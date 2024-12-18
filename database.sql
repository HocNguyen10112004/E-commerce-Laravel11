-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 02:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elaravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_admin`
--

CREATE TABLE `table_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_phone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_admin`
--

INSERT INTO `table_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyen Thai Hoc', '0889367456', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_desc` varchar(255) NOT NULL,
  `brand_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `brand_name`, `brand_desc`, `brand_status`, `created_at`, `updated_at`) VALUES
(4, 'MSI', 'MSI', 1, '2024-12-15 10:18:45', '2024-12-15 10:18:45'),
(5, 'DELL', 'DELL', 1, '2024-12-16 04:37:35', '2024-12-16 04:37:35'),
(6, 'Lenovo', 'Lenovo', 1, '2024-12-16 04:37:47', '2024-12-16 04:37:47'),
(7, 'HP', 'HP', 1, '2024-12-16 04:37:55', '2024-12-16 04:37:55'),
(8, 'ASUS', 'ASUS', 1, '2024-12-16 04:38:03', '2024-12-16 04:38:03'),
(9, 'acer', 'acer', 1, '2024-12-16 04:38:11', '2024-12-16 04:38:11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_desc` varchar(255) NOT NULL,
  `category_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`category_id`, `category_name`, `category_desc`, `category_status`, `created_at`, `updated_at`) VALUES
(26, 'Laptop Gaming', 'Laptop Gaming', 1, '2024-12-15 10:18:03', '2024-12-15 10:18:03'),
(28, 'Laptop Văn phòng', 'Laptop Văn phòng', 1, '2024-12-16 04:35:32', '2024-12-16 04:35:32'),
(29, 'Laptop 2 trong 1', 'Laptop 2 trong 1', 1, '2024-12-16 04:35:50', '2024-12-16 04:35:50'),
(30, 'Laptop Doanh nhân', 'Laptop Doanh nhân', 1, '2024-12-16 04:36:06', '2024-12-16 04:36:06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon`
--

CREATE TABLE `tbl_coupon` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_number` int(11) NOT NULL,
  `coupon_desc` int(11) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_coupon`
--

INSERT INTO `tbl_coupon` (`coupon_id`, `coupon_name`, `coupon_code`, `coupon_number`, `coupon_desc`, `coupon_value`, `created_at`, `updated_at`) VALUES
(3, 'GIANGSINH2024', 'MRCM24', 998, 1, 20, '2024-12-15 10:38:10', '2024-12-18 05:11:06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_password` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_customers`
--

INSERT INTO `tbl_customers` (`customer_id`, `customer_name`, `customer_email`, `customer_password`, `customer_phone`, `created_at`, `updated_at`) VALUES
(10, 'Dykhengg', '22520619@gmail.com', '652FiapDoq', '0868835850', '2024-12-15 10:16:10', '2024-12-15 10:16:10'),
(11, 'Nguyễn Trọng Nhân', 'tnhan20152016@gmail.com', 'yHyxwtsCKy', '0336371599', '2024-12-15 10:29:34', '2024-12-15 10:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_id` bigint(20) UNSIGNED NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `distance` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `order_total` double NOT NULL,
  `order_feeshipping` bigint(20) UNSIGNED NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_sales_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `product_desc` text NOT NULL,
  `product_content` text NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `category_id`, `brand_id`, `product_desc`, `product_content`, `product_price`, `product_image`, `product_status`, `created_at`, `updated_at`) VALUES
(15, 'ASUS ROG Strix SCAR 17 Core i9 12th Gen - (32 GB/1 TB SSD/Windows 11 Home/8 GB Graphics/NVIDIA GeForce RTX 3070 Ti) G733ZW-LL139WS Gaming Laptop  (17.3 inch, Off Black, 2.90 kg, With MS Office)', 26, 8, 'CPU: 12900H\nGPU: NVIDIA GeForce RTX 3070 Ti\nRAM: 32 GB DDR5 Không có\nSSD: 1 TB\nMàn hình: 43.94 cm (17.3 inch) 2560 x 1440 Pixel\nPin: 4 cell\nMàu sắc: Off Black\nTrọng lượng: 2.90 kg', 'Bài review về laptop', '70299000', 'laptop_0.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(16, 'ASUS ROG Strix SCAR 15 Core i9 12th Gen - (32 GB/1 TB SSD/Windows 11 Home/8 GB Graphics/NVIDIA GeForce RTX 3070 Ti) G533ZW-LN136WS Gaming Laptop  (15.6 inch, Off Black, 2.30 kg, With MS Office)', 26, 8, 'CPU: 12900H\nGPU: NVIDIA GeForce RTX 3070 Ti\nRAM: 32 GB DDR5 Không có\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 inch) 2560 x 1440 Pixel\nPin: 4 cell\nMàu sắc: Off Black\nTrọng lượng: 2.30 kg', 'Bài review về laptop', '68799000', 'laptop_1.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(17, 'HP Victus Ryzen 7 Octa Core 5800H - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050) 16-e0351AX Gaming Laptop  (16.1 inch, Mica Silver, 2.48 kg, With MS Office)', 26, 7, 'CPU: 5800H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 40.89 cm (16.1 inch) 1920 x 1080 PIxel\nPin: 4 cell\nMàu sắc: Mica Silver\nTrọng lượng: 2.48 kg', 'Bài review về laptop', '31199000', 'laptop_2.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(18, 'Lenovo IdeaPad Gaming 3i Ryzen 7 Octa Core R7-5800H 5th Gen - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050) 15ACH6 Gaming Laptop  (15.6 inch, Shadow Black, 2.25 kg, With MS Office)', 26, 6, 'CPU: R7-5800H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 16 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 pixel\nPin: Không có\nMàu sắc: Shadow Black\nTrọng lượng: 2.25 kg', 'Bài review về laptop', '26299000', 'laptop_3.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(19, 'Lenovo Yoga Slim 7 Core i5 11th Gen - (16 GB/512 GB SSD/Windows 11 Home) 82A300MBIN Thin and Light Laptop  (14 inch, Slate Grey, With MS Office)', 28, 6, 'CPU: Không có\nGPU: Intel Integrated Intel\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1080 pixel\nPin: Không có\nMàu sắc: Slate Grey\nTrọng lượng: Không có', 'Bài review về laptop', '22799000', 'laptop_4.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(20, 'Lenovo Yoga Slim 7 Core i7 11th Gen - (16 GB/512 GB SSD/Windows 11 Home) 14ITL05 Thin and Light Laptop  (14 inch, Slate Grey, 1.36 kg, With MS Office)', 28, 6, 'CPU: i5 1135G7\nGPU: Intel Integrated Iris Xe Graphics\nRAM: 16 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080 pixel\nPin: Không có\nMàu sắc: Slate Grey\nTrọng lượng: 1.36 kg', 'Bài review về laptop', '23499000', 'laptop_5.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(21, 'Lenovo Lenovo V15 Celeron Dual Core - (4 GB/256 GB SSD/Windows 10) 82C30053IH Thin and Light Laptop  (15.6 inch, Iron Grey)', 28, 6, 'CPU: Không có\nGPU: Intel Integrated Intel HD\nRAM: 4 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1080 pixel\nPin: Không có\nMàu sắc: Iron Grey\nTrọng lượng: Không có', 'Bài review về laptop', '8799000', 'laptop_6.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(22, 'Lenovo Yoga 6 Ryzen 7 Octa Core R7-5700U 5th Gen - (16 GB/1 TB SSD/Windows 11 Home) 13ALC6 2 in 1 Laptop  (13.3 inch, Abyss Blue, 1.31 kg, With MS Office)', 29, 6, 'CPU: R7-5700U\nGPU: AMD Radeon Integrated AMD Radeon Graphics\nRAM: 16 GB DDR4 3200 MHz\nSSD: 1 TB\nMàn hình: 33.78 cm (13.3 inch) 1920 x 1080 pixel\nPin: Không có\nMàu sắc: Abyss Blue\nTrọng lượng: 1.31 kg', 'Bài review về laptop', '27399000', 'laptop_7.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(23, 'ASUS TUF Gaming F15 Core i5 10th Gen - (8 GB/1 TB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce GTX 1650/144 Hz) FX506LH-HN310W Gaming Laptop  (15.6 inch, Black, 2.30 kg)', 26, 8, 'CPU: i5-10300H\nGPU: NVIDIA GeForce GTX 1650\nRAM: 8 GB DDR4 2933 MHz\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080$$Pixels pixel\nPin: Không có\nMàu sắc: Black\nTrọng lượng: 2.30 kg', 'Bài review về laptop', '19499000', 'laptop_8.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(24, 'DELL Inspiron Pentium Silver - (8 GB/256 GB SSD/Windows 11 Home) Inspiron 3521 Notebook  (15.6 Inch, Carbon Black, 1.61 Kg, With MS Office)', 28, 5, 'CPU: N5030\nGPU: Intel Integrated UHD Graphics\nRAM: 8 GB DDR4 2666 MHz\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Carbon Black\nTrọng lượng: 1.61 Kg', 'Bài review về laptop', '9899000', 'laptop_9.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(25, 'DELL Inspiron Athlon Dual Core 3050U - (8 GB/256 GB SSD/Windows 11 Home) Inspiron 3525 Notebook  (15.6 Inch, Carbon Black, 1.68 Kg, With MS Office)', 28, 5, 'CPU: 3050U\nGPU: AMD Radeon Radeon Graphics\nRAM: 8 GB DDR4 2666 MHz\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Carbon Black\nTrọng lượng: 1.68 Kg', 'Bài review về laptop', '9299000', 'laptop_10.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(26, 'DELL Core i5 11th Gen - (16 GB/512 GB SSD/Windows 11 Home) XPS 9305 Thin and Light Laptop  (13.4 inch, Platinum Silver, 1.16 kg, With MS Office)', 28, 5, 'CPU: 1135G7\nGPU: Intel Integrated Iris Xe\nRAM: 16 GB LPDDR4X Không có\nSSD: 512 GB\nMàn hình: 34.04 cm (13.4 inch) 1920 x 1080 Pixel\nPin: 4 cell\nMàu sắc: Platinum Silver\nTrọng lượng: 1.16 kg', 'Bài review về laptop', '44799000', 'laptop_11.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(27, 'Lenovo Yoga 7i Ryzen 7 Octa Core R7-5800U 5th Gen - (16 GB/512 GB SSD/Windows 10 Home) 14ITL5 2 in 1 Laptop  (14 inch, Slate Grey, 1.43 kg, With MS Office)', 29, 6, 'CPU: R7-5800U\nGPU: AMD Radeon Integrated AMD Radeon Graphics\nRAM: 16 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080$$Pixels pixel\nPin: Không có\nMàu sắc: Slate Grey\nTrọng lượng: 1.43 kg', 'Bài review về laptop', '29699000', 'laptop_12.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(28, 'ASUS Ryzen 7 Dual Core 7th Gen - (16 GB/512 GB HDD/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX3050- 4GB) FA506IC-HN075W Gaming Laptop  (15.6 inch, Black)', 26, 8, 'CPU: Không có\nGPU: NVIDIA GeForce RTX3050- 4GB\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1080 x 1920$$Pixels pixel\nPin: Không có\nMàu sắc: Black\nTrọng lượng: Không có', 'Bài review về laptop', '24899000', 'laptop_13.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(29, 'ASUS Ryzen 3 Quad Core 3rd Gen - (8 GB/256 GB SSD/Windows 11 Home) M515DA-BR322WS Laptop  (15.6 inch, Silver, With MS Office)', 28, 8, 'CPU: Không có\nGPU: AMD Radeon amd redeon\nRAM: 8 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1080 x 1920$$Pixels pixel\nPin: Không có\nMàu sắc: Silver\nTrọng lượng: Không có', 'Bài review về laptop', '11099000', 'laptop_14.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(30, 'ASUS ROG Flow X13 (2021) Ryzen 9 Octa Core Ryzen 9 5900HS 5th Gen - (32 GB/1 TB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce GTX 1650/120 Hz) GV301QH-K6461TS 2 in 1 Gaming Laptop  (13.4 Inch, Black, 1.3 KG, With MS Office)', 26, 8, 'CPU: Ryzen 9 5900HS\nGPU: NVIDIA GeForce GTX 1650\nRAM: 32 GB LPDDR4X 4266 MHz\nSSD: 1 TB\nMàn hình: 34.04 cm (13.4 Inch) 1920 x 1200 Pixel\nPin: 4 Cell\nMàu sắc: Black\nTrọng lượng: 1.3 KG', 'Bài review về laptop', '38899000', 'laptop_15.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(31, 'MSI GP66 Leopard Core i7 11th Gen - (16 GB/1 TB SSD/Windows 10 Home/8 GB Graphics/NVIDIA GeForce RTX 3070/240 Hz) GP66 Leopard 11UG Gaming Laptop  (15.6 inches, Black, 2.9 kg)', 26, 4, 'CPU: 11800H\nGPU: NVIDIA GeForce RTX 3070\nRAM: 16 GB DDR4 3200 MHz\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 inches) 1920 x 1080 Pixels\nPin: 4 cell\nMàu sắc: Black\nTrọng lượng: 2.9 kg', 'Bài review về laptop', '47399000', 'laptop_16.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(32, 'ASUS Vivobook 15 OLED Core i3 11th Gen - (8 GB/256 GB SSD/Windows 11 Home) K513EA-L301WS Laptop  (15.6 inch, Hearty Gold, 1.80 kg kg, With MS Office)', 28, 8, 'CPU: Core i3-1115G4\nGPU: Intel Integrated Intel® UHD Graphics\nRAM: 8 GB DDR4 3200 MHz\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 pixel\nPin: 42WHrs, 3S1P, 3-cell Li-ion\nMàu sắc: Hearty Gold\nTrọng lượng: 1.80 kg kg', 'Bài review về laptop', '14399000', 'laptop_17.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(33, 'DELL G15 Core i7 11th Gen - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050 Ti/165 Hz) G15-5511 SE Gaming Laptop  (15.6 inch, Obsidian Black, 2.65 kg, With MS Office)', 26, 5, 'CPU: 11800H\nGPU: NVIDIA GeForce RTX 3050 Ti\nRAM: 16 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 6 Cell\nMàu sắc: Obsidian Black\nTrọng lượng: 2.65 kg', 'Bài review về laptop', '31199000', 'laptop_21.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(34, 'DELL Ryzen 5 Hexa Core 5600H - (8 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050/120 Hz) G15-5515 Gaming Laptop  (15.6 inch, Grey, 2.57 kg, With MS Office)', 26, 5, 'CPU: 5600H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Grey\nTrọng lượng: 2.57 kg', 'Bài review về laptop', '20799000', 'laptop_22.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(35, 'ASUS Vivobook S14 OLED (2022) Intel EVO Core i5 12th Gen - (16 GB/512 GB SSD/Windows 11 Home) S3402ZA-KM501WS Thin and Light Laptop  (14 Inch, Neutral Grey, 1.50 Kg, With MS Office)', 28, 8, 'CPU: 12500H\nGPU: Intel Integrated Iris Xe Graphics\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 Inch) 2880 x 1800 Pixels\nPin: 3\nMàu sắc: Neutral Grey\nTrọng lượng: 1.50 Kg', 'Bài review về laptop', '22499000', 'laptop_24.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(36, 'ASUS Vivobook S14 OLED (2022) Intel EVO Core i7 12th Gen - (16 GB/512 GB SSD/Windows 11 Home) S3402ZA-KM702WS Thin and Light Laptop  (14 inch, Indie Black, 1.50 kg, With MS Office)', 28, 8, 'CPU: 12700H\nGPU: Intel Integrated Iris Xe\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 2880 x 1800 Pixels\nPin: 3 Cell\nMàu sắc: Indie Black\nTrọng lượng: 1.50 kg', 'Bài review về laptop', '28499000', 'laptop_25.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(37, 'ASUS Zenbook 14 OLED (2022) Intel EVO Core i5 12th Gen - (16 GB/512 GB SSD/Windows 11 Home) UX3402ZA-KM531WS Thin and Light Laptop  (14 inch, Ponder Blue, 1.39 kg, With MS Office)', 28, 8, 'CPU: 1240P\nGPU: Intel Integrated Iris Xe\nRAM: 16 GB LPDDR5 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 2880 x 1800 Pixel\nPin: 4 Cell\nMàu sắc: Ponder Blue\nTrọng lượng: 1.39 kg', 'Bài review về laptop', '26999000', 'laptop_26.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(38, 'ASUS Zenbook 14X (2022) Space edition Intel EVO Core i7 12th Gen - (16 GB/1 TB SSD/Windows 11 Home) UX5401ZAS-KN711WS Thin and Light Laptop  (14 inch, Titanium, 1.40 kg, With MS Office)', 28, 8, 'CPU: 12700H\nGPU: Intel Integrated Iris Xe\nRAM: 16 GB LPDDR5 Không có\nSSD: 1 TB\nMàn hình: 35.56 cm (14 inch) 2880 x 1800 Pixel\nPin: 3 Cell\nMàu sắc: Titanium\nTrọng lượng: 1.40 kg', 'Bài review về laptop', '40399000', 'laptop_27.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(39, 'ASUS Vivobook S14 OLED (2022) Intel EVO Core i5 12th Gen - (16 GB/512 GB SSD/Windows 11 Home) S3402ZA-KM502WS Thin and Light Laptop  (14 Inch, Indie Black, 1.50 Kg, With MS Office)', 28, 8, 'CPU: 12500H\nGPU: Intel Integrated Iris Xe Graphics\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 Inch) 2880 x 1800 Pixels\nPin: 3\nMàu sắc: Indie Black\nTrọng lượng: 1.50 Kg', 'Bài review về laptop', '22499000', 'laptop_28.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(40, 'ASUS Zenbook 14 OLED (2022) Intel EVO Core i7 12th Gen - (16 GB/512 GB SSD/Windows 11 Home) UX3402ZA-KM731WS Thin and Light Laptop  (14 inch, Ponder Blue, 1.39 kg, With MS Office)', 28, 8, 'CPU: 1260P\nGPU: Intel Integrated Iris Xe\nRAM: 16 GB LPDDR5 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 2880 x 1800 Pixel\nPin: 4 Cell\nMàu sắc: Ponder Blue\nTrọng lượng: 1.39 kg', 'Bài review về laptop', '31499000', 'laptop_29.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(41, 'ASUS Vivobook S14 OLED (2022) Intel EVO Core i7 12th Gen - (16 GB/512 GB SSD/Windows 11 Home) S3402ZA-KM701WS Thin and Light Laptop  (14 Inch, Neutral Grey, 1.50 Kg, With MS Office)', 28, 8, 'CPU: 12700H\nGPU: Intel Integrated Iris Xe Graphics\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 Inch) 2880 x 1800 Pixels\nPin: 3\nMàu sắc: Neutral Grey\nTrọng lượng: 1.50 Kg', 'Bài review về laptop', '28499000', 'laptop_30.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(42, 'ASUS Zenbook 14X (2022) Space edition Intel EVO Core i5 12th Gen - (16 GB/512 GB SSD/Windows 11 Home) UX5401ZAS-KN521WS Thin and Light Laptop  (14 inch, Titanium, 1.40 kg, With MS Office)', 28, 8, 'CPU: 12500H\nGPU: Intel Integrated Iris Xe\nRAM: 16 GB LPDDR5 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 2880 x 1800 Pixel\nPin: 3 Cell\nMàu sắc: Titanium\nTrọng lượng: 1.40 kg', 'Bài review về laptop', '34399000', 'laptop_31.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(43, 'DELL Vostro 3405 Ryzen 5 Quad Core 3450U - (8 GB/256 GB SSD/Windows 11 Home) Vostro 3405 Thin and Light Laptop  (14 inch, Dune, 1.59 kg, With MS Office)', 28, 5, 'CPU: 3450U\nGPU: AMD Radeon Vega 8\nRAM: 8 GB DDR4 2400 MHz\nSSD: 256 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Dune\nTrọng lượng: 1.59 kg', 'Bài review về laptop', '12899000', 'laptop_32.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(44, 'ASUS Ryzen 7 Hexa Core 10th Gen - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX 3050 rts) FA506IC-HN005T Gaming Laptop  (15.6 inch, Graphite Black)', 26, 8, 'CPU: Không có\nGPU: NVIDIA GeForce RTX 3050 rts\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1080 x 1920$$Pixels pixel\nPin: Không có\nMàu sắc: Graphite Black\nTrọng lượng: Không có', 'Bài review về laptop', '24099000', 'laptop_33.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(45, 'ASUS Ryzen 9 Octa Core 10th Gen - (16 GB/512 GB SSD/Windows 11 Home/6 GB Graphics/NVIDIA GeForce RTX RTX3060-6GB) FA506QM-HN124W Gaming Laptop  (16.6 inch, Graphite Black)', 26, 8, 'CPU: Không có\nGPU: NVIDIA GeForce RTX RTX3060-6GB\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 42.16 cm (16.6 inch) 1080-1920 pixel\nPin: Không có\nMàu sắc: Graphite Black\nTrọng lượng: Không có', 'Bài review về laptop', '31999000', 'laptop_34.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(46, 'ASUS Core i5 10th Gen - (8 GB/256 GB SSD/Windows 11 Home) X515JA-BQ511WS Thin and Light Laptop  (15.6 inch, Transparent Silver, With MS Office)', 28, 8, 'CPU: Không có\nGPU: Intel Integrated intel\nRAM: 8 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1080*1920 pixel\nPin: Không có\nMàu sắc: Transparent Silver\nTrọng lượng: Không có', 'Bài review về laptop', '12999000', 'laptop_35.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(47, 'ASUS Core i5 11th Gen - (8 GB/1 TB HDD/256 GB SSD/Windows 10 Home) K513EA-L501TS Laptop  (15.6 inch, Hearty Gold, With MS Office)', 28, 8, 'CPU: Không có\nGPU: Intel Integrated Intel HD Graphics\nRAM: 8 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 720x1080 FHD OLED pixel\nPin: Không có\nMàu sắc: Hearty Gold\nTrọng lượng: Không có', 'Bài review về laptop', '19799000', 'laptop_36.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(48, 'ASUS Ryzen 7 Quad Core 10th Gen - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce GTX GTX 1650 4GB Graphics) G713IH-HX020T Gaming Laptop  (17.3 inch, Gray)', 26, 8, 'CPU: Không có\nGPU: NVIDIA GeForce GTX GTX 1650 4GB Graphics\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 43.94 cm (17.3 inch) 1920*1080 pixel\nPin: Không có\nMàu sắc: Gray\nTrọng lượng: Không có', 'Bài review về laptop', '24699000', 'laptop_37.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(49, 'ASUS Core i5 11th Gen - (16 GB/512 GB SSD/Windows 11 Home) K413EA-EB522WS Thin and Light Laptop  (14 inch, Indie Black, 1.40 kg, With MS Office)', 28, 8, 'CPU: 1135G7\nGPU: Intel Integrated Iris Xe\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Indie Black\nTrọng lượng: 1.40 kg', 'Bài review về laptop', '18299000', 'laptop_38.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(50, 'ASUS VivoBook 15 (2021) Core i5 10th Gen - (8 GB/512 GB SSD/Windows 11 Home) X515JA-BQ521WS Thin and Light Laptop  (15.6 inch, Transparent Silver, 1.80 kg, With MS Office)', 28, 8, 'CPU: 1035G1\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 2 cell\nMàu sắc: Transparent Silver\nTrọng lượng: 1.80 kg', 'Bài review về laptop', '14399000', 'laptop_39.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(51, 'DELL G15 Core i7 12th Gen - (16 GB/1 TB SSD/Windows 11 Home/6 GB Graphics/NVIDIA GeForce RTX 3060) G15-5521 SE Gaming Laptop  (15.6 Inch, Obsidian Black, 2.57 kg, With MS Office)', 26, 5, 'CPU: 12700H\nGPU: NVIDIA GeForce RTX 3060\nRAM: 16 GB DDR5 4800 Mhz\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 Inch) 2560 x1440 Pixel\nPin: 6 Cell\nMàu sắc: Obsidian Black\nTrọng lượng: 2.57 kg', 'Bài review về laptop', '41599000', 'laptop_40.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(52, 'DELL G15 Core i5 12th Gen - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050) G15-5520 Gaming Laptop  (15.6 Inch, Dark Shadow Grey, 2.57 kg, With MS Office)', 26, 5, 'CPU: 12500H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 16 GB DDR5 4800 Mhz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixel\nPin: 3 Cell\nMàu sắc: Dark Shadow Grey\nTrọng lượng: 2.57 kg', 'Bài review về laptop', '26399000', 'laptop_41.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(53, 'DELL G15 Core i7 12th Gen - (16 GB/512 GB SSD/Windows 11 Home/6 GB Graphics/NVIDIA GeForce RTX 3060) G15-5520 Gaming Laptop  (15.6 Inch, Dark Shadow Grey, 2.57 kg, With MS Office)', 26, 5, 'CPU: 12700H\nGPU: NVIDIA GeForce RTX 3060\nRAM: 16 GB DDR5 4800 Mhz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixel\nPin: 6 Cell\nMàu sắc: Dark Shadow Grey\nTrọng lượng: 2.57 kg', 'Bài review về laptop', '38299000', 'laptop_42.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(54, 'ASUS Core i3 11th Gen - (8 GB/256 GB SSD/Windows 10 Home) X515EA-BR312TS Thin and Light Laptop  (15.6 inch, Transparent Silver, 1.80 kg, With MS Office)', 28, 8, 'CPU: 1115G4\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1366 x 768 Pixel\nPin: 2 cell\nMàu sắc: Transparent Silver\nTrọng lượng: 1.80 kg', 'Bài review về laptop', '11099000', 'laptop_43.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(55, 'DELL Core i5 11th Gen - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050) G15-5511 Gaming Laptop  (15.6 inch, Dark Shadow Grey, 2.65 kg, With MS Office)', 26, 5, 'CPU: 11260H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Dark Shadow Grey\nTrọng lượng: 2.65 kg', 'Bài review về laptop', '22299000', 'laptop_44.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(56, 'DELL G15 Core i7 12th Gen - (16 GB/1 TB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050 Ti) G15-5521 SE Gaming Laptop  (15.6 Inch, Obsidian Black, 2.57 kg, With MS Office)', 26, 5, 'CPU: 12700H\nGPU: NVIDIA GeForce RTX 3050 Ti\nRAM: 16 GB DDR5 4800 Mhz\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixel\nPin: 3 Cell\nMàu sắc: Obsidian Black\nTrọng lượng: 2.57 kg', 'Bài review về laptop', '35199000', 'laptop_45.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(57, 'DELL G15 Core i7 12th Gen - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050 Ti) G15-5520 Gaming Laptop  (15.6 Inch, Dark Shadow Grey, 2.57 kg, With MS Office)', 26, 5, 'CPU: 12700H\nGPU: NVIDIA GeForce RTX 3050 Ti\nRAM: 16 GB DDR5 4800 Mhz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixel\nPin: 3 Cell\nMàu sắc: Dark Shadow Grey\nTrọng lượng: 2.57 kg', 'Bài review về laptop', '31499000', 'laptop_46.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(58, 'DELL Core i5 11th Gen - (8 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050) G15-5511 Gaming Laptop  (15.6 inch, Dark Shadow Grey, 2.65 kg, With MS Office)', 26, 5, 'CPU: 11260H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Dark Shadow Grey\nTrọng lượng: 2.65 kg', 'Bài review về laptop', '20799000', 'laptop_47.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(59, 'acer Aspire 5 Core i5 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) A515-56 Thin and Light Laptop  (15.6 Inch, Pure Silver, 1.65 kg, With MS Office)', 28, 9, 'CPU: 1135G7\nGPU: Intel Integrated Iris Xe\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Pure Silver\nTrọng lượng: 1.65 kg', 'Bài review về laptop', '14999000', 'laptop_48.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(60, 'ASUS VivoBook Ultra K15 OLED Core i3 11th Gen - (8 GB/1 TB HDD/256 GB SSD/Windows 11 Home) K513EA-L322WS Thin and Light Laptop  (15.6 inch, Indie Black, 1.80 kg, With MS Office)', 28, 8, 'CPU: 1115G4\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Indie Black\nTrọng lượng: 1.80 kg', 'Bài review về laptop', '15299000', 'laptop_49.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(61, 'ASUS VivoBook 15 Core i3 10th Gen - (8 GB/1 TB HDD/Windows 11 Home) X515JA-BQ302W Thin and Light Laptop  (15.6 inch, Transparent Silver, 1.80 kg)', 28, 8, 'CPU: 1005G1\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: Không có\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 2 cell\nMàu sắc: Transparent Silver\nTrọng lượng: 1.80 kg', 'Bài review về laptop', '9299000', 'laptop_50.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(62, 'ASUS Core i5 11th Gen - (16 GB/512 GB SSD/Windows 11 Home) K513EA-L513WS Laptop  (15.6 inch, Silver, With MS Office)', 28, 8, 'CPU: Không có\nGPU: Intel Integrated intel\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1080*1920 pixel\nPin: Không có\nMàu sắc: Silver\nTrọng lượng: Không có', 'Bài review về laptop', '20399000', 'laptop_51.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(63, 'HP Core i5 11th Gen - (8 GB/512 GB SSD/Windows 11 Home/2 GB Graphics) 15s-du3519TX Thin and Light Laptop  (15.6 Inch, Natural Silver, 1.75 Kg, With MS Office)', 28, 7, 'CPU: 1135G7\nGPU: NVIDIA GeForce MX450\nRAM: 8 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Natural Silver\nTrọng lượng: 1.75 Kg', 'Bài review về laptop', '19499000', 'laptop_52.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(64, 'HP Pavilion Ryzen 7 Octa Core 5825U - (16 GB/512 GB SSD/Windows 11 Home) 14-EC1008AU Thin and Light Laptop  (14 inch, Natural Silver, 1.41 kg, With MS Office)', 28, 7, 'CPU: 5825U\nGPU: AMD Radeon AMD\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080 Pixel\nPin: 3 Cell\nMàu sắc: Natural Silver\nTrọng lượng: 1.41 kg', 'Bài review về laptop', '21599000', 'laptop_53.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(65, 'HP Pavilion Ryzen 5 Hexa Core 5625U - (16 GB/512 GB SSD/Windows 11 Home) 14-EC1019AU Thin and Light Laptop  (14 inch, Natural Silver, 1.41 kg, With MS Office)', 28, 7, 'CPU: 5625U\nGPU: AMD Radeon AMD\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080 Pixel\nPin: 3 Cell\nMàu sắc: Natural Silver\nTrọng lượng: 1.41 kg', 'Bài review về laptop', '18899000', 'laptop_54.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(66, 'ASUS Core i5 11th Gen - (8 GB/1 TB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX RTX3050-4G) FX516PCZ-HN090T Gaming Laptop  (15.6 inch, White)', 26, 8, 'CPU: Không có\nGPU: NVIDIA GeForce RTX RTX3050-4G\nRAM: 8 GB DDR4 Không có\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 inch) 1080*1920 pixel\nPin: Không có\nMàu sắc: White\nTrọng lượng: Không có', 'Bài review về laptop', '23599000', 'laptop_55.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(67, 'acer Celeron Dual Core - (4 GB/256 GB SSD/Windows 11 Home) TMB311-31 Notebook  (11.6 Inch, Black, 1.4 Kg)', 28, 9, 'CPU: N4020\nGPU: Intel Integrated UHD Graphics 600\nRAM: 4 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 29.46 cm (11.6 Inch) 1366 x 768 Pixels\nPin: 3\nMàu sắc: Black\nTrọng lượng: 1.4 Kg', 'Bài review về laptop', '7499000', 'laptop_56.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(68, 'acer Celeron Dual Core - (4 GB/128 GB SSD/Windows 11 Home) TMB311-31 Notebook  (11.6 Inch, Black, 1.4 Kg)', 28, 9, 'CPU: N4020\nGPU: Intel Integrated UHD Graphics 600\nRAM: 4 GB DDR4 Không có\nSSD: 128 GB\nMàn hình: 29.46 cm (11.6 Inch) 1366 x 768 Pixels\nPin: 3\nMàu sắc: Black\nTrọng lượng: 1.4 Kg', 'Bài review về laptop', '7199000', 'laptop_57.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(69, 'acer Nitro 5 Core i5 11th Gen - (8 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce GTX 1650) AN515-57 Gaming Laptop  (15.6 inch, Shale Black, 2.2 kg)', 26, 9, 'CPU: 11400H\nGPU: NVIDIA GeForce GTX 1650\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 4 cell\nMàu sắc: Shale Black\nTrọng lượng: 2.2 kg', 'Bài review về laptop', '19499000', 'laptop_58.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(70, 'ASUS VivoBook 14 (2021) Celeron Dual Core - (4 GB/256 GB SSD/Windows 11 Home) X415MA-BV011W Thin and Light Laptop  (14 inch, Transparent Silver, 1.60 kg)', 28, 8, 'CPU: N4020\nGPU: Intel Integrated UHD\nRAM: 4 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 35.56 cm (14 inch) 1366 x 768 Pixel\nPin: 2 cell\nMàu sắc: Transparent Silver\nTrọng lượng: 1.60 kg', 'Bài review về laptop', '7799000', 'laptop_59.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(71, 'acer Aspire 3 Core i5 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) A315-58 Thin and Light Laptop  (15.6 Inch, Pure Silver, 1.7 kg, With MS Office)', 28, 9, 'CPU: 1135G7\nGPU: Intel Integrated Iris Xe\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixel\nPin: 2 cell\nMàu sắc: Pure Silver\nTrọng lượng: 1.7 kg', 'Bài review về laptop', '14999000', 'laptop_60.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(72, 'acer Nitro 5 Core i7 12th Gen - (16 GB/1 TB HDD/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050 Ti) AN515-58 Gaming Laptop  (15.6 inch, Shale Black, 2.6 kg)', 26, 9, 'CPU: 12500H\nGPU: NVIDIA GeForce RTX 3050 Ti\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 4 cell\nMàu sắc: Shale Black\nTrọng lượng: 2.6 kg', 'Bài review về laptop', '32899000', 'laptop_61.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(73, 'HP Pavilion Gaming Ryzen 5 Hexa Core 5600H - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX 3050 Ti) 15-EC2048AX Gaming Laptop  (15.6 Inch, Shadow Black, 1.98 Kg, With MS Office)', 26, 7, 'CPU: 5600H\nGPU: NVIDIA GeForce RTX 3050 Ti\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixel\nPin: 3 Cell\nMàu sắc: Shadow Black\nTrọng lượng: 1.98 Kg', 'Bài review về laptop', '23399000', 'laptop_62.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(74, 'HP OMEN Core i7 12th Gen - (16 GB/1 TB SSD/Windows 11 Home/4 GB Graphics) 16-B1351TX Laptop  (16.1 inch, Shadow Black, 2.32 kg, With MS Office)', 28, 7, 'CPU: 12700H\nGPU: NVIDIA GeForce RTX 3050 Ti\nRAM: 16 GB DDR5 Không có\nSSD: 1 TB\nMàn hình: 40.89 cm (16.1 inch) 1920 x 1080 PIxel\nPin: 4 Cell\nMàu sắc: Shadow Black\nTrọng lượng: 2.32 kg', 'Bài review về laptop', '38899000', 'laptop_63.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(75, 'Lenovo THINKBOOK 15 Core i3 11th Gen - (8 GB/512 GB SSD/Windows 10 Home) THINKBOOK 15 Notebook  (15.6 inch, Minral Grey, 1.9 kg)', 28, 6, 'CPU: I3-1115G4\nGPU: Intel Integrated INTEL UHD\nRAM: 8 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 X 1080 pixel\nPin: 3 CELL , 45WHR\nMàu sắc: Minral Grey\nTrọng lượng: 1.9 kg', 'Bài review về laptop', '16199000', 'laptop_64.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(76, 'ASUS Ryzen 5 Quad Core 3rd Gen - (8 GB/512 GB SSD/Windows 11 Home) M515DA-BQ512WS Thin and Light Laptop  (15.6 inch, Transparent Silver, With MS Office)', 28, 8, 'CPU: Không có\nGPU: AMD Radeon\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 720x1080 FHD LCD pixel\nPin: Không có\nMàu sắc: Transparent Silver\nTrọng lượng: Không có', 'Bài review về laptop', '13499000', 'laptop_65.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(77, 'DELL Inspiron Pentium Quad Core - (8 GB/256 GB SSD/Windows 11 Home) Inspiron 3521 Thin and Light Laptop  (15.6 inch, Platinum Silver, 1.8 kg, With MS Office)', 28, 5, 'CPU: N5030\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 2666 MHz\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1366 x 768 pixel\nPin: 3 cell\nMàu sắc: Platinum Silver\nTrọng lượng: 1.8 kg', 'Bài review về laptop', '11099000', 'laptop_66.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(78, 'ASUS Core i5 11th Gen - (8 GB/1 TB HDD/256 GB SSD/Windows 11 Home) K513EA-L501WS Laptop  (15.6 inch, Hearty GOLD, With MS Office)', 28, 8, 'CPU: Không có\nGPU: Intel Integrated INTEL HD\nRAM: 8 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1080*1920 pixel\nPin: Không có\nMàu sắc: Hearty GOLD\nTrọng lượng: Không có', 'Bài review về laptop', '19899000', 'laptop_67.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(79, 'ASUS Ryzen 7 Quad Core 10th Gen - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/AMD Radeon RTX3050- 4GB) G513IC-HN023WS Gaming Laptop  (15.6 inch, Gray, With MS Office)', 26, 8, 'CPU: Không có\nGPU: AMD Radeon RTX3050- 4GB\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1080*1920 pixel\nPin: Không có\nMàu sắc: Gray\nTrọng lượng: Không có', 'Bài review về laptop', '26799000', 'laptop_68.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(80, 'DELL Vostro 5000 Series Ryzen 5 Quad Core Ryzen 5-5625U - (16 GB/512 GB SSD/Windows 10 Home) Vostro 5625 Thin and Light Laptop  (16 inch, Titan Grey, 1.9 kg, With MS Office)', 28, 5, 'CPU: Ryzen 5-5625U\nGPU: AMD Radeon Intgrated\nRAM: 16 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 40.64 cm (16 inch) 1920 x 1200$$Pixels pixel\nPin: 4 Cell , 54 Whr\nMàu sắc: Titan Grey\nTrọng lượng: 1.9 kg', 'Bài review về laptop', '20699000', 'laptop_69.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(81, 'DELL G15 Core i5 11th Gen - (16 GB/512 GB SSD/Windows 10/4 GB Graphics/NVIDIA GeForce RTX 3050Ti) G15-5511 Gaming Laptop  (15.6 Inch, Dark Shadow Grey, 2.4 kg, With MS Office)', 26, 5, 'CPU: 11400H\nGPU: NVIDIA GeForce RTX 3050Ti\nRAM: 16 GB DDR4 2933 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Dark Shadow Grey\nTrọng lượng: 2.4 kg', 'Bài review về laptop', '27699000', 'laptop_70.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(82, 'ASUS TUF Gaming F15 Core i7 12th Gen - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050 Ti) FX577ZE-HN056W Gaming Laptop  (15.6 inch, Jaeger Gray, 2.20 kg)', 26, 8, 'CPU: 12700H\nGPU: NVIDIA GeForce RTX 3050 Ti\nRAM: 16 GB DDR5 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 4 cell\nMàu sắc: Jaeger Gray\nTrọng lượng: 2.20 kg', 'Bài review về laptop', '34999000', 'laptop_71.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(83, 'ASUS ROG Strix SCAR 17 Core i9 12th Gen - (32 GB/1 TB SSD/Windows 11 Home/8 GB Graphics/NVIDIA GeForce RTX 3070 Ti) G733ZW-LL139WS Gaming Laptop  (17.3 inch, Off Black, 2.90 kg, With MS Office)', 26, 8, 'CPU: 12900H\nGPU: NVIDIA GeForce RTX 3070 Ti\nRAM: 32 GB DDR5 Không có\nSSD: 1 TB\nMàn hình: 43.94 cm (17.3 inch) 2560 x 1440 Pixel\nPin: 4 cell\nMàu sắc: Off Black\nTrọng lượng: 2.90 kg', 'Bài review về laptop', '70299000', 'laptop_72.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(84, 'ASUS ROG Strix SCAR 15 Core i9 12th Gen - (32 GB/1 TB SSD/Windows 11 Home/8 GB Graphics/NVIDIA GeForce RTX 3070 Ti) G533ZW-LN136WS Gaming Laptop  (15.6 inch, Off Black, 2.30 kg, With MS Office)', 26, 8, 'CPU: 12900H\nGPU: NVIDIA GeForce RTX 3070 Ti\nRAM: 32 GB DDR5 Không có\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 inch) 2560 x 1440 Pixel\nPin: 4 cell\nMàu sắc: Off Black\nTrọng lượng: 2.30 kg', 'Bài review về laptop', '68799000', 'laptop_73.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(85, 'HP Victus Ryzen 7 Octa Core 5800H - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050) 16-e0351AX Gaming Laptop  (16.1 inch, Mica Silver, 2.48 kg, With MS Office)', 26, 7, 'CPU: 5800H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 40.89 cm (16.1 inch) 1920 x 1080 PIxel\nPin: 4 cell\nMàu sắc: Mica Silver\nTrọng lượng: 2.48 kg', 'Bài review về laptop', '31199000', 'laptop_74.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(86, 'Lenovo IdeaPad Gaming 3i Ryzen 7 Octa Core R7-5800H 5th Gen - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050) 15ACH6 Gaming Laptop  (15.6 inch, Shadow Black, 2.25 kg, With MS Office)', 26, 6, 'CPU: R7-5800H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 16 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 pixel\nPin: Không có\nMàu sắc: Shadow Black\nTrọng lượng: 2.25 kg', 'Bài review về laptop', '26299000', 'laptop_75.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(87, 'Lenovo Yoga Slim 7 Core i5 11th Gen - (16 GB/512 GB SSD/Windows 11 Home) 82A300MBIN Thin and Light Laptop  (14 inch, Slate Grey, With MS Office)', 28, 6, 'CPU: Không có\nGPU: Intel Integrated Intel\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1080 pixel\nPin: Không có\nMàu sắc: Slate Grey\nTrọng lượng: Không có', 'Bài review về laptop', '22799000', 'laptop_76.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(88, 'Lenovo Yoga Slim 7 Core i7 11th Gen - (16 GB/512 GB SSD/Windows 11 Home) 14ITL05 Thin and Light Laptop  (14 inch, Slate Grey, 1.36 kg, With MS Office)', 28, 6, 'CPU: i5 1135G7\nGPU: Intel Integrated Iris Xe Graphics\nRAM: 16 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080 pixel\nPin: Không có\nMàu sắc: Slate Grey\nTrọng lượng: 1.36 kg', 'Bài review về laptop', '23499000', 'laptop_77.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(89, 'Lenovo Lenovo V15 Celeron Dual Core - (4 GB/256 GB SSD/Windows 10) 82C30053IH Thin and Light Laptop  (15.6 inch, Iron Grey)', 28, 6, 'CPU: Không có\nGPU: Intel Integrated Intel HD\nRAM: 4 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1080 pixel\nPin: Không có\nMàu sắc: Iron Grey\nTrọng lượng: Không có', 'Bài review về laptop', '8799000', 'laptop_78.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(90, 'Lenovo Yoga 6 Ryzen 7 Octa Core R7-5700U 5th Gen - (16 GB/1 TB SSD/Windows 11 Home) 13ALC6 2 in 1 Laptop  (13.3 inch, Abyss Blue, 1.31 kg, With MS Office)', 29, 6, 'CPU: R7-5700U\nGPU: AMD Radeon Integrated AMD Radeon Graphics\nRAM: 16 GB DDR4 3200 MHz\nSSD: 1 TB\nMàn hình: 33.78 cm (13.3 inch) 1920 x 1080 pixel\nPin: Không có\nMàu sắc: Abyss Blue\nTrọng lượng: 1.31 kg', 'Bài review về laptop', '27399000', 'laptop_79.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(91, 'ASUS TUF Gaming F15 Core i5 10th Gen - (8 GB/1 TB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce GTX 1650/144 Hz) FX506LH-HN310W Gaming Laptop  (15.6 inch, Black, 2.30 kg)', 26, 8, 'CPU: i5-10300H\nGPU: NVIDIA GeForce GTX 1650\nRAM: 8 GB DDR4 2933 MHz\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080$$Pixels pixel\nPin: Không có\nMàu sắc: Black\nTrọng lượng: 2.30 kg', 'Bài review về laptop', '19499000', 'laptop_80.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(92, 'DELL Inspiron Pentium Silver - (8 GB/256 GB SSD/Windows 11 Home) Inspiron 3521 Notebook  (15.6 Inch, Carbon Black, 1.61 Kg, With MS Office)', 28, 5, 'CPU: N5030\nGPU: Intel Integrated UHD Graphics\nRAM: 8 GB DDR4 2666 MHz\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Carbon Black\nTrọng lượng: 1.61 Kg', 'Bài review về laptop', '9899000', 'laptop_81.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(93, 'DELL Inspiron Athlon Dual Core 3050U - (8 GB/256 GB SSD/Windows 11 Home) Inspiron 3525 Notebook  (15.6 Inch, Carbon Black, 1.68 Kg, With MS Office)', 28, 5, 'CPU: 3050U\nGPU: AMD Radeon Radeon Graphics\nRAM: 8 GB DDR4 2666 MHz\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Carbon Black\nTrọng lượng: 1.68 Kg', 'Bài review về laptop', '9299000', 'laptop_82.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(94, 'DELL Core i5 11th Gen - (16 GB/512 GB SSD/Windows 11 Home) XPS 9305 Thin and Light Laptop  (13.4 inch, Platinum Silver, 1.16 kg, With MS Office)', 28, 5, 'CPU: 1135G7\nGPU: Intel Integrated Iris Xe\nRAM: 16 GB LPDDR4X Không có\nSSD: 512 GB\nMàn hình: 34.04 cm (13.4 inch) 1920 x 1080 Pixel\nPin: 4 cell\nMàu sắc: Platinum Silver\nTrọng lượng: 1.16 kg', 'Bài review về laptop', '44799000', 'laptop_83.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(95, 'Lenovo Yoga 7i Ryzen 7 Octa Core R7-5800U 5th Gen - (16 GB/512 GB SSD/Windows 10 Home) 14ITL5 2 in 1 Laptop  (14 inch, Slate Grey, 1.43 kg, With MS Office)', 29, 6, 'CPU: R7-5800U\nGPU: AMD Radeon Integrated AMD Radeon Graphics\nRAM: 16 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080$$Pixels pixel\nPin: Không có\nMàu sắc: Slate Grey\nTrọng lượng: 1.43 kg', 'Bài review về laptop', '29699000', 'laptop_84.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(96, 'ASUS Ryzen 7 Dual Core 7th Gen - (16 GB/512 GB HDD/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX3050- 4GB) FA506IC-HN075W Gaming Laptop  (15.6 inch, Black)', 26, 8, 'CPU: Không có\nGPU: NVIDIA GeForce RTX3050- 4GB\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1080 x 1920$$Pixels pixel\nPin: Không có\nMàu sắc: Black\nTrọng lượng: Không có', 'Bài review về laptop', '24899000', 'laptop_85.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(97, 'ASUS Ryzen 3 Quad Core 3rd Gen - (8 GB/256 GB SSD/Windows 11 Home) M515DA-BR322WS Laptop  (15.6 inch, Silver, With MS Office)', 28, 8, 'CPU: Không có\nGPU: AMD Radeon amd redeon\nRAM: 8 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1080 x 1920$$Pixels pixel\nPin: Không có\nMàu sắc: Silver\nTrọng lượng: Không có', 'Bài review về laptop', '11099000', 'laptop_86.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(98, 'ASUS ROG Flow X13 (2021) Ryzen 9 Octa Core Ryzen 9 5900HS 5th Gen - (32 GB/1 TB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce GTX 1650/120 Hz) GV301QH-K6461TS 2 in 1 Gaming Laptop  (13.4 Inch, Black, 1.3 KG, With MS Office)', 26, 8, 'CPU: Ryzen 9 5900HS\nGPU: NVIDIA GeForce GTX 1650\nRAM: 32 GB LPDDR4X 4266 MHz\nSSD: 1 TB\nMàn hình: 34.04 cm (13.4 Inch) 1920 x 1200 Pixel\nPin: 4 Cell\nMàu sắc: Black\nTrọng lượng: 1.3 KG', 'Bài review về laptop', '38899000', 'laptop_87.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(99, 'MSI GP66 Leopard Core i7 11th Gen - (16 GB/1 TB SSD/Windows 10 Home/8 GB Graphics/NVIDIA GeForce RTX 3070/240 Hz) GP66 Leopard 11UG Gaming Laptop  (15.6 inches, Black, 2.9 kg)', 26, 4, 'CPU: 11800H\nGPU: NVIDIA GeForce RTX 3070\nRAM: 16 GB DDR4 3200 MHz\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 inches) 1920 x 1080 Pixels\nPin: 4 cell\nMàu sắc: Black\nTrọng lượng: 2.9 kg', 'Bài review về laptop', '47399000', 'laptop_88.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(100, 'ASUS Vivobook 15 OLED Core i3 11th Gen - (8 GB/256 GB SSD/Windows 11 Home) K513EA-L301WS Laptop  (15.6 inch, Hearty Gold, 1.80 kg kg, With MS Office)', 28, 8, 'CPU: Core i3-1115G4\nGPU: Intel Integrated Intel® UHD Graphics\nRAM: 8 GB DDR4 3200 MHz\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 pixel\nPin: 42WHrs, 3S1P, 3-cell Li-ion\nMàu sắc: Hearty Gold\nTrọng lượng: 1.80 kg kg', 'Bài review về laptop', '14399000', 'laptop_89.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(101, 'DELL G15 Core i7 11th Gen - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050 Ti/165 Hz) G15-5511 SE Gaming Laptop  (15.6 inch, Obsidian Black, 2.65 kg, With MS Office)', 26, 5, 'CPU: 11800H\nGPU: NVIDIA GeForce RTX 3050 Ti\nRAM: 16 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 6 Cell\nMàu sắc: Obsidian Black\nTrọng lượng: 2.65 kg', 'Bài review về laptop', '31199000', 'laptop_93.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(102, 'DELL Ryzen 5 Hexa Core 5600H - (8 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050/120 Hz) G15-5515 Gaming Laptop  (15.6 inch, Grey, 2.57 kg, With MS Office)', 26, 5, 'CPU: 5600H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Grey\nTrọng lượng: 2.57 kg', 'Bài review về laptop', '20799000', 'laptop_94.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(103, 'DELL Ryzen 7 Octa Core 5800H - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050/120 Hz) G15-5515 Gaming Laptop  (15.6 inch, Grey, 2.57 kg, With MS Office)', 26, 5, 'CPU: 5800H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Grey\nTrọng lượng: 2.57 kg', 'Bài review về laptop', '27099000', 'laptop_96.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(104, 'HP Core i3 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) 15s-fq2627TU Thin and Light Laptop  (15.6 Inch, Jet Black, 1.69 Kg, With MS Office)', 28, 7, 'CPU: 1125G4\nGPU: Intel Integrated UHD Graphics\nRAM: 8 GB DDR4 2666 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Jet Black\nTrọng lượng: 1.69 Kg', 'Bài review về laptop', '12299000', 'laptop_97.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(105, 'DELL Ryzen 5 Hexa Core 5600H - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050/120 Hz) G15-5515 Gaming Laptop  (15.6 inch, Grey, 2.57 kg, With MS Office)', 26, 5, 'CPU: 5600H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Grey\nTrọng lượng: 2.57 kg', 'Bài review về laptop', '22199000', 'laptop_98.jpeg', 1, '2024-12-16 05:17:02', '2024-12-16 05:17:02'),
(106, 'ASUS VivoBook 14 (2021) Ryzen 5 Quad Core 3500U - (8 GB/512 GB SSD/Windows 11 Home) M415DA-EB712WS Thin and Light Laptop  (14 inch, Transparent Silver, 1.60 kg, With MS Office)', 28, 8, 'CPU: 3500U\nGPU: AMD Radeon Vega 8\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080 Pixel\nPin: Không có\nMàu sắc: Transparent Silver\nTrọng lượng: 1.60 kg', 'Bài review về laptop', '13499000', 'laptop_99.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(107, 'ASUS VivoBook Flip 14 Core i3 11th Gen - (8 GB/256 GB SSD/Windows 11 Home) TP470EA-EC302WS 2 in 1 Laptop  (14 Inch, Indie Black, 1.50 kg, With MS Office)', 29, 8, 'CPU: 1115G4\nGPU: Intel Integrated UHD Graphics\nRAM: 8 GB LPDDR4X Không có\nSSD: 256 GB\nMàn hình: 35.56 cm (14 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Indie Black\nTrọng lượng: 1.50 kg', 'Bài review về laptop', '14999000', 'laptop_100.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(108, 'ASUS VivoBook 15 (2021) Core i5 10th Gen - (8 GB/1 TB HDD/Windows 11 Home) X515JA-BQ501W Thin and Light Laptop  (15.6 inch, Transparent Silver, 1.80 kg)', 28, 8, 'CPU: 1035G1\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: Không có\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 2 cell\nMàu sắc: Transparent Silver\nTrọng lượng: 1.80 kg', 'Bài review về laptop', '12899000', 'laptop_101.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(109, 'ASUS Celeron Dual Core - (4 GB/128 GB SSD/Windows 11 Home) BR1100CKA-GJ0722W Laptop  (11.6 Inch, Star Grey, 1.26 Kg)', 28, 8, 'CPU: N4500\nGPU: Intel Integrated UHD Graphics\nRAM: 4 GB DDR4 Không có\nSSD: 128 GB\nMàn hình: 29.46 cm (11.6 Inch) 1366 x 768 Pixels\nPin: 3\nMàu sắc: Star Grey\nTrọng lượng: 1.26 Kg', 'Bài review về laptop', '7499000', 'laptop_102.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(110, 'ASUS Celeron Dual Core - (4 GB/128 GB SSD/Windows 11 Home) BR1100FKA-BP1104W Laptop  (11.6 Inch, Star Grey, 1.40 Kg)', 28, 8, 'CPU: N4500\nGPU: Intel Integrated UHD Graphics\nRAM: 4 GB DDR4 Không có\nSSD: 128 GB\nMàn hình: 29.46 cm (11.6 Inch) 1366 x 768 Pixels\nPin: 3\nMàu sắc: Star Grey\nTrọng lượng: 1.40 Kg', 'Bài review về laptop', '8999000', 'laptop_103.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(111, 'ASUS VivoBook K15 OLED Ryzen 7 Octa Core 5700U - (16 GB/512 GB SSD/Windows 11 Home) KM513UA-L711WS Thin and Light Laptop  (15.6 Inch, Hearty Gold, 1.80 Kg, With MS Office)', 28, 8, 'CPU: 5700U\nGPU: AMD Radeon Radeon Graphics\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Hearty Gold\nTrọng lượng: 1.80 Kg', 'Bài review về laptop', '19499000', 'laptop_104.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(112, 'ASUS VivoBook Flip 14 Core i5 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) TP470EA-EC512WS 2 in 1 Laptop  (14 Inch, Indie Black, 1.50 Kg, With MS Office)', 29, 8, 'CPU: 1135G7\nGPU: Intel Integrated Iris Xe Graphics\nRAM: 8 GB LPDDR4X Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Indie Black\nTrọng lượng: 1.50 Kg', 'Bài review về laptop', '19199000', 'laptop_105.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(113, 'ASUS VivoBook K15 OLED Ryzen 7 Octa Core 5700U - (16 GB/512 GB SSD/Windows 11 Home) KM513UA-L713WS Thin and Light Laptop  (15.6 Inch, Transparent Silver, 1.80 Kg, With MS Office)', 28, 8, 'CPU: 5700U\nGPU: AMD Radeon Radeon Graphics\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Transparent Silver\nTrọng lượng: 1.80 Kg', 'Bài review về laptop', '19499000', 'laptop_106.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(114, 'ASUS VivoBook 15 (2022) Celeron Quad Core - (4 GB/256 GB SSD/Windows 11 Home) X515MA-BR011W Thin and Light Laptop  (15.6 inch, Transparent Silver, 1.80 kg)', 28, 8, 'CPU: N4020\nGPU: Intel Integrated UHD\nRAM: 4 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1366 x 768 Pixel\nPin: 2 cell\nMàu sắc: Transparent Silver\nTrọng lượng: 1.80 kg', 'Bài review về laptop', '8099000', 'laptop_107.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(115, 'ASUS VivoBook Flip 14 Core i3 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) TP470EA-EC312WS 2 in 1 Laptop  (14 Inch, Indie Black, 1.50 kg, With MS Office)', 29, 8, 'CPU: 1115G4\nGPU: Intel Integrated UHD Graphics\nRAM: 8 GB LPDDR4X Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Indie Black\nTrọng lượng: 1.50 kg', 'Bài review về laptop', '15899000', 'laptop_108.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(116, 'ASUS VivoBook 15 (2021) Core i3 10th Gen - (8 GB/512 GB SSD/Windows 11 Home) X515JA-BQ322WS Thin and Light Laptop  (15.6 inch, Transparent Silver, 1.80 kg, With MS Office)', 28, 8, 'CPU: 1005G1\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 2 cell\nMàu sắc: Transparent Silver\nTrọng lượng: 1.80 kg', 'Bài review về laptop', '11699000', 'laptop_109.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(117, 'ASUS VivoBook 14 (2021) Ryzen 7 Quad Core 3700U - (16 GB/512 GB SSD/Windows 11 Home) M415DA-EB512WS Thin and Light Laptop  (14 inch, Transparent Silver, 1.60 kg, With MS Office)', 28, 8, 'CPU: 3700U\nGPU: AMD Radeon RX Vega 10\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080 Pixel\nPin: Không có\nMàu sắc: Transparent Silver\nTrọng lượng: 1.60 kg', 'Bài review về laptop', '15899000', 'laptop_110.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(118, 'ASUS VivoBook 15 (2021) Core i3 11th Gen - (8 GB/1 TB HDD/Windows 11 Home) X515EA-BR391W Thin and Light Laptop  (15.6 inch, Slate Grey, 1.80 kg)', 28, 8, 'CPU: 1115G4\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: Không có\nMàn hình: 39.62 cm (15.6 inch) 1366 x 768 Pixel\nPin: 2 cell\nMàu sắc: Slate Grey\nTrọng lượng: 1.80 kg', 'Bài review về laptop', '10499000', 'laptop_111.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03');
INSERT INTO `tbl_product` (`product_id`, `product_name`, `category_id`, `brand_id`, `product_desc`, `product_content`, `product_price`, `product_image`, `product_status`, `created_at`, `updated_at`) VALUES
(119, 'ASUS VivoBook 15 (2021) Core i3 11th Gen - (8 GB/1 TB HDD/256 GB SSD/Windows 11 Home) X515EA-EJ332WS Thin and Light Laptop  (15.6 inch, Transparent Silver, 1.80 kg, With MS Office)', 28, 8, 'CPU: 1115G4\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 2 cell\nMàu sắc: Transparent Silver\nTrọng lượng: 1.80 kg', 'Bài review về laptop', '12299000', 'laptop_112.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(120, 'HP Pavilion Ryzen 5 Hexa Core 5625U - (8 GB/512 GB SSD/Windows 11 Home) 15-eh2024AU Thin and Light Laptop  (15.6 Inch, Natural Silver, 1.75 Kg, With MS Office)', 28, 7, 'CPU: 5625U\nGPU: AMD Radeon Radeon Graphics\nRAM: 8 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Natural Silver\nTrọng lượng: 1.75 Kg', 'Bài review về laptop', '18599000', 'laptop_113.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(121, 'HP Envy Core i9 11th Gen - (32 GB/1 TB SSD/Windows 11 Pro/6 GB Graphics) 15-ep1087TX Laptop  (15.6 inch, Natural Silver, 2.14 kg, With MS Office)', 28, 7, 'CPU: 11900H\nGPU: NVIDIA GeForce RTX 3060\nRAM: 32 GB DDR4 Không có\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 inch) 3840 x 2160 Pixel\nPin: 6 Cell\nMàu sắc: Natural Silver\nTrọng lượng: 2.14 kg', 'Bài review về laptop', '62299000', 'laptop_114.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(122, 'HP Chromebook Celeron Quad Core - (4 GB/64 GB EMMC Storage/Chrome OS) 14a-ca0504TU Thin and Light Laptop  (14 Inch, Forest Teal, 1.49 Kg)', 28, 7, 'CPU: N4020\nGPU: Intel Integrated UHD Graphics\nRAM: 4 GB LPDDR4 2400 MHz\nSSD: Không có\nMàn hình: 35.56 cm (14 Inch) 1366 x 768 Pixels\nPin: 2\nMàu sắc: Forest Teal\nTrọng lượng: 1.49 Kg', 'Bài review về laptop', '8299000', 'laptop_115.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(123, 'HP Chromebook Celeron Dual Core - (4 GB/64 GB EMMC Storage/Chrome OS) 14a-ca0506TU Thin and Light Laptop  (14 Inch, Mineral Silver, 1.49 Kg)', 28, 7, 'CPU: N4020\nGPU: Intel Integrated UHD Graphics\nRAM: 4 GB LPDDR4 2400 MHz\nSSD: Không có\nMàn hình: 35.56 cm (14 Inch) 1366 x 768 Pixels\nPin: 2\nMàu sắc: Mineral Silver\nTrọng lượng: 1.49 Kg', 'Bài review về laptop', '8299000', 'laptop_116.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(124, 'HP Envy Core i7 11th Gen - (16 GB/1 TB SSD/Windows 11 Pro/4 GB Graphics) 15-ep1085TX Thin and Light Laptop  (15.6 Inch, Natural Silver, 2.14 Kg, With MS Office)', 28, 7, 'CPU: 11800H\nGPU: NVIDIA GeForce RTX RTX 3050\nRAM: 16 GB DDR4 3200 MHz\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 Inch) 3840 x 2160 Pixels\nPin: 6\nMàu sắc: Natural Silver\nTrọng lượng: 2.14 Kg', 'Bài review về laptop', '48899000', 'laptop_117.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(125, 'HP Pavilion Ryzen 5 Hexa Core 5625U - (8 GB/512 GB SSD/Windows 11 Home) 14-EC1003AU Thin and Light Laptop  (14 Inch, Natural Silver, 1.41 Kg, With MS Office)', 28, 7, 'CPU: 5625U\nGPU: AMD Radeon Radeon Graphics\nRAM: 8 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 35.56 cm (14 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Natural Silver\nTrọng lượng: 1.41 Kg', 'Bài review về laptop', '16499000', 'laptop_118.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(126, 'HP Pavilion Ryzen 5 Hexa Core 5625U - (8 GB/512 GB SSD/Windows 11 Home) 15-eh2018AU Thin and Light Laptop  (15.6 Inch, Natural Silver, 1.75 Kg, With MS Office)', 28, 7, 'CPU: 5625U\nGPU: AMD Radeon Radeon Graphics\nRAM: 8 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Natural Silver\nTrọng lượng: 1.75 Kg', 'Bài review về laptop', '18099000', 'laptop_119.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(127, 'HP Pavilion Ryzen 5 Hexa Core 5625U - (8 GB/512 GB SSD/Windows 11 Home) 15-eh2018AU Thin and Light Laptop  (15.6 Inch, Natural Silver, 1.75 Kg, With MS Office)', 28, 7, 'CPU: 5625U\nGPU: AMD Radeon Radeon Graphics\nRAM: 8 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Natural Silver\nTrọng lượng: 1.75 Kg', 'Bài review về laptop', '18099000', 'laptop_120.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(128, 'HP Pavilion Ryzen 5 Hexa Core 5625U - (8 GB/512 GB SSD/Windows 11 Home) 14-EC1003AU Thin and Light Laptop  (14 Inch, Natural Silver, 1.41 Kg, With MS Office)', 28, 7, 'CPU: 5625U\nGPU: AMD Radeon Radeon Graphics\nRAM: 8 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 35.56 cm (14 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Natural Silver\nTrọng lượng: 1.41 Kg', 'Bài review về laptop', '16499000', 'laptop_121.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(129, 'HP Envy Core i7 11th Gen - (16 GB/1 TB SSD/Windows 11 Pro/4 GB Graphics) 15-ep1085TX Thin and Light Laptop  (15.6 Inch, Natural Silver, 2.14 Kg, With MS Office)', 28, 7, 'CPU: 11800H\nGPU: NVIDIA GeForce RTX RTX 3050\nRAM: 16 GB DDR4 3200 MHz\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 Inch) 3840 x 2160 Pixels\nPin: 6\nMàu sắc: Natural Silver\nTrọng lượng: 2.14 Kg', 'Bài review về laptop', '48899000', 'laptop_122.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(130, 'DELL Inspiron 3000 Core i3 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) 3511 Thin and Light Laptop  (15.6 Inch, Black, 1.8 Kgs, With MS Office)', 28, 5, 'CPU: 1115G4\nGPU: Intel Integrated Intel UHD Graphics\nRAM: 8 GB DDR4 2666 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920x 1080$$Pixels pixel\nPin: 3\nMàu sắc: Black\nTrọng lượng: 1.8 Kgs', 'Bài review về laptop', '13399000', 'laptop_123.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(131, 'ASUS Vivobook 15 Ryzen 7 Quad Core AMD R7-3700U - (16 GB/512 GB SSD/Windows 11 Home) M515DA-BQ722WS Laptop  (15.6 inch, Transparent Silver, 1.8 kg, With MS Office)', 28, 8, 'CPU: AMD R7-3700U\nGPU: AMD Radeon Radeon RX Vega 10 Graphics\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080$$Pixels pixel\nPin: Không có\nMàu sắc: Transparent Silver\nTrọng lượng: 1.8 kg', 'Bài review về laptop', '16499000', 'laptop_124.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(132, 'ASUS ExpertBook Core i3 11th Gen - (4 GB/256 GB SSD/DOS) P1511CEA-BQ1758 Business Laptop  (15.6 inch, Slate Grey, 1.80 kg)', 30, 8, 'CPU: Intel i3 1115G4\nGPU: Intel Integrated HD\nRAM: 4 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080$$Pixels pixel\nPin: 2 cell\nMàu sắc: Slate Grey\nTrọng lượng: 1.80 kg', 'Bài review về laptop', '10799000', 'laptop_125.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(133, 'Lenovo IdeaPad Gaming 3 Core i5 11th Gen - (8 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050) 15IHU6 Gaming Laptop  (15.6 inch, Shadow Black, 2.25 kg, With MS Office)', 26, 6, 'CPU: 11300H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: Không có\nMàu sắc: Shadow Black\nTrọng lượng: 2.25 kg', 'Bài review về laptop', '21899000', 'laptop_126.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(134, 'HP Pavilion x360 Convertible Core i3 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) 14-dy0207TU Thin and Light Laptop  (14 inch, Natural Silver, 1.52 kg, With MS Office)', 28, 7, 'CPU: 1125G4\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Natural Silver\nTrọng lượng: 1.52 kg', 'Bài review về laptop', '16799000', 'laptop_127.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(135, 'Lenovo Ideapad Gaming 3 Ryzen 7 Octa Core 5800H - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce GTX 1650) 15ACH6 Gaming Laptop  (15.6 inch, Shadow Black, 2.25 kg)', 26, 6, 'CPU: 5800H\nGPU: NVIDIA GeForce GTX 1650\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920x1080 Pixel\nPin: Không có\nMàu sắc: Shadow Black\nTrọng lượng: 2.25 kg', 'Bài review về laptop', '23399000', 'laptop_129.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(136, 'Lenovo IdeaPad Gaming 3 Ryzen 5 Hexa Core 5600H - (8 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050) 15ACH6 Gaming Laptop  (15.6 inch, Shadow Black, 2.25 kg, With MS Office)', 26, 6, 'CPU: 5600H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: Không có\nMàu sắc: Shadow Black\nTrọng lượng: 2.25 kg', 'Bài review về laptop', '20999000', 'laptop_130.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(137, 'Lenovo IdeaPad Flex 5 Core i3 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) 14ITL05 2 in 1 Laptop  (14 Inch, Graphite Grey, With MS Office)', 29, 6, 'CPU: 1115G4\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 Inch) 1920 x 1080 Pixel\nPin: Không có\nMàu sắc: Graphite Grey\nTrọng lượng: Không có', 'Bài review về laptop', '17699000', 'laptop_131.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(138, 'Lenovo IdeaPad 1 Celeron Dual Core - (4 GB/256 GB SSD/Windows 11 Home) 11IGL05 Thin and Light Laptop  (11.6 Inch, Platinum Grey, With MS Office)', 28, 6, 'CPU: N4020\nGPU: Intel Integrated UHD\nRAM: 4 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 29.46 cm (11.6 Inch) 1366 x 768 Pixel\nPin: Không có\nMàu sắc: Platinum Grey\nTrọng lượng: Không có', 'Bài review về laptop', '7199000', 'laptop_132.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(139, 'HP Pavilion x360 Convertible Core i7 11th Gen - (16 GB/512 GB SSD/Windows 11 Home) 14-dy1047TU Thin and Light Laptop  (14 inch, Natural Silver, 1.52 kg, With MS Office)', 28, 7, 'CPU: 1195G7\nGPU: Intel Integrated Iris Xe Graphics\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Natural Silver\nTrọng lượng: 1.52 kg', 'Bài review về laptop', '26399000', 'laptop_133.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(140, 'Lenovo IdeaPad Flex 5 Ryzen 5 Hexa Core 5500U - (8 GB/512 GB SSD/Windows 11 Home) 14ALC05 2 in 1 Laptop  (14 Inch, Graphite Grey, With MS Office)', 29, 6, 'CPU: 5500U\nGPU: AMD Radeon AMD\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 Inch) 1920 x 1080 Pixel\nPin: Không có\nMàu sắc: Graphite Grey\nTrọng lượng: Không có', 'Bài review về laptop', '17399000', 'laptop_134.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(141, 'Lenovo IdeaPad 3 Core i3 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) 14ITL6 Thin and Light Laptop  (14 Inch, Arctic Grey, With MS Office)', 28, 6, 'CPU: 1115G4\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 Inch) 1920 x 1080 Pixel\nPin: Không có\nMàu sắc: Arctic Grey\nTrọng lượng: Không có', 'Bài review về laptop', '12899000', 'laptop_135.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(142, 'HP Pavilion x360 Convertible Core i5 11th Gen - (16 GB/512 GB SSD/Windows 11 Home) 14-dy1048TU Thin and Light Laptop  (14 inch, Natural Silver, 1.52 kg, With MS Office)', 28, 7, 'CPU: 1155G7\nGPU: Intel Integrated Iris Xe Graphics\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Natural Silver\nTrọng lượng: 1.52 kg', 'Bài review về laptop', '22499000', 'laptop_136.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(143, 'Lenovo Yoga 7 Core i7 11th Gen - (16 GB/512 GB SSD/Windows 11 Home) 14ITL5 2 in 1 Laptop  (14 Inch, Slate Grey, With MS Office)', 29, 6, 'CPU: 1165G7\nGPU: Intel Integrated Iris Xe\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 Inch) 1920 x 1080 Pixel\nPin: Không có\nMàu sắc: Slate Grey\nTrọng lượng: Không có', 'Bài review về laptop', '29999000', 'laptop_137.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(144, 'DELL Inspiron Ryzen 5 Dual Core 3450U - (8 GB/512 GB SSD/Windows 11 Home) INSPIRON 3515 Thin and Light Laptop  (15.6 Inch, Carbon Black, 1.8 kg, With MS Office)', 28, 5, 'CPU: 3450U\nGPU: AMD Radeon Vega Graphics\nRAM: 8 GB DDR4 2666 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixel\nPin: 3 Cell\nMàu sắc: Carbon Black\nTrọng lượng: 1.8 kg', 'Bài review về laptop', '13999000', 'laptop_138.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(145, 'DELL Vostro Core i3 10th Gen - (8 GB/512 GB SSD/Windows 11 Home) vostro 3510 icl Thin and Light Laptop  (15.6 inch, Titan Gray, 1.8 Kg, With MS Office)', 28, 5, 'CPU: 1005G1\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 2666 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 3 Cell\nMàu sắc: Titan Gray\nTrọng lượng: 1.8 Kg', 'Bài review về laptop', '12299000', 'laptop_139.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(146, 'HP Core i3 11th Gen - (8 GB/512 GB SSD/Windows 10 Home) 14s-dq2606tu Thin and Light Laptop  (14 Inch, Natural Silver, 1.46 Kg, With MS Office)', 28, 7, 'CPU: Không có\nGPU: Intel Integrated UHD Graphics\nRAM: 8 GB DDR4 2666 MHz\nSSD: 512 GB\nMàn hình: 35.56 cm (14 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Natural Silver\nTrọng lượng: 1.46 Kg', 'Bài review về laptop', '12899000', 'laptop_140.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(147, 'DELL Ryzen 3 Dual Core 3250U - (8 GB/512 GB SSD/Windows 11 Home) INSPIRON 3515 Thin and Light Laptop  (15.6 inch, Carbon Black, 1.8 kg, With MS Office)', 28, 5, 'CPU: 3250U\nGPU: AMD Radeon AMD\nRAM: 8 GB DDR4 2666 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Carbon Black\nTrọng lượng: 1.8 kg', 'Bài review về laptop', '12299000', 'laptop_141.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(148, 'DELL Core i3 10th Gen - (8 GB/1 TB HDD/256 GB SSD/Windows 11 Home) Vostro 3510 Thin and Light Laptop  (15.6 inch, Titan Gray, 1.8 kg, With MS Office)', 28, 5, 'CPU: 1005G1\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Titan Gray\nTrọng lượng: 1.8 kg', 'Bài review về laptop', '12299000', 'laptop_142.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(149, 'HP OMEN Core i7 12th Gen - (16 GB/1 TB SSD/Windows 11 Home/6 GB Graphics) 16-B1361TX Laptop  (16.1 inch, Shadow Black, 2.32 kg, With MS Office)', 28, 7, 'CPU: 12700H\nGPU: NVIDIA GeForce RTX 3060\nRAM: 16 GB DDR5 Không có\nSSD: 1 TB\nMàn hình: 40.89 cm (16.1 inch) 1920 x 1080 Pixel\nPin: 6 Cell\nMàu sắc: Shadow Black\nTrọng lượng: 2.32 kg', 'Bài review về laptop', '46599000', 'laptop_143.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(150, 'ASUS Commercial Series Core i3 10th Gen - (4 GB/256 GB SSD/Windows 10 Home) P2451FA Business Laptop  (14 inch, Black)', 30, 8, 'CPU: Không có\nGPU: Intel Integrated Intel UHD\nRAM: 4 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 35.56 cm (14 inch) 1366 x 768$$Pixels pixel\nPin: Không có\nMàu sắc: Black\nTrọng lượng: Không có', 'Bài review về laptop', '11699000', 'laptop_144.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(151, 'HP OMEN Ryzen 7 Octa Core 5800H - (16 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050Ti) 16-C0138AX Gaming Laptop  (16.1 Inch, Mica Silver, 2.32 Kg, With MS Office)', 26, 7, 'CPU: 5800H\nGPU: NVIDIA GeForce RTX 3050Ti\nRAM: 16 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 40.89 cm (16.1 Inch) 1920 x 1080 Pixels\nPin: 4\nMàu sắc: Mica Silver\nTrọng lượng: 2.32 Kg', 'Bài review về laptop', '31299000', 'laptop_145.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(152, 'HP OMEN Ryzen 7 Octa Core 5800H - (16 GB/1 TB SSD/Windows 11 Home/AMD Radeon RX 6600M) 16-C0140AX Gaming Laptop  (16.1 inch, Mica Silver, 2.32 Kg, With MS Office)', 26, 7, 'CPU: 5800H\nGPU: AMD Radeon RX 6600M\nRAM: 16 GB DDR4 Không có\nSSD: 1 TB\nMàn hình: 40.89 cm (16.1 inch) 1920 x 1080 Pixel\nPin: 6 cell\nMàu sắc: Mica Silver\nTrọng lượng: 2.32 Kg', 'Bài review về laptop', '37599000', 'laptop_146.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(153, 'HP Core i3 11th Gen - (8 GB/1 TB HDD/Windows 11 Home) 250 G8 Laptop  (15.6 inch, Dark Ash)', 28, 7, 'CPU: Không có\nGPU: Intel Integrated\nRAM: 8 GB DDR4 Không có\nSSD: Không có\nMàn hình: 39.62 cm (15.6 inch) 1366 x 768 pixel\nPin: Không có\nMàu sắc: Dark Ash\nTrọng lượng: Không có', 'Bài review về laptop', '12199000', 'laptop_147.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(154, 'HP Ryzen 3 Dual Core - (8 GB/1 TB HDD/Windows 11 Home) 255 G8 Laptop  (15.6 inch, Dark Ash)', 28, 7, 'CPU: Không có\nGPU: AMD Radeon\nRAM: 8 GB DDR4 Không có\nSSD: Không có\nMàn hình: 39.62 cm (15.6 inch) 1366 x 768 pixel\nPin: Không có\nMàu sắc: Dark Ash\nTrọng lượng: Không có', 'Bài review về laptop', '11399000', 'laptop_148.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(155, 'ASUS ROG Strix G15 Ryzen 7 Octa Core 4800H - (8 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX RTX 3050/144 Hz) G513IC-HN025W Gaming Laptop  (15.6 Inch, Eclipse Gray, 2.10 Kg)', 26, 8, 'CPU: 4800H\nGPU: NVIDIA GeForce RTX RTX 3050\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 4\nMàu sắc: Eclipse Gray\nTrọng lượng: 2.10 Kg', 'Bài review về laptop', '25199000', 'laptop_149.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(156, 'ASUS TUF Gaming F15 Core i5 10th Gen - (8 GB/512 GB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce GTX GTX 1650/144 Hz) FX506LH-HN258WS Gaming Laptop  (15.6 Inch, Black Plastic, 2.30 Kg, With MS Office)', 26, 8, 'CPU: 10300H\nGPU: NVIDIA GeForce GTX GTX 1650\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels pixel\nPin: 3\nMàu sắc: Black Plastic\nTrọng lượng: 2.30 Kg', 'Bài review về laptop', '18599000', 'laptop_150.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(157, 'HP Core i3 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) 250 G8 Laptop  (15.6 inch, Dark Ash)', 28, 7, 'CPU: Không có\nGPU: Intel Integrated\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 pixel\nPin: Không có\nMàu sắc: Dark Ash\nTrọng lượng: Không có', 'Bài review về laptop', '12999000', 'laptop_151.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(158, 'ASUS Ryzen 7 Octa Core 5800HS - (16 GB/1 TB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX GeForce RTX 3050) GA401QC-K2188WS Gaming Laptop  (14 Inch, Eclipse Gray, 1.60 Kg, With MS Office)', 26, 8, 'CPU: 5800HS\nGPU: NVIDIA GeForce RTX GeForce RTX 3050\nRAM: 16 GB DDR4 3200 MHz\nSSD: 1 TB\nMàn hình: 35.56 cm (14 Inch) 2560 x 1440 Pixels\nPin: 4\nMàu sắc: Eclipse Gray\nTrọng lượng: 1.60 Kg', 'Bài review về laptop', '34399000', 'laptop_152.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(159, 'ASUS Ryzen 7 Octa Core 6800H - (16 GB/1 TB SSD/Windows 11 Home/6 GB Graphics/NVIDIA GeForce RTX RTX 3060/144 Hz) FA777RM-HX019W Gaming Laptop  (17.3 Inch, Jaeger Gray, 2.60 Kg)', 26, 8, 'CPU: 6800H\nGPU: NVIDIA GeForce RTX RTX 3060\nRAM: 16 GB DDR5 4800 MHz\nSSD: 1 TB\nMàn hình: 43.94 cm (17.3 Inch) 1920 x 1080 Pixels\nPin: 4\nMàu sắc: Jaeger Gray\nTrọng lượng: 2.60 Kg', 'Bài review về laptop', '40099000', 'laptop_153.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(160, 'HP Celeron Dual Core - (8 GB/256 GB SSD/Windows 11 Home) 14s-dq3032tu Thin and Light Laptop  (14 inch, Jet Black, 1.46 kg, With MS Office)', 28, 7, 'CPU: N4500\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 35.56 cm (14 inch) 1366 x 768 Pixel\nPin: 3 cell\nMàu sắc: Jet Black\nTrọng lượng: 1.46 kg', 'Bài review về laptop', '9899000', 'laptop_154.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(161, 'Lenovo Yoga 6 Ryzen 7 Octa Core 5700U - (16 GB/512 GB SSD/Windows 11 Home) 13ALC6 2 in 1 Laptop  (13.3 inch, Abyss Blue, 1.32 Kg, With MS Office)', 29, 6, 'CPU: 5700U\nGPU: AMD Radeon\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 33.78 cm (13.3 inch) 1920 x 1080 Pixels\nPin: Không có\nMàu sắc: Abyss Blue\nTrọng lượng: 1.32 Kg', 'Bài review về laptop', '23999000', 'laptop_155.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(162, 'ASUS Pentium Quad Core 10th Gen - (4 GB/128 GB SSD/128 GB EMMC Storage/Windows 11 Home) T3300KA-LQ121WS 2 in 1 Laptop  (13.3 inch, Black, With MS Office)', 29, 8, 'CPU: Không có\nGPU: Intel Integrated intel hd\nRAM: 4 GB DDR4 Không có\nSSD: 128 GB\nMàn hình: 33.78 cm (13.3 inch) 1920 x 1080$$Pixels pixel\nPin: Không có\nMàu sắc: Black\nTrọng lượng: Không có', 'Bài review về laptop', '16199000', 'laptop_156.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(163, 'ASUS Core i7 11th Gen - (16 GB/512 GB SSD/4 GB EMMC Storage/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX NVIDIA GeForce RTX 3050) FX706HCB-HX193T Gaming Laptop  (17.3 inch, Black)', 26, 8, 'CPU: Không có\nGPU: NVIDIA GeForce RTX NVIDIA GeForce RTX 3050\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 43.94 cm (17.3 inch) 1920 x 1080$$Pixels pixel\nPin: Không có\nMàu sắc: Black\nTrọng lượng: Không có', 'Bài review về laptop', '28799000', 'laptop_157.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(164, 'HP ProBook Core i5 11th Gen - (8 GB/512 GB SSD/Windows 10 Pro) 450 G8 Laptop  (15.6 inch, Pike Silver Aluminum)', 28, 7, 'CPU: Không có\nGPU: Intel Integrated\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1366 x 768 pixel\nPin: Không có\nMàu sắc: Pike Silver Aluminum\nTrọng lượng: Không có', 'Bài review về laptop', '26699000', 'laptop_158.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(165, 'MSI Raider GE66 Core i7 12th Gen - (16 GB/1 TB SSD/Windows 11 Home/8 GB Graphics/NVIDIA GeForce RTX 3070 Ti) Raider GE66 12UGS-096IN Gaming Laptop  (15.6 inch, Titanium Blue, 2.38 kg)', 26, 4, 'CPU: 12700H\nGPU: NVIDIA GeForce RTX 3070 Ti\nRAM: 16 GB DDR5 Không có\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 inch) 2560 x 1440 Pixel\nPin: 4 Cell\nMàu sắc: Titanium Blue\nTrọng lượng: 2.38 kg', 'Bài review về laptop', '77799000', 'laptop_159.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(166, 'MSI Core i7 12th Gen - (16 GB/1 TB SSD/Windows 11 Home/8 GB Graphics/NVIDIA GeForce RTX 3070) Crosshair 15 Rainbow Six Extraction Edition B12UGZ-032IN Gaming Laptop  (15.6 inch, Black, 2.47 kg)', 26, 4, 'CPU: 12700H\nGPU: NVIDIA GeForce RTX 3070\nRAM: 16 GB DDR4 Không có\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 inch) 2560 x 1440 Pixel\nPin: 4 cell\nMàu sắc: Black\nTrọng lượng: 2.47 kg', 'Bài review về laptop', '53899000', 'laptop_160.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(167, 'acer Predator Helios 300 Core i9 11th Gen - (16 GB/1 TB SSD/Windows 11 Home/6 GB Graphics/NVIDIA GeForce RTX 3060/360 Hz) PH315-54 Gaming Laptop  (15.6 Inch, Abyssal Black, 2.3 Kg)', 26, 9, 'CPU: 11900H\nGPU: NVIDIA GeForce RTX 3060\nRAM: 16 GB DDR4 3200 MHz\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 4\nMàu sắc: Abyssal Black\nTrọng lượng: 2.3 Kg', 'Bài review về laptop', '43399000', 'laptop_162.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(168, 'Lenovo Core i5 10th Gen - (4 GB/1 TB HDD/DOS) V14 IIL Laptop  (14 inch, Grey)', 28, 6, 'CPU: Không có\nGPU: NA INTEGRATED_GRAPHICS\nRAM: 4 GB DDR4 Không có\nSSD: Không có\nMàn hình: 35.56 cm (14 inch) ?1366 x 768 (HD Ready) pixel\nPin: Không có\nMàu sắc: Grey\nTrọng lượng: Không có', 'Bài review về laptop', '14299000', 'laptop_163.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(169, 'HP OMEN Core i7 11th Gen - (16 GB/1 TB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX RTX 3050Ti) 16-B0352TX Gaming Laptop  (16.1 Inch, Shadow Black, 2.32 Kg, With MS Office)', 26, 7, 'CPU: 11800H\nGPU: NVIDIA GeForce RTX RTX 3050Ti\nRAM: 16 GB DDR4 3200 MHz\nSSD: 1 TB\nMàn hình: 40.89 cm (16.1 Inch) 1920 x 1080 Pixels\nPin: 6\nMàu sắc: Shadow Black\nTrọng lượng: 2.32 Kg', 'Bài review về laptop', '35599000', 'laptop_164.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(170, 'HP OMEN Core i7 11th Gen - (16 GB/1 TB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX RTX 3050) 16-B0351TX Gaming Laptop  (16.1 Inch, Shadow Black, 2.32 Kg, With MS Office)', 26, 7, 'CPU: 11800H\nGPU: NVIDIA GeForce RTX RTX 3050\nRAM: 16 GB DDR4 3200 MHz\nSSD: 1 TB\nMàn hình: 40.89 cm (16.1 Inch) 1920 x 1080 Pixel\nPin: 4\nMàu sắc: Shadow Black\nTrọng lượng: 2.32 Kg', 'Bài review về laptop', '34999000', 'laptop_165.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(171, 'ASUS Asus Vivobook 15 Pentium Quad Core - (4 GB/1 TB HDD/Windows 11 Home) X515MA-BR101W Laptop  (15.6 inch, Transparent Silver, 1.8 kg)', 28, 8, 'CPU: PQC N5030\nGPU: Intel Integrated Intel UHD\nRAM: 4 GB DDR4 Không có\nSSD: Không có\nMàn hình: 39.62 cm (15.6 inch) 1366 x 768 pixel\nPin: Không có\nMàu sắc: Transparent Silver\nTrọng lượng: 1.8 kg', 'Bài review về laptop', '8999000', 'laptop_166.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(172, 'MSI Sword 15 Core i7 11th Gen - (8 GB/512 GB SSD/Windows 10 Home/4 GB Graphics/NVIDIA GeForce RTX 3050/144 Hz) 15 A11UC-891IN Gaming Laptop  (15.6 inch, White, 2.25 kg)', 26, 4, 'CPU: Intel Core i7-11800H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 8 GB DDR4 3200 MHz\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080$$Pixels pixel\nPin: 3 cell\nMàu sắc: White\nTrọng lượng: 2.25 kg', 'Bài review về laptop', '26099000', 'laptop_167.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(173, 'HP Ryzen 5 Quad Core - (8 GB/512 GB SSD/Windows 10 Home) 15s-gr0500AU Laptop  (15.6 inch, Natural Silver, With MS Office)', 28, 7, 'CPU: Không có\nGPU: AMD Radeon AMD\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 pixel\nPin: Không có\nMàu sắc: Natural Silver\nTrọng lượng: Không có', 'Bài review về laptop', '15699000', 'laptop_168.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(174, 'HP Core i3 10th Gen - (8 GB/512 GB SSD/Windows 10 Pro) 240 G8 Laptop  (14 inch, Black)', 28, 7, 'CPU: Không có\nGPU: Intel Integrated\nRAM: 8 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920x1080 pixel\nPin: Không có\nMàu sắc: Black\nTrọng lượng: Không có', 'Bài review về laptop', '16099000', 'laptop_169.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(175, 'ASUS Vivobook Ultra K15 Core i3 11th Gen - (8 GB/256 GB SSD/Windows 11 Home) K513EA-L303WS K513E Thin and Light Laptop  (15.6 inch, Transparent Silver, 1.8 kg, With MS Office)', 28, 8, 'CPU: i3-1115G4\nGPU: Intel Integrated Intel UHD\nRAM: 8 GB DDR4 3200 MHz\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 pixel\nPin: Không có\nMàu sắc: Transparent Silver\nTrọng lượng: 1.8 kg', 'Bài review về laptop', '14699000', 'laptop_170.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(176, 'ASUS Vivobook 11 Celeron Dual Core - (4 GB/128 GB EMMC Storage/Windows 11 Home) E210MA-GJ001W Thin and Light Laptop  (11.6 inch, Peacock Blue, 1.05 kg)', 28, 8, 'CPU: Celeron N4020\nGPU: Intel Integrated Intel® UHD Graphics 600\nRAM: 4 GB DDR4 Không có\nSSD: Không có\nMàn hình: 29.46 cm (11.6 inch) 1366 x 768 pixel\nPin: 38WHrs, 2S1P, 2-cell Li-ion\nMàu sắc: Peacock Blue\nTrọng lượng: 1.05 kg', 'Bài review về laptop', '8099000', 'laptop_171.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(177, 'ASUS Core i3 11th Gen - (8 GB/256 GB SSD/Windows 11 Home) K513EA-L303WS Laptop  (15.6 inch, Silver, With MS Office)', 28, 8, 'CPU: Không có\nGPU: Intel Integrated intel hd\nRAM: 8 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 pixel\nPin: Không có\nMàu sắc: Silver\nTrọng lượng: Không có', 'Bài review về laptop', '13999000', 'laptop_172.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(178, 'ASUS VivoBook K15 OLED Ryzen 5 Hexa Core 5500U - (16 GB/512 GB SSD/Windows 11 Home) KM513UA-L513WS Thin and Light Laptop  (15.6 Inch, Transparent Silver, 1.80 Kg, With MS Office)', 28, 8, 'CPU: 5500U\nGPU: AMD Radeon Radeon Graphics\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixels\nPin: 3\nMàu sắc: Transparent Silver\nTrọng lượng: 1.80 Kg', 'Bài review về laptop', '18599000', 'laptop_173.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(179, 'ASUS VivoBook K15 OLED (2021) Ryzen 5 Hexa Core 5500U - (16 GB/512 GB SSD/Windows 11 Home) KM513UA-L511WS Thin and Light Laptop  (15.6 inch, Hearty Gold, 1.80 kg, With MS Office)', 28, 8, 'CPU: 5500U\nGPU: AMD Radeon AMD\nRAM: 16 GB DDR4 Không có\nSSD: 512 GB\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 3 cell\nMàu sắc: Hearty Gold\nTrọng lượng: 1.80 kg', 'Bài review về laptop', '18599000', 'laptop_174.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(180, 'ASUS EeeBook 12 Celeron Dual Core - (4 GB/64 GB EMMC Storage/Windows 11 Home) E210MA-GJ012W Thin and Light Laptop  (11.6 Inch, Star Black, 1.05 Kg)', 28, 8, 'CPU: N4020\nGPU: Intel Integrated UHD Graphics 600\nRAM: 4 GB DDR4 Không có\nSSD: Không có\nMàn hình: 29.46 cm (11.6 Inch) 1366 x 768 Pixels\nPin: 2\nMàu sắc: Star Black\nTrọng lượng: 1.05 Kg', 'Bài review về laptop', '6599000', 'laptop_175.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(181, 'ASUS VivoBook 15 (2021) Core i3 10th Gen - (8 GB/1 TB HDD/Windows 11 Home) X515JA-BQ302W Thin and Light Laptop  (15.6 inch, Transparent Silver, 1.80 kg)', 28, 8, 'CPU: 1005G1\nGPU: Intel Integrated UHD\nRAM: 8 GB DDR4 Không có\nSSD: Không có\nMàn hình: 39.62 cm (15.6 inch) 1920 x 1080 Pixel\nPin: 2 cell\nMàu sắc: Transparent Silver\nTrọng lượng: 1.80 kg', 'Bài review về laptop', '9599000', 'laptop_176.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(182, 'ASUS EeeBook 12 Celeron Dual Core - (4 GB/64 GB EMMC Storage/Windows 11 Home) E210MA-GJ011W Thin and Light Laptop  (11.6 Inch, Peacock Blue, 1.05 kg)', 28, 8, 'CPU: N4020\nGPU: Intel Integrated UHD Graphics 600\nRAM: 4 GB DDR4 Không có\nSSD: Không có\nMàn hình: 29.46 cm (11.6 Inch) 1366 x 768 Pixels\nPin: 2\nMàu sắc: Peacock Blue\nTrọng lượng: 1.05 kg', 'Bài review về laptop', '6599000', 'laptop_177.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(183, 'ASUS EeeBook 14 Pentium Silver - (8 GB/256 GB SSD/Windows 11 Home) E410KA-BV103WS Thin and Light Laptop  (14 Inch, Star Black, 1.30 kg, With MS Office)', 28, 8, 'CPU: N6000\nGPU: Intel Integrated Intel HD Graphics\nRAM: 8 GB DDR4 Không có\nSSD: 256 GB\nMàn hình: 35.56 cm (14 Inch) 1366 x 768 Pixels\nPin: 3\nMàu sắc: Star Black\nTrọng lượng: 1.30 kg', 'Bài review về laptop', '9599000', 'laptop_178.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(184, 'ASUS ZenBook Duo 14 (2021) Touch Panel Core i5 11th Gen - (16 GB/512 GB SSD/Windows 11 Home/2 GB Graphics) UX482EG-KA521WS Thin and Light Laptop  (14 inch, Celestial Blue, 1.62 kg, With MS Office)', 28, 8, 'CPU: 1135G7\nGPU: NVIDIA GeForce MX450\nRAM: 16 GB LPDDR4X Không có\nSSD: 512 GB\nMàn hình: 35.56 cm (14 inch) 1920 x 1080 Pixel\nPin: 4 Cell\nMàu sắc: Celestial Blue\nTrọng lượng: 1.62 kg', 'Bài review về laptop', '34399000', 'laptop_179.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(185, 'ASUS ROG Strix G15 (2022) Ryzen 7 Octa Core 6800H - (16 GB/1 TB SSD/Windows 11 Home/4 GB Graphics/NVIDIA GeForce RTX 3050) G513RC-HN084WS Gaming Laptop  (15.6 Inch, Volt Green, 2.10 kg, With MS Office)', 26, 8, 'CPU: 6800H\nGPU: NVIDIA GeForce RTX 3050\nRAM: 16 GB DDR5 4800 MHz\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 Inch) 1920 x 1080 Pixel\nPin: 4 cell\nMàu sắc: Volt Green\nTrọng lượng: 2.10 kg', 'Bài review về laptop', '34399000', 'laptop_180.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(186, 'ASUS ROG Strix SCAR 15 (2022) Core i9 12th Gen - (32 GB/1 TB SSD/Windows 11 Home/16 GB Graphics/NVIDIA GeForce RTX 3080 Ti) G533ZX-LN024WS Gaming Laptop  (15.6 inch, Off Black, 2.30 Kg, With MS Office)', 26, 8, 'CPU: 12900H\nGPU: NVIDIA GeForce RTX 3080 Ti\nRAM: 32 GB DDR5 Không có\nSSD: 1 TB\nMàn hình: 39.62 cm (15.6 inch) 2560 x 1440 Pixel\nPin: 4 cell\nMàu sắc: Off Black\nTrọng lượng: 2.30 Kg', 'Bài review về laptop', '90399000', 'laptop_181.jpeg', 1, '2024-12-16 05:17:03', '2024-12-16 05:17:03'),
(187, 'test', 30, 9, 'test', 'test', 'test', '', 0, '2024-12-17 21:15:21', '2024-12-17 21:15:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reviews`
--

CREATE TABLE `tbl_reviews` (
  `review_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `review_content` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_name` varchar(255) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `shipping_phone` varchar(255) NOT NULL,
  `shipping_email` varchar(255) NOT NULL,
  `shipping_notes` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_admin`
--
ALTER TABLE `table_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `table_admin_admin_email_unique` (`admin_email`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_email` (`customer_email`),
  ADD UNIQUE KEY `customer_phone` (`customer_phone`);

--
-- Indexes for table `tbl_location`
--
ALTER TABLE `tbl_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `shipping_id` (`shipping_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`,`shipping_id`,`payment_id`),
  ADD KEY `shipping_id` (`shipping_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`),
  ADD KEY `order_id` (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `table_admin`
--
ALTER TABLE `table_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  MODIFY `coupon_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_location`
--
ALTER TABLE `tbl_location`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  MODIFY `review_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_location`
--
ALTER TABLE `tbl_location`
  ADD CONSTRAINT `tbl_location_ibfk_1` FOREIGN KEY (`shipping_id`) REFERENCES `tbl_shipping` (`shipping_id`);

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`shipping_id`) REFERENCES `tbl_shipping` (`shipping_id`),
  ADD CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customers` (`customer_id`),
  ADD CONSTRAINT `tbl_order_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `tbl_payment` (`payment_id`);

--
-- Constraints for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD CONSTRAINT `tbl_order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`),
  ADD CONSTRAINT `tbl_order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`);

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `tbl_brand` (`brand_id`),
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `tbl_category_product` (`category_id`);

--
-- Constraints for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  ADD CONSTRAINT `tbl_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`),
  ADD CONSTRAINT `tbl_reviews_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customers` (`customer_id`);

--
-- Constraints for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD CONSTRAINT `tbl_shipping_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customers` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
