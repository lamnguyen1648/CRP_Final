-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2021 at 02:13 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crp_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `accountID` varchar(255) NOT NULL,
  `accountFullname` varchar(255) NOT NULL,
  `accountUsername` varchar(255) NOT NULL,
  `accountPassword` varchar(255) NOT NULL,
  `accountEmail` varchar(255) DEFAULT NULL,
  `accountPhone` varchar(255) DEFAULT NULL,
  `roleID` varchar(255) NOT NULL,
  `passwordToken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`accountID`, `accountFullname`, `accountUsername`, `accountPassword`, `accountEmail`, `accountPhone`, `roleID`, `passwordToken`) VALUES
('account_0', 'Lam Nguyen', 'lamnguyen', '$2y$10$YWgW4b8vZmF5g5fPnOJQ8OMEinjfVYINv0GZZQjAambfvKt8iINQm', 'lamnguyen@gmail.com', '0868851101', 'role_0', NULL),
('account_1', 'Demo Staff', 'Staff', '$2y$10$9iXI2kmKunjdlRr5FPCeqecrM8VYLxGAok5EiRYGnAMI8jHCInNg2', 'demo@example.com', '0123456789', 'role_1', NULL),
('user500173', 'Demo Guest', 'guest', '$2y$10$iFJhDiYbV/BvW8O7bDIg.OEGVxcLPMBZYtVBd4zBuubl/2qW7W7wC', 'guest@gmail.com', '0123456789', 'role_2', NULL),
('user561019', 'Nguyen Hong Son', 'sonnguyen', '$2y$10$TF/zBsccZpnXkC4zmMexNeYDYRRUle6Z0xDf6zTSJZDnSgJ77tDr2', 'sonnguyen@gmail.com', '0123456789', 'role_2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account_role`
--

CREATE TABLE `tbl_account_role` (
  `roleID` varchar(255) NOT NULL,
  `roleName` varchar(255) NOT NULL,
  `roleDesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_account_role`
--

INSERT INTO `tbl_account_role` (`roleID`, `roleName`, `roleDesc`) VALUES
('role_0', 'Admin', 'Boss'),
('role_1', 'Staff', 'Working'),
('role_2', 'Customer', 'End User');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account_voucher`
--

CREATE TABLE `tbl_account_voucher` (
  `voucherID` varchar(255) NOT NULL,
  `accountID` varchar(255) NOT NULL,
  `typeID` varchar(255) NOT NULL,
  `createdTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_account_voucher`
--

INSERT INTO `tbl_account_voucher` (`voucherID`, `accountID`, `typeID`, `createdTime`) VALUES
('voucher_12908', 'user431660', 'type_0', '2021-12-23 13:59:11'),
('voucher_57686', 'user561019', 'type_0', '2021-12-29 08:02:59'),
('voucher_60996', 'user500173', 'type_0', '2021-12-22 04:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account_wallet`
--

CREATE TABLE `tbl_account_wallet` (
  `walletID` varchar(255) NOT NULL,
  `walletBalance` varchar(255) NOT NULL,
  `accountID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_account_wallet`
--

INSERT INTO `tbl_account_wallet` (`walletID`, `walletBalance`, `accountID`) VALUES
('wallet36144', '2412', 'user561019'),
('wallet52160', '5600', 'user431660'),
('wallet99644', '0', 'user500173');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_activity_log`
--

CREATE TABLE `tbl_activity_log` (
  `logID` varchar(255) NOT NULL,
  `logTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `logName` varchar(255) NOT NULL,
  `logContent` varchar(255) NOT NULL,
  `accountID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_activity_log`
--

INSERT INTO `tbl_activity_log` (`logID`, `logTime`, `logName`, `logContent`, `accountID`) VALUES
('log_0', '2021-12-16 09:58:54', 'Add Account', 'Added Account account_1 with the following identifications: Fullname: John Doe, Username: Demo, Email: demo@example.com, Phone Number: 0123456789, Role: role_1', 'account_0'),
('log_1', '2021-12-16 11:57:10', 'Add Account', 'Added Account account_2 with the following identifications: \r\n                       Fullname: Guest Name, Username: Guest, Email: guest@gmail.com, Phone Number: 0123456789, Role: role_2', 'account_0'),
('log_10', '2021-12-29 02:09:48', 'Update Category', 'Updated Product product_31 with the following changes:\r\n        Product Name: Pear -> Pear,\r\n        Product Price: 45000 -> 40000,\r\n        Product Description: Fresh -> ,\r\n        Product Category: category_5 -> category_5', 'account_0'),
('log_11', '2021-12-29 02:10:04', 'Update Product Category', 'Updated Product Category category_5 with the following changes:\r\n        Category Name: fruit -> Fruit,\r\n        Category Description: fresh -> fresh', 'account_0'),
('log_12', '2021-12-29 06:15:31', 'Update Account Role', 'Updated Account Role role_2 with the following changes:\r\n        Role Name: Customer -> Customer,\r\n        Role Description: Money Source -> End User', 'account_0'),
('log_13', '2021-12-29 06:19:42', 'Update Product Category', 'Updated Product Category category_4 with the following changes:\r\n        Category Name: rice and nuts -> Rice and Nuts,\r\n        Category Description: well preserved -> well preserved', 'account_0'),
('log_14', '2021-12-29 06:19:50', 'Update Product Category', 'Updated Product Category category_3 with the following changes:\r\n        Category Name: fish -> Fish,\r\n        Category Description: fresh -> fresh', 'account_0'),
('log_15', '2021-12-29 06:19:56', 'Update Product Category', 'Updated Product Category category_2 with the following changes:\r\n        Category Name: seafood -> Seafood,\r\n        Category Description: Fresh -> Fresh', 'account_0'),
('log_16', '2021-12-29 08:08:40', 'Update Order Status', 'Updated Order 2932 with the following changes:\r\n        Order Status: Pending -> Shipping', 'account_0'),
('log_2', '2021-12-16 11:59:10', 'Add Account', 'Added Account account_3 with the following identifications:\r\n            Fullname: Lam Nguyen,\r\n            Username: lamnguyenGuest,\r\n            Email: lamnguyen@gmail.com,\r\n            Phone Number: 0868851101,\r\n            Role: role_2', 'account_0'),
('log_3', '2021-12-16 12:00:16', 'Add Product Category', 'Added Product Category category_1 with the following identifications:\r\n            Category Name: Meat,\r\n            Category Description: Red', 'account_0'),
('log_4', '2021-12-16 12:38:08', 'Update Product Inventory', 'Updated Product Inventory product_0 with the following changes:\r\n        Product Status: Empty -> Available,\r\n        Product Quantity:  -> 10', 'account_0'),
('log_5', '2021-12-22 03:41:23', 'Add Account', 'Added Account account_1 with the following identifications:\r\n            Fullname: Demo Staff,\r\n            Username: Staff,\r\n            Email: demo@example.com,\r\n            Phone Number: 0123456789,\r\n            Role: role_1', 'account_0'),
('log_6', '2021-12-22 03:42:33', 'Add Account', 'Added Account account_2 with the following identifications:\r\n            Fullname: Demo Guest,\r\n            Username: Guest,\r\n            Email: guest@gmail.com,\r\n            Phone Number: 0123456789,\r\n            Role: role_2', 'account_0'),
('log_7', '2021-12-23 14:57:21', 'Update Order Status', 'Updated Order 1985 with the following changes:\r\n        Order Status: Pending -> Completed', 'account_0'),
('log_8', '2021-12-23 15:01:48', 'Update Order Status', 'Updated Order 9688 with the following changes:\r\n        Order Status: Pending -> Completed', 'account_0'),
('log_9', '2021-12-29 02:09:13', 'Update Account Role', 'Updated Account Role role_1 with the following changes:\r\n        Role Name: Staff -> Staff,\r\n        Role Description: Underpaid? -> Working', 'account_0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `orderID` varchar(255) NOT NULL,
  `createdTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `currentStatus` varchar(255) NOT NULL,
  `extraNotes` varchar(255) DEFAULT NULL,
  `customerName` varchar(255) NOT NULL,
  `customerAddress` varchar(255) NOT NULL,
  `customerEmail` varchar(255) DEFAULT NULL,
  `customerPhone` varchar(255) DEFAULT NULL,
  `paymentID` varchar(255) NOT NULL,
  `voucherID` varchar(255) DEFAULT NULL,
  `totalPrice` int(11) NOT NULL,
  `accountID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`orderID`, `createdTime`, `currentStatus`, `extraNotes`, `customerName`, `customerAddress`, `customerEmail`, `customerPhone`, `paymentID`, `voucherID`, `totalPrice`, `accountID`) VALUES
('1041', '2021-12-29 07:46:29', 'Pending', 'extras please', 'Nguyen Huu Phuong Lam', 'P210 khu tap the 51 Huynh Thuc Khang, quan Dong Da, Ha Noi', 'lamnguyen2k1@gmail.com', '0123456789', 'payment_0', NULL, 13000, NULL),
('1985', '2021-12-23 14:57:21', 'Completed', 'afdawdaw', 'Son Nguyen', 'Ha Noi', 'sonnguyen@gmail.com', '1234567890', 'payment_0', NULL, 25000, 'user431660'),
('2036', '2021-12-29 08:01:18', 'Pending', 'extras please', 'Nguyen Huu Phuong Lam', 'P210 khu tap the 51 Huynh Thuc Khang, quan Dong Da, Ha Noi', 'lamnguyen2k1@gmail.com', '0123456789', 'payment_0', NULL, 3200000, NULL),
('2932', '2021-12-29 08:08:40', 'Shipping', '', 'Nguyen Hong Son', '107 Nguyen Phong Sac, quan Cau Giay, Ha Noi', 'sonnguyen@gmail.com', '0123456789', 'payment_0', 'type_7', 170300, 'user561019'),
('3340', '2021-12-23 14:06:15', 'Pending', 'afasfege', 'Son Nguyen', 'fawdadwa', 'sonnguyen@gmail.com', '1234567890', 'payment_0', NULL, 90000, 'user431660'),
('4461', '2021-12-23 14:32:02', 'Pending', 'dawdwads', 'Son Nguyen', 'Ha Noi', 'sonnguyen@gmail.com', '1234567890', 'payment_0', 'type_7', 156000, 'user431660'),
('6257', '2021-12-23 13:57:28', 'Pending', 'dawdcac', 'Lam', 'Ha Noi', 'lamnguyen@gmail.com', '1234567890', 'payment_0', NULL, 90000, NULL),
('7888', '2021-12-23 14:31:13', 'Pending', 'sfsfadadaw', 'Son Nguyen', 'Ha Noi', 'sonnguyen@gmail.com', '1234567890', 'payment_0', NULL, 240000, 'user431660'),
('9688', '2021-12-23 15:01:48', 'Completed', '', 'Ralphy Seymour', 'Ha Noi', 'random@email.com', '0123456789', 'payment_0', NULL, 10000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `orderID` varchar(255) NOT NULL,
  `productID` varchar(255) NOT NULL,
  `currentPrice` int(11) NOT NULL,
  `orderedQuantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order_detail`
--

INSERT INTO `tbl_order_detail` (`orderID`, `productID`, `currentPrice`, `orderedQuantity`) VALUES
('1041', 'product_1', 13000, 1),
('1985', 'product_1', 13000, 1),
('1985', 'product_2', 12000, 1),
('2036', 'product_11', 320000, 10),
('2932', 'product_2', 12000, 1),
('2932', 'product_7', 250000, 1),
('3340', 'product_0', 10000, 9),
('4461', 'product_2', 12000, 20),
('6257', 'product_0', 10000, 9),
('7888', 'product_2', 12000, 20),
('9688', 'product_0', 10000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `paymentID` varchar(255) NOT NULL,
  `paymentName` varchar(255) NOT NULL,
  `paymentDesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`paymentID`, `paymentName`, `paymentDesc`) VALUES
('payment_0', 'Cash on Delivery (CoD)', 'Pays the bill upon receiving purchase'),
('payment_1', 'PalPal', 'Payment through PayPal');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productID` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productDesc` varchar(255) DEFAULT NULL,
  `productPrice` int(11) NOT NULL,
  `productStatus` varchar(255) NOT NULL,
  `inventoryQuantity` int(11) NOT NULL,
  `categoryID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productID`, `productName`, `productDesc`, `productPrice`, `productStatus`, `inventoryQuantity`, `categoryID`) VALUES
('product_0', 'Cabbages', 'sweet cabbages', 10000, 'Empty', 0, 'category_0'),
('product_1', 'Pumpkin', 'Fresh', 13000, 'Available', 10, 'category_0'),
('product_10', 'Duck', 'Nice', 220000, 'Available', 18, 'category_1'),
('product_11', 'Goat Meat', 'Nice', 320000, 'Available', 0, 'category_1'),
('product_12', 'Salmon', 'Fresh', 350000, 'Available', 12, 'category_2'),
('product_13', 'Oysters', 'Ha Long oysters', 50000, 'Available', 15, 'category_2'),
('product_14', 'Crab', 'Ca Mau', 320000, 'Available', 9, 'category_2'),
('product_15', 'Carp', 'Fresh', 130000, 'Available', 3, 'category_3'),
('product_16', 'Shrimp', 'Fresh', 50000, 'Available', 31, 'category_3'),
('product_17', 'Snakehead fish', 'Fresh', 250000, 'Available', 9, 'category_3'),
('product_18', 'Black carp', 'Fresh', 230000, 'Available', 4, 'category_3'),
('product_19\r\n', 'Luce', 'Da River', 80000, 'Available', 9, 'category_3'),
('product_2', 'Cucumber', 'Fresh', 12000, 'Available', 14, 'category_0'),
('product_20', 'Catfish', 'Fresh', 120000, 'Available', 12, 'category_3'),
('product_21', 'Rice', 'Well', 160000, 'Available', 12, 'category_4'),
('product_22', 'Brown rice', 'Well', 150000, 'Available', 10, 'category_4'),
('product_23', 'Peanut', 'Well', 50000, 'Available', 25, 'category_4'),
('product_24', 'Black beans', 'Well', 65000, 'Available', 45, 'category_4'),
('product_25', 'Green bean', 'Well', 30000, 'Available', 25, 'category_4'),
('product_26', 'Dried lotus seeds', 'Well', 50000, 'Available', 15, 'category_4'),
('product_27', 'Apple', 'Fresh', 230000, 'Available', 12, 'category_5'),
('product_28', 'Strawberry', 'Fresh', 250000, 'Available', 10, 'category_5'),
('product_29', 'Grape', 'Fresh', 310000, 'Available', 15, 'category_5'),
('product_3', 'Tomato', 'Fresh', 15000, 'Available', 15, 'category_0'),
('product_30', 'Banana', 'Fresh', 30000, 'Available', 15, 'category_5'),
('product_31', 'Pear', '', 40000, 'Available', 28, 'category_5'),
('product_32', 'Watermelon', 'Fresh', 60000, 'Available', 16, 'category_5'),
('product_4', 'Carrot', 'Fresh', 25000, 'Available', 15, 'category_0'),
('product_5', 'Potato', 'Fresh', 28000, 'Available', 16, 'category_0'),
('product_6', 'Beef', 'Nice', 300000, 'Available', 45, 'category_1'),
('product_7', 'Pog', 'Nice', 250000, 'Available', 24, 'category_1'),
('product_8', 'Chicken', 'Nice', 230000, 'Available', 12, 'category_1'),
('product_9', 'Buffalo meat', 'Nice', 400000, 'Available', 16, 'category_1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_category`
--

CREATE TABLE `tbl_product_category` (
  `categoryID` varchar(255) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryDesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_category`
--

INSERT INTO `tbl_product_category` (`categoryID`, `categoryName`, `categoryDesc`) VALUES
('category_0', 'Vegetables', 'Green'),
('category_1', 'Meat', 'Red'),
('category_2', 'Seafood', 'Fresh'),
('category_3', 'Fish', 'fresh'),
('category_4', 'Rice and Nuts', 'well preserved'),
('category_5', 'Fruit', 'fresh');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_comment`
--

CREATE TABLE `tbl_product_comment` (
  `commentID` varchar(255) NOT NULL,
  `createdTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `commentUser` varchar(255) NOT NULL,
  `commentContent` varchar(255) NOT NULL,
  `commentPhone` varchar(10) NOT NULL,
  `commentEmail` varchar(255) NOT NULL,
  `productID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_comment`
--

INSERT INTO `tbl_product_comment` (`commentID`, `createdTime`, `commentUser`, `commentContent`, `commentPhone`, `commentEmail`, `productID`) VALUES
('comment303752', '2021-12-29 08:00:29', 'Nguyen Huu Phuong Lam', 'a', '0123456789', 'lamnguyen2k1@gmail.com', 'product_11'),
('comment553416', '2021-12-23 13:48:01', 'Lam Nguyen', 'nice', '0123456789', 'lamnguyen@gmail.com', 'product_0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_images`
--

CREATE TABLE `tbl_product_images` (
  `imageID` varchar(255) NOT NULL,
  `imageName` varchar(255) NOT NULL,
  `imageDesc` varchar(255) DEFAULT NULL,
  `productID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product_images`
--

INSERT INTO `tbl_product_images` (`imageID`, `imageName`, `imageDesc`, `productID`) VALUES
('img_1', 'cabbages.jpg', 'sweet cabbage', 'product_0'),
('img_10', 'tomato1.jpg', 'tomato', 'product_3'),
('img_11', 'tomato2.jpg', 'tomato', 'product_3'),
('img_12', 'tomato3.jpg', 'tomato', 'product_3'),
('img_13', 'carot1.jpg', 'carrot', 'product_4'),
('img_14', 'carot2.jpg', 'carrot', 'product_4'),
('img_15', 'carot3.jpg', 'carrot', 'product_4'),
('img_16', 'potato1.jpg', 'potato', 'product_5'),
('img_17', 'potato2.jpg', 'potato', 'product_5'),
('img_18', 'potato3.jpg', 'potato', 'product_5'),
('img_19', 'beef1.jpg', 'nice', 'product_6'),
('img_2', 'cabbages1.jpg', 'sweet cabbage', 'product_0'),
('img_20', 'beef2.jpg', 'beef', 'product_6'),
('img_21', 'beef3.jpg', 'beef', 'product_6'),
('img_22', 'pog1.jpg', 'pog', 'product_7'),
('img_23', 'pog2.jpg', 'pog', 'product_7'),
('img_24', 'pog3.jpg', 'pog', 'product_7'),
('img_25', 'ga1.jpg', 'chicken', 'product_8'),
('img_26', 'ga2.jpg', 'chicken', 'product_8'),
('img_27', 'ga3.jpg', 'chicken', 'product_8'),
('img_28', 'trau1.jpg', 'buffalo', 'product_9'),
('img_29', 'trau2.jpg', 'buffalo', 'product_9'),
('img_3', 'cabbages2.jpg', 'sweet cabbage', 'product_0'),
('img_30', 'trau3.jpg', 'buffalo', 'product_9'),
('img_31', 'vit1.jpg', 'Duck', 'product_10'),
('img_32', 'vit2.jpg', 'Duck', 'product_10'),
('img_33', 'vit3.jpg', 'Duck', 'product_10'),
('img_34', 'de1.jpg', 'goat', 'product_11'),
('img_35', 'de2.jpg', 'goat', 'product_11'),
('img_36', 'de3.jpg', 'goat', 'product_11'),
('img_37', 'salmon1.jpg', 'salmon', 'product_12'),
('img_38', 'salmon2.jpg', 'salmon', 'product_12'),
('img_39', 'salmon3.jpg', 'salmon', 'product_12'),
('img_4', 'pumpkin1.jpg', 'Fresh', 'product_1'),
('img_40', 'hau1.jpg', 'Oysters', 'product_13'),
('img_41', 'hau2.jpg', 'Oysters', 'product_13'),
('img_42', 'hau3.jpg', 'Oysters', 'product_13'),
('img_43', 'cua1.jpg', 'Crab', 'product_14'),
('img_44', 'cua2.jpg', 'crab', 'product_14'),
('img_45', 'cua3.jpg', 'crab', 'product_14'),
('img_46', 'cachep1.jpg', 'Carp', 'product_15'),
('img_47', 'cachep2.jpg', 'Carp', 'product_15'),
('img_48', 'cachep3.jpg', 'Carp', 'product_15'),
('img_49', 'tom1.jpg', 'shrimp', 'product_16'),
('img_5', 'pumpkin2.jpg', 'Fresh', 'product_1'),
('img_50', 'tom2.jpg', 'shrimp', 'product_16'),
('img_51', 'tom3.jpg', 'shrimp', 'product_16'),
('img_52', 'caloc1.jpg', 'snakehead fish', 'product_17'),
('img_53', 'caloc2.jpg', 'snakehead fish', 'product_17'),
('img_54', 'caloc3.jpg', 'snakehead fish', 'product_17'),
('img_55', 'tramden1.jpg', 'black carp', 'product_18'),
('img_56', 'tramden2.jpg', 'black carp', 'product_18'),
('img_57', 'tramden3.jpg', 'black carp', 'product_18'),
('img_58', 'luce1.jpg', 'Luce', 'product_19\r\n'),
('img_59', 'luce2.jpg', 'Luce', 'product_19\r\n'),
('img_6', 'pumpkin3.jpg', 'Fresh', 'product_1'),
('img_60', 'luce3.jpg', 'Luce', 'product_19\r\n'),
('img_61', 'tre1.jpg', 'catfish', 'product_20'),
('img_62', 'tre2.jpg', 'catfish', 'product_20'),
('img_63', 'tre3.jpg', 'catfish', 'product_20'),
('img_64', 'gao1.jpg', 'rice', 'product_21'),
('img_65', 'gao2.jpg', 'rice', 'product_21'),
('img_66', 'gao3.jpg', 'rice', 'product_21'),
('img_67', 'gaolut1.jpg', 'brown rice', 'product_22'),
('img_68', 'gaolut2.jpg', 'brown rice', 'product_22'),
('img_69', 'gaolut3.jpg', 'brown rice', 'product_22'),
('img_7', 'cucumber1.jpg', 'Fresh', 'product_2'),
('img_70', 'lac1.jpg', 'Peanut', 'product_23'),
('img_71', 'lac2.jpg', 'Peanut', 'product_23'),
('img_72', 'lac3.jpg', 'Peanut', 'product_23'),
('img_73', 'doden1.jpg', 'Black bean', 'product_24'),
('img_74', 'doden2.jpg', 'Black bean', 'product_24'),
('img_75', 'doden3.jpg', 'Black bean', 'product_24'),
('img_76', 'doxanh1.jpg', 'Green bean', 'product_25'),
('img_77', 'doxanh2.jpg', 'Green bean', 'product_25'),
('img_78', 'doxanh3.jpg', 'Green bean', 'product_25'),
('img_79', 'sen1.jpg', 'Dried lotus seed', 'product_26'),
('img_8', 'cucumber2.jpg', 'Fresh', 'product_2'),
('img_80', 'sen2.jpg', 'Dried lotus seed', 'product_26'),
('img_81', 'sen3.jpg', 'Dried lotus seed', 'product_26'),
('img_82', 'tao1.jpg', 'Apple', 'product_27'),
('img_83', 'tao2.jpg', 'Apple', 'product_27'),
('img_84', 'tao3.jpg', 'Apple', 'product_27'),
('img_85', 'dau1.jpg', 'Strawberry', 'product_28'),
('img_86', 'dau2.jpg', 'Strawberry', 'product_28'),
('img_87', 'dau3.jpg', 'Strawberry', 'product_28'),
('img_88', 'nho1.jpg', 'Grape', 'product_29'),
('img_89', 'nho2.jpg', 'Grape', 'product_29'),
('img_9', 'cucumber3.jpg', 'Fresh', 'product_2'),
('img_90', 'nho3.jpg', 'Grape', 'product_29'),
('img_91', 'chuoi1.jpg', 'Banana', 'product_30'),
('img_92', 'chuoi2.jpg', 'Banana', 'product_30'),
('img_93', 'chuoi3.jpg', 'Banana', 'product_30'),
('img_94', 'le1.jpg', 'Pear', 'product_31'),
('img_95', 'le2.jpg', 'Pear', 'product_31'),
('img_96', 'le3.jpg', 'Pear', 'product_31'),
('img_97', 'duahau1.jpg', 'Watermelon', 'product_32'),
('img_98', 'duahau2.jpg', 'Watermelon', 'product_32'),
('img_99', 'duahau3.jpg', 'Watermelon', 'product_32');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_voucher_type`
--

CREATE TABLE `tbl_voucher_type` (
  `typeID` varchar(255) NOT NULL,
  `typeName` varchar(255) NOT NULL,
  `typeDesc` varchar(255) DEFAULT NULL,
  `voucherValue` int(11) NOT NULL,
  `voucherCost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_voucher_type`
--

INSERT INTO `tbl_voucher_type` (`typeID`, `typeName`, `typeDesc`, `voucherValue`, `voucherCost`) VALUES
('type_0', '10% all invoices', '10% off, can be applied to all purchases', 10, 100),
('type_1', '20% all invoices', '20% off, can be applied to all purchases', 20, 200),
('type_2', '15% all invoices', '15% off, can be applied to all purchases', 15, 150),
('type_3', '5% all invoices', '5% off, can be applied to all purchases', 5, 50),
('type_4', '25% all invoices', '25% off, can be applied to all purchases', 25, 250),
('type_5', '30% all invoices', '10% off, can be applied to all purchases', 30, 300),
('type_6', '12% all invoices', '12% off, can be applied to all purchases', 12, 120),
('type_7', '35% all invoices', '35% off, can be applied to all purchases', 35, 350);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wallet_history`
--

CREATE TABLE `tbl_wallet_history` (
  `createdTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `historyName` varchar(255) NOT NULL,
  `historyContent` varchar(255) NOT NULL,
  `historyAmount` int(11) NOT NULL,
  `walletID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_wallet_history`
--

INSERT INTO `tbl_wallet_history` (`createdTime`, `historyName`, `historyContent`, `historyAmount`, `walletID`) VALUES
('2021-12-23 14:06:15', 'Buy Product', '', 900, 'wallet52160'),
('2021-12-23 14:27:27', 'Redeem voucher', '', 350, 'wallet52160'),
('2021-12-23 14:31:13', 'Buy Product', '', 2400, 'wallet52160'),
('2021-12-23 14:32:02', 'Buy Product', '', 2400, 'wallet52160'),
('2021-12-23 14:52:23', 'Buy Product', '', 250, 'wallet52160'),
('2021-12-29 08:05:24', 'Redeem voucher', '', 350, 'wallet36144'),
('2021-12-29 08:06:42', 'Buy Product', '', 262, 'wallet36144');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`accountID`),
  ADD KEY `account_role` (`roleID`);

--
-- Indexes for table `tbl_account_role`
--
ALTER TABLE `tbl_account_role`
  ADD PRIMARY KEY (`roleID`);

--
-- Indexes for table `tbl_account_voucher`
--
ALTER TABLE `tbl_account_voucher`
  ADD PRIMARY KEY (`voucherID`),
  ADD KEY `account_voucher` (`accountID`),
  ADD KEY `voucher_applied` (`typeID`);

--
-- Indexes for table `tbl_account_wallet`
--
ALTER TABLE `tbl_account_wallet`
  ADD PRIMARY KEY (`walletID`),
  ADD KEY `account_wallet` (`accountID`);

--
-- Indexes for table `tbl_activity_log`
--
ALTER TABLE `tbl_activity_log`
  ADD PRIMARY KEY (`logID`),
  ADD KEY `account_log` (`accountID`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `payment_type` (`paymentID`),
  ADD KEY `account_order` (`accountID`),
  ADD KEY `voucherID` (`voucherID`);

--
-- Indexes for table `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`orderID`,`productID`),
  ADD KEY `product_list` (`productID`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `product_category` (`categoryID`);

--
-- Indexes for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `tbl_product_comment`
--
ALTER TABLE `tbl_product_comment`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `product_comment` (`productID`);

--
-- Indexes for table `tbl_product_images`
--
ALTER TABLE `tbl_product_images`
  ADD PRIMARY KEY (`imageID`),
  ADD KEY `product_images` (`productID`);

--
-- Indexes for table `tbl_voucher_type`
--
ALTER TABLE `tbl_voucher_type`
  ADD PRIMARY KEY (`typeID`);

--
-- Indexes for table `tbl_wallet_history`
--
ALTER TABLE `tbl_wallet_history`
  ADD PRIMARY KEY (`createdTime`),
  ADD KEY `wallet_history` (`walletID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD CONSTRAINT `account_role` FOREIGN KEY (`roleID`) REFERENCES `tbl_account_role` (`roleID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_account_voucher`
--
ALTER TABLE `tbl_account_voucher`
  ADD CONSTRAINT `account_voucher` FOREIGN KEY (`accountID`) REFERENCES `tbl_account` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voucher_applied` FOREIGN KEY (`typeID`) REFERENCES `tbl_voucher_type` (`typeID`);

--
-- Constraints for table `tbl_account_wallet`
--
ALTER TABLE `tbl_account_wallet`
  ADD CONSTRAINT `account_wallet` FOREIGN KEY (`accountID`) REFERENCES `tbl_account` (`accountID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_activity_log`
--
ALTER TABLE `tbl_activity_log`
  ADD CONSTRAINT `account_log` FOREIGN KEY (`accountID`) REFERENCES `tbl_account` (`accountID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `account_order` FOREIGN KEY (`accountID`) REFERENCES `tbl_account` (`accountID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_type` FOREIGN KEY (`paymentID`) REFERENCES `tbl_payment` (`paymentID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`voucherID`) REFERENCES `tbl_voucher_type` (`typeID`);

--
-- Constraints for table `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD CONSTRAINT `order_detail` FOREIGN KEY (`orderID`) REFERENCES `tbl_order` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_list` FOREIGN KEY (`productID`) REFERENCES `tbl_product` (`productID`);

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `product_category` FOREIGN KEY (`categoryID`) REFERENCES `tbl_product_category` (`categoryID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tbl_product_comment`
--
ALTER TABLE `tbl_product_comment`
  ADD CONSTRAINT `product_comment` FOREIGN KEY (`productID`) REFERENCES `tbl_product` (`productID`);

--
-- Constraints for table `tbl_product_images`
--
ALTER TABLE `tbl_product_images`
  ADD CONSTRAINT `product_images` FOREIGN KEY (`productID`) REFERENCES `tbl_product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_wallet_history`
--
ALTER TABLE `tbl_wallet_history`
  ADD CONSTRAINT `wallet_history` FOREIGN KEY (`walletID`) REFERENCES `tbl_account_wallet` (`walletID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
