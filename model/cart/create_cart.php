<?php

include_once __DIR__ . '/../../config/db.php';

try {
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Lấy API key từ header
    $headers = getallheaders();
    $api_key = $headers['X-Api-Key'] ?? '';

    // kiểm tra các trường bắt buộc
    if (!isset($data['id'])) {
        throw new Exception('Thiếu trường bắt buộc: id', 400);
    }

    if (empty($api_key)) {
        throw new Exception('Thiếu API key trong header', 401);
    }

    // validate và làm sạch các trường đầu vào
    $product_id = trim($data['id']);
    $requested_quantity = isset($data['quantity']) ? intval($data['quantity']) : 1;
    $size = isset($data['size']) ? trim($data['size']) : null;
    $color = isset($data['color']) ? trim($data['color']) : null;
    
    // Kiểm tra nếu số lượng yêu cầu vượt quá giới hạn
    if ($requested_quantity >= 20) {
        throw new Exception('Số lượng sản phẩm không được vượt quá 20', 400);
    }
    
    $quantity = max(1, $requested_quantity);
    $api_key = trim($api_key);

    // Lấy user_id từ api_key
    $user_sql = "SELECT id FROM users WHERE api_key = ? LIMIT 1";
    $user_stmt = $conn->prepare($user_sql);
    $user_stmt->bind_param("s", $api_key);
    $user_stmt->execute();
    $user_result = $user_stmt->get_result();
    
    if ($user_result->num_rows === 0) {
        throw new Exception('API key không hợp lệ', 401);
    }
    
    $user = $user_result->fetch_assoc();
    $user_id = $user['id'];

    // Kiểm tra xem sản phẩm có tồn tại và có sẵn không
    $product_sql = "SELECT id, quantity FROM products WHERE id = ? AND status = 1 LIMIT 1";
    $product_stmt = $conn->prepare($product_sql);
    $product_stmt->bind_param("s", $product_id);
    $product_stmt->execute();
    $product_result = $product_stmt->get_result();
    
    if ($product_result->num_rows === 0) {
        throw new Exception('Sản phẩm này đã hết hàng', 404);
    }

    $product = $product_result->fetch_assoc();
    if ($product['quantity'] < $quantity) {
        throw new Exception('Số lượng sản phẩm trong kho không đủ', 400);
    }

    // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
    $check_sql = "SELECT id, quantity FROM cart WHERE user_id = ? AND product_id = ? AND size = ? AND color = ? LIMIT 1";
    $check_stmt = $conn->prepare($check_sql);
    $check_stmt->bind_param("ssss", $user_id, $product_id, $size, $color);
    $check_stmt->execute();
    $cart_result = $check_stmt->get_result();

    $quantity_limit_reached = false;
    if ($cart_result->num_rows > 0) {
        // cập nhật số lượng sản phẩm trong giỏ hàng
        $cart_item = $cart_result->fetch_assoc();
        $new_quantity = $cart_item['quantity'] + $quantity;
        
        // Kiểm tra số lượng yêu cầu có vượt quá số lượng trong kho không
        if ($new_quantity > $product['quantity']) {
            throw new Exception('Số lượng yêu cầu vượt quá số lượng có sẵn', 400);
        }
        
        // Kiểm tra giới hạn số lượng trong giỏ hàng
        if ($new_quantity > 20) {
            throw new Exception('Số lượng sản phẩm trong giỏ hàng không được vượt quá 20', 400);
        }

        // Cập nhật số lượng trong giỏ hàng
        $update_sql = "UPDATE cart SET quantity = ? WHERE id = ?";
        $update_stmt = $conn->prepare($update_sql);
        $update_stmt->bind_param("ii", $new_quantity, $cart_item['id']);
        $update_stmt->execute();

    } else {
        // Kiểm tra tổng số sản phẩm trong giỏ hàng của user khi thêm mới
        $total_products_sql = "SELECT COUNT(*) as total FROM cart WHERE user_id = ?";
        $total_products_stmt = $conn->prepare($total_products_sql);
        $total_products_stmt->bind_param("s", $user_id);
        $total_products_stmt->execute();
        $total_products_result = $total_products_stmt->get_result()->fetch_assoc();
        
        if ($total_products_result['total'] >= 20) {
            throw new Exception('Bạn cần xóa sản phẩm trong giỏ hàng!', 400);
        }

        // thêm sản phẩm vào giỏ hàng
        $insert_sql = "INSERT INTO cart (user_id, product_id, size, color, quantity, checker) VALUES (?, ?, ?, ?, ?, 0)";
        $insert_stmt = $conn->prepare($insert_sql);
        $insert_stmt->bind_param("ssssi", $user_id, $product_id, $size, $color, $quantity);
        $insert_stmt->execute();

    }

    // chuẩn bị response thành công
    $response = [
        'ok' => true,
        'status' => 'success',
        'message' => 'Thêm sản phẩm vào giỏ hàng thành công',
        'code' => 201,
       
    ];
    http_response_code(201);

} catch (Exception $e) {
    $response = [
        'ok' => false,
        'status' => 'error',
        'code' => $e->getCode() ?: 400,
        'message' => $e->getMessage()
    ];
    http_response_code($e->getCode() ?: 400);
} finally {
    // đóng tất cả các prepared statements
    if (isset($user_stmt)) $user_stmt->close();
    if (isset($product_stmt)) $product_stmt->close();
    if (isset($check_stmt)) $check_stmt->close();
    if (isset($update_stmt)) $update_stmt->close();
    if (isset($insert_stmt)) $insert_stmt->close();
    if (isset($total_products_stmt)) $total_products_stmt->close();
    if (isset($update_stock_stmt)) $update_stock_stmt->close();
    $conn->close();
}

echo json_encode($response, JSON_UNESCAPED_UNICODE);
