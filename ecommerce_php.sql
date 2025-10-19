-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ecommerce_php
CREATE DATABASE IF NOT EXISTS `ecommerce_php` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce_php`;

-- Dumping structure for table ecommerce_php.attribute
CREATE TABLE IF NOT EXISTS `attribute` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.attribute_value
CREATE TABLE IF NOT EXISTS `attribute_value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attribute_id` int NOT NULL,
  `value_name` varchar(50) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.banner
CREATE TABLE IF NOT EXISTS `banner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `cate_id` int NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `totalPrice` int NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.cart_item
CREATE TABLE IF NOT EXISTS `cart_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_variant_id` int NOT NULL,
  `quantity` smallint NOT NULL,
  `cart_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_id` (`product_variant_id`),
  KEY `prod_id_2` (`product_variant_id`),
  KEY `cart_id` (`cart_id`),
  KEY `product_variant_id` (`product_variant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.coupon
CREATE TABLE IF NOT EXISTS `coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `title` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
  `min_amount` int NOT NULL,
  `expired` datetime NOT NULL,
  `quantity` smallint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.images_product
CREATE TABLE IF NOT EXISTS `images_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` text NOT NULL,
  `prod_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_id` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.news
CREATE TABLE IF NOT EXISTS `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `view` smallint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_code` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status_id` int NOT NULL DEFAULT '1',
  `total_money` int NOT NULL,
  `coupon_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.order_item
CREATE TABLE IF NOT EXISTS `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_variant_id` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `total_money` int NOT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_variant_id` (`product_variant_id`),
  KEY `product_id` (`product_variant_id`),
  KEY `product_variant_id_2` (`product_variant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.order_status
CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_method_id` int NOT NULL,
  `payment_transaction_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_method_id` (`payment_method_id`,`payment_transaction_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.payment_method
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.payment_transactions
CREATE TABLE IF NOT EXISTS `payment_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bankCode` varchar(50) NOT NULL,
  `bankTranNo` varchar(50) NOT NULL,
  `cardType` varchar(50) NOT NULL,
  `payDate` bigint NOT NULL,
  `transactionNo` varchar(50) NOT NULL,
  `secureHash` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `discount` smallint DEFAULT '0',
  `isVariant` tinyint DEFAULT '0',
  `sold` int DEFAULT '0',
  `quantity` int DEFAULT '0',
  `thumb` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `totalRatings` float DEFAULT '0',
  `totalUserRatings` mediumint DEFAULT '0',
  `short_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `cate_id` int DEFAULT NULL,
  `slug` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `status` tinyint DEFAULT '0',
  `view` mediumint DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.product_variants
CREATE TABLE IF NOT EXISTS `product_variants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prod_id` int NOT NULL,
  `price` int NOT NULL,
  `quantity` smallint NOT NULL,
  `discount` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod_id` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.ratings
CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prod_id` int NOT NULL,
  `user_id` int NOT NULL,
  `star` int NOT NULL,
  `comment` varchar(255) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `prod_id` (`prod_id`,`user_id`),
  KEY `prod_id_2` (`prod_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.store_custom
CREATE TABLE IF NOT EXISTS `store_custom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `open_time` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'https://t4.ftcdn.net/jpg/05/49/98/39/360_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg',
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `isBlock` tinyint NOT NULL DEFAULT '0',
  `role_id` tinyint NOT NULL DEFAULT '3',
  `accessToken` text NOT NULL,
  `refreshToken` varchar(500) NOT NULL,
  `create_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`phone`),
  KEY `email_2` (`email`,`phone`),
  KEY `email_3` (`email`,`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table ecommerce_php.variants_value
CREATE TABLE IF NOT EXISTS `variants_value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_variant_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `attribute_value_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variant_id` (`product_variant_id`,`attribute_id`,`attribute_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
