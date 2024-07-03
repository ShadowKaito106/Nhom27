-- --------------------------------------------------------
-- Máy chủ:                      127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Phiên bản:           12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for webdientu
DROP DATABASE IF EXISTS `webdientu`;
CREATE DATABASE IF NOT EXISTS `webdientu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webdientu`;

-- Dumping structure for table webdientu.blog
CREATE TABLE IF NOT EXISTS `blog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `created_date` date DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.blog: ~0 rows (approximately)

-- Dumping structure for table webdientu.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `total_price` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpu4bcbluhsxagirmbdn7dilm5` (`product_id`),
  KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKpu4bcbluhsxagirmbdn7dilm5` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.cart: ~0 rows (approximately)

-- Dumping structure for table webdientu.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hide` bit(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKt8o6pivur7nn124jehx7cygw5` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.categories: ~2 rows (approximately)
REPLACE INTO `categories` (`id`, `hide`, `name`) VALUES
	(1, b'0', 'Đồ chơi'),
	(2, b'0', 'Đồ chơi cho Sang');

-- Dumping structure for table webdientu.contact
CREATE TABLE IF NOT EXISTS `contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `created_date` date DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe07k4jcfdophemi6j1lt84b61` (`user_id`),
  CONSTRAINT `FKe07k4jcfdophemi6j1lt84b61` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.contact: ~0 rows (approximately)

-- Dumping structure for table webdientu.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `quantity` int NOT NULL,
  `total_amount` bigint NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKgnfabg6rvhoc3c9o4deqb1hn4` (`order_id`),
  KEY `FKjunvl5maki3unqdvljk31kns3` (`user_id`),
  CONSTRAINT `FKjunvl5maki3unqdvljk31kns3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKthf5w8xuexpjinfl7xheakhqn` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.invoice: ~0 rows (approximately)

-- Dumping structure for table webdientu.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `total_price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.orders: ~1 rows (approximately)
REPLACE INTO `orders` (`id`, `address`, `created_date`, `customer_name`, `email`, `note`, `phone`, `status`, `total_price`) VALUES
	('6fd859cd-3532-4e05-9940-e60763818c5a', 'Ở đây/ đường này, phường này, quận này, thành phố này', '2024-07-03', 'Tao là chó', 'duyduy31012@gmail.com', 'Ship được đến nhà chỉ định cho 5 củ', '0559921212', b'0', 1000000);

-- Dumping structure for table webdientu.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) NOT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.order_details: ~1 rows (approximately)
REPLACE INTO `order_details` (`id`, `quantity`, `size`, `order_id`, `product_id`) VALUES
	(1, 100, 'xxl', '6fd859cd-3532-4e05-9940-e60763818c5a', 1);

-- Dumping structure for table webdientu.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `hide` bit(1) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` bigint NOT NULL,
  `quantity` int NOT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_chk_1` CHECK ((`price` >= 0)),
  CONSTRAINT `products_chk_2` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.products: ~1 rows (approximately)
REPLACE INTO `products` (`id`, `avatar`, `created_date`, `description`, `hide`, `name`, `price`, `quantity`, `category_id`) VALUES
	(1, '13fe1ffc-bef5-4367-ba38-06b99eb48a01_2eb67acd-0daa-4511-82a7-704bbf263102_602765c1-3bc5-41d8-aea6-18148d94154b_Screenshot .png', '2024-07-03', 'Đây không phải là anh Liêm', b'0', 'Test', 10000, 1000000, 2);

-- Dumping structure for table webdientu.product_details
CREATE TABLE IF NOT EXISTS `product_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnfvvq3meg4ha3u1bju9k4is3r` (`product_id`),
  CONSTRAINT `FKnfvvq3meg4ha3u1bju9k4is3r` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.product_details: ~1 rows (approximately)
REPLACE INTO `product_details` (`id`, `image`, `product_id`) VALUES
	(1, 'Screenshot 2023-05-25 204224.png', 1);

-- Dumping structure for table webdientu.promotion
CREATE TABLE IF NOT EXISTS `promotion` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `discount` float NOT NULL,
  `end_date` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqmywk5v1ql1l7rx3qc3u13qwn` (`category_id`),
  CONSTRAINT `FKqmywk5v1ql1l7rx3qc3u13qwn` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.promotion: ~1 rows (approximately)
REPLACE INTO `promotion` (`id`, `code`, `created_date`, `discount`, `end_date`, `name`, `quantity`, `start_date`, `category_id`) VALUES
	('edeb4774-6745-46e5-84a8-b51d7d23218d', 'Zeo', '2024-07-03', 10, '2025-01-03', 'Lưu Hoàng Anh Khoa', 10, '2024-07-01', 2);

-- Dumping structure for table webdientu.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(250) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.role: ~3 rows (approximately)
REPLACE INTO `role` (`id`, `description`, `name`) VALUES
	(1, 'ad', 'ADMIN'),
	(2, 'cus', 'CUSTOMER'),
	(3, 'em', 'EMPLOYER');

-- Dumping structure for table webdientu.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `applied_voucher_code` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`),
  UNIQUE KEY `UK589idila9li6a4arw1t8ht1gx` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.user: ~2 rows (approximately)
REPLACE INTO `user` (`id`, `applied_voucher_code`, `date_of_birth`, `email`, `full_name`, `gender`, `password`, `phone`, `reset_password_token`, `username`) VALUES
	(1, NULL, '2003-01-31', 'duyduy31012@gmail.com', 'Lưu Hoàng Anh Khoa', 'Khác', '$2a$10$bbm6iDl3va.LLJE8LF3GduFbCt.3wN0KnS4wqgswBRKAQbJYjL6ha', '0559921212', NULL, 'admin'),
	(2, NULL, '2024-07-31', 'SangGayRatNhieu@gmail.com', 'Sang nô lệ', 'false', '$2a$10$b8BsQlapjc/7sXDo3E67je65Lc6dIIiHozG3.fqrFhF35uD6k0fnG', '0123456789', NULL, 'Employee');

-- Dumping structure for table webdientu.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table webdientu.user_role: ~2 rows (approximately)
REPLACE INTO `user_role` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
