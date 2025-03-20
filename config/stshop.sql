-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 20, 2025 lúc 12:33 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `stshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` varchar(32) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `order` tinyint(1) NOT NULL,
  `mess` tinyint(1) NOT NULL,
  `statistics` tinyint(1) NOT NULL,
  `user` tinyint(1) NOT NULL,
  `product` tinyint(1) NOT NULL,
  `discount` tinyint(1) NOT NULL,
  `review` tinyint(1) NOT NULL,
  `layout` tinyint(1) NOT NULL,
  `decentralization` tinyint(1) NOT NULL,
  `note` varchar(255) NOT NULL,
  `api_key` varchar(64) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `order`, `mess`, `statistics`, `user`, `product`, `discount`, `review`, `layout`, `decentralization`, `note`, `api_key`, `time`) VALUES
('25ad094dd04f', 'Nguyễn Thị Ánh', 'anh@gmail.com', 'anh@gmail.com', 1, 1, 1, 0, 0, 1, 1, 0, 0, 'thu ngân \n', '2509cd8123e6748f6f33814ba0da53f711f315036874c94df497baaddca8a22b', '2024-11-27 23:28:36'),
('3911212e43a4', 'levanc@gmail.com', 'levanc@gmail.com', 'levanc@gmail.com', 1, 1, 1, 0, 0, 0, 0, 0, 0, 'Kiểm duyệt đơn hàng\n', '19a866728e93ad089db7ac9bca303c80a99a0f2d8c6c236727abce836f90170e', '2024-11-29 19:34:05'),
('46eb8e7597f9', 'thuan@gmail.com', 'thuan@gmail.com', 'thuan@gmail.com', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'Kỹ Thuật', '141cb8ecaee561fdeb390ddc66f8feb24866635df6a8e8f5a0bb75f56e4af447', '2025-03-20 18:32:49'),
('abbd01816489', 'levancc@gmail.com', 'levancc@gmail.com', 'EAVSzs#V', 0, 0, 0, 0, 0, 1, 0, 0, 1, '', 'a7e31a4e5f30e27b6481ef7625e70028f675131be3ad067dbd9694cc23ddadcf', '2024-12-05 10:25:19'),
('highest', 'admin1', 'admin1@gmail.com', 'admin1@gmail.com', 1, 1, 1, 1, 1, 1, 1, 1, 1, 'cao nhất', '3f76d3c2f076c42e17aab538819ff37fd63ba9163c6e1e2f5170cc1256959c1e', '2025-03-20 11:46:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `body_review`
--

CREATE TABLE `body_review` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `body_review`
--

INSERT INTO `body_review` (`id`, `name`, `description`, `icon`) VALUES
(1, 'Đa Dạng Mẫu Giày', 'Cung cấp nhiều mẫu giày thể thao từ sneaker, giày chạy bộ đến giày casual phù hợp với mọi phong cách.', 'FaSyncAlt'),
(2, 'Phục Vụ Nhanh Chóng', 'Đặt hàng dễ dàng, xử lý nhanh chóng giúp bạn nhận được đôi giày yêu thích trong thời gian ngắn nhất.', 'FaClock'),
(3, 'Giao Hàng Tận Nơi', 'Dịch vụ giao hàng nhanh chóng, tiện lợi đến tận cửa nhà bạn trên toàn quốc.', 'FaTruck'),
(4, 'Chất Lượng Đảm Bảo', 'Cam kết sản phẩm chính hãng, chất lượng cao với độ bền và thoải mái tối ưu.', 'AiFillLike'),
(5, 'Đa Dạng Món Ăn', '', ''),
(6, 'Sản phẩm đa dạng: Giày sneaker, giày chạy bộ, phù hợp cho cả nam và nữ.', '', 'TiTick'),
(7, 'Chất lượng đảm bảo: Cam kết hàng chính hãng cao cấp, bền đẹp.', '', 'TiTick'),
(8, 'Giá cả hợp lý: Thường xuyên có khuyến mãi hấp dẫn.', '', 'TiTick'),
(9, 'Dịch vụ tận tâm: Tư vấn nhiệt tình, giao hàng nhanh.', '', 'TiTick'),
(10, 'Thường xuyên cập nhật các sản phẩm mới nhất', '', 'TiTick'),
(19, '', '', ''),
(35, '', '', 'TiTick');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `checker` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company_info`
--

CREATE TABLE `company_info` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `copyright_text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `company_info`
--

INSERT INTO `company_info` (`id`, `name`, `logo`, `description`, `copyright_text`) VALUES
(1, 'STshop', 'new_logo.png', 'Hương vị tuyệt vời', '© 2025 STshop . All rights reserved.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact_info`
--

CREATE TABLE `contact_info` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contact_info`
--

INSERT INTO `contact_info` (`id`, `title`, `icon`, `content`, `type`) VALUES
(1, '', 'IoIosMap', '123 Đường Ẩm Thực', ''),
(3, '', 'FaPhoneAlt', '0123 456 789', ''),
(4, '', 'MdEmail', 'info@fastfood.com', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_address`
--

CREATE TABLE `detail_address` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `discount_percent` int(11) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `minimum_price` decimal(15,0) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `discounts`
--

INSERT INTO `discounts` (`id`, `name`, `code`, `description`, `discount_percent`, `valid_from`, `valid_to`, `quantity`, `minimum_price`, `status`) VALUES
(36, 'Giảm giá mùa hè', '98QMOEWB', '', 20, '2024-11-01', '2024-11-30', 19, 500000, 1),
(40, 'Giảm giá mùa đông', 'A438DWIO', '', 10, '2024-11-01', '2024-12-28', 20, 200000, 1),
(41, 'Hộ ngộ', 'IE6R0CDJ', '', 20, '2024-11-01', '2024-11-17', 299, 100000, 1),
(42, 'Giảm giá cho người mới', 'L6952FH3', '', 10, '2024-11-18', '2024-12-31', 10, 0, 1),
(48, 'Giảm giá tổng hóa đơn 5%', 'BILL5A', 'Khuyến mãi giảm 5% tổng giá trị hóa đơn cho đơn hàng từ 200.000 VND', 5, '2024-11-20', '2024-12-31', 100, 200000, 0),
(49, 'Giảm giá tổng hóa đơn 10%', 'BILL10B', 'Khuyến mãi giảm 10% tổng giá trị hóa đơn cho đơn hàng từ 500.000 VND', 10, '2024-11-22', '2025-01-15', 80, 500000, 1),
(50, 'Giảm giá tổng hóa đơn 7%', 'BILL7C', 'Khuyến mãi giảm 7% tổng giá trị hóa đơn cho đơn hàng từ 300.000 VND', 7, '2024-11-25', '2025-01-20', 70, 300000, 1),
(51, 'Giảm giá tổng hóa đơn 15%', 'BILL15D', 'Khuyến mãi giảm 15% tổng giá trị hóa đơn cho đơn hàng từ 1.000.000 VND', 15, '2024-12-01', '2025-02-15', 50, 1000000, 1),
(52, 'Giảm giá tổng hóa đơn 20%', 'BILL20E', 'Khuyến mãi giảm 20% tổng giá trị hóa đơn cho đơn hàng từ 1.500.000 VND', 20, '2024-12-05', '2025-03-01', 30, 1500000, 1),
(53, 'Giảm giá tổng hóa đơn 12%', 'BILL12F', 'Khuyến mãi giảm 12% tổng giá trị hóa đơn cho đơn hàng từ 750.000 VND', 12, '2024-12-10', '2025-02-28', 60, 750000, 1),
(54, 'Giảm giá tổng hóa đơn 8%', 'BILL8G', 'Khuyến mãi giảm 8% tổng giá trị hóa đơn cho đơn hàng từ 400.000 VND', 8, '2024-12-15', '2025-03-10', 90, 400000, 1),
(55, 'Giảm giá tổng hóa đơn 10%', 'BILL10H', 'Khuyến mãi giảm 10% tổng giá trị hóa đơn cho đơn hàng từ 600.000 VND', 10, '2024-12-20', '2025-01-30', 120, 600000, 1),
(56, 'Giảm giá tổng hóa đơn 15%', 'BILL15I', 'Khuyến mãi giảm 15% tổng giá trị hóa đơn cho đơn hàng từ 900.000 VND', 15, '2024-11-18', '2025-02-10', 45, 900000, 1),
(57, 'Giảm giá tổng hóa đơn 5%', 'BILL5J', 'Khuyến mãi giảm 5% tổng giá trị hóa đơn cho đơn hàng từ 250.000 VND', 5, '2024-11-18', '2025-01-05', 150, 250000, 1),
(58, 'Giảm giá tổng hóa đơn 18%', 'BILL18K', 'Khuyến mãi giảm 18% tổng giá trị hóa đơn cho đơn hàng từ 1.200.000 VND', 18, '2024-11-18', '2025-03-01', 35, 1200000, 1),
(59, 'Giảm giá tổng hóa đơn 6%', 'BILL6L', 'Khuyến mãi giảm 6% tổng giá trị hóa đơn cho đơn hàng từ 350.000 VND', 6, '2024-11-18', '2025-02-01', 110, 350000, 1),
(60, 'Giảm giá tổng hóa đơn 9%', 'BILL9M', 'Khuyến mãi giảm 9% tổng giá trị hóa đơn cho đơn hàng từ 450.000 VND', 9, '2024-11-18', '2025-01-15', 84, 450000, 1),
(61, 'Giảm giá tổng hóa đơn 20%', 'BILL20N', 'Khuyến mãi giảm 20% tổng giá trị hóa đơn cho đơn hàng từ 2.000.000 VND', 20, '2024-11-18', '2025-03-15', 24, 2000000, 1),
(62, 'Giảm giá tổng hóa đơn 14%', 'BILL14O', 'Khuyến mãi giảm 14% tổng giá trị hóa đơn cho đơn hàng từ 800.000 VND', 14, '2024-11-18', '2025-02-10', 54, 800000, 1),
(63, 'Giảm giá tổng hóa đơn 17%', 'BILL17P', 'Khuyến mãi giảm 17% tổng giá trị hóa đơn cho đơn hàng từ 1.300.000 VND', 17, '2024-11-18', '2025-02-20', 28, 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount_history`
--

CREATE TABLE `discount_history` (
  `id` int(11) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `status` varchar(255) NOT NULL,
  `Datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `discount_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount_user`
--

CREATE TABLE `discount_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `minimum_price` float(15,0) NOT NULL,
  `discount_percent` varchar(255) NOT NULL,
  `valid_from` datetime NOT NULL,
  `valid_to` datetime NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `discount_user`
--

INSERT INTO `discount_user` (`id`, `name`, `user_id`, `email`, `code`, `description`, `minimum_price`, `discount_percent`, `valid_from`, `valid_to`, `status`) VALUES
(65, 'giảm giá 10%', '673d69eb63e32', 'thuan18092003@gmail.com', 'FUMHCPUA', '10%', 0, '10', '2024-12-04 00:00:00', '2024-12-07 00:00:00', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `footer_links`
--

CREATE TABLE `footer_links` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `footer_links`
--

INSERT INTO `footer_links` (`id`, `title`, `url`) VALUES
(1, 'Điều khoản sử dụng', '/terms'),
(2, 'Chính sách bảo mật', '/privacy'),
(3, 'Cookies', '/cookies');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `head_review`
--

CREATE TABLE `head_review` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `color` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `head_review`
--

INSERT INTO `head_review` (`id`, `name`, `description`, `color`) VALUES
(1, 'Về STshop', 'Thưởng thức hương vị nhanh chóng, ngon miệng', ''),
(2, 'Câu Chuyện Của Chúng Tôi', 'STshop là cửa hàng chuyên cung cấp các mẫu giày thể thao thời thượng, phù hợp với mọi phong cách và nhu cầu của khách hàng. Tại đây, bạn sẽ tìm thấy những đôi giày chính hãng, đa dạng mẫu đảm bảo mang lại sự thoải mái và tự tin trong từng bước chân.', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `admin_id` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `sender_type` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nav_menu`
--

CREATE TABLE `nav_menu` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `image` text NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `highlight` tinyint(1) DEFAULT 0,
  `class_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nav_menu`
--

INSERT INTO `nav_menu` (`id`, `title`, `image`, `url`, `order_number`, `is_active`, `highlight`, `class_name`) VALUES
(1, 'Trang Chủ', '', '/', 1, 1, 0, 'nav-link'),
(2, 'Sản phẩm', '', '/products', 2, 1, 0, 'nav-link'),
(3, 'Ưu đãi', '', '/discount', 3, 1, 0, 'nav-link'),
(4, 'Giới thiệu', '', '/abouts', 4, 1, 0, 'nav-link'),
(5, 'STshop', 'https://res.cloudinary.com/djtooivoj/image/upload/v1742402105/Logo2_xbhxcy.png', '/', NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `newsletter_section`
--

CREATE TABLE `newsletter_section` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `button_text` varchar(100) DEFAULT NULL,
  `placeholder_text` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `newsletter_section`
--

INSERT INTO `newsletter_section` (`id`, `title`, `description`, `button_text`, `placeholder_text`) VALUES
(1, 'Đăng ký nhận ưu đãi', 'Nhận ngay ưu đãi 20% cho đơn hàng đầu tiên!', 'Đăng ký ngay', 'Email của bạn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `discount_code` varchar(255) DEFAULT NULL,
  `total_price` decimal(15,0) NOT NULL,
  `subtotal` decimal(15,0) NOT NULL,
  `review` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_process`
--

CREATE TABLE `order_process` (
  `id` int(11) NOT NULL,
  `step_number` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `order_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_process`
--

INSERT INTO `order_process` (`id`, `step_number`, `title`, `description`, `icon`, `order_number`) VALUES
(1, 1, 'Vào trang web của STshop', 'Truy cập website để bắt đầu đặt món', 'CiGlobe', 1),
(2, 2, 'Đăng nhập tài khoản', 'Đăng nhập để nhận ưu đãi đặc biệt', 'CiUser', 2),
(3, 3, 'Lựa chọn sản phẩm yêu thích', 'Khám phá menu đa dạng của chúng tôi', 'CiHeart', 3),
(4, 4, 'Thêm ghi chú', 'Tùy chỉnh món ăn theo ý thích', 'CiEdit', 4),
(5, 5, 'Tạo đơn hàng', 'Xác nhận và thanh toán đơn hàng', 'MdOutlineShoppingCart', 5),
(6, 6, 'Chuẩn bị tận hưởng', 'Đơn hàng đang được chuẩn bị', 'CiFaceSmile', 6),
(8, 0, 'Các bước đặt món tại FASTFOOT', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `reset_code` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` varchar(64) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` varchar(225) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sold` int(11) DEFAULT 0,
  `price` decimal(15,0) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` varchar(255) NOT NULL,
  `lock` tinyint(1) NOT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `size` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`size`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `sold`, `price`, `quantity`, `status`, `type`, `lock`, `discount`, `image_url`, `created_at`, `size`) VALUES
('67dbac802d1cf', 'qqqqq', 'qqqqqq', 0, 10000, 100, 1, 'red , blue', 0, '10', 'https://ananas.vn/wp-content/uploads/Pro_AV00205_4.jpeg', '2025-03-19 23:49:52', '[20,30,40]'),
('67dbcaed5750c', 'sdfa', 'sdf', 0, 2333, 23, 1, 'red, blue, greens', 0, '20', 'ádf', '2025-03-20 01:59:41', '[\"10\",\" 20\",\" 30\"]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_order`
--

CREATE TABLE `product_order` (
  `id` int(11) NOT NULL,
  `order_id` varchar(64) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(15,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `discount_percent` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `min_order_value` decimal(15,0) DEFAULT NULL,
  `max_discount` decimal(15,0) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `product_id` varchar(225) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `image_1` text NOT NULL,
  `image_2` text NOT NULL,
  `image_3` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `social_media`
--

CREATE TABLE `social_media` (
  `id` int(11) NOT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `social_media`
--

INSERT INTO `social_media` (`id`, `platform`, `icon`, `url`) VALUES
(1, '', 'FaFacebookF', 'https://facebook.com/fastfood'),
(2, 'instagram', 'FaInstagram', 'https://www.instagram.com/'),
(3, '', 'RiTwitterXLine', 'https://x.com/');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` varchar(64) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `api_key` varchar(64) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` tinyint(1) DEFAULT NULL,
  `avata` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `api_key`, `created_at`, `role`, `avata`) VALUES
('6728af0394d6c', 'Vũ Quang Huy', 'vuhuy@gmail.com', 'vuhuy@gmail.com', '64c76a2dc06fb9d519a0b7340072507acb4ea929a31a58ef5a890616e4fe7493', '2024-10-04 11:24:51', 1, 'https://tse4.mm.bing.net/th?id=OIP.Zmki3GIiRk-XKTzRRlxn4QHaER&pid=Api&P=0&h=220'),
('673b44eda483f', 'Lò Tiến Anh', 'tienanhtch@gmail.com', '123456', '25c9c8660c938155ce86a77517410cbebab4327f5e867ce1cd6f5c230e2ec534', '2024-11-18 13:45:17', 1, 'https://tse4.mm.bing.net/th?id=OIP.Zmki3GIiRk-XKTzRRlxn4QHaER&pid=Api&P=0&h=220'),
('673d69eb63e32', 'Nguyễn Minh Em', 'thuan18092003@gmail.com', 'thuan18092003@gmail.com', 'a93fb747a6e90fdf95525edd804400dd245d17155ef1ba5734bfa50e01ed722d', '2024-11-20 04:47:39', 1, 'data:image/png;base64,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'),
('67db92639f2b2', 'thuan@gmail.com', 'thuan@gmail.com', 'thuan@gmail.com', 'bc5839780ad0c1aa7c6e07b951936d029ad557f5971d9f808f3907f6cee31396', '2025-03-20 03:58:27', 1, 'https://tse4.mm.bing.net/th?id=OIP.Zmki3GIiRk-XKTzRRlxn4QHaER&pid=Api&P=0&h=220');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `website_info`
--

CREATE TABLE `website_info` (
  `id` int(11) NOT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `logo_url` text DEFAULT NULL,
  `site_slogan` text DEFAULT NULL,
  `opening_hours` varchar(100) DEFAULT NULL,
  `search_placeholder` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `website_info`
--

INSERT INTO `website_info` (`id`, `site_name`, `logo_url`, `site_slogan`, `opening_hours`, `search_placeholder`) VALUES
(1, 'STshop', 'https://res.cloudinary.com/djtooivoj/image/upload/v1742437617/slider6_nq7zjy.jpg', 'Chào mừng bạn đến với STshop – nơi mang đến trải nghiệm mua sắm giày thể thao chất lượng, thời trang và tiện lợi nhất!', '6:30 A.M - 12:00 P.M', 'Tìm kiếm món ăn bạn muốn');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `body_review`
--
ALTER TABLE `body_review`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `company_info`
--
ALTER TABLE `company_info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact_info`
--
ALTER TABLE `contact_info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `detail_address`
--
ALTER TABLE `detail_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `discount_history`
--
ALTER TABLE `discount_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `discount_user`
--
ALTER TABLE `discount_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_favorite` (`user_id`,`product_id`),
  ADD KEY `idx_user_favorites` (`user_id`),
  ADD KEY `idx_product_favorites` (`product_id`);

--
-- Chỉ mục cho bảng `footer_links`
--
ALTER TABLE `footer_links`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `head_review`
--
ALTER TABLE `head_review`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Chỉ mục cho bảng `nav_menu`
--
ALTER TABLE `nav_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `newsletter_section`
--
ALTER TABLE `newsletter_section`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Chỉ mục cho bảng `order_process`
--
ALTER TABLE `order_process`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `website_info`
--
ALTER TABLE `website_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `body_review`
--
ALTER TABLE `body_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=630;

--
-- AUTO_INCREMENT cho bảng `company_info`
--
ALTER TABLE `company_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `contact_info`
--
ALTER TABLE `contact_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `detail_address`
--
ALTER TABLE `detail_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `discount_history`
--
ALTER TABLE `discount_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT cho bảng `discount_user`
--
ALTER TABLE `discount_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT cho bảng `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `footer_links`
--
ALTER TABLE `footer_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `head_review`
--
ALTER TABLE `head_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT cho bảng `nav_menu`
--
ALTER TABLE `nav_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `newsletter_section`
--
ALTER TABLE `newsletter_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `order_process`
--
ALTER TABLE `order_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;

--
-- AUTO_INCREMENT cho bảng `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=744;

--
-- AUTO_INCREMENT cho bảng `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT cho bảng `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `website_info`
--
ALTER TABLE `website_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `detail_address`
--
ALTER TABLE `detail_address`
  ADD CONSTRAINT `detail_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `discount_history`
--
ALTER TABLE `discount_history`
  ADD CONSTRAINT `discount_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `discount_user`
--
ALTER TABLE `discount_user`
  ADD CONSTRAINT `discount_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `detail_address` (`id`);

--
-- Các ràng buộc cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `product_order_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
