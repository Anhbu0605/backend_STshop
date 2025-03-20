<?php

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once __DIR__ . '/../../config/db.php';
include_once __DIR__ . '/../../model/Product.php';
include_once __DIR__ . '/../../utils/helpers.php';

$product = new Product($conn);

try {
    // Lấy các tham số tìm kiếm và lọc
    $search = isset($_GET['q']) ? trim($_GET['q']) : '';

    $filters = [
        'type' => isset($_GET['type']) ? trim($_GET['type']) : 'all',
        'min_price' => isset($_GET['min_price']) ? floatval($_GET['min_price']) : null,
        'max_price' => isset($_GET['max_price']) ? floatval($_GET['max_price']) : null,
        'status' => isset($_GET['status']) ? intval($_GET['status']) : null,
        'sort_by' => isset($_GET['sort_by']) ? trim($_GET['sort_by']) : 'created_at',
        'sort_order' => isset($_GET['sort_order']) && strtoupper($_GET['sort_order']) === 'ASC' ? 'ASC' : 'DESC'
    ];

    // Xây dựng truy vấn để lấy tất cả sản phẩm
    $query = "SELECT * FROM products WHERE 1=1";
    
    // Thêm điều kiện tìm kiếm nếu có
    if (!empty($search)) {
        $query .= " AND (name LIKE '%$search%' OR description LIKE '%$search%')";
    }
    
    // Thêm bộ lọc type nếu không phải 'all'
    if (!empty($filters['type']) && $filters['type'] !== 'all') {
        $query .= " AND type = '{$filters['type']}'";
    }
    
    // Thêm bộ lọc khoảng giá nếu có
    if ($filters['min_price'] !== null) {
        $query .= " AND price >= {$filters['min_price']}";
    }
    
    if ($filters['max_price'] !== null) {
        $query .= " AND price <= {$filters['max_price']}";
    }
    
    // Thêm bộ lọc trạng thái nếu có
    if ($filters['status'] !== null) {
        $query .= " AND status = {$filters['status']}";
    }
    
    // Thêm sắp xếp
    $query .= " ORDER BY {$filters['sort_by']} {$filters['sort_order']}";
    
    // Thực thi truy vấn để lấy tất cả sản phẩm
    $result = $conn->query($query);
    
    // Đếm tổng số sản phẩm (cần truy vấn riêng)
    $count_query = "SELECT COUNT(*) as total FROM products WHERE 1=1";
    
    // Thêm các điều kiện tương tự như truy vấn chính
    if (!empty($search)) {
        $count_query .= " AND (name LIKE '%$search%' OR description LIKE '%$search%')";
    }
    
    if (!empty($filters['type']) && $filters['type'] !== 'all') {
        $count_query .= " AND type = '{$filters['type']}'";
    }
    
    if ($filters['min_price'] !== null) {
        $count_query .= " AND price >= {$filters['min_price']}";
    }
    
    if ($filters['max_price'] !== null) {
        $count_query .= " AND price <= {$filters['max_price']}";
    }
    
    if ($filters['status'] !== null) {
        $count_query .= " AND status = {$filters['status']}";
    }
    
    $count_result = $conn->query($count_query);
    $count_row = $count_result->fetch_assoc();
    $total_products = $count_row['total'];
    
    $products_arr = [];

    // Chuẩn bị câu lệnh tính điểm trung bình một lần
    $avg_rating_stmt = $conn->prepare("SELECT AVG(rating) AS average_rating FROM reviews WHERE product_id = ?");

    while ($row = $result->fetch_assoc()) {
        // Lấy điểm trung bình
        $avg_rating_stmt->bind_param("s", $row['id']);
        $avg_rating_stmt->execute();
        $avg_rating_result = $avg_rating_stmt->get_result()->fetch_assoc();
        $average_rating = $avg_rating_result['average_rating'] !== null ? round((float)$avg_rating_result['average_rating'], 1) : 0;

        // thêm average_rating vào mảng
        $row['average_rating'] = $average_rating;

        // chuyển đổi các trường số sang kiểu dữ liệu thích hợp
        $row['price'] = (float)$row['price'];
        $row['size'] = $row['size'];
        $row['sold'] = (int)$row['sold'];
        $row['quantity'] = (int)$row['quantity'];
        $row['lock'] = (bool)$row['lock'];
        $row['discount'] = $row['discount'] !== null ? (float)$row['discount'] : null;

        // Kiểm tra quantity và cập nhật status
        $row['status'] = $row['quantity'] > 0;

        $products_arr[] = $row;
    }

    $avg_rating_stmt->close();

    $response = [
        'ok' => true,
        'status' => 'success',
        'message' => 'Lấy tất cả sản phẩm thành công',
        'code' => 200,
        'data' => [
            'products' => $products_arr,
            'pagination' => [
                'total' => (int)$total_products,
                'count' => count($products_arr),
                'per_page' => $limit,
                'current_page' => $page,
                'total_pages' => ceil($total_products / $limit)
            ],
            'filters' => [
                'search' => $search,
                'type' => $filters['type'],
                'min_price' => $filters['min_price'],
                'max_price' => $filters['max_price'],
                'status' => $filters['status'],
                'sort_by' => $filters['sort_by'],
                'sort_order' => $filters['sort_order']
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