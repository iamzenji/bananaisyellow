-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2024 at 01:29 PM
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
-- Database: `botecha`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_qty` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `tracking_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `category`, `brand`, `type`, `unit`, `price`, `quantity`, `unit_qty`, `total`, `order_id`, `tracking_number`) VALUES
(1, 'Chips', 'Piattos', 'Sachet', '85g', 3000.00, 20, 2000, 60000.00, 67, 'TN6640e562eeb80'),
(2, 'Chips', 'Chippy', 'Sachet', '85g', 3000.00, 20, 2000, 60000.00, 67, 'TN6640e562eeb80'),
(3, 'Chips', 'Vcut', 'Sachet', '85g', 3000.00, 20, 2000, 60000.00, 67, 'TN6640e562eeb80'),
(4, 'Oily Fish', '555 Sardines', 'Canned Food', '85g', 3000.00, 10, 1000, 60000.00, 67, 'TN6640e562eeb80'),
(5, 'Beverages', 'Mineral Summit Water', 'Bottle', '85g', 3000.00, 20, 1000, 60000.00, 67, 'TN6640e562eeb80'),
(6, 'Tuna', 'Century Tuna', 'Canned Food', '85g', 3000.00, 20, 2000, 60000.00, 67, 'TN6640e562eeb80');

-- --------------------------------------------------------

--
-- Table structure for table `cart_sales`
--

CREATE TABLE `cart_sales` (
  `cart_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `scale` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Loperamide'),
(2, 'Paracetamol'),
(3, 'Anti'),
(4, 'ano]hmn'),
(5, 'Antibiotic'),
(6, 'Chips'),
(7, 'Oily Fish'),
(8, 'Beverages'),
(9, 'Tuna');

-- --------------------------------------------------------

--
-- Table structure for table `daily_time_record`
--

CREATE TABLE `daily_time_record` (
  `record_id` int(10) NOT NULL,
  `rec_emp_id` int(10) NOT NULL,
  `record_emp_name` varchar(250) NOT NULL,
  `record_emp_position` varchar(250) NOT NULL,
  `record_shift` varchar(100) NOT NULL,
  `record_date` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounted_item`
--

CREATE TABLE `discounted_item` (
  `id` int(11) NOT NULL,
  `employee` varchar(50) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` decimal(10,0) NOT NULL,
  `unit_qty` int(11) NOT NULL,
  `total_cost` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dtrrevised`
--

CREATE TABLE `dtrrevised` (
  `record_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time DEFAULT NULL,
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dtrrevised`
--

INSERT INTO `dtrrevised` (`record_id`, `employee_id`, `date`, `time_in`, `time_out`, `remarks`) VALUES
(1, 17, '2024-03-30', '08:18:22', '09:18:22', ''),
(2, 17, '2024-03-31', '08:25:54', '09:25:54', ''),
(3, 17, '2024-04-01', '08:26:55', '09:26:55', 'Late and Valid Time Out'),
(6, 19, '2024-03-30', '09:51:15', '10:51:15', ''),
(7, 19, '2024-03-31', '09:51:36', '10:51:36', ''),
(8, 20, '2024-03-30', '09:52:16', '10:52:16', ''),
(9, 20, '2024-03-31', '09:52:38', '10:52:38', ''),
(10, 21, '2024-03-30', '09:53:06', '10:53:06', ''),
(11, 21, '2024-03-31', '09:53:27', '10:53:27', ''),
(30, 18, '2024-03-16', '08:00:00', '20:00:00', ''),
(31, 18, '2024-03-17', '08:00:00', '20:00:00', ''),
(32, 19, '2024-04-01', '07:00:00', '11:00:00', ''),
(33, 19, '2024-04-10', '07:00:00', '09:00:00', ''),
(34, 19, '2024-04-11', '08:00:00', '12:00:00', ''),
(35, 19, '2024-04-12', '07:00:00', '09:00:00', ''),
(36, 18, '2024-04-10', '07:00:00', '09:00:00', ''),
(37, 18, '2024-04-12', '07:00:00', '09:00:00', ''),
(38, 20, '2024-04-10', '07:00:00', '09:00:00', ''),
(39, 21, '2024-04-10', '07:00:00', '09:00:00', ''),
(44, 55, '2024-04-01', '05:18:20', '19:18:54', '');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `employee_id` int(10) NOT NULL,
  `employee_name` varchar(200) NOT NULL,
  `employee_position` varchar(250) NOT NULL,
  `employee_contact` varchar(200) NOT NULL,
  `employee_datestart` date DEFAULT NULL,
  `employee_username` varchar(255) NOT NULL,
  `employee_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`employee_id`, `employee_name`, `employee_position`, `employee_contact`, `employee_datestart`, `employee_username`, `employee_password`) VALUES
(17, 'Marco Torres', 'HR Officer', '09556454874', '2024-03-16', 'Marco_1', 'Marco_1'),
(18, 'Micosh Yutuc', 'Purchase Order Officer', '09154751547', '2024-03-16', 'Micosh_1', 'Micosh_1'),
(19, 'Aeron Herrera', 'Finance Officer', '09123854784', '2024-03-16', 'Aeron_1', 'Aeron_1'),
(20, 'Regina Velarde', 'Sales Officer - Cashier', '09548975891', '2024-03-16', 'Regina_1', 'regina_1'),
(21, 'Zenji Yangco', 'Inventory Officer', '09651254985', '2024-03-16', 'Zenji_1', 'Zenji_1'),
(55, 'Trisha Macapagal', 'HR Officer', '09458745618', '2024-04-13', 'Trisha_1', 'Trisha_1');

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary`
--

CREATE TABLE `employee_salary` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salary` int(50) NOT NULL,
  `insurance` int(50) DEFAULT 1000,
  `tax` int(50) DEFAULT 1000,
  `hours_worked` int(50) NOT NULL,
  `pay_per_hour` int(50) DEFAULT 10,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_salary`
--

INSERT INTO `employee_salary` (`id`, `employee_id`, `salary`, `insurance`, `tax`, `hours_worked`, `pay_per_hour`, `date`) VALUES
(4, 18, 0, 1500, 1500, 0, 25, '2024-04-09'),
(5, 19, 0, 1000, 1000, 3, 2000, '2024-04-09'),
(6, 17, 0, 1000, 1000, 0, 100, '2024-04-09'),
(7, 20, 0, 1000, 1000, 0, 70, '2024-04-09'),
(8, 21, 0, 1000, 1000, 0, 70, '2024-04-09');

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary_revised`
--

CREATE TABLE `employee_salary_revised` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salary` int(50) NOT NULL,
  `insurance` int(50) DEFAULT 1000,
  `tax` int(50) DEFAULT 1000,
  `hours_worked` int(50) NOT NULL,
  `pay_per_hour` int(50) DEFAULT 10,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_salary_revised`
--

INSERT INTO `employee_salary_revised` (`id`, `employee_id`, `salary`, `insurance`, `tax`, `hours_worked`, `pay_per_hour`, `date`) VALUES
(23, 19, 0, 1000, 1000, 10, 2000, '2024-04-09'),
(27, 19, 0, 1000, 1000, 2, 2000, '2024-04-09'),
(29, 19, 0, 1000, 1000, 2, 2000, '2024-04-09'),
(30, 18, 0, 1500, 1500, 24, 200, '2024-04-09'),
(31, 18, 0, 1500, 1500, 2, 200, '2024-04-09'),
(33, 18, 0, 1500, 1500, 2, 200, '2024-04-09'),
(34, 20, 0, 1000, 1000, 2, 70, '2024-04-09'),
(35, 21, 0, 1000, 1000, 2, 70, '2024-04-09'),
(36, 21, 0, 1000, 1000, 2, 70, '2024-04-09'),
(37, 17, 0, 1000, 1000, 3, 100, '2024-04-09');

-- --------------------------------------------------------

--
-- Table structure for table `finance_balance`
--

CREATE TABLE `finance_balance` (
  `transactionID` int(11) NOT NULL,
  `currentbal` int(11) NOT NULL,
  `cost` int(11) DEFAULT NULL,
  `companyname` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `finance_balance`
--

INSERT INTO `finance_balance` (`transactionID`, `currentbal`, `cost`, `companyname`) VALUES
(7794684, -45362, 18505, 0),
(7183168, 0, 45362, 0),
(7794684, -45362, 18505, 0),
(7183168, 0, 45362, 0);

-- --------------------------------------------------------

--
-- Table structure for table `finance_inbox`
--

CREATE TABLE `finance_inbox` (
  `id` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `msginfo` text DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(55) DEFAULT 'Pending',
  `cost` decimal(10,0) DEFAULT NULL,
  `approvaldate` datetime DEFAULT NULL,
  `approvalmsg` text DEFAULT '----------'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `finance_inbox`
--

INSERT INTO `finance_inbox` (`id`, `company`, `msginfo`, `date`, `status`, `cost`, `approvaldate`, `approvalmsg`) VALUES
(1179392, 'PO', 'Purchase Order Request', '2024-04-20 07:54:41', 'Denied', 45362, '2024-04-20 09:28:20', 'kkk'),
(1392403, 'PO', 'Purchase Order Request', '2024-05-12 23:50:59', 'Pending', 316440, NULL, '----------'),
(1592983, 'PO', 'Purchase Order Request', '2024-04-27 03:09:18', 'Pending', 23000, NULL, '----------'),
(3046863, 'PO', 'Purchase Order Request', '2024-05-12 23:50:59', 'Pending', 316440, NULL, '----------'),
(3538425, 'PO', 'Purchase Order Request', '2024-05-12 23:50:59', 'Pending', 316440, NULL, '----------'),
(3670783, 'PO', 'Purchase Order Request', '2024-05-12 23:50:59', 'Pending', 316440, NULL, '----------'),
(3897459, 'PO', 'Purchase Order Request', '2024-04-21 02:52:03', 'Pending', 22981, NULL, '----------'),
(4307343, 'PO', 'Purchase Order Request', '2024-04-27 03:09:29', 'Pending', 17400, NULL, '----------'),
(4954463, 'PO', 'Purchase Order Request', '2024-04-21 02:47:47', 'Pending', 45362, NULL, '----------'),
(5616664, 'PO', 'Purchase Order Request', '2024-04-21 03:41:35', 'Pending', 70029, NULL, '----------'),
(6029558, 'PO', 'Purchase Order Request', '2024-04-27 03:07:59', 'Pending', 23000, NULL, '----------'),
(6592256, 'PO', 'Purchase Order Request', '2024-04-27 03:08:11', 'Pending', 17400, NULL, '----------'),
(7118311, 'PO', 'Purchase Order Request', '2024-04-21 02:41:29', 'Pending', 119008, NULL, '----------'),
(7183168, 'PO', 'Purchase Order Request', '2024-04-20 03:31:19', 'Approved', 45362, '2024-04-20 03:46:21', 'as'),
(7794684, 'PO', 'Purchase Order Request', '2024-04-20 03:34:07', 'Approved', 18505, '2024-04-20 03:44:31', 'asd'),
(8736275, 'PO', 'Purchase Order Request', '2024-05-12 23:50:58', 'Pending', 316440, NULL, '----------'),
(9006138, 'PO', 'Purchase Order Request', '2024-04-21 03:41:35', 'Pending', 70029, NULL, '----------'),
(9497695, 'PO', 'Purchase Order Request', '2024-05-12 23:50:59', 'Pending', 316440, NULL, '----------');

-- --------------------------------------------------------

--
-- Table structure for table `finance_inbox_po`
--

CREATE TABLE `finance_inbox_po` (
  `id` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `msginfo` text DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(55) DEFAULT 'Pending',
  `cost` decimal(10,0) DEFAULT NULL,
  `approvaldate` datetime DEFAULT NULL,
  `approvalmsg` text DEFAULT '----------'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `finance_inbox_po`
--

INSERT INTO `finance_inbox_po` (`id`, `company`, `msginfo`, `date`, `status`, `cost`, `approvaldate`, `approvalmsg`) VALUES
(1179392, 'PO', 'Purchase Order Request', '2024-04-20 07:54:41', 'Denied', 45362, '2024-04-20 09:28:20', 'kkk'),
(1392403, 'PO', 'Purchase Order Request', '2024-05-12 23:50:59', 'Pending', 316440, NULL, '----------'),
(1592983, 'PO', 'Purchase Order Request', '2024-04-27 03:09:18', 'Pending', 23000, NULL, '----------'),
(3046863, 'PO', 'Purchase Order Request', '2024-05-12 23:50:59', 'Pending', 316440, NULL, '----------'),
(3538425, 'PO', 'Purchase Order Request', '2024-05-12 23:50:59', 'Pending', 316440, NULL, '----------'),
(3670783, 'PO', 'Purchase Order Request', '2024-05-12 23:50:59', 'Pending', 316440, NULL, '----------'),
(3897459, 'PO', 'Purchase Order Request', '2024-04-21 02:52:03', 'Pending', 22981, NULL, '----------'),
(4307343, 'PO', 'Purchase Order Request', '2024-04-27 03:09:29', 'Pending', 17400, NULL, '----------'),
(4954463, 'PO', 'Purchase Order Request', '2024-04-21 02:47:47', 'Pending', 45362, NULL, '----------'),
(5616664, 'PO', 'Purchase Order Request', '2024-04-21 03:41:35', 'Pending', 70029, NULL, '----------'),
(6029558, 'PO', 'Purchase Order Request', '2024-04-27 03:07:59', 'Pending', 23000, NULL, '----------'),
(6592256, 'PO', 'Purchase Order Request', '2024-04-27 03:08:11', 'Pending', 17400, NULL, '----------'),
(7118311, 'PO', 'Purchase Order Request', '2024-04-21 02:41:29', 'Pending', 119008, NULL, '----------'),
(7183168, 'PO', 'Purchase Order Request', '2024-04-20 03:31:19', 'Approved', 45362, '2024-04-20 03:46:21', 'as'),
(7794684, 'PO', 'Purchase Order Request', '2024-04-20 03:34:07', 'Approved', 18505, '2024-04-20 03:44:31', 'asd'),
(8736275, 'PO', 'Purchase Order Request', '2024-05-12 23:50:58', 'Pending', 316440, NULL, '----------'),
(9006138, 'PO', 'Purchase Order Request', '2024-04-21 03:41:35', 'Pending', 70029, NULL, '----------'),
(9497695, 'PO', 'Purchase Order Request', '2024-05-12 23:50:59', 'Pending', 316440, NULL, '----------');

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `title` text NOT NULL,
  `details` text NOT NULL,
  `offset_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `holiday`
--

INSERT INTO `holiday` (`id`, `date`, `title`, `details`, `offset_date`) VALUES
(1, '2024-04-09', 'Araw ng Kagitingan', 'Araw ng Kagitingan', '2024-04-09'),
(2, '2024-05-01', 'Labor Day', 'Labor Day', '2024-05-01'),
(3, '2024-06-12', 'Independence Day', 'Independence Day', '2024-06-12'),
(5, '2024-08-30', 'National Heroes Day', 'National Heroes Day', '2024-08-30'),
(6, '2024-11-30', 'Bonifacio Day', 'Bonifacio Day', '2024-11-30'),
(7, '2024-12-25', 'Christmas Day', 'Christmas Day', '2024-12-25'),
(9, '2024-12-30', 'Rizal Day', 'Rizal Day', '2024-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `qty_stock` int(11) NOT NULL,
  `unit_inv_qty` int(11) NOT NULL,
  `unit_cost` int(50) NOT NULL,
  `storage_location` varchar(255) NOT NULL,
  `showroom_quantity_stock` int(11) NOT NULL,
  `showroom_location` varchar(255) NOT NULL,
  `quantity_to_reorder` int(11) NOT NULL,
  `total_cost` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `supplier`, `category`, `brand`, `type`, `unit`, `qty_stock`, `unit_inv_qty`, `unit_cost`, `storage_location`, `showroom_quantity_stock`, `showroom_location`, `quantity_to_reorder`, `total_cost`) VALUES
(1, 'JACK n JILL', 'Chips', 'Piattos', 'Sachet', '85g', 20, 2000, 30, 'Shelf 1', 46, 'Display Area 1', 100, 60000),
(2, 'JACK n JILL', 'Chips', 'Chippy', 'Sachet', '85g', 100, 10000, 15, 'Shelf 3', 46, 'Display Area 3', 100, 150000),
(3, 'JACK n JILL', 'Chips', 'Vcut', 'Sachet', '85g', 100, 10000, 30, 'Shelf 2', 48, 'Display Area 2', 100, 300000),
(4, 'JACK n JILL', 'Oily Fish', '555 Sardines', 'Canned Food', '85g', 50, 5000, 50, 'Shelf 5', 28, 'Display Area 5', 100, 250000),
(5, 'JACK n JILL', 'Beverages', 'Mineral Summit Water', 'Bottle', '85g', 100, 5000, 10, 'Shelf 6', 43, 'Display Area 6', 100, 50000),
(6, 'JACK n JILL', 'Tuna', 'Century Tuna', 'Canned Food', '85g', 100, 10000, 36, 'Shelf 4', 28, 'Display Area 4', 50, 360000);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_logs`
--

CREATE TABLE `inventory_logs` (
  `log_id` int(11) NOT NULL,
  `inventory_id` date NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `brand_name` varchar(255) NOT NULL,
  `employee` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `stock_after` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_logs`
--

INSERT INTO `inventory_logs` (`log_id`, `inventory_id`, `date`, `brand_name`, `employee`, `quantity`, `stock_after`, `reason`) VALUES
(1, '0000-00-00', '2024-05-12 15:50:58', 'Piattos', 'Zenji Yangco', 20, 2000, 'Purchase order'),
(2, '0000-00-00', '2024-05-12 15:50:59', 'Chippy', 'Zenji Yangco', 20, 2000, 'Purchase order'),
(3, '0000-00-00', '2024-05-12 15:50:59', 'Vcut', 'Zenji Yangco', 20, 2000, 'Purchase order'),
(4, '0000-00-00', '2024-05-12 15:50:59', '555 Sardines', 'Zenji Yangco', 10, 1000, 'Purchase order'),
(5, '0000-00-00', '2024-05-12 15:50:59', 'Mineral Summit Water', 'Zenji Yangco', 20, 1000, 'Purchase order'),
(6, '0000-00-00', '2024-05-12 15:50:59', 'Century Tuna', 'Zenji Yangco', 20, 2000, 'Purchase order'),
(7, '0000-00-00', '2024-05-12 15:53:31', 'Piattos', 'Zenji Yangco', 0, 2000, 'Edit Item'),
(8, '0000-00-00', '2024-05-12 15:54:45', 'Vcut', 'Zenji Yangco', 8000, 10000, 'Edit Item'),
(9, '0000-00-00', '2024-05-12 15:56:19', 'Chippy', 'Zenji Yangco', 8000, 10000, 'Edit Item'),
(10, '0000-00-00', '2024-05-12 15:57:04', 'Century Tuna', 'Zenji Yangco', 8000, 10000, 'Edit Item'),
(11, '0000-00-00', '2024-05-12 15:57:43', '555 Sardines', 'Zenji Yangco', 4000, 5000, 'Edit Item'),
(12, '0000-00-00', '2024-05-12 15:59:46', 'Mineral Summit Water', 'Zenji Yangco', 4000, 5000, 'Edit Item');

-- --------------------------------------------------------

--
-- Table structure for table `item_mapping`
--

CREATE TABLE `item_mapping` (
  `map_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `shelves` varchar(20) NOT NULL,
  `colum` int(11) NOT NULL,
  `row` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `item_mapping`
--

INSERT INTO `item_mapping` (`map_id`, `item_id`, `shelves`, `colum`, `row`) VALUES
(24, 1, 'MedEast', 2, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `mebalik`
--

CREATE TABLE `mebalik` (
  `id` int(11) NOT NULL,
  `transact_no` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `reasons` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicinetype`
--

CREATE TABLE `medicinetype` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `medicinetype`
--

INSERT INTO `medicinetype` (`type_id`, `type_name`) VALUES
(1, 'Sachet'),
(2, 'Canned Food'),
(3, 'Bottle');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_list`
--

CREATE TABLE `medicine_list` (
  `medicine_id` int(11) NOT NULL,
  `brand` text NOT NULL,
  `unit` text NOT NULL,
  `price` text NOT NULL,
  `unit_qty` text NOT NULL,
  `description` text NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `barcode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `medicine_list`
--

INSERT INTO `medicine_list` (`medicine_id`, `brand`, `unit`, `price`, `unit_qty`, `description`, `supplier_id`, `category_id`, `type_id`, `barcode`) VALUES
(1, 'Piattos', '85g', '3000', '100', 'Cheese', 1, 6, 1, '2145369856541'),
(2, 'Chippy', '27g', '1500', '100', 'Barbecue', 1, 6, 1, '6574157895412'),
(3, 'Vcut', '85g', '3000', '100', 'Potato Chips', 1, 6, 1, '9574156854752'),
(4, '555 Sardines', '155g', '5000', '100', 'Tomato Sauce', 1, 7, 2, '3614785298745'),
(5, 'Mineral Summit Water', '350ml', '500', '50', 'Purified Water', 1, 8, 3, '4785963214785'),
(6, 'Century Tuna', '155g', '3600', '100', 'Healthy Meat', 1, 9, 2, '2547896321475');

-- --------------------------------------------------------

--
-- Table structure for table `meremove`
--

CREATE TABLE `meremove` (
  `id` int(11) NOT NULL,
  `cashier_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `scale` varchar(11) NOT NULL,
  `reasons` varchar(255) NOT NULL,
  `stat` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mesali`
--

CREATE TABLE `mesali` (
  `id` int(11) NOT NULL,
  `transact_no` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `scale` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `shipping_fee` decimal(10,2) DEFAULT NULL,
  `grand_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `subtotal`, `tax`, `shipping_fee`, `grand_total`) VALUES
(35, 85932.00, 10311.84, 600.00, 96843.84),
(36, 3996.60, 479.59, 600.00, 5076.19),
(37, 4596.60, 551.59, 600.00, 5748.19),
(38, 4596.60, 551.59, 600.00, 5748.19),
(39, 3996.60, 479.59, 600.00, 5076.19),
(40, 3996.60, 479.59, 600.00, 5076.19),
(41, 3996.60, 479.59, 600.00, 5076.19),
(42, 491581.80, 58989.82, 600.00, 551171.62),
(43, 3996.60, 479.59, 600.00, 5076.19),
(44, 3996.60, 479.59, 600.00, 5076.19),
(45, 3996.60, 479.59, 600.00, 5076.19),
(46, 3996.60, 479.59, 600.00, 5076.19),
(47, 3996.60, 479.59, 600.00, 5076.19),
(48, 3996.60, 479.59, 600.00, 5076.19),
(49, 3996.60, 479.59, 600.00, 5076.19),
(50, 3996.60, 479.59, 600.00, 5076.19),
(51, 39966.00, 4795.92, 600.00, 45361.92),
(52, 15986.40, 1918.37, 600.00, 18504.77),
(53, 148881.00, 17865.72, 600.00, 167346.72),
(54, 128898.00, 15467.76, 600.00, 144965.76),
(55, 59949.00, 7193.88, 600.00, 67742.88),
(56, 9193.20, 1103.18, 600.00, 10896.38),
(57, 63945.60, 7673.47, 600.00, 72219.07),
(58, 39966.00, 4795.92, 600.00, 45361.92),
(59, 105721.80, 12686.62, 600.00, 119008.42),
(60, 39966.00, 4795.92, 600.00, 45361.92),
(61, 19983.00, 2397.96, 600.00, 22980.96),
(62, 61989.80, 7438.78, 600.00, 70028.58),
(63, 20000.00, 2400.00, 600.00, 23000.00),
(64, 15000.00, 1800.00, 600.00, 17400.00),
(65, 20000.00, 2400.00, 600.00, 23000.00),
(66, 15000.00, 1800.00, 600.00, 17400.00),
(67, 282000.00, 33840.00, 600.00, 316440.00);

-- --------------------------------------------------------

--
-- Table structure for table `return_item`
--

CREATE TABLE `return_item` (
  `id` int(11) NOT NULL,
  `employee` varchar(50) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `unit_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `effective_date` date NOT NULL,
  `created_date` date NOT NULL,
  `created_by` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id`, `employee_id`, `effective_date`, `created_date`, `created_by`) VALUES
(61, 18, '2024-04-05', '2024-04-05', 'Lavin'),
(64, 55, '2024-04-13', '2024-04-13', 'Marco');

-- --------------------------------------------------------

--
-- Table structure for table `shiftdetails`
--

CREATE TABLE `shiftdetails` (
  `id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `day` text NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shiftdetails`
--

INSERT INTO `shiftdetails` (`id`, `shift_id`, `employee_id`, `day`, `time_in`, `time_out`) VALUES
(65, 61, 18, 'Friday', '00:01:00', '05:00:00'),
(68, 64, 55, 'Saturday', '09:00:00', '10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `contact_person` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `address`, `contact_person`, `contact`, `email`, `date_created`) VALUES
(1, 'JACK n JILL', 'San Fernando Pampanga', 'Zenji Yangco', '098754847563', 'zenjiyangco@gmail.com', '2024-05-12 23:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `transact`
--

CREATE TABLE `transact` (
  `id` int(11) NOT NULL,
  `transact_no` varchar(255) NOT NULL,
  `cashier_id` int(11) NOT NULL,
  `pay_method` varchar(20) NOT NULL,
  `sub_total` float(100,2) NOT NULL,
  `type` varchar(20) NOT NULL,
  `total_dis` float(100,2) NOT NULL,
  `total_amount` float(100,2) NOT NULL,
  `bayad` float(100,2) NOT NULL,
  `sukli` float(100,2) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `cart_sales`
--
ALTER TABLE `cart_sales`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `daily_time_record`
--
ALTER TABLE `daily_time_record`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `ada` (`rec_emp_id`),
  ADD KEY `dada` (`record_emp_name`),
  ADD KEY `sasa` (`record_emp_position`);

--
-- Indexes for table `discounted_item`
--
ALTER TABLE `discounted_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dtrrevised`
--
ALTER TABLE `dtrrevised`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `asdds` (`employee_id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `employee_name` (`employee_name`),
  ADD KEY `employee_position` (`employee_position`);

--
-- Indexes for table `employee_salary`
--
ALTER TABLE `employee_salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee_salary_revised`
--
ALTER TABLE `employee_salary_revised`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `finance_inbox`
--
ALTER TABLE `finance_inbox`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_inbox_po`
--
ALTER TABLE `finance_inbox_po`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Indexes for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `item_mapping`
--
ALTER TABLE `item_mapping`
  ADD PRIMARY KEY (`map_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `mebalik`
--
ALTER TABLE `mebalik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `medicine_list`
--
ALTER TABLE `medicine_list`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indexes for table `meremove`
--
ALTER TABLE `meremove`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `cashier_id` (`cashier_id`);

--
-- Indexes for table `mesali`
--
ALTER TABLE `mesali`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `transact_no` (`transact_no`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_item`
--
ALTER TABLE `return_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `shiftdetails`
--
ALTER TABLE `shiftdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asa` (`shift_id`),
  ADD KEY `adasdas` (`employee_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `transact`
--
ALTER TABLE `transact`
  ADD PRIMARY KEY (`transact_no`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `cashier_id` (`cashier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart_sales`
--
ALTER TABLE `cart_sales`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `discounted_item`
--
ALTER TABLE `discounted_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dtrrevised`
--
ALTER TABLE `dtrrevised`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `employee_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `employee_salary`
--
ALTER TABLE `employee_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `employee_salary_revised`
--
ALTER TABLE `employee_salary_revised`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `finance_inbox`
--
ALTER TABLE `finance_inbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9497696;

--
-- AUTO_INCREMENT for table `finance_inbox_po`
--
ALTER TABLE `finance_inbox_po`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9497696;

--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `item_mapping`
--
ALTER TABLE `item_mapping`
  MODIFY `map_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `mebalik`
--
ALTER TABLE `mebalik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `medicine_list`
--
ALTER TABLE `medicine_list`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `meremove`
--
ALTER TABLE `meremove`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `mesali`
--
ALTER TABLE `mesali`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `return_item`
--
ALTER TABLE `return_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `shiftdetails`
--
ALTER TABLE `shiftdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transact`
--
ALTER TABLE `transact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `cart_sales`
--
ALTER TABLE `cart_sales`
  ADD CONSTRAINT `cart_sales_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`inventory_id`),
  ADD CONSTRAINT `cart_sales_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`inventory_id`);

--
-- Constraints for table `daily_time_record`
--
ALTER TABLE `daily_time_record`
  ADD CONSTRAINT `ada` FOREIGN KEY (`rec_emp_id`) REFERENCES `employee_details` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dada` FOREIGN KEY (`record_emp_name`) REFERENCES `employee_details` (`employee_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sasa` FOREIGN KEY (`record_emp_position`) REFERENCES `employee_details` (`employee_position`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dtrrevised`
--
ALTER TABLE `dtrrevised`
  ADD CONSTRAINT `asdds` FOREIGN KEY (`employee_id`) REFERENCES `employee_details` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_salary`
--
ALTER TABLE `employee_salary`
  ADD CONSTRAINT `mean` FOREIGN KEY (`employee_id`) REFERENCES `employee_details` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_salary_revised`
--
ALTER TABLE `employee_salary_revised`
  ADD CONSTRAINT `mur` FOREIGN KEY (`employee_id`) REFERENCES `employee_details` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mebalik`
--
ALTER TABLE `mebalik`
  ADD CONSTRAINT `mebalik_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`inventory_id`);

--
-- Constraints for table `shift`
--
ALTER TABLE `shift`
  ADD CONSTRAINT `dsadasd` FOREIGN KEY (`employee_id`) REFERENCES `employee_details` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shiftdetails`
--
ALTER TABLE `shiftdetails`
  ADD CONSTRAINT `adasdas` FOREIGN KEY (`employee_id`) REFERENCES `employee_details` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asa` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
