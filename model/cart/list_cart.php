<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once __DIR__ . '/../../config/db.php';
try {
    // Get API key from header
    $headers = getallheaders();
    $api_key = $headers['X-Api-Key'] ?? '';

    if (empty($api_key)) {
        throw new Exception('Thiếu API key trong header', 401);
    }

    // Get user_id from api_key
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

    $sort_by = isset($_GET['sort_by']) ? trim($_GET['sort_by']) : 'id';
    $sort_order = isset($_GET['sort_order']) && strtoupper($_GET['sort_order']) === 'ASC' ? 'ASC' : 'DESC';

    $sql = "SELECT c.id, c.user_id, c.product_id, c.quantity, c.checker, c.size, c.color,
                   p.name as product_name, p.price, p.discount, p.image_url, p.status, p.quantity as product_quantity
            FROM cart c
            LEFT JOIN products p ON c.product_id = p.id
            WHERE c.user_id = ?
            ORDER BY $sort_by $sort_order";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    $cart_items = [];
    $warnings = [];
    while ($row = $result->fetch_assoc()) {
        $row['quantity'] = (int)$row['quantity'];
        $row['price'] = (float)$row['price'];
        $row['checker'] = (bool)$row['checker'];
        $row['discount'] = (float)$row['discount'];
        $row['status'] = (bool)$row['status'];
        $row['product_quantity'] = (int)$row['product_quantity'];
        $row['warning'] = true;
        $row['size'] = $row['size'];
        $row['color'] = $row['color'];

        // Kiểm tra số lượng sản phẩm
        if ($row['product_quantity'] === 0) {
            $warnings[] = "Sản phẩm '{$row['product_name']}' đã hết hàng";
            $row['warning'] = false;
        } elseif ($row['product_quantity'] < $row['quantity']) {
            $warnings[] = "Số lượng sản phẩm '{$row['product_name']}' trong kho không đủ (Còn {$row['product_quantity']} sản phẩm)";
            $row['warning'] = false;
        }

        $cart_items[] = $row;
    }

    $stmt->close();
    $conn->close();

    $response = [
        'ok' => true,
        'status' => 'success',
        'message' => 'Lấy giỏ hàng thành công',
        'code' => 200,
        'data' => [
            'cart_items' => $cart_items,
            'warnings' => $warnings,
            'filters' => [
                'user_id' => $user_id,
                'sort_by' => $sort_by,
                'sort_order' => $sort_order
            ]
        ]
    ];
    http_response_code(200);
} catch (Exception $e) {
    $response = [
        'ok' => false,
        'status' => 'error',
        'code' => $e->getCode() ?: 400,
        'message' => $e->getMessage()
    ];
    http_response_code($e->getCode() ?: 400);
}

echo json_encode($response, JSON_UNESCAPED_UNICODE);
