-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 02, 2021 at 09:45 AM
-- Server version: 5.7.33-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-30+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gt`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_order_status_id` (IN `order_id_back` INT(11))  NO SQL
BEGIN
DECLARE realmID INT DEFAULT 0;
SET realmID = (SELECT COUNT(item_status_id) FROM order_lot_item WHERE order_id=order_id_back AND `item_status_id`!= 3);

IF (realmID = 0) THEN
 UPDATE new_order n
       SET 
           `n`.`order_status_id`='3'
       WHERE `n`.`order_id`=order_id_back;
  END IF; 
  SELECT order_status_id FROM new_order;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `account_name` varchar(222) DEFAULT NULL,
  `account_phone` varchar(222) DEFAULT NULL,
  `account_mobile` varchar(255) DEFAULT NULL,
  `account_email_ids` varchar(222) DEFAULT NULL,
  `account_address` text,
  `account_state` int(11) DEFAULT NULL,
  `account_city` int(11) DEFAULT NULL,
  `account_postal_code` varchar(50) DEFAULT NULL,
  `account_gst_no` varchar(222) DEFAULT NULL,
  `account_pan` varchar(22) DEFAULT NULL,
  `account_aadhaar` varchar(22) DEFAULT NULL,
  `account_contect_person_name` varchar(222) DEFAULT NULL,
  `account_group_id` int(11) DEFAULT NULL,
  `account_remarks` text,
  `opening_balance` double DEFAULT NULL,
  `interest` double DEFAULT NULL,
  `credit_debit` tinyint(1) DEFAULT NULL,
  `opening_balance_in_gold` double DEFAULT NULL,
  `gold_ob_credit_debit` tinyint(1) DEFAULT NULL,
  `opening_balance_in_silver` double DEFAULT NULL,
  `silver_ob_credit_debit` tinyint(1) DEFAULT NULL,
  `opening_balance_in_rupees` double DEFAULT NULL,
  `rupees_ob_credit_debit` tinyint(1) DEFAULT NULL,
  `opening_balance_in_c_amount` double NOT NULL DEFAULT '0',
  `c_amount_ob_credit_debit` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Credit, 2 = Debit',
  `opening_balance_in_r_amount` int(11) NOT NULL DEFAULT '0',
  `r_amount_ob_credit_debit` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Credit, 2 = Debit',
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_account_no` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `bank_interest` double DEFAULT NULL,
  `gold_fine` double DEFAULT '0',
  `silver_fine` double DEFAULT '0',
  `amount` double DEFAULT '0',
  `c_amount` double NOT NULL DEFAULT '0',
  `r_amount` double NOT NULL DEFAULT '0',
  `credit_limit` double DEFAULT '0',
  `balance_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1 = Approved, 2 = Not Approved',
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `is_supplier` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not Supplier, 1 = Supplier',
  `password` varchar(255) DEFAULT NULL,
  `min_price` double DEFAULT NULL,
  `chhijjat_per_100_ad` double DEFAULT '0',
  `meena_charges` double DEFAULT '0',
  `price_per_pcs` double DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = Not Active, 1 = Active',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `account_name`, `account_phone`, `account_mobile`, `account_email_ids`, `account_address`, `account_state`, `account_city`, `account_postal_code`, `account_gst_no`, `account_pan`, `account_aadhaar`, `account_contect_person_name`, `account_group_id`, `account_remarks`, `opening_balance`, `interest`, `credit_debit`, `opening_balance_in_gold`, `gold_ob_credit_debit`, `opening_balance_in_silver`, `silver_ob_credit_debit`, `opening_balance_in_rupees`, `rupees_ob_credit_debit`, `opening_balance_in_c_amount`, `c_amount_ob_credit_debit`, `opening_balance_in_r_amount`, `r_amount_ob_credit_debit`, `bank_name`, `bank_account_no`, `ifsc_code`, `bank_interest`, `gold_fine`, `silver_fine`, `amount`, `c_amount`, `r_amount`, `credit_limit`, `balance_date`, `status`, `user_id`, `user_name`, `is_supplier`, `password`, `min_price`, `chhijjat_per_100_ad`, `meena_charges`, `price_per_pcs`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Cash Customer', '7778889997', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 1, 0, NULL, 0, NULL, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, NULL),
(2, 'Customer Monthly Interest', '', '9999999999', '', '', NULL, NULL, '', '', '', '', '', 15, NULL, NULL, 0, NULL, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, '', '', '', 0, 0, 0, 0, 0, 0, 0, '2020-01-02 19:45:36', 1, 0, NULL, 0, NULL, NULL, 0, 0, NULL, 1, 1, '2019-03-13 13:29:23', 1, '2019-03-13 13:29:23'),
(3, 'Adjust', '', NULL, '', '', NULL, NULL, '', '', '', '', '', 9, NULL, NULL, 0, NULL, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, '', '', '', 0, 0, 0, 0, 0, 0, 0, '2020-01-03 18:40:32', 1, 0, NULL, 0, NULL, NULL, 0, 0, NULL, 1, 1, '2019-04-29 13:20:09', 1, '2019-04-29 13:20:09'),
(4, 'admin', NULL, '2912700007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2020-01-01 17:09:06', 1, 1, NULL, 0, NULL, NULL, 0, 0, NULL, 1, 1, '2019-09-16 17:57:53', NULL, NULL),
(5, 'Salary Expense', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2019-12-22 12:41:36', 1, 0, NULL, 0, NULL, NULL, 0, 0, NULL, 1, 1, '2019-07-27 15:30:00', 1, '2019-07-27 15:30:00'),
(6, 'MF Loss', '', NULL, '', '', NULL, NULL, '', '', '', '', '', 9, NULL, NULL, 0, NULL, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, '', '', '', 0, 0, 0, 0, 0, 0, 0, '2020-01-02 19:53:10', 1, 0, NULL, 0, NULL, NULL, 0, 0, NULL, 1, 1, '2019-09-11 15:30:00', 1, '2019-09-11 15:30:00'),
(358, 'CASTING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 1, 0, NULL, 0, NULL, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, NULL),
(359, 'MACHIN CHAIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, '2019-12-19 17:49:09', 1, 0, NULL, 0, NULL, NULL, 0, 0, NULL, 1, NULL, NULL, NULL, NULL),
(361, 'Sales MAIN', '', '', NULL, '', NULL, NULL, '', '', '', '', '', 50, NULL, NULL, 0, NULL, 0, 1, 0, 1, 0, 2, 0, 1, 0, 1, '', '', '', 0, 0, 0, 0, 0, 0, 0, '2019-12-19 20:07:14', 1, 0, NULL, 0, NULL, NULL, 0, 0, NULL, 1, NULL, NULL, 1, '2019-09-17 19:20:04'),
(362, 'Test', '', '', '', '', NULL, NULL, '', '', '', '', '', 49, '', NULL, 0, NULL, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, '', '', '', 0, 0, 0, 0, 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, 1, 1, '2021-12-02 14:49:54', 1, '2021-12-02 14:49:54');

--
-- Triggers `account`
--
DELIMITER $$
CREATE TRIGGER `account_delete_after_trigger` AFTER DELETE ON `account` FOR EACH ROW INSERT INTO 
  gurulog.`account_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `account_id`=OLD.account_id,
  `account_name`=OLD.account_name,
  `account_phone`=OLD.account_phone,
  `account_mobile`=OLD.account_mobile,
  `account_email_ids`=OLD.account_email_ids,
  `account_address`=OLD.account_address,
  `account_state`=OLD.account_state,
  `account_city`=OLD.account_city,
  `account_postal_code`=OLD.account_postal_code,
  `account_gst_no`=OLD.account_gst_no,
  `account_pan`=OLD.account_pan,
  `account_aadhaar`=OLD.account_aadhaar,
  `account_contect_person_name`=OLD.account_contect_person_name,
  `account_group_id`=OLD.account_group_id,
  `opening_balance`=OLD.opening_balance,
  `interest`=OLD.interest,
  `credit_debit`=OLD.credit_debit,
  `opening_balance_in_gold`=OLD.opening_balance_in_gold,
  `gold_ob_credit_debit`=OLD.gold_ob_credit_debit,
  `opening_balance_in_silver`=OLD.opening_balance_in_silver,
  `silver_ob_credit_debit`=OLD.silver_ob_credit_debit,
  `opening_balance_in_rupees`=OLD.opening_balance_in_rupees,
  `rupees_ob_credit_debit`=OLD.rupees_ob_credit_debit,
  `bank_name`=OLD.bank_name,
  `bank_account_no`=OLD.bank_account_no,
  `ifsc_code`=OLD.ifsc_code,
  `bank_interest`=OLD.bank_interest,
  `gold_fine`=OLD.gold_fine,
  `silver_fine`=OLD.silver_fine,
  `amount`=OLD.amount,
  `credit_limit`=OLD.credit_limit,
  `balance_date`=OLD.balance_date,
  `status`=OLD.status,
  `user_id`=OLD.user_id,
  `user_name`=OLD.user_name,
  `is_supplier`=OLD.is_supplier,
  `password`=OLD.password,
  `min_price`=OLD.min_price,
  `chhijjat_per_100_ad`=OLD.chhijjat_per_100_ad,
  `meena_charges`=OLD.meena_charges,
  `price_per_pcs`=OLD.price_per_pcs,
  `is_active`=OLD.is_active,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `account_insert_after_trigger` AFTER INSERT ON `account` FOR EACH ROW INSERT INTO 
  gurulog.`account_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `account_id`=NEW.account_id,
  `account_name`=NEW.account_name,
  `account_phone`=NEW.account_phone,
  `account_mobile`=NEW.account_mobile,
  `account_email_ids`=NEW.account_email_ids,
  `account_address`=NEW.account_address,
  `account_state`=NEW.account_state,
  `account_city`=NEW.account_city,
  `account_postal_code`=NEW.account_postal_code,
  `account_gst_no`=NEW.account_gst_no,
  `account_pan`=NEW.account_pan,
  `account_aadhaar`=NEW.account_aadhaar,
  `account_contect_person_name`=NEW.account_contect_person_name,
  `account_group_id`=NEW.account_group_id,
  `opening_balance`=NEW.opening_balance,
  `interest`=NEW.interest,
  `credit_debit`=NEW.credit_debit,
  `opening_balance_in_gold`=NEW.opening_balance_in_gold,
  `gold_ob_credit_debit`=NEW.gold_ob_credit_debit,
  `opening_balance_in_silver`=NEW.opening_balance_in_silver,
  `silver_ob_credit_debit`=NEW.silver_ob_credit_debit,
  `opening_balance_in_rupees`=NEW.opening_balance_in_rupees,
  `rupees_ob_credit_debit`=NEW.rupees_ob_credit_debit,
  `bank_name`=NEW.bank_name,
  `bank_account_no`=NEW.bank_account_no,
  `ifsc_code`=NEW.ifsc_code,
  `bank_interest`=NEW.bank_interest,
  `gold_fine`=NEW.gold_fine,
  `silver_fine`=NEW.silver_fine,
  `amount`=NEW.amount,
  `credit_limit`=NEW.credit_limit,
  `balance_date`=NEW.balance_date,
  `status`=NEW.status,
  `user_id`=NEW.user_id,
  `user_name`=NEW.user_name,
  `is_supplier`=NEW.is_supplier,
  `password`=NEW.password,
  `min_price`=NEW.min_price,
  `chhijjat_per_100_ad`=NEW.chhijjat_per_100_ad,
  `meena_charges`=NEW.meena_charges,
  `price_per_pcs`=NEW.price_per_pcs,
  `is_active`=NEW.is_active,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `account_update_after_trigger` AFTER UPDATE ON `account` FOR EACH ROW INSERT INTO 
  gurulog.`account_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `account_id`=NEW.account_id,
  `account_name`=NEW.account_name,
  `account_phone`=NEW.account_phone,
  `account_mobile`=NEW.account_mobile,
  `account_email_ids`=NEW.account_email_ids,
  `account_address`=NEW.account_address,
  `account_state`=NEW.account_state,
  `account_city`=NEW.account_city,
  `account_postal_code`=NEW.account_postal_code,
  `account_gst_no`=NEW.account_gst_no,
  `account_pan`=NEW.account_pan,
  `account_aadhaar`=NEW.account_aadhaar,
  `account_contect_person_name`=NEW.account_contect_person_name,
  `account_group_id`=NEW.account_group_id,
  `opening_balance`=NEW.opening_balance,
  `interest`=NEW.interest,
  `credit_debit`=NEW.credit_debit,
  `opening_balance_in_gold`=NEW.opening_balance_in_gold,
  `gold_ob_credit_debit`=NEW.gold_ob_credit_debit,
  `opening_balance_in_silver`=NEW.opening_balance_in_silver,
  `silver_ob_credit_debit`=NEW.silver_ob_credit_debit,
  `opening_balance_in_rupees`=NEW.opening_balance_in_rupees,
  `rupees_ob_credit_debit`=NEW.rupees_ob_credit_debit,
  `bank_name`=NEW.bank_name,
  `bank_account_no`=NEW.bank_account_no,
  `ifsc_code`=NEW.ifsc_code,
  `bank_interest`=NEW.bank_interest,
  `gold_fine`=NEW.gold_fine,
  `silver_fine`=NEW.silver_fine,
  `amount`=NEW.amount,
  `credit_limit`=NEW.credit_limit,
  `balance_date`=NEW.balance_date,
  `status`=NEW.status,
  `user_id`=NEW.user_id,
  `user_name`=NEW.user_name,
  `is_supplier`=NEW.is_supplier,
  `password`=NEW.password,
  `min_price`=NEW.min_price,
  `chhijjat_per_100_ad`=NEW.chhijjat_per_100_ad,
  `meena_charges`=NEW.meena_charges,
  `price_per_pcs`=NEW.price_per_pcs,
  `is_active`=NEW.is_active,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_balance_date_before_insert` BEFORE INSERT ON `account` FOR EACH ROW IF (NEW.gold_fine != 0 OR NEW.silver_fine != 0 OR NEW.amount != 0) THEN
  SET  NEW.`balance_date`= NOW();
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_balance_date_before_update` BEFORE UPDATE ON `account` FOR EACH ROW IF (NEW.gold_fine != OLD.gold_fine OR NEW.silver_fine != OLD.silver_fine OR NEW.amount != OLD.amount) THEN
  SET  NEW.`balance_date`= NOW();
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account_group`
--

CREATE TABLE `account_group` (
  `account_group_id` int(11) NOT NULL,
  `parent_group_id` int(11) DEFAULT NULL COMMENT '0 = Is Parent',
  `account_group_name` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `is_display_in_balance_sheet` tinyint(1) NOT NULL DEFAULT '1',
  `use_in_profit_loss` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not use in profit loss, 1 = use in profit loss',
  `move_data_opening_zero` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `is_deletable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Deletable, 0 = Not Deletable',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=deleted,0=not deleted',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_group`
--

INSERT INTO `account_group` (`account_group_id`, `parent_group_id`, `account_group_name`, `sequence`, `is_display_in_balance_sheet`, `use_in_profit_loss`, `move_data_opening_zero`, `is_deletable`, `is_deleted`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 10, 'Expenses (Direct)', 2, 0, 0, 0, 0, 0, 1, '2017-08-04 07:40:24', 1, '2019-10-23 13:23:05'),
(2, 10, 'Trading Account', 0, 0, 0, 0, 0, 0, 1, '2017-08-04 07:40:48', 1, '2019-10-23 13:24:38'),
(3, 2, 'General Trading Account', 99, 0, 0, 0, 0, 0, 1, '2017-08-04 07:41:06', 1, '2019-10-23 13:07:34'),
(4, 10, 'Income (Trading)', 2, 0, 0, 0, 0, 0, 1, '2017-08-04 07:41:33', 1, '2019-10-23 13:08:18'),
(5, 10, 'Jobwork Expense', 3, 0, 0, 0, 0, 0, 1, '2017-08-04 07:41:50', 1, '2019-10-23 13:08:00'),
(6, 10, 'Jobwork Income (Trading)', 3, 0, 0, 0, 0, 0, 1, '2017-08-04 07:42:06', 1, '2019-10-23 13:07:52'),
(7, 10, 'Purchase Account', 1, 0, 0, 0, 0, 0, 1, '2017-08-04 07:42:18', 1, '2019-10-23 13:08:10'),
(8, 10, 'Sales Account', 1, 0, 0, 0, 0, 0, 1, '2017-08-04 07:42:27', 1, '2019-10-23 13:07:41'),
(9, 11, 'Expense Account', 1, 0, 0, 0, 0, 0, 1, '2017-08-04 07:42:43', 1, '2019-10-23 13:26:18'),
(10, 0, 'Trading', 0, 0, 0, 0, 0, 0, 1, '2017-08-04 07:43:54', 1, '2019-10-23 13:06:48'),
(11, 0, 'Profit & Loss', 0, 0, 0, 0, 0, 0, 1, '2017-08-04 07:45:17', 1, '2019-10-23 13:07:12'),
(12, 0, 'Balance Sheet', 0, 1, 0, 0, 0, 0, 1, '2017-08-04 07:47:13', 1, '2017-08-04 07:47:13'),
(13, 9, 'Financial Expense', 3, 0, 0, 0, 0, 0, 1, '2017-08-04 07:47:42', 1, '2019-10-23 13:27:12'),
(14, 11, 'Income', 22, 0, 0, 0, 0, 0, 1, '2017-08-04 07:48:00', 1, '2019-10-23 13:25:17'),
(15, 11, 'Income (Other Then Sales)', 3, 0, 0, 0, 0, 0, 1, '2017-08-04 07:48:51', 1, '2019-10-23 12:50:29'),
(16, 11, 'Partner Interest', 4, 1, 0, 0, 0, 0, 1, '2017-08-04 09:17:14', 1, '2017-08-04 09:17:14'),
(17, 11, 'Partner Remuneration', 4, 1, 0, 0, 0, 0, 1, '2017-08-04 09:17:31', 1, '2017-08-04 09:17:31'),
(18, 11, 'Revenue Accounts', 1, 1, 0, 0, 0, 0, 1, '2017-08-04 09:17:59', 1, '2017-08-04 09:17:59'),
(19, 9, 'Salary Expense', 2, 0, 0, 0, 0, 0, 1, '2017-08-04 09:18:27', 1, '2019-10-23 13:09:14'),
(20, 12, 'Current Assets', 1, 1, 0, 0, 0, 0, 1, '2017-08-04 09:18:47', 1, '2017-08-04 09:18:47'),
(21, 20, 'Bank Accounts (Banks)', 8, 1, 0, 0, 0, 0, 1, '2017-08-04 09:19:11', 1, '2017-08-04 09:19:11'),
(22, 12, 'Loans (Liability)', 9, 0, 0, 0, 0, 0, 1, '2017-08-04 09:19:45', 1, '2019-10-23 13:07:26'),
(23, 22, 'Bank OCC a/c', 4, 1, 0, 0, 0, 0, 1, '2017-08-04 09:20:08', 1, '2017-08-04 09:20:08'),
(24, 12, 'Capital Account', 1, 1, 0, 0, 0, 0, 1, '2017-08-04 09:20:23', 1, '2017-08-04 09:20:23'),
(25, 12, 'Cash Ledger A/C.', 98, 1, 0, 0, 0, 0, 1, '2017-08-04 09:20:40', 1, '2017-08-04 09:20:40'),
(26, 20, 'Cash-in-hand', 9, 1, 0, 0, 0, 0, 1, '2017-08-04 09:21:01', 1, '2017-08-04 09:21:01'),
(27, 12, 'Current Liabilities', 5, 1, 0, 0, 0, 0, 1, '2017-08-04 09:21:18', 1, '2017-08-04 09:21:18'),
(28, 20, 'Deposits (Asset)', 4, 1, 0, 0, 0, 0, 1, '2017-08-04 09:21:41', 1, '2017-08-04 09:21:41'),
(29, 27, 'Duties & Taxes', 6, 1, 0, 0, 0, 0, 1, '2017-08-04 09:22:07', 1, '2017-08-04 09:22:07'),
(30, 12, 'Fixed Assets', 2, 1, 0, 0, 0, 0, 1, '2017-08-04 09:22:21', 1, '2017-08-04 09:22:21'),
(31, 12, 'Investments', 3, 1, 0, 0, 0, 0, 1, '2017-08-04 09:22:42', 1, '2017-08-04 09:22:42'),
(32, 20, 'Loans & Advances (Asset)', 5, 1, 0, 0, 0, 0, 1, '2017-08-04 09:23:01', 1, '2017-08-04 09:23:01'),
(33, 12, 'Misc. Expenses (Asset)', 6, 1, 0, 0, 0, 0, 1, '2017-08-04 09:23:52', 1, '2017-08-04 09:23:52'),
(34, 12, 'Profit & Loss A/c', 99, 0, 0, 0, 0, 0, 1, '2017-08-04 09:24:33', 1, '2019-10-23 13:25:41'),
(35, 27, 'Provisions', 7, 1, 0, 0, 0, 0, 1, '2017-08-04 09:24:47', 1, '2017-08-04 09:24:47'),
(36, 24, 'Reserves & Surplus', 2, 1, 0, 0, 0, 0, 1, '2017-08-04 09:25:05', 1, '2017-08-04 09:25:05'),
(37, 22, 'Secured Loans', 10, 1, 0, 0, 0, 0, 1, '2017-08-04 09:25:59', 1, '2017-08-04 09:25:59'),
(38, 12, 'Stock-in-hand', 10, 1, 0, 0, 0, 0, 1, '2017-08-04 09:26:11', 1, '2017-08-04 09:26:11'),
(39, 27, 'Sundry Creditors', 11, 1, 0, 0, 0, 0, 1, '2017-08-04 09:26:32', 1, '2017-08-04 09:26:32'),
(40, 27, 'Sundry Creditors (Others)', 12, 1, 0, 0, 0, 0, 1, '2017-08-04 09:26:52', 1, '2017-08-04 09:26:52'),
(41, 27, 'Sundry Creditors (Salary)', 13, 1, 0, 0, 0, 0, 1, '2017-08-04 09:27:26', 1, '2017-08-04 09:27:26'),
(42, 20, 'Sundry Debtors', 7, 1, 0, 0, 0, 0, 1, '2017-08-04 09:27:44', 1, '2017-08-04 09:27:44'),
(45, 12, 'Suspense Account', 8, 1, 0, 0, 0, 0, 1, '2017-08-04 09:28:34', 1, '2017-08-04 09:28:34'),
(46, 22, 'Unsecured Loans', 3, 1, 0, 0, 0, 0, 1, '2017-08-04 09:28:47', 1, '2017-08-04 09:28:47'),
(47, 27, 'Staff', 99, 1, 0, 0, 0, 0, 1, '2017-08-04 09:45:18', 1, '2017-08-04 09:45:18'),
(48, 27, 'Supplier', 99, 1, 0, 0, 0, 0, 1, '2017-08-04 09:45:26', 1, '2017-08-04 09:45:26'),
(49, 20, 'Customer', 99, 1, 0, 0, 0, 0, 1, '2017-08-04 09:45:47', 1, '2017-08-04 09:45:47'),
(50, NULL, 'Department', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL),
(51, NULL, 'Admin', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL),
(52, NULL, 'User', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL),
(53, NULL, 'Worker', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL),
(54, NULL, 'Salesman', NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL),
(55, NULL, 'Not Approved', NULL, 0, 0, 0, 0, 0, 1, '2019-12-09 00:00:00', 1, '2019-12-09 00:00:00');

--
-- Triggers `account_group`
--
DELIMITER $$
CREATE TRIGGER `account_group_delete_after_trigger` AFTER DELETE ON `account_group` FOR EACH ROW INSERT INTO 
  gurulog.`account_group_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `account_group_id`=OLD.account_group_id,
  `parent_group_id`=OLD.parent_group_id,
  `account_group_name`=OLD.account_group_name,
  `sequence`=OLD.sequence,
  `is_display_in_balance_sheet`=OLD.is_display_in_balance_sheet,
  `use_in_profit_loss`=OLD.use_in_profit_loss,
  `move_data_opening_zero`=OLD.move_data_opening_zero,
  `is_deletable`=OLD.is_deletable,
  `is_deleted`=OLD.is_deleted,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `account_group_insert_after_trigger` AFTER INSERT ON `account_group` FOR EACH ROW INSERT INTO 
  gurulog.`account_group_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `account_group_id`=NEW.account_group_id,
  `parent_group_id`=NEW.parent_group_id,
  `account_group_name`=NEW.account_group_name,
  `sequence`=NEW.sequence,
  `is_display_in_balance_sheet`=NEW.is_display_in_balance_sheet,
  `use_in_profit_loss`=NEW.use_in_profit_loss,
  `move_data_opening_zero`=NEW.move_data_opening_zero,
  `is_deletable`=NEW.is_deletable,
  `is_deleted`=NEW.is_deleted,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `account_group_update_after_trigger` AFTER UPDATE ON `account_group` FOR EACH ROW INSERT INTO 
  gurulog.`account_group_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `account_group_id`=NEW.account_group_id,
  `parent_group_id`=NEW.parent_group_id,
  `account_group_name`=NEW.account_group_name,
  `sequence`=NEW.sequence,
  `is_display_in_balance_sheet`=NEW.is_display_in_balance_sheet,
  `use_in_profit_loss`=NEW.use_in_profit_loss,
  `move_data_opening_zero`=NEW.move_data_opening_zero,
  `is_deletable`=NEW.is_deletable,
  `is_deleted`=NEW.is_deleted,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ad`
--

CREATE TABLE `ad` (
  `ad_id` int(11) NOT NULL,
  `ad_name` varchar(255) NOT NULL,
  `ad_description` text,
  `is_nang_setting` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `is_sell_purchase_ad_charges` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `is_sell_purchase_less_ad_details` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ad`
--

INSERT INTO `ad` (`ad_id`, `ad_name`, `ad_description`, `is_nang_setting`, `is_sell_purchase_ad_charges`, `is_sell_purchase_less_ad_details`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(5, 'COIN LABOUR', '', 0, 1, 0, '2020-02-20 11:46:32', 1, '2020-02-20 16:56:38', 1),
(6, 'WHITE', '', 1, 1, 1, '2020-02-20 16:56:55', 1, '2020-02-20 16:56:55', 1),
(7, 'LABOUR', '', 0, 1, 0, '2020-02-21 16:26:43', 1, '2020-02-21 16:26:43', 1),
(8, 'MOTI ', '', 1, 1, 1, '2020-02-23 11:12:47', 1, '2020-02-23 11:12:47', 1);

--
-- Triggers `ad`
--
DELIMITER $$
CREATE TRIGGER `ad_delete_after_trigger` AFTER DELETE ON `ad` FOR EACH ROW INSERT INTO 
  gurulog.`ad_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `ad_id`=OLD.ad_id,
  `ad_name`=OLD.ad_name,
  `ad_description`=OLD.ad_description,
  `is_nang_setting`=OLD.is_nang_setting,
  `is_sell_purchase_ad_charges`=OLD.is_sell_purchase_ad_charges,
  `is_sell_purchase_less_ad_details`=OLD.is_sell_purchase_less_ad_details,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ad_insert_after_trigger` AFTER INSERT ON `ad` FOR EACH ROW INSERT INTO 
  gurulog.`ad_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `ad_id`=NEW.ad_id,
  `ad_name`=NEW.ad_name,
  `ad_description`=NEW.ad_description,
  `is_nang_setting`=NEW.is_nang_setting,
  `is_sell_purchase_ad_charges`=NEW.is_sell_purchase_ad_charges,
  `is_sell_purchase_less_ad_details`=NEW.is_sell_purchase_less_ad_details,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ad_update_after_trigger` AFTER UPDATE ON `ad` FOR EACH ROW INSERT INTO 
  gurulog.`ad_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `ad_id`=NEW.ad_id,
  `ad_name`=NEW.ad_name,
  `ad_description`=NEW.ad_description,
  `is_nang_setting`=NEW.is_nang_setting,
  `is_sell_purchase_ad_charges`=NEW.is_sell_purchase_ad_charges,
  `is_sell_purchase_less_ad_details`=NEW.is_sell_purchase_less_ad_details,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `carat`
--

CREATE TABLE `carat` (
  `carat_id` int(11) NOT NULL,
  `purity` double DEFAULT NULL,
  `show_in_xrf` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carat`
--

INSERT INTO `carat` (`carat_id`, `purity`, `show_in_xrf`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 92.5, 0, NULL, NULL, '2018-11-21 16:41:35', 1),
(7, 50, 0, NULL, NULL, NULL, 1),
(8, 84, 0, '2018-11-21 16:41:46', 1, NULL, 0),
(9, 76, 0, '2019-03-26 11:17:02', 1, NULL, 0),
(11, 88, 0, '2019-04-06 10:36:54', 1, NULL, 0),
(12, 82, 0, '2019-04-14 17:21:37', 1, NULL, 0),
(16, 100, 0, '2019-07-22 17:34:25', 1, '2019-07-22 17:34:25', 1),
(17, 90, 0, '2019-07-23 10:58:48', 1, '2019-07-23 10:58:48', 1),
(18, 80, 0, '2019-08-22 17:49:20', 1, '2019-08-22 17:49:20', 1),
(19, 89, 0, '2019-08-22 18:54:30', 1, '2019-08-22 18:54:30', 1),
(20, 91, 0, '2019-08-22 19:00:07', 1, '2019-08-22 19:00:07', 1),
(21, 88.15, 0, '2019-08-25 18:11:52', 1, '2019-08-25 18:11:52', 1),
(22, 83, 0, '2019-11-10 12:22:39', 1, '2019-11-10 12:22:39', 1),
(23, 81, 0, '2019-12-01 13:35:01', 1, '2019-12-01 13:35:01', 1),
(24, 0, 0, '2019-12-01 13:37:11', 1, '2019-12-01 13:37:11', 1),
(25, 85, 0, '2020-01-09 15:27:58', 1, '2020-01-09 15:27:58', 1);

--
-- Triggers `carat`
--
DELIMITER $$
CREATE TRIGGER `carat_delete_after_trigger` AFTER DELETE ON `carat` FOR EACH ROW INSERT INTO 
  gurulog.`carat_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `carat_id`=OLD.carat_id,
  `purity`=OLD.purity,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `carat_insert_after_trigger` AFTER INSERT ON `carat` FOR EACH ROW INSERT INTO 
  gurulog.`carat_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `carat_id`=NEW.carat_id,
  `purity`=NEW.purity,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `carat_update_after_trigger` AFTER UPDATE ON `carat` FOR EACH ROW INSERT INTO 
  gurulog.`carat_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `carat_id`=NEW.carat_id,
  `purity`=NEW.purity,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `casting_entry`
--

CREATE TABLE `casting_entry` (
  `ce_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `from_casting_status_id` int(11) DEFAULT NULL,
  `to_casting_status_id` int(11) DEFAULT NULL,
  `cad_worker_id` int(11) DEFAULT NULL,
  `ce_date` date DEFAULT NULL,
  `reference_no` int(11) DEFAULT NULL,
  `lott_complete` tinyint(1) DEFAULT NULL COMMENT '0 = No, 1 = Yes',
  `hisab_done` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `ce_remark` text,
  `total_issue_net_wt` double DEFAULT NULL,
  `total_receive_net_wt` double DEFAULT NULL,
  `total_issue_fine` double DEFAULT NULL,
  `total_receive_fine` double DEFAULT NULL,
  `design_files` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `casting_entry`
--
DELIMITER $$
CREATE TRIGGER `casting_entry_delete_after_trigger` AFTER DELETE ON `casting_entry` FOR EACH ROW INSERT INTO 
  gurulog.`casting_entry_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `ce_id`=OLD.ce_id,
  `department_id`=OLD.department_id,
  `worker_id`=OLD.worker_id,
  `from_casting_status_id`=OLD.from_casting_status_id,
  `to_casting_status_id`=OLD.to_casting_status_id,
  `cad_worker_id`=OLD.cad_worker_id,
  `ce_date`=OLD.ce_date,
  `reference_no`=OLD.reference_no,
  `lott_complete`=OLD.lott_complete,
  `hisab_done`=OLD.hisab_done,
  `ce_remark`=OLD.ce_remark,
  `total_issue_net_wt`=OLD.total_issue_net_wt,
  `total_receive_net_wt`=OLD.total_receive_net_wt,
  `total_issue_fine`=OLD.total_issue_fine,
  `total_receive_fine`=OLD.total_receive_fine,
  `design_files`=OLD.design_files,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `casting_entry_insert_after_trigger` AFTER INSERT ON `casting_entry` FOR EACH ROW INSERT INTO 
  gurulog.`casting_entry_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `ce_id`=NEW.ce_id,
  `department_id`=NEW.department_id,
  `worker_id`=NEW.worker_id,
  `from_casting_status_id`=NEW.from_casting_status_id,
  `to_casting_status_id`=NEW.to_casting_status_id,
  `cad_worker_id`=NEW.cad_worker_id,
  `ce_date`=NEW.ce_date,
  `reference_no`=NEW.reference_no,
  `lott_complete`=NEW.lott_complete,
  `hisab_done`=NEW.hisab_done,
  `ce_remark`=NEW.ce_remark,
  `total_issue_net_wt`=NEW.total_issue_net_wt,
  `total_receive_net_wt`=NEW.total_receive_net_wt,
  `total_issue_fine`=NEW.total_issue_fine,
  `total_receive_fine`=NEW.total_receive_fine,
  `design_files`=NEW.design_files,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `casting_entry_update_after_trigger` AFTER UPDATE ON `casting_entry` FOR EACH ROW INSERT INTO 
  gurulog.`casting_entry_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `ce_id`=NEW.ce_id,
  `department_id`=NEW.department_id,
  `worker_id`=NEW.worker_id,
  `from_casting_status_id`=NEW.from_casting_status_id,
  `to_casting_status_id`=NEW.to_casting_status_id,
  `cad_worker_id`=NEW.cad_worker_id,
  `ce_date`=NEW.ce_date,
  `reference_no`=NEW.reference_no,
  `lott_complete`=NEW.lott_complete,
  `hisab_done`=NEW.hisab_done,
  `ce_remark`=NEW.ce_remark,
  `total_issue_net_wt`=NEW.total_issue_net_wt,
  `total_receive_net_wt`=NEW.total_receive_net_wt,
  `total_issue_fine`=NEW.total_issue_fine,
  `total_receive_fine`=NEW.total_receive_fine,
  `design_files`=NEW.design_files,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `casting_entry_design_files`
--

CREATE TABLE `casting_entry_design_files` (
  `design_file_id` int(11) NOT NULL,
  `ce_id` int(11) DEFAULT NULL,
  `design_file_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `casting_entry_design_files`
--
DELIMITER $$
CREATE TRIGGER `casting_entry_design_files_delete_after_trigger` AFTER DELETE ON `casting_entry_design_files` FOR EACH ROW INSERT INTO 
  gurulog.`casting_entry_design_files_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `design_file_id`=OLD.design_file_id,
  `ce_id`=OLD.ce_id,
  `design_file_name`=OLD.design_file_name,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `casting_entry_design_files_insert_after_trigger` AFTER INSERT ON `casting_entry_design_files` FOR EACH ROW INSERT INTO 
  gurulog.`casting_entry_design_files_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `design_file_id`=NEW.design_file_id,
  `ce_id`=NEW.ce_id,
  `design_file_name`=NEW.design_file_name,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `casting_entry_design_files_update_after_trigger` AFTER UPDATE ON `casting_entry_design_files` FOR EACH ROW INSERT INTO 
  gurulog.`casting_entry_design_files_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `design_file_id`=NEW.design_file_id,
  `ce_id`=NEW.ce_id,
  `design_file_name`=NEW.design_file_name,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `casting_entry_details`
--

CREATE TABLE `casting_entry_details` (
  `ce_detail_id` int(11) NOT NULL,
  `ce_id` int(11) DEFAULT NULL,
  `type_id` tinyint(1) DEFAULT NULL COMMENT '1 = Issue Finish Work, 2 = Issue Scrap, 3 = Receive Finish Work, 4 = Receive Scrap',
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `tunch` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `less` double DEFAULT NULL,
  `net_wt` double DEFAULT NULL,
  `actual_tunch` double DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `pcs` double DEFAULT NULL,
  `ad_weight` double DEFAULT NULL,
  `ad_pcs` double DEFAULT NULL,
  `ce_detail_date` date DEFAULT NULL,
  `tunch_textbox` tinyint(1) DEFAULT NULL,
  `ce_detail_remark` text,
  `purchase_sell_item_id` int(11) DEFAULT NULL COMMENT 'Purchase to Sell : purchase_sell_item_id',
  `stock_type` tinyint(1) DEFAULT NULL COMMENT '1 = Purchase, 2 = Exchange, 3 = Stock Transfer, 4 = Receive, 5 = Receive Finish, 6 = Receive Scrap',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `casting_entry_details`
--
DELIMITER $$
CREATE TRIGGER `casting_entry_details_delete_after_trigger` AFTER DELETE ON `casting_entry_details` FOR EACH ROW INSERT INTO 
  gurulog.`casting_entry_details_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `ce_detail_id`=OLD.ce_detail_id,
  `ce_id`=OLD.ce_id,
  `type_id`=OLD.type_id,
  `category_id`=OLD.category_id,
  `item_id`=OLD.item_id,
  `tunch`=OLD.tunch,
  `weight`=OLD.weight,
  `less`=OLD.less,
  `net_wt`=OLD.net_wt,
  `actual_tunch`=OLD.actual_tunch,
  `fine`=OLD.fine,
  `pcs`=OLD.pcs,
  `ad_weight`=OLD.ad_weight,
  `ad_pcs`=OLD.ad_pcs,
  `ce_detail_date`=OLD.ce_detail_date,
  `tunch_textbox`=OLD.tunch_textbox,
  `ce_detail_remark`=OLD.ce_detail_remark,
  `purchase_sell_item_id`=OLD.purchase_sell_item_id,
  `stock_type`=OLD.stock_type,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `casting_entry_details_insert_after_trigger` AFTER INSERT ON `casting_entry_details` FOR EACH ROW INSERT INTO 
  gurulog.`casting_entry_details_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `ce_detail_id`=NEW.ce_detail_id,
  `ce_id`=NEW.ce_id,
  `type_id`=NEW.type_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `tunch`=NEW.tunch,
  `weight`=NEW.weight,
  `less`=NEW.less,
  `net_wt`=NEW.net_wt,
  `actual_tunch`=NEW.actual_tunch,
  `fine`=NEW.fine,
  `pcs`=NEW.pcs,
  `ad_weight`=NEW.ad_weight,
  `ad_pcs`=NEW.ad_pcs,
  `ce_detail_date`=NEW.ce_detail_date,
  `tunch_textbox`=NEW.tunch_textbox,
  `ce_detail_remark`=NEW.ce_detail_remark,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `casting_entry_details_update_after_trigger` AFTER UPDATE ON `casting_entry_details` FOR EACH ROW INSERT INTO 
  gurulog.`casting_entry_details_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `ce_detail_id`=NEW.ce_detail_id,
  `ce_id`=NEW.ce_id,
  `type_id`=NEW.type_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `tunch`=NEW.tunch,
  `weight`=NEW.weight,
  `less`=NEW.less,
  `net_wt`=NEW.net_wt,
  `actual_tunch`=NEW.actual_tunch,
  `fine`=NEW.fine,
  `pcs`=NEW.pcs,
  `ad_weight`=NEW.ad_weight,
  `ad_pcs`=NEW.ad_pcs,
  `ce_detail_date`=NEW.ce_detail_date,
  `tunch_textbox`=NEW.tunch_textbox,
  `ce_detail_remark`=NEW.ce_detail_remark,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `casting_entry_order_items`
--

CREATE TABLE `casting_entry_order_items` (
  `ce_oi_id` int(11) NOT NULL,
  `ce_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_lot_item_id` int(11) DEFAULT NULL,
  `is_ahead` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `casting_entry_order_items`
--
DELIMITER $$
CREATE TRIGGER `casting_entry_order_items_delete_after_trigger` AFTER DELETE ON `casting_entry_order_items` FOR EACH ROW INSERT INTO 
  gurulog.`casting_entry_order_items_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `ce_oi_id`=OLD.ce_oi_id,
  `ce_id`=OLD.ce_id,
  `order_id`=OLD.order_id,
  `order_lot_item_id`=OLD.order_lot_item_id,
  `is_ahead`=OLD.is_ahead,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `casting_entry_order_items_insert_after_trigger` AFTER INSERT ON `casting_entry_order_items` FOR EACH ROW INSERT INTO 
  gurulog.`casting_entry_order_items_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `ce_oi_id`=NEW.ce_oi_id,
  `ce_id`=NEW.ce_id,
  `order_id`=NEW.order_id,
  `order_lot_item_id`=NEW.order_lot_item_id,
  `is_ahead`=NEW.is_ahead,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `casting_entry_order_items_update_after_trigger` AFTER UPDATE ON `casting_entry_order_items` FOR EACH ROW INSERT INTO 
  gurulog.`casting_entry_order_items_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `ce_oi_id`=NEW.ce_oi_id,
  `ce_id`=NEW.ce_id,
  `order_id`=NEW.order_id,
  `order_lot_item_id`=NEW.order_lot_item_id,
  `is_ahead`=NEW.is_ahead,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_group_id` int(11) DEFAULT NULL,
  `hsn_code` varchar(255) DEFAULT NULL,
  `gst_rate` double NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_group_id`, `hsn_code`, `gst_rate`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(17, 'CASTING', 1, NULL, 0, 1, '2018-11-21 18:13:19', NULL, NULL),
(19, 'CASTING GENTS RING', 1, NULL, 0, 1, '2019-02-13 18:05:49', NULL, NULL);

--
-- Triggers `category`
--
DELIMITER $$
CREATE TRIGGER `category_delete_after_trigger` AFTER DELETE ON `category` FOR EACH ROW INSERT INTO 
  gurulog.`category_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `category_id`=OLD.category_id,
  `category_name`=OLD.category_name,
  `category_group_id`=OLD.category_group_id,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `category_insert_after_trigger` AFTER INSERT ON `category` FOR EACH ROW INSERT INTO 
  gurulog.`category_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `category_id`=NEW.category_id,
  `category_name`=NEW.category_name,
  `category_group_id`=NEW.category_group_id,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `category_update_after_trigger` AFTER UPDATE ON `category` FOR EACH ROW INSERT INTO 
  gurulog.`category_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `category_id`=NEW.category_id,
  `category_name`=NEW.category_name,
  `category_group_id`=NEW.category_group_id,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category_group`
--

CREATE TABLE `category_group` (
  `category_group_id` int(11) NOT NULL,
  `category_group_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_group`
--

INSERT INTO `category_group` (`category_group_id`, `category_group_name`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Gold', NULL, NULL, NULL, NULL),
(2, 'Silver', NULL, NULL, NULL, NULL),
(3, 'Other', NULL, NULL, NULL, NULL);

--
-- Triggers `category_group`
--
DELIMITER $$
CREATE TRIGGER `category_group_delete_after_trigger` AFTER DELETE ON `category_group` FOR EACH ROW INSERT INTO 
  gurulog.`category_group_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `category_group_id`=OLD.category_group_id,
  `category_group_name`=OLD.category_group_name,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `category_group_insert_after_trigger` AFTER INSERT ON `category_group` FOR EACH ROW INSERT INTO 
  gurulog.`category_group_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `category_group_id`=NEW.category_group_id,
  `category_group_name`=NEW.category_group_name,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `category_group_update_after_trigger` AFTER UPDATE ON `category_group` FOR EACH ROW INSERT INTO 
  gurulog.`category_group_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `category_group_id`=NEW.category_group_id,
  `category_group_name`=NEW.category_group_name,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_name` varchar(222) DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1=deleted,0=not deleted',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `state_id`, `city_name`, `is_deleted`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 3, 'Rajkot', 0, 1, '2017-07-18 18:15:13', 1, '2018-03-06 14:55:38'),
(2, 2, 'Jaipur', 0, 1, '2017-07-18 18:15:24', 1, '2017-07-18 18:15:46'),
(4, 1, 'Ahamdabad', 0, 1, '2017-07-18 18:16:31', 1, '2017-07-18 18:16:31'),
(5, 4, 'Udaipur', 0, 1, '2017-07-20 09:35:35', 1, '2018-03-06 14:55:22'),
(6, 2, 'Ajmer', 0, 1, '2017-07-20 09:38:55', 1, '2017-07-20 09:38:55'),
(7, 4, 'Mumbai', 0, 1, '2017-07-20 09:41:23', 1, '2017-07-20 09:41:23');

--
-- Triggers `city`
--
DELIMITER $$
CREATE TRIGGER `city_delete_after_trigger` AFTER DELETE ON `city` FOR EACH ROW INSERT INTO 
  gurulog.`city_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `city_id`=OLD.city_id,
  `state_id`=OLD.state_id,
  `city_name`=OLD.city_name,
  `is_deleted`=OLD.is_deleted,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `city_insert_after_trigger` AFTER INSERT ON `city` FOR EACH ROW INSERT INTO 
  gurulog.`city_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `city_id`=NEW.city_id,
  `state_id`=NEW.state_id,
  `city_name`=NEW.city_name,
  `is_deleted`=NEW.is_deleted,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `city_update_after_trigger` AFTER UPDATE ON `city` FOR EACH ROW INSERT INTO 
  gurulog.`city_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `city_id`=NEW.city_id,
  `state_id`=NEW.state_id,
  `city_name`=NEW.city_name,
  `is_deleted`=NEW.is_deleted,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `company_details`
--

CREATE TABLE `company_details` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_gst_no` varchar(255) DEFAULT NULL,
  `company_phone` varchar(255) DEFAULT NULL,
  `company_mobile` varchar(255) DEFAULT NULL,
  `company_address` text,
  `company_postal_code` varchar(255) DEFAULT NULL,
  `company_state_id` int(11) DEFAULT NULL,
  `company_city_id` int(11) DEFAULT NULL,
  `company_cin` varchar(255) DEFAULT NULL,
  `company_reg_no` varchar(255) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_details`
--

INSERT INTO `company_details` (`company_id`, `company_name`, `company_gst_no`, `company_phone`, `company_mobile`, `company_address`, `company_postal_code`, `company_state_id`, `company_city_id`, `company_cin`, `company_reg_no`, `updated_by`, `updated_at`) VALUES
(1, 'ABC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `design_master`
--

CREATE TABLE `design_master` (
  `design_id` int(11) NOT NULL,
  `design_no` varchar(255) DEFAULT NULL,
  `file_no` varchar(255) DEFAULT NULL,
  `stl_3dm_no` varchar(255) DEFAULT NULL,
  `die_making` varchar(255) DEFAULT NULL,
  `die_no` varchar(255) DEFAULT NULL,
  `weight_for_bom` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `design_master`
--
DELIMITER $$
CREATE TRIGGER `design_master_delete_after_trigger` AFTER DELETE ON `design_master` FOR EACH ROW INSERT INTO 
  gurulog.`design_master_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `design_id`=OLD.design_id,
  `design_no`=OLD.design_no,
  `file_no`=OLD.file_no,
  `stl_3dm_no`=OLD.stl_3dm_no,
  `die_making`=OLD.die_making,
  `die_no`=OLD.die_no,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `design_master_insert_after_trigger` AFTER INSERT ON `design_master` FOR EACH ROW INSERT INTO 
  gurulog.`design_master_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `design_id`=NEW.design_id,
  `design_no`=NEW.design_no,
  `file_no`=NEW.file_no,
  `stl_3dm_no`=NEW.stl_3dm_no,
  `die_making`=NEW.die_making,
  `die_no`=NEW.die_no,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `design_master_update_after_trigger` AFTER UPDATE ON `design_master` FOR EACH ROW INSERT INTO 
  gurulog.`design_master_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `design_id`=NEW.design_id,
  `design_no`=NEW.design_no,
  `file_no`=NEW.file_no,
  `stl_3dm_no`=NEW.stl_3dm_no,
  `die_making`=NEW.die_making,
  `die_no`=NEW.die_no,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary`
--

CREATE TABLE `employee_salary` (
  `employee_salary_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `month_year` varchar(200) DEFAULT NULL,
  `worked_days` int(11) NOT NULL,
  `monthly_salary` double(20,2) NOT NULL,
  `salary_calculated` double(20,2) NOT NULL,
  `give_salary` double(20,2) NOT NULL,
  `leaves` int(11) NOT NULL,
  `journal_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `employee_salary`
--
DELIMITER $$
CREATE TRIGGER `employee_salary_delete_after_trigger` AFTER DELETE ON `employee_salary` FOR EACH ROW INSERT INTO 
  gurulog.`employee_salary_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `employee_salary_id`=OLD.employee_salary_id,
  `account_id`=OLD.account_id,
  `department_id`=OLD.department_id,
  `month_year`=OLD.month_year,
  `worked_days`=OLD.worked_days,
  `monthly_salary`=OLD.monthly_salary,
  `salary_calculated`=OLD.salary_calculated,
  `give_salary`=OLD.give_salary,
  `leaves`=OLD.leaves,
  `journal_id`=OLD.journal_id,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `employee_salary_insert_after_trigger` AFTER INSERT ON `employee_salary` FOR EACH ROW INSERT INTO 
  gurulog.`employee_salary_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `employee_salary_id`=NEW.employee_salary_id,
  `account_id`=NEW.account_id,
  `department_id`=NEW.department_id,
  `month_year`=NEW.month_year,
  `worked_days`=NEW.worked_days,
  `monthly_salary`=NEW.monthly_salary,
  `salary_calculated`=NEW.salary_calculated,
  `give_salary`=NEW.give_salary,
  `leaves`=NEW.leaves,
  `journal_id`=NEW.journal_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `employee_salary_update_after_trigger` AFTER UPDATE ON `employee_salary` FOR EACH ROW INSERT INTO 
  gurulog.`employee_salary_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `employee_salary_id`=NEW.employee_salary_id,
  `account_id`=NEW.account_id,
  `department_id`=NEW.department_id,
  `month_year`=NEW.month_year,
  `worked_days`=NEW.worked_days,
  `monthly_salary`=NEW.monthly_salary,
  `salary_calculated`=NEW.salary_calculated,
  `give_salary`=NEW.give_salary,
  `leaves`=NEW.leaves,
  `journal_id`=NEW.journal_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `assign_id` int(11) DEFAULT NULL,
  `feedback_date` date DEFAULT NULL,
  `note` text,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `feedback`
--
DELIMITER $$
CREATE TRIGGER `feedback_delete_after_trigger` AFTER DELETE ON `feedback` FOR EACH ROW INSERT INTO 
  gurulog.`feedback_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `feedback_id`=OLD.feedback_id,
  `assign_id`=OLD.assign_id,
  `feedback_date`=OLD.feedback_date,
  `note`=OLD.note,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `feedback_insert_after_trigger` AFTER INSERT ON `feedback` FOR EACH ROW INSERT INTO 
  gurulog.`feedback_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `feedback_id`=NEW.feedback_id,
  `assign_id`=NEW.assign_id,
  `feedback_date`=NEW.feedback_date,
  `note`=NEW.note,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `feedback_update_after_trigger` AFTER UPDATE ON `feedback` FOR EACH ROW INSERT INTO 
  gurulog.`feedback_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `feedback_id`=NEW.feedback_id,
  `assign_id`=NEW.assign_id,
  `feedback_date`=NEW.feedback_date,
  `note`=NEW.note,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gold_bhav`
--

CREATE TABLE `gold_bhav` (
  `gold_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `gold_sale_purchase` tinyint(1) DEFAULT NULL COMMENT '1 = Sale, 2 = Purchase',
  `gold_weight` double DEFAULT NULL,
  `gold_rate` double DEFAULT NULL,
  `gold_value` double DEFAULT NULL,
  `gold_cr_effect` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = C Amt, 2 = R Amt',
  `c_amt` double NOT NULL DEFAULT '0',
  `r_amt` double NOT NULL DEFAULT '0',
  `gold_narration` varchar(255) DEFAULT NULL,
  `through_lineitem` tinyint(1) DEFAULT NULL COMMENT '1 = Gold Bhav entry through Lineitem',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `gold_bhav`
--
DELIMITER $$
CREATE TRIGGER `gold_bhav_delete_after_trigger` AFTER DELETE ON `gold_bhav` FOR EACH ROW INSERT INTO 
  gurulog.`gold_bhav_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `gold_id`=OLD.gold_id,
  `sell_id`=OLD.sell_id,
  `gold_sale_purchase`=OLD.gold_sale_purchase,
  `gold_weight`=OLD.gold_weight,
  `gold_rate`=OLD.gold_rate,
  `gold_value`=OLD.gold_value,
  `gold_narration`=OLD.gold_narration,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `gold_bhav_insert_after_trigger` AFTER INSERT ON `gold_bhav` FOR EACH ROW INSERT INTO 
  gurulog.`gold_bhav_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `gold_id`=NEW.gold_id,
  `sell_id`=NEW.sell_id,
  `gold_sale_purchase`=NEW.gold_sale_purchase,
  `gold_weight`=NEW.gold_weight,
  `gold_rate`=NEW.gold_rate,
  `gold_value`=NEW.gold_value,
  `gold_narration`=NEW.gold_narration,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `gold_bhav_update_after_trigger` AFTER UPDATE ON `gold_bhav` FOR EACH ROW INSERT INTO 
  gurulog.`gold_bhav_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `gold_id`=NEW.gold_id,
  `sell_id`=NEW.sell_id,
  `gold_sale_purchase`=NEW.gold_sale_purchase,
  `gold_weight`=NEW.gold_weight,
  `gold_rate`=NEW.gold_rate,
  `gold_value`=NEW.gold_value,
  `gold_narration`=NEW.gold_narration,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hallmark_item_master`
--

CREATE TABLE `hallmark_item_master` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hallmark_item_master`
--

INSERT INTO `hallmark_item_master` (`item_id`, `item_name`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'RING', 1, '2020-07-03 11:59:29', 1, '2020-07-03 11:59:29');

--
-- Triggers `hallmark_item_master`
--
DELIMITER $$
CREATE TRIGGER `hallmark_item_master_delete_after_trigger` AFTER DELETE ON `hallmark_item_master` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_item_master_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `item_id`=OLD.item_id,
  `item_name`=OLD.item_name,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hallmark_item_master_insert_after_trigger` AFTER INSERT ON `hallmark_item_master` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_item_master_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `item_id`=NEW.item_id,
  `item_name`=NEW.item_name,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hallmark_item_master_update_after_trigger` AFTER UPDATE ON `hallmark_item_master` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_item_master_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `item_id`=NEW.item_id,
  `item_name`=NEW.item_name,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hallmark_receipt`
--

CREATE TABLE `hallmark_receipt` (
  `receipt_id` int(11) NOT NULL,
  `receipt_date` date DEFAULT NULL,
  `receipt_time` time DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_time` time DEFAULT NULL,
  `metal_id` int(11) DEFAULT NULL,
  `party_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `hallmark_receipt`
--
DELIMITER $$
CREATE TRIGGER `hallmark_receipt_delete_after_trigger` AFTER DELETE ON `hallmark_receipt` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_receipt_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `receipt_id`=OLD.receipt_id,
  `receipt_date`=OLD.receipt_date,
  `receipt_time`=OLD.receipt_time,
  `delivery_date`=OLD.delivery_date,
  `delivery_time`=OLD.delivery_time,
  `metal_id`=OLD.metal_id,
  `party_id`=OLD.party_id,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hallmark_receipt_insert_after_trigger` AFTER INSERT ON `hallmark_receipt` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_receipt_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `receipt_id`=NEW.receipt_id,
  `receipt_date`=NEW.receipt_date,
  `receipt_time`=NEW.receipt_time,
  `delivery_date`=NEW.delivery_date,
  `delivery_time`=NEW.delivery_time,
  `metal_id`=NEW.metal_id,
  `party_id`=NEW.party_id,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hallmark_receipt_update_after_trigger` AFTER UPDATE ON `hallmark_receipt` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_receipt_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `receipt_id`=NEW.receipt_id,
  `receipt_date`=NEW.receipt_date,
  `receipt_time`=NEW.receipt_time,
  `delivery_date`=NEW.delivery_date,
  `delivery_time`=NEW.delivery_time,
  `metal_id`=NEW.metal_id,
  `party_id`=NEW.party_id,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hallmark_receipt_details`
--

CREATE TABLE `hallmark_receipt_details` (
  `rd_id` int(11) NOT NULL,
  `receipt_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `receipt_weight` double DEFAULT NULL,
  `purity` double DEFAULT NULL,
  `box_no` double DEFAULT NULL,
  `pcs` double DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `hallmark_receipt_details`
--
DELIMITER $$
CREATE TRIGGER `hallmark_receipt_details_delete_after_trigger` AFTER DELETE ON `hallmark_receipt_details` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_receipt_details_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `rd_id`=OLD.rd_id,
  `receipt_id`=OLD.receipt_id,
  `article_id`=OLD.article_id,
  `receipt_weight`=OLD.receipt_weight,
  `purity`=OLD.purity,
  `box_no`=OLD.box_no,
  `pcs`=OLD.pcs,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hallmark_receipt_details_insert_after_trigger` AFTER INSERT ON `hallmark_receipt_details` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_receipt_details_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `rd_id`=NEW.rd_id,
  `receipt_id`=NEW.receipt_id,
  `article_id`=NEW.article_id,
  `receipt_weight`=NEW.receipt_weight,
  `purity`=NEW.purity,
  `box_no`=NEW.box_no,
  `pcs`=NEW.pcs,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hallmark_receipt_details_update_after_trigger` AFTER UPDATE ON `hallmark_receipt_details` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_receipt_details_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `rd_id`=NEW.rd_id,
  `receipt_id`=NEW.receipt_id,
  `article_id`=NEW.article_id,
  `receipt_weight`=NEW.receipt_weight,
  `purity`=NEW.purity,
  `box_no`=NEW.box_no,
  `pcs`=NEW.pcs,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hallmark_xrf`
--

CREATE TABLE `hallmark_xrf` (
  `xrf_id` int(11) NOT NULL,
  `posting_date` date DEFAULT NULL,
  `receipt_no` int(11) DEFAULT NULL,
  `receipt_date` date DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1=Active',
  `receipt_time` time DEFAULT NULL,
  `taken_by_same` tinyint(1) DEFAULT NULL COMMENT '1-Yes, 0-No',
  `taken_by_name` varchar(255) DEFAULT NULL,
  `gst_no` varchar(255) DEFAULT NULL,
  `box_no` double DEFAULT NULL,
  `min_price` double DEFAULT NULL,
  `price_per_pcs` double DEFAULT NULL,
  `total_item_amount` double DEFAULT NULL,
  `cgst_per` double DEFAULT NULL,
  `cgst_amount` double DEFAULT NULL,
  `sgst_per` double DEFAULT NULL,
  `sgst_amount` double DEFAULT NULL,
  `igst_per` double DEFAULT NULL,
  `igst_amount` double DEFAULT NULL,
  `other_charges` double DEFAULT NULL,
  `total_amount` double NOT NULL DEFAULT '0',
  `advance_rec_amount` double DEFAULT NULL,
  `pending_amount` double DEFAULT NULL,
  `remark` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `hallmark_xrf`
--
DELIMITER $$
CREATE TRIGGER `hallmark_xrf_delete_after_trigger` AFTER DELETE ON `hallmark_xrf` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_xrf_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `xrf_id`=OLD.xrf_id,
  `posting_date`=OLD.posting_date,
  `receipt_no`=OLD.receipt_no,
  `receipt_date`=OLD.receipt_date,
  `account_id`=OLD.account_id,
  `status`=OLD.status,
  `receipt_time`=OLD.receipt_time,
  `taken_by_same`=OLD.taken_by_same,
  `taken_by_name`=OLD.taken_by_name,
  `gst_no`=OLD.gst_no,
  `box_no`=OLD.box_no,
  `min_price`=OLD.min_price,
  `price_per_pcs`=OLD.price_per_pcs,
  `total_item_amount`=OLD.total_item_amount,
  `cgst_per`=OLD.cgst_per,
  `cgst_amount`=OLD.cgst_amount,
  `sgst_per`=OLD.sgst_per,
  `sgst_amount`=OLD.sgst_amount,
  `igst_per`=OLD.igst_per,
  `igst_amount`=OLD.igst_amount,
  `other_charges`=OLD.other_charges,
  `advance_rec_amount`=OLD.advance_rec_amount,
  `pending_amount`=OLD.pending_amount,
  `remark`=OLD.remark,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hallmark_xrf_insert_after_trigger` AFTER INSERT ON `hallmark_xrf` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_xrf_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `xrf_id`=NEW.xrf_id,
  `posting_date`=NEW.posting_date,
  `receipt_no`=NEW.receipt_no,
  `receipt_date`=NEW.receipt_date,
  `account_id`=NEW.account_id,
  `status`=NEW.status,
  `receipt_time`=NEW.receipt_time,
  `taken_by_same`=NEW.taken_by_same,
  `taken_by_name`=NEW.taken_by_name,
  `gst_no`=NEW.gst_no,
  `box_no`=NEW.box_no,
  `min_price`=NEW.min_price,
  `price_per_pcs`=NEW.price_per_pcs,
  `total_item_amount`=NEW.total_item_amount,
  `cgst_per`=NEW.cgst_per,
  `cgst_amount`=NEW.cgst_amount,
  `sgst_per`=NEW.sgst_per,
  `sgst_amount`=NEW.sgst_amount,
  `igst_per`=NEW.igst_per,
  `igst_amount`=NEW.igst_amount,
  `other_charges`=NEW.other_charges,
  `advance_rec_amount`=NEW.advance_rec_amount,
  `pending_amount`=NEW.pending_amount,
  `remark`=NEW.remark,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hallmark_xrf_update_after_trigger` AFTER UPDATE ON `hallmark_xrf` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_xrf_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `xrf_id`=NEW.xrf_id,
  `posting_date`=NEW.posting_date,
  `receipt_no`=NEW.receipt_no,
  `receipt_date`=NEW.receipt_date,
  `account_id`=NEW.account_id,
  `status`=NEW.status,
  `receipt_time`=NEW.receipt_time,
  `taken_by_same`=NEW.taken_by_same,
  `taken_by_name`=NEW.taken_by_name,
  `gst_no`=NEW.gst_no,
  `box_no`=NEW.box_no,
  `min_price`=NEW.min_price,
  `price_per_pcs`=NEW.price_per_pcs,
  `total_item_amount`=NEW.total_item_amount,
  `cgst_per`=NEW.cgst_per,
  `cgst_amount`=NEW.cgst_amount,
  `sgst_per`=NEW.sgst_per,
  `sgst_amount`=NEW.sgst_amount,
  `igst_per`=NEW.igst_per,
  `igst_amount`=NEW.igst_amount,
  `other_charges`=NEW.other_charges,
  `advance_rec_amount`=NEW.advance_rec_amount,
  `pending_amount`=NEW.pending_amount,
  `remark`=NEW.remark,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hallmark_xrf_items`
--

CREATE TABLE `hallmark_xrf_items` (
  `xrf_item_id` int(11) NOT NULL,
  `xrf_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `purity` int(11) DEFAULT NULL COMMENT 'purity',
  `rec_qty` double DEFAULT NULL,
  `price_per_pcs` double DEFAULT NULL,
  `item_amount` double DEFAULT NULL,
  `rec_weight` double DEFAULT NULL,
  `paid_weight` double DEFAULT NULL,
  `remark` text,
  `hm_ls_option` tinyint(1) NOT NULL DEFAULT '1',
  `deliver_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `hallmark_xrf_items`
--
DELIMITER $$
CREATE TRIGGER `hallmark_xrf_items_delete_after_trigger` AFTER DELETE ON `hallmark_xrf_items` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_xrf_items_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `xrf_item_id`=OLD.xrf_item_id,
  `xrf_id`=OLD.xrf_id,
  `item_id`=OLD.item_id,
  `purity`=OLD.purity,
  `rec_qty`=OLD.rec_qty,
  `price_per_pcs`=OLD.price_per_pcs,
  `item_amount`=OLD.item_amount,
  `weight`=OLD.rec_weight,
  `remark`=OLD.remark,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hallmark_xrf_items_insert_after_trigger` AFTER INSERT ON `hallmark_xrf_items` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_xrf_items_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `xrf_item_id`=NEW.xrf_item_id,
  `xrf_id`=NEW.xrf_id,
  `item_id`=NEW.item_id,
  `purity`=NEW.purity,
  `rec_qty`=NEW.rec_qty,
  `price_per_pcs`=NEW.price_per_pcs,
  `item_amount`=NEW.item_amount,
  `weight`=NEW.rec_weight,
  `remark`=NEW.remark,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hallmark_xrf_items_update_after_trigger` AFTER UPDATE ON `hallmark_xrf_items` FOR EACH ROW INSERT INTO 
  gurulog.`hallmark_xrf_items_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `xrf_item_id`=NEW.xrf_item_id,
  `xrf_id`=NEW.xrf_id,
  `item_id`=NEW.item_id,
  `purity`=NEW.purity,
  `rec_qty`=NEW.rec_qty,
  `price_per_pcs`=NEW.price_per_pcs,
  `item_amount`=NEW.item_amount,
  `weight`=NEW.rec_weight,
  `remark`=NEW.remark,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hr_apply_leave`
--

CREATE TABLE `hr_apply_leave` (
  `apply_leave_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `no_of_days` int(11) DEFAULT NULL,
  `reason` text,
  `status` tinyint(4) DEFAULT '0' COMMENT '0 = Pending, 1 = Approved, 2 = Disapproved',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `hr_apply_leave`
--
DELIMITER $$
CREATE TRIGGER `hr_apply_leave_delete_after_trigger` AFTER DELETE ON `hr_apply_leave` FOR EACH ROW INSERT INTO 
  gurulog.`hr_apply_leave_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `apply_leave_id`=OLD.apply_leave_id,
  `user_id`=OLD.user_id,
  `from_date`=OLD.from_date,
  `to_date`=OLD.to_date,
  `no_of_days`=OLD.no_of_days,
  `reason`=OLD.reason,
  `status`=OLD.status,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hr_apply_leave_insert_after_trigger` AFTER INSERT ON `hr_apply_leave` FOR EACH ROW INSERT INTO 
  gurulog.`hr_apply_leave_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `apply_leave_id`=NEW.apply_leave_id,
  `user_id`=NEW.user_id,
  `from_date`=NEW.from_date,
  `to_date`=NEW.to_date,
  `no_of_days`=NEW.no_of_days,
  `reason`=NEW.reason,
  `status`=NEW.status,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hr_apply_leave_update_after_trigger` AFTER UPDATE ON `hr_apply_leave` FOR EACH ROW INSERT INTO 
  gurulog.`hr_apply_leave_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `apply_leave_id`=NEW.apply_leave_id,
  `user_id`=NEW.user_id,
  `from_date`=NEW.from_date,
  `to_date`=NEW.to_date,
  `no_of_days`=NEW.no_of_days,
  `reason`=NEW.reason,
  `status`=NEW.status,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hr_attendance`
--

CREATE TABLE `hr_attendance` (
  `attendance_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  `attendance_time` time DEFAULT NULL,
  `is_in_out` tinyint(1) DEFAULT NULL COMMENT '1=IN, 2=OUT',
  `is_out_for_office` tinyint(1) DEFAULT NULL COMMENT '1=Yes, 2=No',
  `is_cron_entry` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `hr_attendance`
--
DELIMITER $$
CREATE TRIGGER `hr_attendance_delete_after_trigger` AFTER DELETE ON `hr_attendance` FOR EACH ROW INSERT INTO 
  gurulog.`hr_attendance_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `attendance_id`=OLD.attendance_id,
  `account_id`=OLD.account_id,
  `attendance_date`=OLD.attendance_date,
  `attendance_time`=OLD.attendance_time,
  `is_in_out`=OLD.is_in_out,
  `is_out_for_office`=OLD.is_out_for_office,
  `is_cron_entry`=OLD.is_cron_entry,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hr_attendance_insert_after_trigger` AFTER INSERT ON `hr_attendance` FOR EACH ROW INSERT INTO 
  gurulog.`hr_attendance_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `attendance_id`=NEW.attendance_id,
  `account_id`=NEW.account_id,
  `attendance_date`=NEW.attendance_date,
  `attendance_time`=NEW.attendance_time,
  `is_in_out`=NEW.is_in_out,
  `is_out_for_office`=NEW.is_out_for_office,
  `is_cron_entry`=NEW.is_cron_entry,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hr_attendance_update_after_trigger` AFTER UPDATE ON `hr_attendance` FOR EACH ROW INSERT INTO 
  gurulog.`hr_attendance_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `attendance_id`=NEW.attendance_id,
  `account_id`=NEW.account_id,
  `attendance_date`=NEW.attendance_date,
  `attendance_time`=NEW.attendance_time,
  `is_in_out`=NEW.is_in_out,
  `is_out_for_office`=NEW.is_out_for_office,
  `is_cron_entry`=NEW.is_cron_entry,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hr_present_hours`
--

CREATE TABLE `hr_present_hours` (
  `present_hour_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `present_date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `no_of_hours` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `hr_present_hours`
--
DELIMITER $$
CREATE TRIGGER `hr_present_hours_delete_after_trigger` AFTER DELETE ON `hr_present_hours` FOR EACH ROW INSERT INTO 
  gurulog.`hr_present_hours_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `present_hour_id`=OLD.present_hour_id,
  `user_id`=OLD.user_id,
  `department_id`=OLD.department_id,
  `present_date`=OLD.present_date,
  `in_time`=OLD.in_time,
  `out_time`=OLD.out_time,
  `no_of_hours`=OLD.no_of_hours,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hr_present_hours_insert_after_trigger` AFTER INSERT ON `hr_present_hours` FOR EACH ROW INSERT INTO 
  gurulog.`hr_present_hours_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `present_hour_id`=NEW.present_hour_id,
  `user_id`=NEW.user_id,
  `department_id`=NEW.department_id,
  `present_date`=NEW.present_date,
  `in_time`=NEW.in_time,
  `out_time`=NEW.out_time,
  `no_of_hours`=NEW.no_of_hours,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hr_present_hours_update_after_trigger` AFTER UPDATE ON `hr_present_hours` FOR EACH ROW INSERT INTO 
  gurulog.`hr_present_hours_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `present_hour_id`=NEW.present_hour_id,
  `user_id`=NEW.user_id,
  `department_id`=NEW.department_id,
  `present_date`=NEW.present_date,
  `in_time`=NEW.in_time,
  `out_time`=NEW.out_time,
  `no_of_hours`=NEW.no_of_hours,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hr_yearly_leave`
--

CREATE TABLE `hr_yearly_leave` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hr_yearly_leave`
--

INSERT INTO `hr_yearly_leave` (`id`, `event_name`, `leave_date`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'monthely', '2020-02-28', '2020-01-07 20:05:41', 1, NULL, NULL);

--
-- Triggers `hr_yearly_leave`
--
DELIMITER $$
CREATE TRIGGER `hr_yearly_leave_delete_after_trigger` AFTER DELETE ON `hr_yearly_leave` FOR EACH ROW INSERT INTO 
  gurulog.`hr_yearly_leave_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `leave_id`=OLD.id,
  `event_name`=OLD.event_name,
  `leave_date`=OLD.leave_date,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hr_yearly_leave_insert_after_trigger` AFTER INSERT ON `hr_yearly_leave` FOR EACH ROW INSERT INTO 
  gurulog.`hr_yearly_leave_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `leave_id`=NEW.id,
  `event_name`=NEW.event_name,
  `leave_date`=NEW.leave_date,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `hr_yearly_leave_update_after_trigger` AFTER UPDATE ON `hr_yearly_leave` FOR EACH ROW INSERT INTO 
  gurulog.`hr_yearly_leave_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `leave_id`=NEW.id,
  `event_name`=NEW.event_name,
  `leave_date`=NEW.leave_date,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_receive`
--

CREATE TABLE `issue_receive` (
  `ir_id` int(11) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `ir_date` date DEFAULT NULL,
  `reference_no` int(11) DEFAULT NULL,
  `lott_complete` tinyint(1) DEFAULT NULL COMMENT '0 = No, 1 = Yes',
  `hisab_done` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `ir_diffrence` double DEFAULT NULL,
  `worker_gold_rate` double DEFAULT NULL,
  `ir_remark` text,
  `total_issue_net_wt` double DEFAULT NULL,
  `total_receive_net_wt` double DEFAULT NULL,
  `total_issue_fine` double DEFAULT NULL,
  `total_receive_fine` double DEFAULT NULL,
  `journal_id` int(11) DEFAULT NULL COMMENT 'Lott Complete to diff. fine amount Worker <> MF Loss journal_id ',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `issue_receive`
--
DELIMITER $$
CREATE TRIGGER `issue_receive_delete_after_trigger` AFTER DELETE ON `issue_receive` FOR EACH ROW INSERT INTO 
  gurulog.`issue_receive_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `ir_id`=OLD.ir_id,
  `worker_id`=OLD.worker_id,
  `department_id`=OLD.department_id,
  `ir_date`=OLD.ir_date,
  `reference_no`=OLD.reference_no,
  `lott_complete`=OLD.lott_complete,
  `hisab_done`=OLD.hisab_done,
  `ir_remark`=OLD.ir_remark,
  `total_issue_net_wt`=OLD.total_issue_net_wt,
  `total_receive_net_wt`=OLD.total_receive_net_wt,
  `total_issue_fine`=OLD.total_issue_fine,
  `total_receive_fine`=OLD.total_receive_fine,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `issue_receive_insert_after_trigger` AFTER INSERT ON `issue_receive` FOR EACH ROW INSERT INTO 
  gurulog.`issue_receive_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `ir_id`=NEW.ir_id,
  `worker_id`=NEW.worker_id,
  `department_id`=NEW.department_id,
  `ir_date`=NEW.ir_date,
  `reference_no`=NEW.reference_no,
  `lott_complete`=NEW.lott_complete,
  `hisab_done`=NEW.hisab_done,
  `ir_remark`=NEW.ir_remark,
  `total_issue_net_wt`=NEW.total_issue_net_wt,
  `total_receive_net_wt`=NEW.total_receive_net_wt,
  `total_issue_fine`=NEW.total_issue_fine,
  `total_receive_fine`=NEW.total_receive_fine,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `issue_receive_update_after_trigger` AFTER UPDATE ON `issue_receive` FOR EACH ROW INSERT INTO 
  gurulog.`issue_receive_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `ir_id`=NEW.ir_id,
  `worker_id`=NEW.worker_id,
  `department_id`=NEW.department_id,
  `ir_date`=NEW.ir_date,
  `reference_no`=NEW.reference_no,
  `lott_complete`=NEW.lott_complete,
  `hisab_done`=NEW.hisab_done,
  `ir_remark`=NEW.ir_remark,
  `total_issue_net_wt`=NEW.total_issue_net_wt,
  `total_receive_net_wt`=NEW.total_receive_net_wt,
  `total_issue_fine`=NEW.total_issue_fine,
  `total_receive_fine`=NEW.total_receive_fine,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_receive_details`
--

CREATE TABLE `issue_receive_details` (
  `ird_id` int(11) NOT NULL,
  `ir_id` int(11) DEFAULT NULL,
  `type_id` tinyint(1) DEFAULT NULL COMMENT '1 = Issue 2 = Receive',
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `tunch` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `less` double DEFAULT NULL,
  `net_wt` double DEFAULT NULL,
  `actual_tunch` double DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `wastage` double DEFAULT NULL,
  `calculated_wastage` double DEFAULT NULL,
  `ird_date` date DEFAULT NULL,
  `tunch_textbox` tinyint(1) DEFAULT NULL,
  `ird_remark` text,
  `purchase_sell_item_id` int(11) DEFAULT NULL COMMENT 'Purchase to Sell : purchase_sell_item_id',
  `stock_type` tinyint(1) DEFAULT NULL COMMENT '1 = Purchase, 2 = Exchange, 3 = Stock Transfer, 4 = Receive',
  `huid` varchar(15) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `issue_receive_details`
--
DELIMITER $$
CREATE TRIGGER `issue_receive_details_delete_after_trigger` AFTER DELETE ON `issue_receive_details` FOR EACH ROW INSERT INTO 
  gurulog.`issue_receive_details_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `ird_id`=OLD.ird_id,
  `ir_id`=OLD.ir_id,
  `type_id`=OLD.type_id,
  `category_id`=OLD.category_id,
  `item_id`=OLD.item_id,
  `tunch`=OLD.tunch,
  `weight`=OLD.weight,
  `less`=OLD.less,
  `net_wt`=OLD.net_wt,
  `actual_tunch`=OLD.actual_tunch,
  `fine`=OLD.fine,
  `ird_date`=OLD.ird_date,
  `tunch_textbox`=OLD.tunch_textbox,
  `ird_remark`=OLD.ird_remark,
  `purchase_sell_item_id`=OLD.purchase_sell_item_id,
  `stock_type`=OLD.stock_type,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `issue_receive_details_insert_after_trigger` AFTER INSERT ON `issue_receive_details` FOR EACH ROW INSERT INTO 
  gurulog.`issue_receive_details_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `ird_id`=NEW.ird_id,
  `ir_id`=NEW.ir_id,
  `type_id`=NEW.type_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `tunch`=NEW.tunch,
  `weight`=NEW.weight,
  `less`=NEW.less,
  `net_wt`=NEW.net_wt,
  `actual_tunch`=NEW.actual_tunch,
  `fine`=NEW.fine,
  `ird_date`=NEW.ird_date,
  `tunch_textbox`=NEW.tunch_textbox,
  `ird_remark`=NEW.ird_remark,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `issue_receive_details_update_after_trigger` AFTER UPDATE ON `issue_receive_details` FOR EACH ROW INSERT INTO 
  gurulog.`issue_receive_details_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `ird_id`=NEW.ird_id,
  `ir_id`=NEW.ir_id,
  `type_id`=NEW.type_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `tunch`=NEW.tunch,
  `weight`=NEW.weight,
  `less`=NEW.less,
  `net_wt`=NEW.net_wt,
  `actual_tunch`=NEW.actual_tunch,
  `fine`=NEW.fine,
  `ird_date`=NEW.ird_date,
  `tunch_textbox`=NEW.tunch_textbox,
  `ird_remark`=NEW.ird_remark,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_receive_silver`
--

CREATE TABLE `issue_receive_silver` (
  `irs_id` int(11) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `irs_date` date DEFAULT NULL,
  `reference_no` int(11) DEFAULT NULL,
  `lott_complete` tinyint(1) DEFAULT NULL COMMENT '0 = No, 1 = Yes',
  `hisab_done` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `irs_remark` text,
  `total_issue_net_wt` double DEFAULT NULL,
  `total_receive_net_wt` double DEFAULT NULL,
  `total_issue_fine` double DEFAULT NULL,
  `total_receive_fine` double DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `issue_receive_silver`
--
DELIMITER $$
CREATE TRIGGER `issue_receive_silver_delete_after_trigger` AFTER DELETE ON `issue_receive_silver` FOR EACH ROW INSERT INTO 
  gurulog.`issue_receive_silver_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `irs_id`=OLD.irs_id,
  `worker_id`=OLD.worker_id,
  `department_id`=OLD.department_id,
  `irs_date`=OLD.irs_date,
  `reference_no`=OLD.reference_no,
  `lott_complete`=OLD.lott_complete,
  `hisab_done`=OLD.hisab_done,
  `irs_remark`=OLD.irs_remark,
  `total_issue_net_wt`=OLD.total_issue_net_wt,
  `total_receive_net_wt`=OLD.total_receive_net_wt,
  `total_issue_fine`=OLD.total_issue_fine,
  `total_receive_fine`=OLD.total_receive_fine,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `issue_receive_silver_insert_after_trigger` AFTER INSERT ON `issue_receive_silver` FOR EACH ROW INSERT INTO 
  gurulog.`issue_receive_silver_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `irs_id`=NEW.irs_id,
  `worker_id`=NEW.worker_id,
  `department_id`=NEW.department_id,
  `irs_date`=NEW.irs_date,
  `reference_no`=NEW.reference_no,
  `lott_complete`=NEW.lott_complete,
  `hisab_done`=NEW.hisab_done,
  `irs_remark`=NEW.irs_remark,
  `total_issue_net_wt`=NEW.total_issue_net_wt,
  `total_receive_net_wt`=NEW.total_receive_net_wt,
  `total_issue_fine`=NEW.total_issue_fine,
  `total_receive_fine`=NEW.total_receive_fine,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `issue_receive_silver_update_after_trigger` AFTER UPDATE ON `issue_receive_silver` FOR EACH ROW INSERT INTO 
  gurulog.`issue_receive_silver_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `irs_id`=NEW.irs_id,
  `worker_id`=NEW.worker_id,
  `department_id`=NEW.department_id,
  `irs_date`=NEW.irs_date,
  `reference_no`=NEW.reference_no,
  `lott_complete`=NEW.lott_complete,
  `hisab_done`=NEW.hisab_done,
  `irs_remark`=NEW.irs_remark,
  `total_issue_net_wt`=NEW.total_issue_net_wt,
  `total_receive_net_wt`=NEW.total_receive_net_wt,
  `total_issue_fine`=NEW.total_issue_fine,
  `total_receive_fine`=NEW.total_receive_fine,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_receive_silver_details`
--

CREATE TABLE `issue_receive_silver_details` (
  `irsd_id` int(11) NOT NULL,
  `irs_id` int(11) DEFAULT NULL,
  `type_id` tinyint(1) DEFAULT NULL COMMENT '1 = Issue 2 = Receive',
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `tunch` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `less` double DEFAULT NULL,
  `net_wt` double DEFAULT NULL,
  `actual_tunch` double DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `irsd_date` date DEFAULT NULL,
  `tunch_textbox` tinyint(1) DEFAULT NULL,
  `irsd_remark` text,
  `purchase_sell_item_id` int(11) DEFAULT NULL COMMENT 'Purchase to Sell : purchase_sell_item_id',
  `stock_type` tinyint(1) DEFAULT NULL COMMENT '1 = Purchase, 2 = Exchange, 3 = Stock Transfer, 4 = Receive',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `issue_receive_silver_details`
--
DELIMITER $$
CREATE TRIGGER `issue_receive_silver_details_delete_after_trigger` AFTER DELETE ON `issue_receive_silver_details` FOR EACH ROW INSERT INTO 
  gurulog.`issue_receive_silver_details_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `irsd_id`=OLD.irsd_id,
  `irs_id`=OLD.irs_id,
  `type_id`=OLD.type_id,
  `category_id`=OLD.category_id,
  `item_id`=OLD.item_id,
  `tunch`=OLD.tunch,
  `weight`=OLD.weight,
  `less`=OLD.less,
  `net_wt`=OLD.net_wt,
  `actual_tunch`=OLD.actual_tunch,
  `fine`=OLD.fine,
  `irsd_date`=OLD.irsd_date,
  `tunch_textbox`=OLD.tunch_textbox,
  `irsd_remark`=OLD.irsd_remark,
  `purchase_sell_item_id`=OLD.purchase_sell_item_id,
  `stock_type`=OLD.stock_type,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `issue_receive_silver_details_insert_after_trigger` AFTER INSERT ON `issue_receive_silver_details` FOR EACH ROW INSERT INTO 
  gurulog.`issue_receive_silver_details_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `irsd_id`=NEW.irsd_id,
  `irs_id`=NEW.irs_id,
  `type_id`=NEW.type_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `tunch`=NEW.tunch,
  `weight`=NEW.weight,
  `less`=NEW.less,
  `net_wt`=NEW.net_wt,
  `actual_tunch`=NEW.actual_tunch,
  `fine`=NEW.fine,
  `irsd_date`=NEW.irsd_date,
  `tunch_textbox`=NEW.tunch_textbox,
  `irsd_remark`=NEW.irsd_remark,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `issue_receive_silver_details_update_after_trigger` AFTER UPDATE ON `issue_receive_silver_details` FOR EACH ROW INSERT INTO 
  gurulog.`issue_receive_silver_details_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `irsd_id`=NEW.irsd_id,
  `irs_id`=NEW.irs_id,
  `type_id`=NEW.type_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `tunch`=NEW.tunch,
  `weight`=NEW.weight,
  `less`=NEW.less,
  `net_wt`=NEW.net_wt,
  `actual_tunch`=NEW.actual_tunch,
  `fine`=NEW.fine,
  `irsd_date`=NEW.irsd_date,
  `tunch_textbox`=NEW.tunch_textbox,
  `irsd_remark`=NEW.irsd_remark,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `item_bom`
--

CREATE TABLE `item_bom` (
  `item_bom_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `weight_for_bom` double DEFAULT NULL,
  `design_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_master`
--

CREATE TABLE `item_master` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `short_item` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `die_no` varchar(255) DEFAULT NULL,
  `design_no` varchar(255) DEFAULT NULL,
  `min_order_qty` double DEFAULT NULL,
  `default_wastage` double DEFAULT NULL,
  `st_default_wastage` double DEFAULT NULL,
  `less` tinyint(1) DEFAULT NULL COMMENT '0 = No, 1 = Yes',
  `display_item_in` varchar(255) DEFAULT NULL,
  `stock_method` tinyint(1) DEFAULT NULL COMMENT '1 = Default, 2 = Item Wise, 3 = Combine',
  `metal_payment_receipt` tinyint(1) DEFAULT '0' COMMENT '1 = Yes, 0 = No',
  `sequence_no` varchar(255) DEFAULT NULL,
  `rate_on` double NOT NULL DEFAULT '1',
  `rate_of` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Labour, 2 = Item',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_master`
--

INSERT INTO `item_master` (`item_id`, `item_name`, `short_item`, `category_id`, `image`, `die_no`, `design_no`, `min_order_qty`, `default_wastage`, `st_default_wastage`, `less`, `display_item_in`, `stock_method`, `metal_payment_receipt`, `sequence_no`, `rate_on`, `rate_of`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(48, 'CASTING', '', 17, './assets/image/2018_11_22_17_25_28_1542887728.png', '', '', 0, 5, 0, 1, 'Purchase,Sell', 1, 0, '', 1, 1, 1, '2018-11-21 18:14:35', 1, '2021-11-10 17:18:59');

--
-- Triggers `item_master`
--
DELIMITER $$
CREATE TRIGGER `item_master_delete_after_trigger` AFTER DELETE ON `item_master` FOR EACH ROW INSERT INTO 
  gurulog.`item_master_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `item_id`=OLD.item_id,
  `item_name`=OLD.item_name,
  `short_item`=OLD.short_item,
  `category_id`=OLD.category_id,
  `image`=OLD.image,
  `die_no`=OLD.die_no,
  `design_no`=OLD.design_no,
  `min_order_qty`=OLD.min_order_qty,
  `default_wastage`=OLD.default_wastage,
  `st_default_wastage`=OLD.st_default_wastage,
  `less`=OLD.less,
  `display_item_in`=OLD.display_item_in,
  `stock_method`=OLD.stock_method,
  `metal_payment_receipt`=OLD.metal_payment_receipt,
  `sequence_no`=OLD.sequence_no,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `item_master_insert_after_trigger` AFTER INSERT ON `item_master` FOR EACH ROW INSERT INTO 
  gurulog.`item_master_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `item_id`=NEW.item_id,
  `item_name`=NEW.item_name,
  `short_item`=NEW.short_item,
  `category_id`=NEW.category_id,
  `image`=NEW.image,
  `die_no`=NEW.die_no,
  `design_no`=NEW.design_no,
  `min_order_qty`=NEW.min_order_qty,
  `default_wastage`=NEW.default_wastage,
  `st_default_wastage`=NEW.st_default_wastage,
  `less`=NEW.less,
  `display_item_in`=NEW.display_item_in,
  `stock_method`=NEW.stock_method,
  `metal_payment_receipt`=NEW.metal_payment_receipt,
  `sequence_no`=NEW.sequence_no,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `item_master_update_after_trigger` AFTER UPDATE ON `item_master` FOR EACH ROW INSERT INTO 
  gurulog.`item_master_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `item_id`=NEW.item_id,
  `item_name`=NEW.item_name,
  `short_item`=NEW.short_item,
  `category_id`=NEW.category_id,
  `image`=NEW.image,
  `die_no`=NEW.die_no,
  `design_no`=NEW.design_no,
  `min_order_qty`=NEW.min_order_qty,
  `default_wastage`=NEW.default_wastage,
  `st_default_wastage`=NEW.st_default_wastage,
  `less`=NEW.less,
  `display_item_in`=NEW.display_item_in,
  `stock_method`=NEW.stock_method,
  `metal_payment_receipt`=NEW.metal_payment_receipt,
  `sequence_no`=NEW.sequence_no,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `item_stock`
--

CREATE TABLE `item_stock` (
  `item_stock_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `ntwt` double DEFAULT NULL,
  `grwt` double DEFAULT NULL,
  `less` double DEFAULT NULL,
  `tunch` double DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `purchase_sell_item_id` int(11) DEFAULT NULL,
  `stock_type` tinyint(1) DEFAULT NULL COMMENT '1 = Purchase, 2 = Exchange, 3 = Stock Transfer, 4 = Receive , 5 = MHM Receive Finish, 6 = MHM Receive Scrap, 7 = MC Receive Finish, 8 = MC Receive Scrap, 9 = Casting Entry Receive Finish, 10 = Casting Entry Receive Scrap, 11 = Opening Stock',
  `huid` varchar(15) DEFAULT NULL,
  `rfid_created_grwt` double NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `item_stock`
--
DELIMITER $$
CREATE TRIGGER `item_stock_delete_after_trigger` AFTER DELETE ON `item_stock` FOR EACH ROW INSERT INTO 
  gurulog.`item_stock_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `item_stock_id`=OLD.item_stock_id,
  `department_id`=OLD.department_id,
  `category_id`=OLD.category_id,
  `item_id`=OLD.item_id,
  `ntwt`=OLD.ntwt,
  `grwt`=OLD.grwt,
  `less`=OLD.less,
  `tunch`=OLD.tunch,
  `fine`=OLD.fine,
  `purchase_sell_item_id`=OLD.purchase_sell_item_id,
  `stock_type`=OLD.stock_type,
  `rfid_created_grwt`=OLD.rfid_created_grwt,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `item_stock_insert_after_trigger` AFTER INSERT ON `item_stock` FOR EACH ROW INSERT INTO 
  gurulog.`item_stock_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `item_stock_id`=NEW.item_stock_id,
  `department_id`=NEW.department_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `ntwt`=NEW.ntwt,
  `grwt`=NEW.grwt,
  `less`=NEW.less,
  `tunch`=NEW.tunch,
  `fine`=NEW.fine,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `rfid_created_grwt`=NEW.rfid_created_grwt,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `item_stock_update_after_trigger` AFTER UPDATE ON `item_stock` FOR EACH ROW INSERT INTO 
  gurulog.`item_stock_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `item_stock_id`=NEW.item_stock_id,
  `department_id`=NEW.department_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `ntwt`=NEW.ntwt,
  `grwt`=NEW.grwt,
  `less`=NEW.less,
  `tunch`=NEW.tunch,
  `fine`=NEW.fine,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `rfid_created_grwt`=NEW.rfid_created_grwt,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `item_stock_rfid`
--

CREATE TABLE `item_stock_rfid` (
  `item_stock_rfid_id` int(11) NOT NULL,
  `item_stock_id` int(11) DEFAULT NULL,
  `rfid_grwt` double NOT NULL DEFAULT '0',
  `rfid_less` double NOT NULL DEFAULT '0',
  `rfid_add` double DEFAULT '0',
  `rfid_ntwt` double NOT NULL DEFAULT '0',
  `rfid_tunch` double NOT NULL DEFAULT '0',
  `rfid_fine` double NOT NULL DEFAULT '0',
  `real_rfid` varchar(255) DEFAULT NULL,
  `rfid_size` varchar(255) DEFAULT NULL,
  `rfid_charges` double DEFAULT '0',
  `rfid_ad_id` int(11) DEFAULT NULL,
  `rfid_used` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not Used, 1 = Used',
  `from_relation_id` int(11) DEFAULT NULL,
  `from_module` int(11) DEFAULT NULL COMMENT '1 = RFID Create, 2 = Sell, 3 = Stock Transfer',
  `to_relation_id` int(11) DEFAULT NULL,
  `to_module` int(11) DEFAULT NULL COMMENT '1 = RFID Create, 2 = Sell, 3 = Stock Transfer',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `item_stock_rfid`
--
DELIMITER $$
CREATE TRIGGER `item_stock_rfid_delete_after_trigger` AFTER DELETE ON `item_stock_rfid` FOR EACH ROW INSERT INTO 
  gurulog.`item_stock_rfid_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `item_stock_rfid_id`=OLD.item_stock_rfid_id,
  `item_stock_id`=OLD.item_stock_id,
  `rfid_grwt`=OLD.rfid_grwt,
  `rfid_less`=OLD.rfid_less,
  `rfid_add`=OLD.rfid_add,
  `rfid_ntwt`=OLD.rfid_ntwt,
  `rfid_tunch`=OLD.rfid_tunch,
  `rfid_fine`=OLD.rfid_fine,
  `real_rfid`=OLD.real_rfid,
  `rfid_size`=OLD.rfid_size,
  `rfid_charges`=OLD.rfid_charges,
  `rfid_ad_id`=OLD.rfid_ad_id,
  `rfid_used`=OLD.rfid_used,
  `from_relation_id`=OLD.from_relation_id,
  `from_module`=OLD.from_module,
  `to_relation_id`=OLD.to_relation_id,
  `to_module`=OLD.to_module,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `item_stock_rfid_insert_after_trigger` AFTER INSERT ON `item_stock_rfid` FOR EACH ROW INSERT INTO 
  gurulog.`item_stock_rfid_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `item_stock_rfid_id`=NEW.item_stock_rfid_id,
  `item_stock_id`=NEW.item_stock_id,
  `rfid_grwt`=NEW.rfid_grwt,
  `rfid_less`=NEW.rfid_less,
  `rfid_add`=NEW.rfid_add,
  `rfid_ntwt`=NEW.rfid_ntwt,
  `rfid_tunch`=NEW.rfid_tunch,
  `rfid_fine`=NEW.rfid_fine,
  `real_rfid`=NEW.real_rfid,
  `rfid_size`=NEW.rfid_size,
  `rfid_charges`=NEW.rfid_charges,
  `rfid_ad_id`=NEW.rfid_ad_id,
  `rfid_used`=NEW.rfid_used,
  `from_relation_id`=NEW.from_relation_id,
  `from_module`=NEW.from_module,
  `to_relation_id`=NEW.to_relation_id,
  `to_module`=NEW.to_module,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `item_stock_rfid_update_after_trigger` AFTER UPDATE ON `item_stock_rfid` FOR EACH ROW INSERT INTO 
  gurulog.`item_stock_rfid_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `item_stock_rfid_id`=NEW.item_stock_rfid_id,
  `item_stock_id`=NEW.item_stock_id,
  `rfid_grwt`=NEW.rfid_grwt,
  `rfid_less`=NEW.rfid_less,
  `rfid_add`=NEW.rfid_add,
  `rfid_ntwt`=NEW.rfid_ntwt,
  `rfid_tunch`=NEW.rfid_tunch,
  `rfid_fine`=NEW.rfid_fine,
  `real_rfid`=NEW.real_rfid,
  `rfid_size`=NEW.rfid_size,
  `rfid_charges`=NEW.rfid_charges,
  `rfid_ad_id`=NEW.rfid_ad_id,
  `rfid_used`=NEW.rfid_used,
  `from_relation_id`=NEW.from_relation_id,
  `from_module`=NEW.from_module,
  `to_relation_id`=NEW.to_relation_id,
  `to_module`=NEW.to_module,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `journal_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `journal_date` date DEFAULT NULL,
  `interest_account_id` int(11) DEFAULT NULL COMMENT 'Monthly Interest of this Account',
  `gold_rate` double DEFAULT NULL,
  `silver_rate` double DEFAULT NULL,
  `interest_rate` double DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `is_module` int(10) DEFAULT NULL COMMENT '1 = Manufacture Hand Made, 2=Employee Salary, 3 = Issue/Receive',
  `audit_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Pending = 1, Audited = 2, Suspected = 3',
  `ibs_tran_particular` text,
  `ibs_inst_num` varchar(255) DEFAULT NULL,
  `ibs_deposit_branch` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `journal`
--
DELIMITER $$
CREATE TRIGGER `journal_delete_after_trigger` AFTER DELETE ON `journal` FOR EACH ROW INSERT INTO 
  gurulog.`journal_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `journal_id`=OLD.journal_id,
  `department_id`=OLD.department_id,
  `journal_date`=OLD.journal_date,
  `interest_account_id`=OLD.interest_account_id,
  `gold_rate`=OLD.gold_rate,
  `silver_rate`=OLD.silver_rate,
  `interest_rate`=OLD.interest_rate,
  `relation_id`=OLD.relation_id,
  `is_module`=OLD.is_module,
  `audit_status`=OLD.audit_status,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `journal_insert_after_trigger` AFTER INSERT ON `journal` FOR EACH ROW INSERT INTO 
  gurulog.`journal_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `journal_id`=NEW.journal_id,
  `department_id`=NEW.department_id,
  `journal_date`=NEW.journal_date,
  `interest_account_id`=NEW.interest_account_id,
  `gold_rate`=NEW.gold_rate,
  `silver_rate`=NEW.silver_rate,
  `interest_rate`=NEW.interest_rate,
  `relation_id`=NEW.relation_id,
  `is_module`=NEW.is_module,
  `audit_status`=NEW.audit_status,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `journal_update_after_trigger` AFTER UPDATE ON `journal` FOR EACH ROW INSERT INTO 
  gurulog.`journal_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `journal_id`=NEW.journal_id,
  `department_id`=NEW.department_id,
  `journal_date`=NEW.journal_date,
  `interest_account_id`=NEW.interest_account_id,
  `gold_rate`=NEW.gold_rate,
  `silver_rate`=NEW.silver_rate,
  `interest_rate`=NEW.interest_rate,
  `relation_id`=NEW.relation_id,
  `is_module`=NEW.is_module,
  `audit_status`=NEW.audit_status,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `journal_details`
--

CREATE TABLE `journal_details` (
  `jd_id` int(11) NOT NULL,
  `journal_id` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1=naam, 2=jama',
  `account_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `c_amt` double NOT NULL DEFAULT '0',
  `r_amt` double NOT NULL DEFAULT '0',
  `narration` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `journal_details`
--
DELIMITER $$
CREATE TRIGGER `journal_details_delete_after_trigger` AFTER DELETE ON `journal_details` FOR EACH ROW INSERT INTO 
  gurulog.`journal_details_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `jd_id`=OLD.jd_id,
  `journal_id`=OLD.journal_id,
  `type`=OLD.type,
  `account_id`=OLD.account_id,
  `amount`=OLD.amount,
  `narration`=OLD.narration,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `journal_details_insert_after_trigger` AFTER INSERT ON `journal_details` FOR EACH ROW INSERT INTO 
  gurulog.`journal_details_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `jd_id`=NEW.jd_id,
  `journal_id`=NEW.journal_id,
  `type`=NEW.type,
  `account_id`=NEW.account_id,
  `amount`=NEW.amount,
  `narration`=NEW.narration,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `journal_details_update_after_trigger` AFTER UPDATE ON `journal_details` FOR EACH ROW INSERT INTO 
  gurulog.`journal_details_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `jd_id`=NEW.jd_id,
  `journal_id`=NEW.journal_id,
  `type`=NEW.type,
  `account_id`=NEW.account_id,
  `amount`=NEW.amount,
  `narration`=NEW.narration,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kaleyra_webhook_demo`
--

CREATE TABLE `kaleyra_webhook_demo` (
  `id` int(11) NOT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `message_body` text,
  `message_from` varchar(15) DEFAULT NULL,
  `message_name` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `message_status` varchar(50) DEFAULT NULL,
  `message_created_at` varchar(255) DEFAULT NULL,
  `message_wanumber` varchar(15) DEFAULT NULL,
  `webhook_content` text CHARACTER SET utf8,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `machine_chain`
--

CREATE TABLE `machine_chain` (
  `machine_chain_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `operation_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `machine_chain_date` date DEFAULT NULL,
  `reference_no` int(11) DEFAULT NULL,
  `lott_complete` tinyint(1) DEFAULT NULL COMMENT '0 = No, 1 = Yes',
  `curb_box` tinyint(4) DEFAULT NULL COMMENT '1=Curb, 2=Box',
  `hisab_done` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `machine_chain_remark` text,
  `total_receive_fw_weight` double DEFAULT NULL,
  `total_issue_weight` double DEFAULT NULL,
  `total_receive_weight` double DEFAULT NULL,
  `total_issue_net_wt` double DEFAULT NULL,
  `total_receive_net_wt` double DEFAULT NULL,
  `total_issue_fine` double DEFAULT NULL,
  `total_receive_fine` double DEFAULT NULL,
  `is_calculated` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `is_forwarded` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `forwarded_from_mc_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `machine_chain`
--
DELIMITER $$
CREATE TRIGGER `machine_chain_delete_after_trigger` AFTER DELETE ON `machine_chain` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `machine_chain_id`=OLD.machine_chain_id,
  `department_id`=OLD.department_id,
  `operation_id`=OLD.operation_id,
  `worker_id`=OLD.worker_id,
  `machine_chain_date`=OLD.machine_chain_date,
  `reference_no`=OLD.reference_no,
  `lott_complete`=OLD.lott_complete,
  `curb_box`=OLD.curb_box,
  `hisab_done`=OLD.hisab_done,
  `machine_chain_remark`=OLD.machine_chain_remark,
  `total_receive_fw_weight`=OLD.total_receive_fw_weight,
  `total_issue_weight`=OLD.total_issue_weight,
  `total_receive_weight`=OLD.total_receive_weight,
  `total_issue_net_wt`=OLD.total_issue_net_wt,
  `total_receive_net_wt`=OLD.total_receive_net_wt,
  `total_issue_fine`=OLD.total_issue_fine,
  `total_receive_fine`=OLD.total_receive_fine,
  `is_calculated`=OLD.is_calculated,
  `is_forwarded`=OLD.is_forwarded,
  `forwarded_from_mc_id`=OLD.forwarded_from_mc_id,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_insert_after_trigger` AFTER INSERT ON `machine_chain` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `machine_chain_id`=NEW.machine_chain_id,
  `department_id`=NEW.department_id,
  `operation_id`=NEW.operation_id,
  `worker_id`=NEW.worker_id,
  `machine_chain_date`=NEW.machine_chain_date,
  `reference_no`=NEW.reference_no,
  `lott_complete`=NEW.lott_complete,
  `curb_box`=NEW.curb_box,
  `hisab_done`=NEW.hisab_done,
  `machine_chain_remark`=NEW.machine_chain_remark,
  `total_receive_fw_weight`=NEW.total_receive_fw_weight,
  `total_issue_weight`=NEW.total_issue_weight,
  `total_receive_weight`=NEW.total_receive_weight,
  `total_issue_net_wt`=NEW.total_issue_net_wt,
  `total_receive_net_wt`=NEW.total_receive_net_wt,
  `total_issue_fine`=NEW.total_issue_fine,
  `total_receive_fine`=NEW.total_receive_fine,
  `is_calculated`=NEW.is_calculated,
  `is_forwarded`=NEW.is_forwarded,
  `forwarded_from_mc_id`=NEW.forwarded_from_mc_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_update_after_trigger` AFTER UPDATE ON `machine_chain` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `machine_chain_id`=NEW.machine_chain_id,
  `department_id`=NEW.department_id,
  `operation_id`=NEW.operation_id,
  `worker_id`=NEW.worker_id,
  `machine_chain_date`=NEW.machine_chain_date,
  `reference_no`=NEW.reference_no,
  `lott_complete`=NEW.lott_complete,
  `curb_box`=NEW.curb_box,
  `hisab_done`=NEW.hisab_done,
  `machine_chain_remark`=NEW.machine_chain_remark,
  `total_receive_fw_weight`=NEW.total_receive_fw_weight,
  `total_issue_weight`=NEW.total_issue_weight,
  `total_receive_weight`=NEW.total_receive_weight,
  `total_issue_net_wt`=NEW.total_issue_net_wt,
  `total_receive_net_wt`=NEW.total_receive_net_wt,
  `total_issue_fine`=NEW.total_issue_fine,
  `total_receive_fine`=NEW.total_receive_fine,
  `is_calculated`=NEW.is_calculated,
  `is_forwarded`=NEW.is_forwarded,
  `forwarded_from_mc_id`=NEW.forwarded_from_mc_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `machine_chain_details`
--

CREATE TABLE `machine_chain_details` (
  `machine_chain_detail_id` int(11) NOT NULL,
  `machine_chain_id` int(11) DEFAULT NULL,
  `type_id` tinyint(1) DEFAULT NULL COMMENT '1 = Issue Finish Work, 2 = Issue Scrap, 3 = Receive Finish Work, 4 = Receive Scrap',
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `tunch` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `less` double DEFAULT NULL,
  `net_wt` double DEFAULT NULL,
  `actual_tunch` double DEFAULT NULL,
  `real_actual_tunch` double DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `pcs` double DEFAULT NULL,
  `machine_chain_detail_date` date DEFAULT NULL,
  `tunch_textbox` tinyint(1) DEFAULT NULL,
  `machine_chain_detail_remark` text,
  `purchase_sell_item_id` int(11) DEFAULT NULL COMMENT 'Purchase to Sell : purchase_sell_item_id',
  `stock_type` tinyint(1) DEFAULT NULL COMMENT '1 = Purchase, 2 = Exchange, 3 = Stock Transfer, 4 = Receive, 5 = Receive Finish, 6 = Receive Scrap, 7 = MC Receive Finish, 8 = MC Receive Scrap',
  `is_forwarded` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `forwarded_from_mcd_id` int(11) DEFAULT NULL,
  `added_from_ifw_mcd_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `machine_chain_details`
--
DELIMITER $$
CREATE TRIGGER `machine_chain_details_delete_after_trigger` AFTER DELETE ON `machine_chain_details` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_details_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `machine_chain_detail_id`=OLD.machine_chain_detail_id,
  `machine_chain_id`=OLD.machine_chain_id,
  `type_id`=OLD.type_id,
  `category_id`=OLD.category_id,
  `item_id`=OLD.item_id,
  `tunch`=OLD.tunch,
  `weight`=OLD.weight,
  `less`=OLD.less,
  `net_wt`=OLD.net_wt,
  `actual_tunch`=OLD.actual_tunch,
  `real_actual_tunch`=OLD.real_actual_tunch,
  `fine`=OLD.fine,
  `pcs`=OLD.pcs,
  `machine_chain_detail_date`=OLD.machine_chain_detail_date,
  `tunch_textbox`=OLD.tunch_textbox,
  `machine_chain_detail_remark`=OLD.machine_chain_detail_remark,
  `purchase_sell_item_id`=OLD.purchase_sell_item_id,
  `stock_type`=OLD.stock_type,
  `is_forwarded`=OLD.is_forwarded,
  `forwarded_from_mcd_id`=OLD.forwarded_from_mcd_id,
  `added_from_ifw_mcd_id`=OLD.added_from_ifw_mcd_id,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_details_insert_after_trigger` AFTER INSERT ON `machine_chain_details` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_details_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `machine_chain_detail_id`=NEW.machine_chain_detail_id,
  `machine_chain_id`=NEW.machine_chain_id,
  `type_id`=NEW.type_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `tunch`=NEW.tunch,
  `weight`=NEW.weight,
  `less`=NEW.less,
  `net_wt`=NEW.net_wt,
  `actual_tunch`=NEW.actual_tunch,
  `real_actual_tunch`=NEW.real_actual_tunch,
  `fine`=NEW.fine,
  `pcs`=NEW.pcs,
  `machine_chain_detail_date`=NEW.machine_chain_detail_date,
  `tunch_textbox`=NEW.tunch_textbox,
  `machine_chain_detail_remark`=NEW.machine_chain_detail_remark,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `is_forwarded`=NEW.is_forwarded,
  `forwarded_from_mcd_id`=NEW.forwarded_from_mcd_id,
  `added_from_ifw_mcd_id`=NEW.added_from_ifw_mcd_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_details_update_after_trigger` AFTER UPDATE ON `machine_chain_details` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_details_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `machine_chain_detail_id`=NEW.machine_chain_detail_id,
  `machine_chain_id`=NEW.machine_chain_id,
  `type_id`=NEW.type_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `tunch`=NEW.tunch,
  `weight`=NEW.weight,
  `less`=NEW.less,
  `net_wt`=NEW.net_wt,
  `actual_tunch`=NEW.actual_tunch,
  `real_actual_tunch`=NEW.real_actual_tunch,
  `fine`=NEW.fine,
  `pcs`=NEW.pcs,
  `machine_chain_detail_date`=NEW.machine_chain_detail_date,
  `tunch_textbox`=NEW.tunch_textbox,
  `machine_chain_detail_remark`=NEW.machine_chain_detail_remark,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `is_forwarded`=NEW.is_forwarded,
  `forwarded_from_mcd_id`=NEW.forwarded_from_mcd_id,
  `added_from_ifw_mcd_id`=NEW.added_from_ifw_mcd_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `machine_chain_detail_order_items`
--

CREATE TABLE `machine_chain_detail_order_items` (
  `machine_chain_detail_oi_id` int(11) NOT NULL,
  `machine_chain_id` int(11) DEFAULT NULL,
  `machine_chain_detail_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_lot_item_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `machine_chain_detail_order_items`
--
DELIMITER $$
CREATE TRIGGER `machine_chain_detail_order_items_delete_after_trigger` AFTER DELETE ON `machine_chain_detail_order_items` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_detail_order_items_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `machine_chain_detail_oi_id`=OLD.machine_chain_detail_oi_id,
  `machine_chain_id`=OLD.machine_chain_id,
  `machine_chain_detail_id`=OLD.machine_chain_detail_id,
  `order_id`=OLD.order_id,
  `order_lot_item_id`=OLD.order_lot_item_id,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_detail_order_items_insert_after_trigger` AFTER INSERT ON `machine_chain_detail_order_items` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_detail_order_items_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `machine_chain_detail_oi_id`=NEW.machine_chain_detail_oi_id,
  `machine_chain_id`=NEW.machine_chain_id,
  `machine_chain_detail_id`=NEW.machine_chain_detail_id,
  `order_id`=NEW.order_id,
  `order_lot_item_id`=NEW.order_lot_item_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_detail_order_items_update_after_trigger` AFTER UPDATE ON `machine_chain_detail_order_items` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_detail_order_items_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `machine_chain_detail_oi_id`=NEW.machine_chain_detail_oi_id,
  `machine_chain_id`=NEW.machine_chain_id,
  `machine_chain_detail_id`=NEW.machine_chain_detail_id,
  `order_id`=NEW.order_id,
  `order_lot_item_id`=NEW.order_lot_item_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `machine_chain_operation`
--

CREATE TABLE `machine_chain_operation` (
  `operation_id` int(11) NOT NULL,
  `operation_name` varchar(255) DEFAULT NULL,
  `sequence_no` int(11) DEFAULT NULL,
  `allow_only_1_order_item` tinyint(1) DEFAULT '0' COMMENT '1-Yes, 0-No',
  `direct_issue_allow` tinyint(1) DEFAULT '0' COMMENT '1-Yes, 0-No',
  `calculate_button` tinyint(1) DEFAULT '0' COMMENT '1-Yes, 0-No',
  `use_selected_tunch` tinyint(1) DEFAULT '0' COMMENT '1-Yes, 0-No',
  `issue_change_actual_tunch_allow` tinyint(1) DEFAULT '0' COMMENT '1-Yes, 0-No',
  `receive_change_actual_tunch_allow` tinyint(1) DEFAULT '0' COMMENT '1-Yes, 0-No',
  `remark` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `machine_chain_operation`
--

INSERT INTO `machine_chain_operation` (`operation_id`, `operation_name`, `sequence_no`, `allow_only_1_order_item`, `direct_issue_allow`, `calculate_button`, `use_selected_tunch`, `issue_change_actual_tunch_allow`, `receive_change_actual_tunch_allow`, `remark`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(10, 'MELTING', 1, 0, 1, 0, 0, 1, 0, '', '2020-01-29 17:26:23', 1, '2020-01-29 17:26:23', 1),
(11, 'WIRE DRAW', 2, 0, 0, 0, 1, 0, 0, '', '2020-01-29 17:27:19', 1, '2020-01-29 17:27:19', 1);

--
-- Triggers `machine_chain_operation`
--
DELIMITER $$
CREATE TRIGGER `machine_chain_operation_delete_after_trigger` AFTER DELETE ON `machine_chain_operation` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_operation_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `operation_id`=OLD.operation_id,
  `operation_name`=OLD.operation_name,
  `sequence_no`=OLD.sequence_no,
  `allow_only_1_order_item`=OLD.allow_only_1_order_item,
  `direct_issue_allow`=OLD.direct_issue_allow,
  `calculate_button`=OLD.calculate_button,
  `use_selected_tunch`=OLD.use_selected_tunch,
  `issue_change_actual_tunch_allow`=OLD.issue_change_actual_tunch_allow,
  `receive_change_actual_tunch_allow`=OLD.receive_change_actual_tunch_allow,
  `remark`=OLD.remark,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_operation_insert_after_trigger` AFTER INSERT ON `machine_chain_operation` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_operation_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `operation_id`=NEW.operation_id,
  `operation_name`=NEW.operation_name,
  `sequence_no`=NEW.sequence_no,
  `allow_only_1_order_item`=NEW.allow_only_1_order_item,
  `direct_issue_allow`=NEW.direct_issue_allow,
  `calculate_button`=NEW.calculate_button,
  `use_selected_tunch`=NEW.use_selected_tunch,
  `issue_change_actual_tunch_allow`=NEW.issue_change_actual_tunch_allow,
  `receive_change_actual_tunch_allow`=NEW.receive_change_actual_tunch_allow,
  `remark`=NEW.remark,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_operation_update_after_trigger` AFTER UPDATE ON `machine_chain_operation` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_operation_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `operation_id`=NEW.operation_id,
  `operation_name`=NEW.operation_name,
  `sequence_no`=NEW.sequence_no,
  `allow_only_1_order_item`=NEW.allow_only_1_order_item,
  `direct_issue_allow`=NEW.direct_issue_allow,
  `calculate_button`=NEW.calculate_button,
  `use_selected_tunch`=NEW.use_selected_tunch,
  `issue_change_actual_tunch_allow`=NEW.issue_change_actual_tunch_allow,
  `receive_change_actual_tunch_allow`=NEW.receive_change_actual_tunch_allow,
  `remark`=NEW.remark,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `machine_chain_operation_department`
--

CREATE TABLE `machine_chain_operation_department` (
  `od_id` int(11) NOT NULL,
  `operation_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `machine_chain_operation_department`
--
DELIMITER $$
CREATE TRIGGER `machine_chain_operation_department_delete_after_trigger` AFTER DELETE ON `machine_chain_operation_department` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_operation_department_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `od_id`=OLD.od_id,
  `operation_id`=OLD.operation_id,
  `department_id`=OLD.department_id,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_operation_department_insert_after_trigger` AFTER INSERT ON `machine_chain_operation_department` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_operation_department_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `od_id`=NEW.od_id,
  `operation_id`=NEW.operation_id,
  `department_id`=NEW.department_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_operation_department_update_after_trigger` AFTER UPDATE ON `machine_chain_operation_department` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_operation_department_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `od_id`=NEW.od_id,
  `operation_id`=NEW.operation_id,
  `department_id`=NEW.department_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `machine_chain_operation_worker`
--

CREATE TABLE `machine_chain_operation_worker` (
  `ow_id` int(11) NOT NULL,
  `operation_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `machine_chain_operation_worker`
--
DELIMITER $$
CREATE TRIGGER `machine_chain_operation_worker_delete_after_trigger` AFTER DELETE ON `machine_chain_operation_worker` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_operation_worker_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `ow_id`=OLD.ow_id,
  `operation_id`=OLD.operation_id,
  `worker_id`=OLD.worker_id,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_operation_worker_insert_after_trigger` AFTER INSERT ON `machine_chain_operation_worker` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_operation_worker_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `ow_id`=NEW.ow_id,
  `operation_id`=NEW.operation_id,
  `worker_id`=NEW.worker_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_operation_worker_update_after_trigger` AFTER UPDATE ON `machine_chain_operation_worker` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_operation_worker_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `ow_id`=NEW.ow_id,
  `operation_id`=NEW.operation_id,
  `worker_id`=NEW.worker_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `machine_chain_order_items`
--

CREATE TABLE `machine_chain_order_items` (
  `machine_chain_oi_id` int(11) NOT NULL,
  `machine_chain_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_lot_item_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `machine_chain_order_items`
--
DELIMITER $$
CREATE TRIGGER `machine_chain_order_items_delete_after_trigger` AFTER DELETE ON `machine_chain_order_items` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_order_items_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `machine_chain_oi_id`=OLD.machine_chain_oi_id,
  `machine_chain_id`=OLD.machine_chain_id,
  `order_id`=OLD.order_id,
  `order_lot_item_id`=OLD.order_lot_item_id,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_order_items_insert_after_trigger` AFTER INSERT ON `machine_chain_order_items` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_order_items_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `machine_chain_oi_id`=NEW.machine_chain_oi_id,
  `machine_chain_id`=NEW.machine_chain_id,
  `order_id`=NEW.order_id,
  `order_lot_item_id`=NEW.order_lot_item_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `machine_chain_order_items_update_after_trigger` AFTER UPDATE ON `machine_chain_order_items` FOR EACH ROW INSERT INTO 
  gurulog.`machine_chain_order_items_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `machine_chain_oi_id`=NEW.machine_chain_oi_id,
  `machine_chain_id`=NEW.machine_chain_id,
  `order_id`=NEW.order_id,
  `order_lot_item_id`=NEW.order_lot_item_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manufacture_status`
--

CREATE TABLE `manufacture_status` (
  `manufacture_status_id` int(11) NOT NULL,
  `manufacture_status_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacture_status`
--

INSERT INTO `manufacture_status` (`manufacture_status_id`, `manufacture_status_name`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Not Started', 1, '2020-01-12 00:00:00', 1, '2020-01-12 00:00:00'),
(2, 'In CAD', 1, '2020-01-12 00:00:00', 1, '2020-01-12 00:00:00'),
(3, 'Design Ready', 1, '2020-01-12 00:00:00', 1, '2020-01-12 00:00:00'),
(4, 'In Wax', 1, '2020-01-12 00:00:00', 1, '2020-01-12 00:00:00');

--
-- Triggers `manufacture_status`
--
DELIMITER $$
CREATE TRIGGER `manufacture_status_delete_after_trigger` AFTER DELETE ON `manufacture_status` FOR EACH ROW INSERT INTO 
  gurulog.`manufacture_status_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `manufacture_status_id`=OLD.manufacture_status_id,
  `manufacture_status_name`=OLD.manufacture_status_name,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `manufacture_status_insert_after_trigger` AFTER INSERT ON `manufacture_status` FOR EACH ROW INSERT INTO 
  gurulog.`manufacture_status_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `manufacture_status_id`=NEW.manufacture_status_id,
  `manufacture_status_name`=NEW.manufacture_status_name,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `manufacture_status_update_after_trigger` AFTER UPDATE ON `manufacture_status` FOR EACH ROW INSERT INTO 
  gurulog.`manufacture_status_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `manufacture_status_id`=NEW.manufacture_status_id,
  `manufacture_status_name`=NEW.manufacture_status_name,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manu_hand_made`
--

CREATE TABLE `manu_hand_made` (
  `mhm_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `operation_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `mhm_date` date DEFAULT NULL,
  `reference_no` int(11) DEFAULT NULL,
  `lott_complete` tinyint(1) DEFAULT NULL COMMENT '0 = No, 1 = Yes',
  `hisab_done` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `mhm_diffrence` double DEFAULT NULL,
  `worker_gold_rate` double DEFAULT NULL,
  `mhm_remark` text,
  `total_issue_net_wt` double DEFAULT NULL,
  `total_receive_net_wt` double DEFAULT NULL,
  `total_issue_fine` double DEFAULT NULL,
  `total_receive_fine` double DEFAULT NULL,
  `audit_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Pending = 1, Audited = 2',
  `journal_id` int(11) DEFAULT NULL COMMENT 'Lott Complete to diff. fine amount Worker <> MF Loss journal_id',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `manu_hand_made`
--
DELIMITER $$
CREATE TRIGGER `manu_hand_made_delete_after_trigger` AFTER DELETE ON `manu_hand_made` FOR EACH ROW INSERT INTO 
  gurulog.`manu_hand_made_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `mhm_id`=OLD.mhm_id,
  `department_id`=OLD.department_id,
  `operation_id`=OLD.operation_id,
  `worker_id`=OLD.worker_id,
  `mhm_date`=OLD.mhm_date,
  `reference_no`=OLD.reference_no,
  `lott_complete`=OLD.lott_complete,
  `hisab_done`=OLD.hisab_done,
  `mhm_diffrence`=OLD.mhm_diffrence,
  `worker_gold_rate`=OLD.worker_gold_rate,
  `mhm_remark`=OLD.mhm_remark,
  `total_issue_net_wt`=OLD.total_issue_net_wt,
  `total_receive_net_wt`=OLD.total_receive_net_wt,
  `total_issue_fine`=OLD.total_issue_fine,
  `total_receive_fine`=OLD.total_receive_fine,
  `journal_id`=OLD.journal_id,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `manu_hand_made_insert_after_trigger` AFTER INSERT ON `manu_hand_made` FOR EACH ROW INSERT INTO 
  gurulog.`manu_hand_made_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `mhm_id`=NEW.mhm_id,
  `department_id`=NEW.department_id,
  `operation_id`=NEW.operation_id,
  `worker_id`=NEW.worker_id,
  `mhm_date`=NEW.mhm_date,
  `reference_no`=NEW.reference_no,
  `lott_complete`=NEW.lott_complete,
  `hisab_done`=NEW.hisab_done,
  `mhm_diffrence`=NEW.mhm_diffrence,
  `worker_gold_rate`=NEW.worker_gold_rate,
  `mhm_remark`=NEW.mhm_remark,
  `total_issue_net_wt`=NEW.total_issue_net_wt,
  `total_receive_net_wt`=NEW.total_receive_net_wt,
  `total_issue_fine`=NEW.total_issue_fine,
  `total_receive_fine`=NEW.total_receive_fine,
  `journal_id`=NEW.journal_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `manu_hand_made_update_after_trigger` AFTER UPDATE ON `manu_hand_made` FOR EACH ROW INSERT INTO 
  gurulog.`manu_hand_made_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `mhm_id`=NEW.mhm_id,
  `department_id`=NEW.department_id,
  `operation_id`=NEW.operation_id,
  `worker_id`=NEW.worker_id,
  `mhm_date`=NEW.mhm_date,
  `reference_no`=NEW.reference_no,
  `lott_complete`=NEW.lott_complete,
  `hisab_done`=NEW.hisab_done,
  `mhm_diffrence`=NEW.mhm_diffrence,
  `worker_gold_rate`=NEW.worker_gold_rate,
  `mhm_remark`=NEW.mhm_remark,
  `total_issue_net_wt`=NEW.total_issue_net_wt,
  `total_receive_net_wt`=NEW.total_receive_net_wt,
  `total_issue_fine`=NEW.total_issue_fine,
  `total_receive_fine`=NEW.total_receive_fine,
  `journal_id`=NEW.journal_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manu_hand_made_ads`
--

CREATE TABLE `manu_hand_made_ads` (
  `mhm_ad_id` int(11) NOT NULL,
  `mhm_id` int(11) NOT NULL DEFAULT '0',
  `ad_id` int(11) NOT NULL DEFAULT '0',
  `ad_pcs` int(11) NOT NULL DEFAULT '0',
  `ad_rate` double NOT NULL DEFAULT '0',
  `ad_amount` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `manu_hand_made_ads`
--
DELIMITER $$
CREATE TRIGGER `manu_hand_made_ads_delete_after_trigger` AFTER DELETE ON `manu_hand_made_ads` FOR EACH ROW INSERT INTO 
  gurulog.`manu_hand_made_ads_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `mhm_ad_id`=OLD.mhm_ad_id,
  `mhm_id`=OLD.mhm_id,
  `ad_id`=OLD.ad_id,
  `ad_pcs`=OLD.ad_pcs,
  `ad_rate`=OLD.ad_rate,
  `ad_amount`=OLD.ad_amount,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `manu_hand_made_ads_insert_after_trigger` AFTER INSERT ON `manu_hand_made_ads` FOR EACH ROW INSERT INTO 
  gurulog.`manu_hand_made_ads_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `mhm_ad_id`=NEW.mhm_ad_id,
  `mhm_id`=NEW.mhm_id,
  `ad_id`=NEW.ad_id,
  `ad_pcs`=NEW.ad_pcs,
  `ad_rate`=NEW.ad_rate,
  `ad_amount`=NEW.ad_amount,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `manu_hand_made_ads_update_after_trigger` AFTER UPDATE ON `manu_hand_made_ads` FOR EACH ROW INSERT INTO 
  gurulog.`manu_hand_made_ads_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `mhm_ad_id`=NEW.mhm_ad_id,
  `mhm_id`=NEW.mhm_id,
  `ad_id`=NEW.ad_id,
  `ad_pcs`=NEW.ad_pcs,
  `ad_rate`=NEW.ad_rate,
  `ad_amount`=NEW.ad_amount,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manu_hand_made_details`
--

CREATE TABLE `manu_hand_made_details` (
  `mhm_detail_id` int(11) NOT NULL,
  `mhm_id` int(11) DEFAULT NULL,
  `type_id` tinyint(1) DEFAULT NULL COMMENT '1 = Issue Finish Work, 2 = Issue Scrap, 3 = Receive Finish Work, 4 = Receive Scrap',
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `tunch` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `less` double DEFAULT NULL,
  `net_wt` double DEFAULT NULL,
  `actual_tunch` double DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `pcs` double DEFAULT NULL,
  `ad_weight` double DEFAULT NULL,
  `including_ad_wt` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not Including, 1 = Including',
  `mhm_detail_date` date DEFAULT NULL,
  `tunch_textbox` tinyint(1) DEFAULT NULL,
  `mhm_detail_remark` text,
  `purchase_sell_item_id` int(11) DEFAULT NULL COMMENT 'Purchase to Sell : purchase_sell_item_id',
  `stock_type` tinyint(1) DEFAULT NULL COMMENT '1 = Purchase, 2 = Exchange, 3 = Stock Transfer, 4 = Receive, 5 = Receive Finish, 6 = Receive Scrap',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `manu_hand_made_details`
--
DELIMITER $$
CREATE TRIGGER `manu_hand_made_details_delete_after_trigger` AFTER DELETE ON `manu_hand_made_details` FOR EACH ROW INSERT INTO 
  gurulog.`manu_hand_made_details_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `mhm_detail_id`=OLD.mhm_detail_id,
  `mhm_id`=OLD.mhm_id,
  `type_id`=OLD.type_id,
  `category_id`=OLD.category_id,
  `item_id`=OLD.item_id,
  `tunch`=OLD.tunch,
  `weight`=OLD.weight,
  `less`=OLD.less,
  `net_wt`=OLD.net_wt,
  `actual_tunch`=OLD.actual_tunch,
  `fine`=OLD.fine,
  `pcs`=OLD.pcs,
  `ad_weight`=OLD.ad_weight,
  `including_ad_wt`=OLD.including_ad_wt,
  `mhm_detail_date`=OLD.mhm_detail_date,
  `tunch_textbox`=OLD.tunch_textbox,
  `mhm_detail_remark`=OLD.mhm_detail_remark,
  `purchase_sell_item_id`=OLD.purchase_sell_item_id,
  `stock_type`=OLD.stock_type,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `manu_hand_made_details_insert_after_trigger` AFTER INSERT ON `manu_hand_made_details` FOR EACH ROW INSERT INTO 
  gurulog.`manu_hand_made_details_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `mhm_detail_id`=NEW.mhm_detail_id,
  `mhm_id`=NEW.mhm_id,
  `type_id`=NEW.type_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `tunch`=NEW.tunch,
  `weight`=NEW.weight,
  `less`=NEW.less,
  `net_wt`=NEW.net_wt,
  `actual_tunch`=NEW.actual_tunch,
  `fine`=NEW.fine,
  `pcs`=NEW.pcs,
  `ad_weight`=NEW.ad_weight,
  `including_ad_wt`=NEW.including_ad_wt,
  `mhm_detail_date`=NEW.mhm_detail_date,
  `tunch_textbox`=NEW.tunch_textbox,
  `mhm_detail_remark`=NEW.mhm_detail_remark,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `manu_hand_made_details_update_after_trigger` AFTER UPDATE ON `manu_hand_made_details` FOR EACH ROW INSERT INTO 
  gurulog.`manu_hand_made_details_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `mhm_detail_id`=NEW.mhm_detail_id,
  `mhm_id`=NEW.mhm_id,
  `type_id`=NEW.type_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `tunch`=NEW.tunch,
  `weight`=NEW.weight,
  `less`=NEW.less,
  `net_wt`=NEW.net_wt,
  `actual_tunch`=NEW.actual_tunch,
  `fine`=NEW.fine,
  `pcs`=NEW.pcs,
  `ad_weight`=NEW.ad_weight,
  `including_ad_wt`=NEW.including_ad_wt,
  `mhm_detail_date`=NEW.mhm_detail_date,
  `tunch_textbox`=NEW.tunch_textbox,
  `mhm_detail_remark`=NEW.mhm_detail_remark,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manu_hand_made_order_items`
--

CREATE TABLE `manu_hand_made_order_items` (
  `mhm_oi_id` int(11) NOT NULL,
  `mhm_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_lot_item_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `manu_hand_made_order_items`
--
DELIMITER $$
CREATE TRIGGER `manu_hand_made_order_items_delete_after_trigger` AFTER DELETE ON `manu_hand_made_order_items` FOR EACH ROW INSERT INTO 
  gurulog.`manu_hand_made_order_items_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `mhm_oi_id`=OLD.mhm_oi_id,
  `mhm_id`=OLD.mhm_id,
  `order_id`=OLD.order_id,
  `order_lot_item_id`=OLD.order_lot_item_id,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `manu_hand_made_order_items_insert_after_trigger` AFTER INSERT ON `manu_hand_made_order_items` FOR EACH ROW INSERT INTO 
  gurulog.`manu_hand_made_order_items_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `mhm_oi_id`=NEW.mhm_oi_id,
  `mhm_id`=NEW.mhm_id,
  `order_id`=NEW.order_id,
  `order_lot_item_id`=NEW.order_lot_item_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `manu_hand_made_order_items_update_after_trigger` AFTER UPDATE ON `manu_hand_made_order_items` FOR EACH ROW INSERT INTO 
  gurulog.`manu_hand_made_order_items_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `mhm_oi_id`=NEW.mhm_oi_id,
  `mhm_id`=NEW.mhm_id,
  `order_id`=NEW.order_id,
  `order_lot_item_id`=NEW.order_lot_item_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `metal_payment_receipt`
--

CREATE TABLE `metal_payment_receipt` (
  `metal_pr_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `metal_payment_receipt` tinyint(1) DEFAULT NULL COMMENT '1 = Payment, 2 = Receive',
  `metal_category_id` int(11) DEFAULT NULL,
  `metal_item_id` int(11) DEFAULT NULL,
  `metal_grwt` double DEFAULT NULL,
  `metal_ntwt` double DEFAULT NULL,
  `metal_tunch` double DEFAULT NULL,
  `metal_fine` double DEFAULT NULL,
  `metal_narration` text,
  `total_gold_fine` double DEFAULT NULL,
  `total_silver_fine` double DEFAULT NULL,
  `total_other_fine` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `metal_payment_receipt`
--
DELIMITER $$
CREATE TRIGGER `metal_payment_receipt_delete_after_trigger` AFTER DELETE ON `metal_payment_receipt` FOR EACH ROW INSERT INTO 
  gurulog.`metal_payment_receipt_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `metal_pr_id`=OLD.metal_pr_id,
  `sell_id`=OLD.sell_id,
  `metal_payment_receipt`=OLD.metal_payment_receipt,
  `metal_category_id`=OLD.metal_category_id,
  `metal_item_id`=OLD.metal_item_id,
  `metal_grwt`=OLD.metal_grwt,
  `metal_ntwt`=OLD.metal_ntwt,
  `metal_tunch`=OLD.metal_tunch,
  `metal_fine`=OLD.metal_fine,
  `metal_narration`=OLD.metal_narration,
  `total_gold_fine`=OLD.total_gold_fine,
  `total_silver_fine`=OLD.total_silver_fine,
  `total_other_fine`=OLD.total_other_fine,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `metal_payment_receipt_insert_after_trigger` AFTER INSERT ON `metal_payment_receipt` FOR EACH ROW INSERT INTO 
  gurulog.`metal_payment_receipt_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `metal_pr_id`=NEW.metal_pr_id,
  `sell_id`=NEW.sell_id,
  `metal_payment_receipt`=NEW.metal_payment_receipt,
  `metal_category_id`=NEW.metal_category_id,
  `metal_item_id`=NEW.metal_item_id,
  `metal_grwt`=NEW.metal_grwt,
  `metal_ntwt`=NEW.metal_ntwt,
  `metal_tunch`=NEW.metal_tunch,
  `metal_fine`=NEW.metal_fine,
  `metal_narration`=NEW.metal_narration,
  `total_gold_fine`=NEW.total_gold_fine,
  `total_silver_fine`=NEW.total_silver_fine,
  `total_other_fine`=NEW.total_other_fine,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `metal_payment_receipt_update_after_trigger` AFTER UPDATE ON `metal_payment_receipt` FOR EACH ROW INSERT INTO 
  gurulog.`metal_payment_receipt_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `metal_pr_id`=NEW.metal_pr_id,
  `sell_id`=NEW.sell_id,
  `metal_payment_receipt`=NEW.metal_payment_receipt,
  `metal_category_id`=NEW.metal_category_id,
  `metal_item_id`=NEW.metal_item_id,
  `metal_grwt`=NEW.metal_grwt,
  `metal_ntwt`=NEW.metal_ntwt,
  `metal_tunch`=NEW.metal_tunch,
  `metal_fine`=NEW.metal_fine,
  `metal_narration`=NEW.metal_narration,
  `total_gold_fine`=NEW.total_gold_fine,
  `total_silver_fine`=NEW.total_silver_fine,
  `total_other_fine`=NEW.total_other_fine,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `module_roles`
--

CREATE TABLE `module_roles` (
  `module_role_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `website_module_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module_roles`
--

INSERT INTO `module_roles` (`module_role_id`, `title`, `role_name`, `website_module_id`) VALUES
(1, 'view', 'view', 1),
(2, 'view', 'view', 2),
(3, 'add', 'add', 2),
(4, 'edit', 'edit', 2),
(5, 'delete', 'delete', 2),
(6, 'view', 'view', 3),
(8, 'edit', 'edit', 3),
(10, 'view', 'view', 4),
(11, 'add', 'add', 4),
(12, 'edit', 'edit', 4),
(13, 'delete', 'delete', 4),
(14, 'view', 'view', 5),
(15, 'add', 'add', 5),
(16, 'edit', 'edit', 5),
(17, 'delete', 'delete', 5),
(18, 'view', 'view', 6),
(19, 'add', 'add', 6),
(20, 'edit', 'edit', 6),
(21, 'delete', 'delete', 6),
(22, 'view', 'view', 7),
(23, 'add', 'add', 7),
(24, 'edit', 'edit', 7),
(25, 'delete', 'delete', 7),
(26, 'view', 'view', 8),
(27, 'add', 'add', 8),
(28, 'edit', 'edit', 8),
(29, 'delete', 'delete', 8),
(30, 'view', 'view', 9),
(31, 'add', 'add', 9),
(32, 'edit', 'edit', 9),
(33, 'delete', 'delete', 9),
(34, 'view', 'view', 10),
(35, 'add', 'add', 10),
(36, 'edit', 'edit', 10),
(37, 'delete', 'delete', 10),
(38, 'allow', 'allow', 11),
(39, 'view', 'view', 12),
(40, 'add', 'add', 12),
(41, 'edit', 'edit', 12),
(42, 'delete', 'delete', 12),
(43, 'view', 'view', 13),
(44, 'view', 'view', 14),
(45, 'add', 'add', 14),
(46, 'edit', 'edit', 14),
(47, 'delete', 'delete', 14),
(48, 'view', 'view', 15),
(49, 'view', 'view', 16),
(50, 'add', 'add', 41),
(51, 'edit', 'edit', 41),
(52, 'delete', 'delete', 41),
(53, 'view', 'view', 17),
(54, 'add', 'add', 17),
(55, 'edit', 'edit', 17),
(56, 'delete', 'delete', 17),
(57, 'view', 'view', 18),
(58, 'view', 'view', 19),
(59, 'view', 'view', 20),
(60, 'view', 'view', 21),
(61, 'allow', 'allow', 22),
(62, 'view', 'view', 23),
(63, 'show party name', 'show party name', 14),
(64, 'view', 'view', 25),
(65, 'add', 'add', 25),
(66, 'edit', 'edit', 25),
(67, 'delete', 'delete', 25),
(68, 'approve', 'approve', 12),
(69, 'view', 'view', 26),
(70, 'add', 'add', 26),
(71, 'edit', 'edit', 26),
(72, 'delete', 'delete', 26),
(73, 'view', 'view', 27),
(74, 'view', 'view', 28),
(75, 'view', 'view', 29),
(76, 'add', 'add', 29),
(77, 'edit', 'edit', 29),
(78, 'delete', 'delete', 29),
(79, 'view', 'view', 30),
(80, 'view', 'view', 31),
(81, 'view', 'view', 32),
(82, 'add', 'add', 32),
(83, 'view', 'view', 33),
(84, 'add', 'add', 33),
(85, 'edit', 'edit', 33),
(86, 'delete', 'delete', 33),
(87, 'view', 'view', 34),
(88, 'add', 'add', 34),
(89, 'edit', 'edit', 34),
(90, 'delete', 'delete', 34),
(91, 'customer ledger', 'customer ledger', 12),
(92, 'view', 'view', 35),
(93, 'add', 'add', 35),
(94, 'view', 'view', 36),
(95, 'view', 'view', 37),
(96, 'add', 'add', 37),
(98, 'approve', 'approve', 33),
(99, 'view', 'view', 38),
(100, 'view', 'view', 39),
(101, 'view', 'view', 40),
(102, 'add', 'add', 40),
(103, 'edit', 'edit', 40),
(104, 'delete', 'delete', 40),
(106, 'worker_hisab', 'worker_hisab', 39),
(107, 'allow_add_opening', 'allow_add_opening', 12),
(108, 'view', 'view', 41),
(109, 'view', 'view', 42),
(110, 'add', 'add', 42),
(111, 'edit', 'edit', 42),
(112, 'delete', 'delete', 42),
(113, 'sell/purchase item list', 'sell/purchase item list', 41),
(114, 'view', 'view', 44),
(115, 'add', 'add', 44),
(116, 'edit', 'edit', 44),
(117, 'delete', 'delete', 44),
(118, 'view', 'view', 45),
(119, 'add', 'add', 45),
(120, 'edit', 'edit', 45),
(121, 'delete', 'delete', 45),
(122, 'allow logout option', 'allow logout option', 7),
(123, 'allow to save gold / silver bhav out of range', 'allow to save gold / silver bhav out of range', 41),
(124, 'allow to save out of credit limit', 'allow to save out of credit limit', 41),
(125, 'view', 'view', 46),
(126, 'add', 'add', 46),
(127, 'edit', 'edit', 46),
(128, 'delete', 'delete', 46),
(129, 'allow to update date', 'allow to update date', 46),
(130, 'allow to update time', 'allow to update time', 46),
(131, 'allow to lott complete', 'allow to lott complete', 39),
(132, 'view', 'view', 43),
(133, 'allow change wastage', 'allow change wastage', 41),
(134, 'allow change wastage', 'allow change wastage', 17),
(135, 'view', 'view', 47),
(136, 'worker_hisab_handmade', 'worker_hisab_handmade', 45),
(137, 'view', 'view', 48),
(138, 'add', 'add', 48),
(139, 'edit', 'edit', 48),
(140, 'delete', 'delete', 48),
(141, 'view', 'view', 49),
(142, 'view', 'view', 50),
(143, 'add', 'add', 50),
(144, 'edit', 'edit', 50),
(145, 'delete', 'delete', 50),
(146, 'view', 'view', 51),
(147, 'add', 'add', 51),
(148, 'edit', 'edit', 51),
(149, 'delete', 'delete', 51),
(150, 'is guard', 'is guard', 17),
(151, 'allow to audit / suspect', 'allow to audit / suspect', 29),
(152, 'allow audit / suspect to pending', 'allow audit / suspect to pending', 29),
(153, 'worker_hisab_machine_chain', 'worker_hisab_machine_chain', 51),
(154, 'view', 'view', 52),
(155, 'allow to audit / suspect', 'allow to audit / suspect', 25),
(156, 'allow audit / suspect to pending', 'allow audit / suspect to pending', 25),
(157, 'allow to audit / suspect', 'allow to audit / suspect', 17),
(158, 'allow audit / suspect to pending', 'allow audit / suspect to pending', 17),
(159, 'allow to audit / suspect', 'allow to audit / suspect', 41),
(160, 'allow audit / suspect to pending', 'allow audit / suspect to pending', 41),
(161, 'allow to lott complete', 'allow to lott complete', 51),
(162, 'view', 'view', 53),
(163, 'view', 'view', 54),
(164, 'view password', 'view password', 7),
(165, 'view', 'view', 55),
(166, 'add', 'add', 55),
(167, 'edit', 'edit', 55),
(168, 'delete', 'delete', 55),
(169, 'view', 'view', 56),
(170, 'add', 'add', 56),
(171, 'edit', 'edit', 56),
(172, 'delete', 'delete', 56),
(173, 'view', 'view', 57),
(174, 'add', 'add', 57),
(175, 'edit', 'edit', 57),
(176, 'delete', 'delete', 57),
(177, 'view', 'view', 58),
(178, 'add', 'add', 58),
(179, 'edit', 'edit', 58),
(180, 'delete', 'delete', 58),
(181, 'view', 'view', 59),
(182, 'add', 'add', 59),
(183, 'edit', 'edit', 59),
(184, 'delete', 'delete', 59),
(185, 'worker_hisab_i_r_silver', 'worker_hisab_i_r_silver', 59),
(186, 'worker_hisab_casting', 'worker_hisab_casting', 58),
(187, 'view', 'view', 60),
(188, 'add', 'add', 60),
(189, 'edit', 'edit', 60),
(190, 'delete', 'delete', 60),
(191, 'allow_change_date', 'allow_change_date', 41),
(192, 'allow_change_date', 'allow_change_date', 42),
(193, 'allow_change_date', 'allow_change_date', 25),
(194, 'allow_change_date', 'allow_change_date', 29),
(195, 'allow_change_date', 'allow_change_date', 17),
(196, 'allow_change_date', 'allow_change_date', 58),
(197, 'allow_change_date', 'allow_change_date', 40),
(198, 'allow_change_date', 'allow_change_date', 59),
(199, 'allow_change_date', 'allow_change_date', 51),
(200, 'allow_change_date', 'allow_change_date', 45),
(201, 'rfid_view', 'rfid_view', 20),
(202, 'rfid_add', 'rfid_add', 20),
(203, 'rfid_edit', 'rfid_edit', 20),
(204, 'rfid_delete', 'rfid_delete', 20),
(205, 'view', 'view', 61),
(206, 'add', 'add', 61),
(207, 'edit', 'edit', 61),
(208, 'delete', 'delete', 61),
(209, 'stock_check', 'stock_check', 20),
(210, 'allow to lott complete mhm', 'allow to lott complete mhm', 45),
(211, 'allow to audit mhm', 'allow to audit mhm', 45),
(212, 'Allow To change Price / Per Pcs', 'Allow To change Price / Per Pcs', 56),
(213, 'adjust c/r amount allowed', 'adjust c/r amount allowed', 41),
(214, 'view', 'view', 62),
(215, 'add', 'add', 62),
(216, 'edit', 'edit', 62),
(217, 'delete', 'delete', 62),
(218, 'allow', 'allow', 63),
(219, 'edit', 'edit', 64),
(220, 'view', 'view', 65),
(221, 'add', 'add', 65),
(222, 'edit', 'edit', 65),
(223, 'delete', 'delete', 65);

--
-- Triggers `module_roles`
--
DELIMITER $$
CREATE TRIGGER `module_roles_delete_after_trigger` AFTER DELETE ON `module_roles` FOR EACH ROW INSERT INTO 
  gurulog.`module_roles_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `module_role_id`=OLD.module_role_id,
  `title`=OLD.title,
  `role_name`=OLD.role_name,
  `website_module_id`=OLD.website_module_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `module_roles_insert_after_trigger` AFTER INSERT ON `module_roles` FOR EACH ROW INSERT INTO 
  gurulog.`module_roles_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `module_role_id`=NEW.module_role_id,
  `title`=NEW.title,
  `role_name`=NEW.role_name,
  `website_module_id`=NEW.website_module_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `module_roles_update_after_trigger` AFTER UPDATE ON `module_roles` FOR EACH ROW INSERT INTO 
  gurulog.`module_roles_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `module_role_id`=NEW.module_role_id,
  `title`=NEW.title,
  `role_name`=NEW.role_name,
  `website_module_id`=NEW.website_module_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `new_order`
--

CREATE TABLE `new_order` (
  `order_id` int(11) NOT NULL,
  `order_no` int(11) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `real_delivery_date` date DEFAULT NULL,
  `party_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL COMMENT 'acoount_id from account table',
  `supplier_delivery_date` date DEFAULT NULL,
  `gold_price` int(11) DEFAULT NULL,
  `silver_price` int(11) DEFAULT NULL,
  `remark` text,
  `reason` text,
  `total_weight` double DEFAULT NULL,
  `total_pcs` double DEFAULT NULL,
  `order_status_id` int(11) DEFAULT '1',
  `order_type` tinyint(1) DEFAULT '1' COMMENT '1 = Order, 2 = Inquiry',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `new_order`
--
DELIMITER $$
CREATE TRIGGER `new_order_delete_after_trigger` AFTER DELETE ON `new_order` FOR EACH ROW INSERT INTO 
  gurulog.`new_order_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `order_id`=OLD.order_id,
  `order_no`=OLD.order_no,
  `process_id`=OLD.process_id,
  `order_date`=OLD.order_date,
  `delivery_date`=OLD.delivery_date,
  `real_delivery_date`=OLD.real_delivery_date,
  `party_id`=OLD.party_id,
  `supplier_id`=OLD.supplier_id,
  `supplier_delivery_date`=OLD.supplier_delivery_date,
  `gold_price`=OLD.gold_price,
  `silver_price`=OLD.silver_price,
  `remark`=OLD.remark,
  `reason`=OLD.reason,
  `total_weight`=OLD.total_weight,
  `total_pcs`=OLD.total_pcs,
  `order_status_id`=OLD.order_status_id,
  `order_type`=OLD.order_type,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `new_order_insert_after_trigger` AFTER INSERT ON `new_order` FOR EACH ROW INSERT INTO 
  gurulog.`new_order_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `order_id`=NEW.order_id,
  `order_no`=NEW.order_no,
  `process_id`=NEW.process_id,
  `order_date`=NEW.order_date,
  `delivery_date`=NEW.delivery_date,
  `real_delivery_date`=NEW.real_delivery_date,
  `party_id`=NEW.party_id,
  `supplier_id`=NEW.supplier_id,
  `supplier_delivery_date`=NEW.supplier_delivery_date,
  `gold_price`=NEW.gold_price,
  `silver_price`=NEW.silver_price,
  `remark`=NEW.remark,
  `reason`=NEW.reason,
  `total_weight`=NEW.total_weight,
  `total_pcs`=NEW.total_pcs,
  `order_status_id`=NEW.order_status_id,
  `order_type`=NEW.order_type,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `new_order_update_after_trigger` AFTER UPDATE ON `new_order` FOR EACH ROW INSERT INTO 
  gurulog.`new_order_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `order_id`=NEW.order_id,
  `order_no`=NEW.order_no,
  `process_id`=NEW.process_id,
  `order_date`=NEW.order_date,
  `delivery_date`=NEW.delivery_date,
  `real_delivery_date`=NEW.real_delivery_date,
  `party_id`=NEW.party_id,
  `supplier_id`=NEW.supplier_id,
  `supplier_delivery_date`=NEW.supplier_delivery_date,
  `gold_price`=NEW.gold_price,
  `silver_price`=NEW.silver_price,
  `remark`=NEW.remark,
  `reason`=NEW.reason,
  `total_weight`=NEW.total_weight,
  `total_pcs`=NEW.total_pcs,
  `order_status_id`=NEW.order_status_id,
  `order_type`=NEW.order_type,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `opening_stock`
--

CREATE TABLE `opening_stock` (
  `opening_stock_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `ntwt` double DEFAULT NULL,
  `grwt` double DEFAULT NULL,
  `less` double DEFAULT NULL,
  `tunch` double DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `design_no` varchar(255) DEFAULT NULL,
  `rfid_number` varchar(255) DEFAULT NULL,
  `opening_pcs` double NOT NULL DEFAULT '0',
  `purchase_sell_item_id` int(11) DEFAULT NULL COMMENT 'Purchase to Sell : purchase_sell_item_id : From where stock build',
  `stock_type` tinyint(1) DEFAULT NULL COMMENT '1 = Purchase, 2 = Exchange, 3 = Stock Transfer, 4 = Receive , 5 = MHM Receive Finish, 6 = MHM Receive Scrap, 7 = MC Receive Finish, 8 = MC Receive Scrap, 9 = Casting Entry Receive Finish, 10 = Casting Entry Receive Scrap, 11 = Opening Stock',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `opening_stock`
--
DELIMITER $$
CREATE TRIGGER `opening_stock_delete_after_trigger` AFTER DELETE ON `opening_stock` FOR EACH ROW INSERT INTO 
  gurulog.`opening_stock_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `opening_stock_id`=OLD.opening_stock_id,
  `department_id`=OLD.department_id,
  `category_id`=OLD.category_id,
  `item_id`=OLD.item_id,
  `ntwt`=OLD.ntwt,
  `grwt`=OLD.grwt,
  `less`=OLD.less,
  `tunch`=OLD.tunch,
  `fine`=OLD.fine,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `opening_stock_insert_after_trigger` AFTER INSERT ON `opening_stock` FOR EACH ROW INSERT INTO 
  gurulog.`opening_stock_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `opening_stock_id`=NEW.opening_stock_id,
  `department_id`=NEW.department_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `ntwt`=NEW.ntwt,
  `grwt`=NEW.grwt,
  `less`=NEW.less,
  `tunch`=NEW.tunch,
  `fine`=NEW.fine,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `opening_stock_update_after_trigger` AFTER UPDATE ON `opening_stock` FOR EACH ROW INSERT INTO 
  gurulog.`opening_stock_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `opening_stock_id`=NEW.opening_stock_id,
  `department_id`=NEW.department_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `ntwt`=NEW.ntwt,
  `grwt`=NEW.grwt,
  `less`=NEW.less,
  `tunch`=NEW.tunch,
  `fine`=NEW.fine,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `operation`
--

CREATE TABLE `operation` (
  `operation_id` int(11) NOT NULL,
  `operation_name` varchar(255) DEFAULT NULL,
  `fix_loss` tinyint(1) DEFAULT NULL COMMENT 'Comment 0 = No, 1 = Yes',
  `fix_loss_per` double DEFAULT NULL,
  `max_loss_allow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not allow, 1 = Allow',
  `max_loss_wt` double DEFAULT NULL,
  `issue_finish_fix_loss` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = No, 1 = Yes',
  `issue_finish_fix_loss_per` double DEFAULT NULL,
  `remark` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`operation_id`, `operation_name`, `fix_loss`, `fix_loss_per`, `max_loss_allow`, `max_loss_wt`, `issue_finish_fix_loss`, `issue_finish_fix_loss_per`, `remark`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Meena', 0, NULL, 0, NULL, 0, NULL, '', '2019-10-18 00:00:00', 1, '2021-02-04 11:34:03', 1),
(2, 'Nang Setting', 0, NULL, 0, NULL, 0, NULL, '', '2019-10-18 00:00:00', 1, '2020-03-01 17:40:37', 1),
(3, 'EMBOSE', 1, 2, 0, NULL, 0, NULL, '', '2020-03-01 17:42:30', 1, '2020-03-14 16:15:14', 1);

--
-- Triggers `operation`
--
DELIMITER $$
CREATE TRIGGER `operation_delete_after_trigger` AFTER DELETE ON `operation` FOR EACH ROW INSERT INTO 
  gurulog.`operation_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `operation_id`=OLD.operation_id,
  `operation_name`=OLD.operation_name,
  `fix_loss`=OLD.fix_loss,
  `fix_loss_per`=OLD.fix_loss_per,
  `max_loss_allow`=OLD.max_loss_allow,
  `max_loss_wt`=OLD.max_loss_wt,
  `issue_finish_fix_loss`=OLD.issue_finish_fix_loss,
  `issue_finish_fix_loss_per`=OLD.issue_finish_fix_loss_per,
  `remark`=OLD.remark,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `operation_insert_after_trigger` AFTER INSERT ON `operation` FOR EACH ROW INSERT INTO 
  gurulog.`operation_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `operation_id`=NEW.operation_id,
  `operation_name`=NEW.operation_name,
  `fix_loss`=NEW.fix_loss,
  `fix_loss_per`=NEW.fix_loss_per,
  `max_loss_allow`=NEW.max_loss_allow,
  `max_loss_wt`=NEW.max_loss_wt,
  `issue_finish_fix_loss`=NEW.issue_finish_fix_loss,
  `issue_finish_fix_loss_per`=NEW.issue_finish_fix_loss_per,
  `remark`=NEW.remark,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `operation_update_after_trigger` AFTER UPDATE ON `operation` FOR EACH ROW INSERT INTO 
  gurulog.`operation_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `operation_id`=NEW.operation_id,
  `operation_name`=NEW.operation_name,
  `fix_loss`=NEW.fix_loss,
  `fix_loss_per`=NEW.fix_loss_per,
  `max_loss_allow`=NEW.max_loss_allow,
  `max_loss_wt`=NEW.max_loss_wt,
  `issue_finish_fix_loss`=NEW.issue_finish_fix_loss,
  `issue_finish_fix_loss_per`=NEW.issue_finish_fix_loss_per,
  `remark`=NEW.remark,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `operation_department`
--

CREATE TABLE `operation_department` (
  `od_id` int(11) NOT NULL,
  `operation_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `operation_department`
--
DELIMITER $$
CREATE TRIGGER `operation_department_delete_after_trigger` AFTER DELETE ON `operation_department` FOR EACH ROW INSERT INTO 
  gurulog.`operation_department_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `od_id`=OLD.od_id,
  `operation_id`=OLD.operation_id,
  `department_id`=OLD.department_id,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `operation_department_insert_after_trigger` AFTER INSERT ON `operation_department` FOR EACH ROW INSERT INTO 
  gurulog.`operation_department_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `od_id`=NEW.od_id,
  `operation_id`=NEW.operation_id,
  `department_id`=NEW.department_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `operation_department_update_after_trigger` AFTER UPDATE ON `operation_department` FOR EACH ROW INSERT INTO 
  gurulog.`operation_department_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `od_id`=NEW.od_id,
  `operation_id`=NEW.operation_id,
  `department_id`=NEW.department_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `operation_worker`
--

CREATE TABLE `operation_worker` (
  `ow_id` int(11) NOT NULL,
  `operation_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `operation_worker`
--
DELIMITER $$
CREATE TRIGGER `operation_worker_delete_after_trigger` AFTER DELETE ON `operation_worker` FOR EACH ROW INSERT INTO 
  gurulog.`operation_worker_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `ow_id`=OLD.ow_id,
  `operation_id`=OLD.operation_id,
  `worker_id`=OLD.worker_id,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `operation_worker_insert_after_trigger` AFTER INSERT ON `operation_worker` FOR EACH ROW INSERT INTO 
  gurulog.`operation_worker_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `ow_id`=NEW.ow_id,
  `operation_id`=NEW.operation_id,
  `worker_id`=NEW.worker_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `operation_worker_update_after_trigger` AFTER UPDATE ON `operation_worker` FOR EACH ROW INSERT INTO 
  gurulog.`operation_worker_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `ow_id`=NEW.ow_id,
  `operation_id`=NEW.operation_id,
  `worker_id`=NEW.worker_id,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order_lot_item`
--

CREATE TABLE `order_lot_item` (
  `order_lot_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_no` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `touch_id` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `pcs` int(11) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `length` varchar(255) DEFAULT NULL,
  `hook_style` varchar(255) DEFAULT NULL,
  `item_status_id` int(11) NOT NULL DEFAULT '1',
  `image` varchar(255) DEFAULT NULL,
  `lot_remark` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `order_lot_item`
--
DELIMITER $$
CREATE TRIGGER `order_lot_item_delete_after_trigger` AFTER DELETE ON `order_lot_item` FOR EACH ROW INSERT INTO 
  gurulog.`order_lot_item_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `order_lot_item_id`=OLD.order_lot_item_id,
  `order_id`=OLD.order_id,
  `order_item_no`=OLD.order_item_no,
  `category_id`=OLD.category_id,
  `item_id`=OLD.item_id,
  `touch_id`=OLD.touch_id,
  `weight`=OLD.weight,
  `pcs`=OLD.pcs,
  `size`=OLD.size,
  `length`=OLD.length,
  `hook_style`=OLD.hook_style,
  `item_status_id`=OLD.item_status_id,
  `image`=OLD.image,
  `lot_remark`=OLD.lot_remark,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `order_lot_item_insert_after_trigger` AFTER INSERT ON `order_lot_item` FOR EACH ROW INSERT INTO 
  gurulog.`order_lot_item_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `order_lot_item_id`=NEW.order_lot_item_id,
  `order_id`=NEW.order_id,
  `order_item_no`=NEW.order_item_no,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `touch_id`=NEW.touch_id,
  `weight`=NEW.weight,
  `pcs`=NEW.pcs,
  `size`=NEW.size,
  `length`=NEW.length,
  `hook_style`=NEW.hook_style,
  `item_status_id`=NEW.item_status_id,
  `image`=NEW.image,
  `lot_remark`=NEW.lot_remark,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `order_lot_item_update_after_trigger` AFTER UPDATE ON `order_lot_item` FOR EACH ROW INSERT INTO 
  gurulog.`order_lot_item_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `order_lot_item_id`=NEW.order_lot_item_id,
  `order_id`=NEW.order_id,
  `order_item_no`=NEW.order_item_no,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `touch_id`=NEW.touch_id,
  `weight`=NEW.weight,
  `pcs`=NEW.pcs,
  `size`=NEW.size,
  `length`=NEW.length,
  `hook_style`=NEW.hook_style,
  `item_status_id`=NEW.item_status_id,
  `image`=NEW.image,
  `lot_remark`=NEW.lot_remark,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_order_status_on_insert` AFTER INSERT ON `order_lot_item` FOR EACH ROW BEGIN
DECLARE realmID INT DEFAULT 0;
DECLARE completed INT DEFAULT 0;
DECLARE pending INT DEFAULT 0;

SET realmID = (SELECT COUNT(item_status_id) FROM order_lot_item WHERE order_id=NEW.order_id AND `item_status_id`NOT IN (2,3));

SET completed = (SELECT COUNT(item_status_id) FROM order_lot_item WHERE order_id=NEW.order_id AND `item_status_id`NOT IN (2));

SET pending = (SELECT COUNT(item_status_id) FROM order_lot_item WHERE order_id=NEW.order_id AND `item_status_id` = 1);

IF (pending > 0) THEN
 UPDATE new_order n
       SET 
           `n`.`order_status_id`='1'
       WHERE `n`.`order_id`=NEW.order_id;
ELSEIF (completed = 0) THEN
 UPDATE new_order n
       SET 
           `n`.`order_status_id`='2'
       WHERE `n`.`order_id`=NEW.order_id;
ELSEIF (realmID = 0) THEN
 UPDATE new_order n
       SET 
           `n`.`order_status_id`='3'
       WHERE `n`.`order_id`=NEW.order_id;
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_order_status_on_update` AFTER UPDATE ON `order_lot_item` FOR EACH ROW BEGIN
DECLARE realmID INT DEFAULT 0;
DECLARE completed INT DEFAULT 0;
DECLARE pending INT DEFAULT 0;

SET realmID = (SELECT COUNT(item_status_id) FROM order_lot_item WHERE order_id=NEW.order_id AND `item_status_id`NOT IN (2,3));

SET completed = (SELECT COUNT(item_status_id) FROM order_lot_item WHERE order_id=NEW.order_id AND `item_status_id`NOT IN (2));

SET pending = (SELECT COUNT(item_status_id) FROM order_lot_item WHERE order_id=NEW.order_id AND `item_status_id` = 1);

IF (pending > 0) THEN
 UPDATE new_order n
       SET 
           `n`.`order_status_id`='1'
       WHERE `n`.`order_id`=NEW.order_id;
ELSEIF (completed = 0) THEN
 UPDATE new_order n
       SET 
           `n`.`order_status_id`='2'
       WHERE `n`.`order_id`=NEW.order_id;
ELSEIF (realmID = 0) THEN
 UPDATE new_order n
       SET 
           `n`.`order_status_id`='3'
       WHERE `n`.`order_id`=NEW.order_id;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `status`) VALUES
(1, 'Pending'),
(2, 'Canceled'),
(3, 'Completed'),
(4, 'Hold');

--
-- Triggers `order_status`
--
DELIMITER $$
CREATE TRIGGER `order_status_delete_after_trigger` AFTER DELETE ON `order_status` FOR EACH ROW INSERT INTO 
  gurulog.`order_status_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `order_status_id`=OLD.order_status_id,
  `status`=OLD.status
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `order_status_insert_after_trigger` AFTER INSERT ON `order_status` FOR EACH ROW INSERT INTO 
  gurulog.`order_status_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `order_status_id`=NEW.order_status_id,
  `status`=NEW.status
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `order_status_update_after_trigger` AFTER UPDATE ON `order_status` FOR EACH ROW INSERT INTO 
  gurulog.`order_status_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `order_status_id`=NEW.order_status_id,
  `status`=NEW.status
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `other`
--

CREATE TABLE `other` (
  `other_id` int(11) NOT NULL,
  `other_no` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `other_date` date DEFAULT NULL,
  `other_remark` varchar(255) DEFAULT NULL,
  `total_grwt` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `other`
--
DELIMITER $$
CREATE TRIGGER `other_delete_after_trigger` AFTER DELETE ON `other` FOR EACH ROW INSERT INTO 
  gurulog.`other_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `other_id`=OLD.other_id,
  `other_no`=OLD.other_no,
  `account_id`=OLD.account_id,
  `department_id`=OLD.department_id,
  `other_date`=OLD.other_date,
  `other_remark`=OLD.other_remark,
  `total_grwt`=OLD.total_grwt,
  `total_amount`=OLD.total_amount,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `other_insert_after_trigger` AFTER INSERT ON `other` FOR EACH ROW INSERT INTO 
  gurulog.`other_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `other_id`=NEW.other_id,
  `other_no`=NEW.other_no,
  `account_id`=NEW.account_id,
  `department_id`=NEW.department_id,
  `other_date`=NEW.other_date,
  `other_remark`=NEW.other_remark,
  `total_grwt`=NEW.total_grwt,
  `total_amount`=NEW.total_amount,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `other_update_after_trigger` AFTER UPDATE ON `other` FOR EACH ROW INSERT INTO 
  gurulog.`other_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `other_id`=NEW.other_id,
  `other_no`=NEW.other_no,
  `account_id`=NEW.account_id,
  `department_id`=NEW.department_id,
  `other_date`=NEW.other_date,
  `other_remark`=NEW.other_remark,
  `total_grwt`=NEW.total_grwt,
  `total_amount`=NEW.total_amount,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `other_items`
--

CREATE TABLE `other_items` (
  `other_item_id` int(11) NOT NULL,
  `other_id` int(11) DEFAULT NULL,
  `other_item_no` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1 = Sell, 2 = Purchase',
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `grwt` double DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `rate_on` double NOT NULL DEFAULT '1',
  `amount` double DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `other_items`
--
DELIMITER $$
CREATE TRIGGER `other_items_delete_after_trigger` AFTER DELETE ON `other_items` FOR EACH ROW INSERT INTO 
  gurulog.`other_items_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `other_item_id`=OLD.other_item_id,
  `other_id`=OLD.other_id,
  `other_item_no`=OLD.other_item_no,
  `type`=OLD.type,
  `category_id`=OLD.category_id,
  `item_id`=OLD.item_id,
  `grwt`=OLD.grwt,
  `rate`=OLD.rate,
  `amount`=OLD.amount,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `other_items_insert_after_trigger` AFTER INSERT ON `other_items` FOR EACH ROW INSERT INTO 
  gurulog.`other_items_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `other_item_id`=NEW.other_item_id,
  `other_id`=NEW.other_id,
  `other_item_no`=NEW.other_item_no,
  `type`=NEW.type,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `grwt`=NEW.grwt,
  `rate`=NEW.rate,
  `amount`=NEW.amount,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `other_items_update_after_trigger` AFTER UPDATE ON `other_items` FOR EACH ROW INSERT INTO 
  gurulog.`other_items_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `other_item_id`=NEW.other_item_id,
  `other_id`=NEW.other_id,
  `other_item_no`=NEW.other_item_no,
  `type`=NEW.type,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `grwt`=NEW.grwt,
  `rate`=NEW.rate,
  `amount`=NEW.amount,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `party_item_details`
--

CREATE TABLE `party_item_details` (
  `party_item_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `wstg` double DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `party_item_details`
--
DELIMITER $$
CREATE TRIGGER `party_item_details_delete_after_trigger` AFTER DELETE ON `party_item_details` FOR EACH ROW INSERT INTO 
  gurulog.`party_item_details_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `party_item_id`=OLD.party_item_id,
  `account_id`=OLD.account_id,
  `category_id`=OLD.category_id,
  `item_id`=OLD.item_id,
  `wstg`=OLD.wstg,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `party_item_details_insert_after_trigger` AFTER INSERT ON `party_item_details` FOR EACH ROW INSERT INTO 
  gurulog.`party_item_details_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `party_item_id`=NEW.party_item_id,
  `account_id`=NEW.account_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `wstg`=NEW.wstg,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `party_item_details_update_after_trigger` AFTER UPDATE ON `party_item_details` FOR EACH ROW INSERT INTO 
  gurulog.`party_item_details_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `party_item_id`=NEW.party_item_id,
  `account_id`=NEW.account_id,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `wstg`=NEW.wstg,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_receipt`
--

CREATE TABLE `payment_receipt` (
  `pay_rec_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `other_id` int(11) DEFAULT NULL,
  `xrf_id` int(11) DEFAULT NULL,
  `payment_receipt` tinyint(1) DEFAULT NULL COMMENT '1 = Payment, 2 = Rexeipt',
  `cash_cheque` tinyint(1) DEFAULT NULL COMMENT '1= Case, 2 = Cheque',
  `bank_id` int(11) DEFAULT NULL,
  `voucher_no` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `on_behalf_of` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `c_amt` double NOT NULL DEFAULT '0',
  `r_amt` double NOT NULL DEFAULT '0',
  `narration` text,
  `is_payment_received` tinyint(1) DEFAULT '0' COMMENT 'is_received =1,not_received =0',
  `audit_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Pending = 1, Audited = 2, Suspected = 3',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `payment_receipt`
--
DELIMITER $$
CREATE TRIGGER `payment_receipt_delete_after_trigger` AFTER DELETE ON `payment_receipt` FOR EACH ROW INSERT INTO 
  gurulog.`payment_receipt_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `pay_rec_id`=OLD.pay_rec_id,
  `sell_id`=OLD.sell_id,
  `other_id`=OLD.other_id,
  `payment_receipt`=OLD.payment_receipt,
  `cash_cheque`=OLD.cash_cheque,
  `bank_id`=OLD.bank_id,
  `voucher_no`=OLD.voucher_no,
  `transaction_date`=OLD.transaction_date,
  `department_id`=OLD.department_id,
  `account_id`=OLD.account_id,
  `on_behalf_of`=OLD.on_behalf_of,
  `amount`=OLD.amount,
  `narration`=OLD.narration,
  `is_payment_received`=OLD.is_payment_received,
  `audit_status`=OLD.audit_status,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `payment_receipt_insert_after_trigger` AFTER INSERT ON `payment_receipt` FOR EACH ROW INSERT INTO 
  gurulog.`payment_receipt_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `pay_rec_id`=NEW.pay_rec_id,
  `sell_id`=NEW.sell_id,
  `other_id`=NEW.other_id,
  `payment_receipt`=NEW.payment_receipt,
  `cash_cheque`=NEW.cash_cheque,
  `bank_id`=NEW.bank_id,
  `voucher_no`=NEW.voucher_no,
  `transaction_date`=NEW.transaction_date,
  `department_id`=NEW.department_id,
  `account_id`=NEW.account_id,
  `on_behalf_of`=NEW.on_behalf_of,
  `amount`=NEW.amount,
  `narration`=NEW.narration,
  `is_payment_received`=NEW.is_payment_received,
  `audit_status`=NEW.audit_status,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `payment_receipt_update_after_trigger` AFTER UPDATE ON `payment_receipt` FOR EACH ROW INSERT INTO 
  gurulog.`payment_receipt_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `pay_rec_id`=NEW.pay_rec_id,
  `sell_id`=NEW.sell_id,
  `other_id`=NEW.other_id,
  `payment_receipt`=NEW.payment_receipt,
  `cash_cheque`=NEW.cash_cheque,
  `bank_id`=NEW.bank_id,
  `voucher_no`=NEW.voucher_no,
  `transaction_date`=NEW.transaction_date,
  `department_id`=NEW.department_id,
  `account_id`=NEW.account_id,
  `on_behalf_of`=NEW.on_behalf_of,
  `amount`=NEW.amount,
  `narration`=NEW.narration,
  `is_payment_received`=NEW.is_payment_received,
  `audit_status`=NEW.audit_status,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `process_master`
--

CREATE TABLE `process_master` (
  `process_id` int(11) NOT NULL,
  `process_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `process_master`
--

INSERT INTO `process_master` (`process_id`, `process_name`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'CASTING', NULL, NULL, 1, '2018-10-11 11:34:14'),
(2, 'MACHIN CHAIN', NULL, NULL, 1, '2018-10-11 11:34:05'),
(3, 'HAND MADE CHAIN', NULL, NULL, 1, '2018-10-11 11:33:54'),
(16, 'Sales MAIN', 1, '2018-09-26 17:16:05', 1, '2018-10-11 11:34:23'),
(17, 'SALES BRANCH', 1, '2018-10-11 11:34:34', NULL, NULL),
(18, 'EMBOSE BANGALI', 1, '2018-11-21 16:36:33', 1, '2018-12-27 11:08:59');

--
-- Triggers `process_master`
--
DELIMITER $$
CREATE TRIGGER `process_master_delete_after_trigger` AFTER DELETE ON `process_master` FOR EACH ROW INSERT INTO 
  gurulog.`process_master_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `process_id`=OLD.process_id,
  `process_name`=OLD.process_name,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `process_master_insert_after_trigger` AFTER INSERT ON `process_master` FOR EACH ROW INSERT INTO 
  gurulog.`process_master_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `process_id`=NEW.process_id,
  `process_name`=NEW.process_name,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `process_master_update_after_trigger` AFTER UPDATE ON `process_master` FOR EACH ROW INSERT INTO 
  gurulog.`process_master_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `process_id`=NEW.process_id,
  `process_name`=NEW.process_name,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `refinery_entry`
--

CREATE TABLE `refinery_entry` (
  `r_entry_id` int(11) NOT NULL,
  `invoice_no` double DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `r_hsn_sac_code` varchar(255) DEFAULT NULL,
  `r_old_jewels_weight` double DEFAULT NULL,
  `r_stones_dust_weights_loss` double DEFAULT NULL,
  `r_before_melting_weight` double DEFAULT NULL,
  `r_melting_loss` double DEFAULT NULL,
  `r_after_melting_weight` double DEFAULT NULL,
  `r_testing_purity_per` double DEFAULT NULL,
  `r_net_fine_gold` double DEFAULT NULL,
  `d_hsn_sac_code` double DEFAULT NULL,
  `d_given_fine_gold_purity` double DEFAULT NULL,
  `d_melting_charges_weight` double DEFAULT NULL,
  `d_melting_charges_per_gram` double DEFAULT NULL,
  `d_melting_charges_total` double DEFAULT NULL,
  `d_refining_charges_weight` double DEFAULT NULL,
  `d_refining_charges_per_gram` double DEFAULT NULL,
  `d_refining_charges_total` double DEFAULT NULL,
  `gst_type_id` int(11) DEFAULT NULL COMMENT '1 = SGST + CGST, 2 = IGST',
  `gst_per` double DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `sgst` double DEFAULT NULL,
  `sgst_per` double DEFAULT NULL,
  `cgst` double DEFAULT NULL,
  `cgst_per` double DEFAULT NULL,
  `igst` double DEFAULT NULL,
  `igst_per` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reminder`
--

CREATE TABLE `reminder` (
  `reminder_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `debit_credit` tinyint(1) DEFAULT NULL COMMENT '1 = Debit, 2 = Credit',
  `amount` double DEFAULT NULL,
  `gold` double DEFAULT NULL,
  `silver` double DEFAULT NULL,
  `remarks` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `reminder`
--
DELIMITER $$
CREATE TRIGGER `reminder_delete_after_trigger` AFTER DELETE ON `reminder` FOR EACH ROW INSERT INTO 
  gurulog.`reminder_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `reminder_id`=OLD.reminder_id,
  `account_id`=OLD.account_id,
  `date`=OLD.date,
  `debit_credit`=OLD.debit_credit,
  `amount`=OLD.amount,
  `gold`=OLD.gold,
  `silver`=OLD.silver,
  `remarks`=OLD.remarks,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reminder_insert_after_trigger` AFTER INSERT ON `reminder` FOR EACH ROW INSERT INTO 
  gurulog.`reminder_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `reminder_id`=NEW.reminder_id,
  `account_id`=NEW.account_id,
  `date`=NEW.date,
  `debit_credit`=NEW.debit_credit,
  `amount`=NEW.amount,
  `gold`=NEW.gold,
  `silver`=NEW.silver,
  `remarks`=NEW.remarks,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reminder_update_after_trigger` AFTER UPDATE ON `reminder` FOR EACH ROW INSERT INTO 
  gurulog.`reminder_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `reminder_id`=NEW.reminder_id,
  `account_id`=NEW.account_id,
  `date`=NEW.date,
  `debit_credit`=NEW.debit_credit,
  `amount`=NEW.amount,
  `gold`=NEW.gold,
  `silver`=NEW.silver,
  `remarks`=NEW.remarks,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL,
  `feedback_id` int(11) DEFAULT NULL,
  `assign_to_id` int(11) DEFAULT NULL,
  `reply_date` date DEFAULT NULL,
  `reply` text,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `reply`
--
DELIMITER $$
CREATE TRIGGER `reply_delete_after_trigger` AFTER DELETE ON `reply` FOR EACH ROW INSERT INTO 
  gurulog.`reply_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `reply_id`=OLD.reply_id,
  `feedback_id`=OLD.feedback_id,
  `assign_to_id`=OLD.assign_to_id,
  `reply_date`=OLD.reply_date,
  `reply`=OLD.reply,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reply_insert_after_trigger` AFTER INSERT ON `reply` FOR EACH ROW INSERT INTO 
  gurulog.`reply_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `reply_id`=NEW.reply_id,
  `feedback_id`=NEW.feedback_id,
  `assign_to_id`=NEW.assign_to_id,
  `reply_date`=NEW.reply_date,
  `reply`=NEW.reply,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reply_update_after_trigger` AFTER UPDATE ON `reply` FOR EACH ROW INSERT INTO 
  gurulog.`reply_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `reply_id`=NEW.reply_id,
  `feedback_id`=NEW.feedback_id,
  `assign_to_id`=NEW.assign_to_id,
  `reply_date`=NEW.reply_date,
  `reply`=NEW.reply,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sell`
--

CREATE TABLE `sell` (
  `sell_id` int(11) NOT NULL,
  `sell_no` int(11) DEFAULT NULL,
  `no_for` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = General No, 2 = Only Purchase, 3 = Only Sell, 4 = Only Payment Receipt, 5 = Only Metal Issue Receive',
  `bill_financial_year` varchar(20) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `sell_date` date DEFAULT NULL,
  `sell_remark` varchar(255) DEFAULT NULL,
  `ship_to_name` varchar(255) DEFAULT NULL,
  `ship_to_address` text,
  `order_id` int(11) DEFAULT NULL COMMENT 'Order to Sell : order_id',
  `total_gold_fine` double DEFAULT NULL,
  `total_silver_fine` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `total_c_amount` double NOT NULL DEFAULT '0',
  `total_r_amount` double NOT NULL DEFAULT '0',
  `delivery_type` tinyint(1) DEFAULT '1' COMMENT '1 = Delivered, 2 = Not Delivered',
  `audit_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Pending = 1, Audited = 2, Suspected = 3',
  `discount_amount` double NOT NULL DEFAULT '0',
  `entry_through` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 = Sell/Purchase Default, 2 = Sell/Purchase Type 2, 3 = Sell/Purchase Type 3, 4 = Sell/Purchase Entry with GST',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `sell`
--
DELIMITER $$
CREATE TRIGGER `sell_delete_after_trigger` AFTER DELETE ON `sell` FOR EACH ROW INSERT INTO 
  gurulog.`sell_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `sell_id`=OLD.sell_id,
  `sell_no`=OLD.sell_no,
  `account_id`=OLD.account_id,
  `process_id`=OLD.process_id,
  `sell_date`=OLD.sell_date,
  `sell_remark`=OLD.sell_remark,
  `order_id`=OLD.order_id,
  `total_gold_fine`=OLD.total_gold_fine,
  `total_silver_fine`=OLD.total_silver_fine,
  `total_amount`=OLD.total_amount,
  `delivery_type`=OLD.delivery_type,
  `audit_status`=OLD.audit_status,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sell_insert_after_trigger` AFTER INSERT ON `sell` FOR EACH ROW INSERT INTO 
  gurulog.`sell_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `sell_id`=NEW.sell_id,
  `sell_no`=NEW.sell_no,
  `account_id`=NEW.account_id,
  `process_id`=NEW.process_id,
  `sell_date`=NEW.sell_date,
  `sell_remark`=NEW.sell_remark,
  `order_id`=NEW.order_id,
  `total_gold_fine`=NEW.total_gold_fine,
  `total_silver_fine`=NEW.total_silver_fine,
  `total_amount`=NEW.total_amount,
  `delivery_type`=NEW.delivery_type,
  `audit_status`=NEW.audit_status,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sell_update_after_trigger` AFTER UPDATE ON `sell` FOR EACH ROW INSERT INTO 
  gurulog.`sell_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `sell_id`=NEW.sell_id,
  `sell_no`=NEW.sell_no,
  `account_id`=NEW.account_id,
  `process_id`=NEW.process_id,
  `sell_date`=NEW.sell_date,
  `sell_remark`=NEW.sell_remark,
  `order_id`=NEW.order_id,
  `total_gold_fine`=NEW.total_gold_fine,
  `total_silver_fine`=NEW.total_silver_fine,
  `total_amount`=NEW.total_amount,
  `delivery_type`=NEW.delivery_type,
  `audit_status`=NEW.audit_status,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sell_adjust_cr`
--

CREATE TABLE `sell_adjust_cr` (
  `sell_adjust_cr_id` int(11) NOT NULL,
  `sell_id` int(11) NOT NULL DEFAULT '0',
  `adjust_to` int(11) NOT NULL DEFAULT '1' COMMENT '1 = R Amt To C Amt, 2 = C Amt To R Amt',
  `adjust_cr_amount` double NOT NULL DEFAULT '0',
  `c_amt` double NOT NULL DEFAULT '0',
  `r_amt` double NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sell_ad_charges`
--

CREATE TABLE `sell_ad_charges` (
  `sell_ad_charges_id` int(11) NOT NULL,
  `sell_id` int(11) NOT NULL DEFAULT '0',
  `ad_id` int(11) NOT NULL DEFAULT '0',
  `ad_pcs` double NOT NULL DEFAULT '0',
  `ad_rate` double NOT NULL DEFAULT '0',
  `ad_amount` double NOT NULL DEFAULT '0',
  `c_amt` double NOT NULL DEFAULT '0',
  `r_amt` double NOT NULL DEFAULT '0',
  `ad_charges_remark` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `sell_ad_charges`
--
DELIMITER $$
CREATE TRIGGER `sell_ad_charges_delete_after_trigger` AFTER DELETE ON `sell_ad_charges` FOR EACH ROW INSERT INTO 
  gurulog.`sell_ad_charges_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `sell_ad_charges_id`=OLD.sell_ad_charges_id,
  `sell_id`=OLD.sell_id,
  `ad_id`=OLD.ad_id,
  `ad_pcs`=OLD.ad_pcs,
  `ad_rate`=OLD.ad_rate,
  `ad_amount`=OLD.ad_amount,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sell_ad_charges_insert_after_trigger` AFTER INSERT ON `sell_ad_charges` FOR EACH ROW INSERT INTO 
  gurulog.`sell_ad_charges_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `sell_ad_charges_id`=NEW.sell_ad_charges_id,
  `sell_id`=NEW.sell_id,
  `ad_id`=NEW.ad_id,
  `ad_pcs`=NEW.ad_pcs,
  `ad_rate`=NEW.ad_rate,
  `ad_amount`=NEW.ad_amount,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sell_ad_charges_update_after_trigger` AFTER UPDATE ON `sell_ad_charges` FOR EACH ROW INSERT INTO 
  gurulog.`sell_ad_charges_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `sell_ad_charges_id`=NEW.sell_ad_charges_id,
  `sell_id`=NEW.sell_id,
  `ad_id`=NEW.ad_id,
  `ad_pcs`=NEW.ad_pcs,
  `ad_rate`=NEW.ad_rate,
  `ad_amount`=NEW.ad_amount,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sell_items`
--

CREATE TABLE `sell_items` (
  `sell_item_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `sell_item_no` int(11) DEFAULT NULL,
  `tunch_textbox` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1=Sell, 2=Purchase, 3=Exchange',
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `stamp_id` int(11) DEFAULT NULL,
  `hsn_code` varchar(255) DEFAULT NULL,
  `grwt` double DEFAULT NULL,
  `stone_wt` double DEFAULT NULL,
  `sijat` double DEFAULT NULL,
  `less` double DEFAULT NULL,
  `net_wt` double DEFAULT NULL,
  `spi_loss_for` double NOT NULL DEFAULT '0',
  `spi_loss` double NOT NULL DEFAULT '0',
  `touch_id` double DEFAULT NULL,
  `wstg` double DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `wastage_labour` int(11) DEFAULT NULL,
  `wastage_labour_value` double DEFAULT NULL,
  `spi_labour_on` tinyint(1) DEFAULT NULL COMMENT '1 = PCS, 2 = NetWt@1000',
  `labour_amount` double NOT NULL DEFAULT '0',
  `gold_silver_rate` double NOT NULL DEFAULT '0',
  `gold_silver_amount` double NOT NULL DEFAULT '0',
  `stone_qty` double NOT NULL DEFAULT '0',
  `stone_rs` double NOT NULL DEFAULT '0',
  `item_stock_rfid_id` int(11) DEFAULT NULL,
  `rfid_number` varchar(255) DEFAULT NULL,
  `spi_pcs` double NOT NULL DEFAULT '0',
  `spi_rate` double NOT NULL DEFAULT '0',
  `spi_rate_of` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Item Rate Of : 1 = Labour, 2 = Item',
  `charges_amt` double NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `rate_per_1_gram` double NOT NULL DEFAULT '0',
  `gross_amount` double NOT NULL DEFAULT '0',
  `labout_other_charges` double NOT NULL DEFAULT '0',
  `gst_rate` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `c_amt` double NOT NULL DEFAULT '0',
  `r_amt` double NOT NULL DEFAULT '0',
  `li_narration` text,
  `order_lot_item_id` int(11) DEFAULT NULL COMMENT 'Order to Sell : order_lot_item_id',
  `purchase_sell_item_id` int(11) DEFAULT NULL COMMENT 'Purchase to Sell : purchase_sell_item_id',
  `stock_type` tinyint(1) DEFAULT NULL COMMENT '1 = Purchase, 2 = Exchange, 3 = Stock Transfer, 4 = Receive',
  `wastage_change_approve` varchar(100) DEFAULT '0_0' COMMENT '0_0 = Default Wastage Only, 1_0 = Only Pending Approve Diff Wastage, 1_1 = Approved Diff Wastage',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `sell_items`
--
DELIMITER $$
CREATE TRIGGER `sell_items_delete_after_trigger` AFTER DELETE ON `sell_items` FOR EACH ROW INSERT INTO 
  gurulog.`sell_items_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `sell_item_id`=OLD.sell_item_id,
  `sell_id`=OLD.sell_id,
  `sell_item_no`=OLD.sell_item_no,
  `tunch_textbox`=OLD.tunch_textbox,
  `type`=OLD.type,
  `category_id`=OLD.category_id,
  `item_id`=OLD.item_id,
  `grwt`=OLD.grwt,
  `less`=OLD.less,
  `net_wt`=OLD.net_wt,
  `touch_id`=OLD.touch_id,
  `wstg`=OLD.wstg,
  `fine`=OLD.fine,
  `item_stock_rfid_id`=OLD.item_stock_rfid_id,
  `rfid_number`=OLD.rfid_number,
  `charges_amt`=OLD.charges_amt,
  `image`=OLD.image,
  `order_lot_item_id`=OLD.order_lot_item_id,
  `purchase_sell_item_id`=OLD.purchase_sell_item_id,
  `stock_type`=OLD.stock_type,
  `wastage_change_approve`=OLD.wastage_change_approve,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sell_items_insert_after_trigger` AFTER INSERT ON `sell_items` FOR EACH ROW INSERT INTO 
  gurulog.`sell_items_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `sell_item_id`=NEW.sell_item_id,
  `sell_id`=NEW.sell_id,
  `sell_item_no`=NEW.sell_item_no,
  `tunch_textbox`=NEW.tunch_textbox,
  `type`=NEW.type,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `grwt`=NEW.grwt,
  `less`=NEW.less,
  `net_wt`=NEW.net_wt,
  `touch_id`=NEW.touch_id,
  `wstg`=NEW.wstg,
  `fine`=NEW.fine,
  `item_stock_rfid_id`=NEW.item_stock_rfid_id,
  `rfid_number`=NEW.rfid_number,
  `charges_amt`=NEW.charges_amt,
  `image`=NEW.image,
  `order_lot_item_id`=NEW.order_lot_item_id,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `wastage_change_approve`=NEW.wastage_change_approve,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sell_items_update_after_trigger` AFTER UPDATE ON `sell_items` FOR EACH ROW INSERT INTO 
  gurulog.`sell_items_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `sell_item_id`=NEW.sell_item_id,
  `sell_id`=NEW.sell_id,
  `sell_item_no`=NEW.sell_item_no,
  `tunch_textbox`=NEW.tunch_textbox,
  `type`=NEW.type,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `grwt`=NEW.grwt,
  `less`=NEW.less,
  `net_wt`=NEW.net_wt,
  `touch_id`=NEW.touch_id,
  `wstg`=NEW.wstg,
  `fine`=NEW.fine,
  `item_stock_rfid_id`=NEW.item_stock_rfid_id,
  `rfid_number`=NEW.rfid_number,
  `charges_amt`=NEW.charges_amt,
  `image`=NEW.image,
  `order_lot_item_id`=NEW.order_lot_item_id,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `wastage_change_approve`=NEW.wastage_change_approve,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sell_items_with_gst`
--

CREATE TABLE `sell_items_with_gst` (
  `sell_item_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `sell_item_no` int(11) DEFAULT NULL,
  `tunch_textbox` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1=Sell, 2=Purchase, 3=Exchange',
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `stamp_id` int(11) DEFAULT NULL,
  `hsn_code` varchar(255) DEFAULT NULL,
  `grwt` double DEFAULT NULL,
  `stone_wt` double DEFAULT NULL,
  `sijat` double DEFAULT NULL,
  `less` double DEFAULT NULL,
  `net_wt` double DEFAULT NULL,
  `spi_loss_for` double NOT NULL DEFAULT '0',
  `spi_loss` double NOT NULL DEFAULT '0',
  `touch_id` double DEFAULT NULL,
  `wstg` double DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `wastage_labour` int(11) DEFAULT NULL,
  `wastage_labour_value` double DEFAULT NULL,
  `spi_labour_on` tinyint(1) DEFAULT NULL COMMENT '1 = PCS, 2 = NetWt@1000',
  `labour_amount` double NOT NULL DEFAULT '0',
  `gold_silver_rate` double NOT NULL DEFAULT '0',
  `gold_silver_amount` double NOT NULL DEFAULT '0',
  `stone_qty` double NOT NULL DEFAULT '0',
  `stone_rs` double NOT NULL DEFAULT '0',
  `item_stock_rfid_id` int(11) DEFAULT NULL,
  `rfid_number` varchar(255) DEFAULT NULL,
  `spi_pcs` double NOT NULL DEFAULT '0',
  `spi_rate` double NOT NULL DEFAULT '0',
  `charges_amt` double NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `rate_per_1_gram` double NOT NULL DEFAULT '0',
  `gross_amount` double NOT NULL DEFAULT '0',
  `labout_other_charges` double NOT NULL DEFAULT '0',
  `gst_rate` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0',
  `c_amt` double NOT NULL DEFAULT '0',
  `r_amt` double NOT NULL DEFAULT '0',
  `li_narration` text,
  `order_lot_item_id` int(11) DEFAULT NULL COMMENT 'Order to Sell : order_lot_item_id',
  `purchase_sell_item_id` int(11) DEFAULT NULL COMMENT 'Purchase to Sell : purchase_sell_item_id',
  `stock_type` tinyint(1) DEFAULT NULL COMMENT '1 = Purchase, 2 = Exchange, 3 = Stock Transfer, 4 = Receive',
  `wastage_change_approve` varchar(100) DEFAULT '0_0' COMMENT '0_0 = Default Wastage Only, 1_0 = Only Pending Approve Diff Wastage, 1_1 = Approved Diff Wastage',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sell_item_charges_details`
--

CREATE TABLE `sell_item_charges_details` (
  `sell_item_charges_details_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `sell_item_id` int(11) DEFAULT NULL,
  `sell_item_charges_details_ad_id` int(11) DEFAULT NULL,
  `sell_item_charges_details_net_wt` double DEFAULT NULL,
  `sell_item_charges_details_per_gram` double DEFAULT NULL,
  `sell_item_charges_details_ad_amount` double DEFAULT NULL,
  `sell_item_charges_details_remark` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sell_less_ad_details`
--

CREATE TABLE `sell_less_ad_details` (
  `sell_less_ad_details_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `sell_item_id` int(11) DEFAULT NULL,
  `less_ad_details_ad_id` int(11) DEFAULT NULL,
  `less_ad_details_ad_pcs` double DEFAULT NULL,
  `less_ad_details_ad_weight` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `sell_less_ad_details`
--
DELIMITER $$
CREATE TRIGGER `sell_less_ad_details_delete_after_trigger` AFTER DELETE ON `sell_less_ad_details` FOR EACH ROW INSERT INTO 
  gurulog.`sell_less_ad_details_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `sell_less_ad_details_id`=OLD.sell_less_ad_details_id,
  `sell_id`=OLD.sell_id,
  `sell_item_id`=OLD.sell_item_id,
  `less_ad_details_ad_id`=OLD.less_ad_details_ad_id,
  `less_ad_details_ad_pcs`=OLD.less_ad_details_ad_pcs,
  `less_ad_details_ad_weight`=OLD.less_ad_details_ad_weight,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sell_less_ad_details_insert_after_trigger` AFTER INSERT ON `sell_less_ad_details` FOR EACH ROW INSERT INTO 
  gurulog.`sell_less_ad_details_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `sell_less_ad_details_id`=NEW.sell_less_ad_details_id,
  `sell_id`=NEW.sell_id,
  `sell_item_id`=NEW.sell_item_id,
  `less_ad_details_ad_id`=NEW.less_ad_details_ad_id,
  `less_ad_details_ad_pcs`=NEW.less_ad_details_ad_pcs,
  `less_ad_details_ad_weight`=NEW.less_ad_details_ad_weight,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sell_less_ad_details_update_after_trigger` AFTER UPDATE ON `sell_less_ad_details` FOR EACH ROW INSERT INTO 
  gurulog.`sell_less_ad_details_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `sell_less_ad_details_id`=NEW.sell_less_ad_details_id,
  `sell_id`=NEW.sell_id,
  `sell_item_id`=NEW.sell_item_id,
  `less_ad_details_ad_id`=NEW.less_ad_details_ad_id,
  `less_ad_details_ad_pcs`=NEW.less_ad_details_ad_pcs,
  `less_ad_details_ad_weight`=NEW.less_ad_details_ad_weight,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sell_type`
--

CREATE TABLE `sell_type` (
  `sell_type_id` int(11) NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sell_type`
--

INSERT INTO `sell_type` (`sell_type_id`, `type_name`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Sell', NULL, NULL, NULL, NULL),
(2, 'Purchase', NULL, NULL, NULL, NULL),
(3, 'Exchange', NULL, NULL, NULL, NULL);

--
-- Triggers `sell_type`
--
DELIMITER $$
CREATE TRIGGER `sell_type_delete_after_trigger` AFTER DELETE ON `sell_type` FOR EACH ROW INSERT INTO 
  gurulog.`sell_type_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `sell_type_id`=OLD.sell_type_id,
  `type_name`=OLD.type_name,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sell_type_insert_after_trigger` AFTER INSERT ON `sell_type` FOR EACH ROW INSERT INTO 
  gurulog.`sell_type_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `sell_type_id`=NEW.sell_type_id,
  `type_name`=NEW.type_name,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sell_type_update_after_trigger` AFTER UPDATE ON `sell_type` FOR EACH ROW INSERT INTO 
  gurulog.`sell_type_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `sell_type_id`=NEW.sell_type_id,
  `type_name`=NEW.type_name,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sell_with_gst`
--

CREATE TABLE `sell_with_gst` (
  `sell_id` int(11) NOT NULL,
  `sell_no` int(11) DEFAULT NULL,
  `bill_financial_year` varchar(20) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `sell_date` date DEFAULT NULL,
  `sell_remark` varchar(255) DEFAULT NULL,
  `ship_to_name` varchar(255) DEFAULT NULL,
  `ship_to_address` text,
  `order_id` int(11) DEFAULT NULL COMMENT 'Order to Sell : order_id',
  `total_gold_fine` double DEFAULT NULL,
  `total_silver_fine` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `total_c_amount` double NOT NULL DEFAULT '0',
  `total_r_amount` double NOT NULL DEFAULT '0',
  `delivery_type` tinyint(1) DEFAULT '1' COMMENT '1 = Delivered, 2 = Not Delivered',
  `audit_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Pending = 1, Audited = 2, Suspected = 3',
  `discount_amount` double NOT NULL DEFAULT '0',
  `round_of_amount` double NOT NULL DEFAULT '0',
  `tcs_per` double NOT NULL DEFAULT '0',
  `tcs_amount` double NOT NULL DEFAULT '0',
  `entry_through` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 = Sell/Purchase Default, 2 = Sell/Purchase Type 2, 3 = Sell/Purchase Type 3, 4 = Sell/Purchase Entry with GST',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `settings_key` varchar(255) DEFAULT NULL,
  `settings_label` varchar(255) DEFAULT NULL,
  `settings_value` varchar(255) DEFAULT NULL,
  `fields_section` int(11) NOT NULL DEFAULT '0' COMMENT '0 = General, 1 = Rate, 2 = Sell/Purchase, 3 = Login, 4 = Manufacturing, 5 = XRF / HM / Laser, 6 = Company Details'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `settings_key`, `settings_label`, `settings_value`, `fields_section`) VALUES
(1, 'gold_rate', 'Gold Rate', '50000', 1),
(2, 'gold_min', 'Gold Minimum', '49000', 1),
(3, 'gold_max', 'Gold Maximum', '49500', 1),
(4, 'silver_rate', 'Silver Rate', '700', 1),
(5, 'silver_min', 'Silver Minimum', '595', 1),
(6, 'silver_max', 'Silver Maximum', '605', 1),
(7, 'login_time_start', 'Login From', '06:00 AM', 3),
(8, 'login_time_end', 'Login To', '11:59 PM', 3),
(9, 'without_purchase_sell_allow', 'Allow Sell Only If Stock Available', '0', 0),
(10, 'set_backup_email', 'Set ReCalculate', 'omviravinash@gmail.com', 0),
(11, 'send_otp_mobile_no', 'Send OTP Mobile No', '', 3),
(12, 'worker_gold_rate', 'Worker Gold Rate', '47000', 1),
(13, 'machine_chain_operation_solding_curb_default_value', 'Machine Chain Operation Solding Curb Default Value', '0.2', 4),
(14, 'machine_chain_operation_solding_box_default_value', 'Machine Chain Operation Solding Box Default Value', '0.7', 4),
(15, 'hallmark_xrf_print_first_line', 'XRF Print First Line', 'Ph. 0291-2623521, 9413623521', 5),
(16, 'theme_color_code', 'Theme Color Code', '#3c8dbc', 0),
(17, 'enter_key_to_next', 'Click on enter key to next Object', '1', 0),
(18, 'use_rfid', 'Use RFID', '1', 0),
(19, 'use_barcode', 'Use Barcode', '0', 0),
(20, 'sell_purchase_difference', 'Sell/Purchase Menu Separately', '0', 2),
(21, 'show_backup_email_menu', 'Show ReCalculate Menu', '1', 0),
(22, 'ask_ad_charges_in_sell_purchase', 'Ask Ad Charges In Sell / Purchase', '1', 2),
(23, 'ask_less_ad_details_in_sell_purchase', 'Ask Less Ad Details In Sell / Purchase', '1', 2),
(24, 'use_category', 'Use Category', '1', 0),
(25, 'department_2', 'Department', '1', 2),
(26, 'remark_2', 'Remark', '1', 2),
(27, 'delivered_not_2', 'Delivered / Not', '1', 2),
(28, 'tunch_textbox_2', 'Tunch Textbox', '1', 2),
(29, 'charges_2', 'Charges', '1', 2),
(30, 'less_netwt_2', 'Less NetWt', '1', 2),
(31, 'wstg_2', 'Wstg', '1', 2),
(32, 'lineitem_image_2', 'Lineitem Image', '1', 2),
(33, 'price_per_pcs', 'Price / Per Pcs', '35', 0),
(34, 'manufacture_lott_complete_in', 'Manufacture Lott Complete in', '3', 4),
(35, 'xrf_box_no_mandatory', 'XRF Box No. Mandatory', '0', 5),
(36, 'company_name', 'Company Name', 'Jewellers', 6),
(37, 'company_contact', 'Company Contact', '', 6),
(38, 'company_address', 'Company Address', '', 6),
(39, 'rate_on', 'Rate on', '2', 1),
(40, 'issue_receive_karigar_wastage', 'Issue Receive Karigar Wastage Post To Account?', '0', 4),
(41, 'ask_discount_in_sell_purchase', 'Ask Discount in Sell / Purchase', '0', 2),
(42, 'display_net_amount_in_outstanding', 'Display Net Amount in Outstanding', '1', 0),
(43, 'c_r_amount_separate', 'C/R Amount Separate', '0', 2),
(44, 'approx_amount', 'Approx Amount', '1', 2),
(45, 'sell_purchase_type_2', 'Sell/Purchase Type 2', '0', 2),
(46, 'sell_purchase_type_3', 'Sell/Purchase Type 3', '0', 2),
(47, 'account_mobile_no_is_required', 'Account Mobile No is Required', '1', 0),
(48, 'line_item_remark', 'Line Item Remark', '0', 2),
(49, 'line_item_gold_silver_rate', 'Line Item Rate', '0', 2),
(50, 'display_line_item_remark_in_ledger', 'Display Line Item Remark in Ledger', '0', 2),
(51, 'display_line_item_remark_in_print', 'Display Line Item Remark in Print', '0', 2),
(52, 'sell_purchase_entry_with_gst', 'Sell Purchase Entry with GST', '0', 2),
(53, 'sell_purchase_print_display_gold_fine_column', 'Sell Purchase Print Display Gold Fine Column', '1', 2),
(54, 'ledger_print_in_page_a5', 'Ledger Print in Page A5(default A4)', '0', 0),
(55, 'default_from_financial_start_year', 'Default From \"01-04-Financial Start Year\"', '0', 0),
(56, 'inventory_data_modules', 'Inventory Data Modules', '0', 0);

--
-- Triggers `settings`
--
DELIMITER $$
CREATE TRIGGER `settings_delete_after_trigger` AFTER DELETE ON `settings` FOR EACH ROW INSERT INTO 
  gurulog.`settings_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `settings_id`=OLD.settings_id,
  `settings_key`=OLD.settings_key,
  `settings_label`=OLD.settings_label,
  `settings_value`=OLD.settings_value
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `settings_insert_after_trigger` AFTER INSERT ON `settings` FOR EACH ROW INSERT INTO 
  gurulog.`settings_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `settings_id`=NEW.settings_id,
  `settings_key`=NEW.settings_key,
  `settings_label`=NEW.settings_label,
  `settings_value`=NEW.settings_value
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `settings_update_after_trigger` AFTER UPDATE ON `settings` FOR EACH ROW INSERT INTO 
  gurulog.`settings_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `settings_id`=NEW.settings_id,
  `settings_key`=NEW.settings_key,
  `settings_label`=NEW.settings_label,
  `settings_value`=NEW.settings_value
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `setting_mac_address`
--

CREATE TABLE `setting_mac_address` (
  `id` int(11) NOT NULL,
  `mac_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `setting_mac_address`
--
DELIMITER $$
CREATE TRIGGER `setting_mac_address_delete_after_trigger` AFTER DELETE ON `setting_mac_address` FOR EACH ROW INSERT INTO 
  gurulog.`setting_mac_address_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `setting_mac_address_id`=OLD.id,
  `mac_address`=OLD.mac_address
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `setting_mac_address_insert_after_trigger` AFTER INSERT ON `setting_mac_address` FOR EACH ROW INSERT INTO 
  gurulog.`setting_mac_address_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `setting_mac_address_id`=NEW.id,
  `mac_address`=NEW.mac_address
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `setting_mac_address_update_after_trigger` AFTER UPDATE ON `setting_mac_address` FOR EACH ROW INSERT INTO 
  gurulog.`setting_mac_address_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `setting_mac_address_id`=NEW.id,
  `mac_address`=NEW.mac_address
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `silver_bhav`
--

CREATE TABLE `silver_bhav` (
  `silver_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `silver_sale_purchase` tinyint(1) DEFAULT NULL COMMENT '1 = Sale, 2 = Purchase',
  `silver_weight` double DEFAULT NULL,
  `silver_rate` double DEFAULT NULL,
  `silver_value` double DEFAULT NULL,
  `silver_cr_effect` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = C Amt, 2 = R Amt',
  `c_amt` double NOT NULL DEFAULT '0',
  `r_amt` double NOT NULL DEFAULT '0',
  `silver_narration` text,
  `through_lineitem` tinyint(1) DEFAULT NULL COMMENT '1 = Silver Bhav entry through Lineitem',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `silver_bhav`
--
DELIMITER $$
CREATE TRIGGER `silver_bhav_delete_after_trigger` AFTER DELETE ON `silver_bhav` FOR EACH ROW INSERT INTO 
  gurulog.`silver_bhav_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `silver_id`=OLD.silver_id,
  `sell_id`=OLD.sell_id,
  `silver_sale_purchase`=OLD.silver_sale_purchase,
  `silver_weight`=OLD.silver_weight,
  `silver_rate`=OLD.silver_rate,
  `silver_value`=OLD.silver_value,
  `silver_narration`=OLD.silver_narration,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `silver_bhav_insert_after_trigger` AFTER INSERT ON `silver_bhav` FOR EACH ROW INSERT INTO 
  gurulog.`silver_bhav_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `silver_id`=NEW.silver_id,
  `sell_id`=NEW.sell_id,
  `silver_sale_purchase`=NEW.silver_sale_purchase,
  `silver_weight`=NEW.silver_weight,
  `silver_rate`=NEW.silver_rate,
  `silver_value`=NEW.silver_value,
  `silver_narration`=NEW.silver_narration,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `silver_bhav_update_after_trigger` AFTER UPDATE ON `silver_bhav` FOR EACH ROW INSERT INTO 
  gurulog.`silver_bhav_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `silver_id`=NEW.silver_id,
  `sell_id`=NEW.sell_id,
  `silver_sale_purchase`=NEW.silver_sale_purchase,
  `silver_weight`=NEW.silver_weight,
  `silver_rate`=NEW.silver_rate,
  `silver_value`=NEW.silver_value,
  `silver_narration`=NEW.silver_narration,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stamp`
--

CREATE TABLE `stamp` (
  `stamp_id` int(11) NOT NULL,
  `stamp_name` varchar(222) DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1=deleted,0=not deleted',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(222) DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '1=deleted,0=not deleted',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`, `is_deleted`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Gujarat', 0, 1, '2017-07-18 18:13:57', 1, '2017-07-18 18:13:57'),
(2, 'Rajasthan', 0, 1, '2017-07-18 18:14:13', 1, '2017-07-18 18:14:55'),
(3, 'UP', 0, 1, '2017-07-18 18:14:36', 1, '2017-07-18 18:14:46'),
(4, 'Maharastra', 0, 1, '2017-07-20 09:39:34', 1, '2017-07-20 09:39:34');

--
-- Triggers `state`
--
DELIMITER $$
CREATE TRIGGER `state_delete_after_trigger` AFTER DELETE ON `state` FOR EACH ROW INSERT INTO 
  gurulog.`state_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `state_id`=OLD.state_id,
  `state_name`=OLD.state_name,
  `is_deleted`=OLD.is_deleted,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `state_insert_after_trigger` AFTER INSERT ON `state` FOR EACH ROW INSERT INTO 
  gurulog.`state_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `state_id`=NEW.state_id,
  `state_name`=NEW.state_name,
  `is_deleted`=NEW.is_deleted,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `state_update_after_trigger` AFTER UPDATE ON `state` FOR EACH ROW INSERT INTO 
  gurulog.`state_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `state_id`=NEW.state_id,
  `state_name`=NEW.state_name,
  `is_deleted`=NEW.is_deleted,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfer`
--

CREATE TABLE `stock_transfer` (
  `stock_transfer_id` int(11) NOT NULL,
  `transfer_date` date DEFAULT NULL,
  `from_department` int(11) DEFAULT NULL,
  `to_department` int(11) DEFAULT NULL,
  `narration` text,
  `total_gold_fine` double NOT NULL DEFAULT '0',
  `total_silver_fine` double NOT NULL DEFAULT '0',
  `audit_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Pending = 1, Audited = 2, Suspected = 3',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `guard_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not Checked, 1 = Checked',
  `guard_checked_narration` text,
  `guard_checked_first_at` datetime DEFAULT NULL,
  `guard_checked_last_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `stock_transfer`
--
DELIMITER $$
CREATE TRIGGER `stock_transfer_delete_after_trigger` AFTER DELETE ON `stock_transfer` FOR EACH ROW INSERT INTO 
  gurulog.`stock_transfer_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `stock_transfer_id`=OLD.stock_transfer_id,
  `transfer_date`=OLD.transfer_date,
  `from_department`=OLD.from_department,
  `to_department`=OLD.to_department,
  `narration`=OLD.narration,
  `total_gold_fine`=OLD.total_gold_fine,
  `total_silver_fine`=OLD.total_silver_fine,
  `audit_status`=OLD.audit_status,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at,
  `guard_checked`=OLD.guard_checked,
  `guard_checked_narration`=OLD.guard_checked_narration,
  `guard_checked_first_at`=OLD.guard_checked_first_at,
  `guard_checked_last_at`=OLD.guard_checked_last_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `stock_transfer_insert_after_trigger` AFTER INSERT ON `stock_transfer` FOR EACH ROW INSERT INTO 
  gurulog.`stock_transfer_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `stock_transfer_id`=NEW.stock_transfer_id,
  `transfer_date`=NEW.transfer_date,
  `from_department`=NEW.from_department,
  `to_department`=NEW.to_department,
  `narration`=NEW.narration,
  `total_gold_fine`=NEW.total_gold_fine,
  `total_silver_fine`=NEW.total_silver_fine,
  `audit_status`=NEW.audit_status,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at,
  `guard_checked`=NEW.guard_checked,
  `guard_checked_narration`=NEW.guard_checked_narration,
  `guard_checked_first_at`=NEW.guard_checked_first_at,
  `guard_checked_last_at`=NEW.guard_checked_last_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `stock_transfer_update_after_trigger` AFTER UPDATE ON `stock_transfer` FOR EACH ROW INSERT INTO 
  gurulog.`stock_transfer_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `stock_transfer_id`=NEW.stock_transfer_id,
  `transfer_date`=NEW.transfer_date,
  `from_department`=NEW.from_department,
  `to_department`=NEW.to_department,
  `narration`=NEW.narration,
  `total_gold_fine`=NEW.total_gold_fine,
  `total_silver_fine`=NEW.total_silver_fine,
  `audit_status`=NEW.audit_status,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at,
  `guard_checked`=NEW.guard_checked,
  `guard_checked_narration`=NEW.guard_checked_narration,
  `guard_checked_first_at`=NEW.guard_checked_first_at,
  `guard_checked_last_at`=NEW.guard_checked_last_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfer_detail`
--

CREATE TABLE `stock_transfer_detail` (
  `transfer_detail_id` int(11) NOT NULL,
  `stock_transfer_id` int(11) DEFAULT NULL,
  `tunch_textbox` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `tunch` double DEFAULT NULL,
  `grwt` double DEFAULT NULL,
  `less` double DEFAULT NULL,
  `ntwt` double DEFAULT NULL,
  `wstg` double DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `from_item_stock_rfid_id` int(11) DEFAULT NULL,
  `to_item_stock_rfid_id` int(11) DEFAULT NULL,
  `rfid_number` varchar(255) DEFAULT NULL,
  `purchase_sell_item_id` int(11) DEFAULT NULL COMMENT 'Purchase to Sell : purchase_sell_item_id',
  `stock_type` tinyint(1) DEFAULT NULL COMMENT '1 = Purchase, 2 = Exchange, 3 = Stock Transfer, 4 = Receive',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `stock_transfer_detail`
--
DELIMITER $$
CREATE TRIGGER `stock_transfer_detail_delete_after_trigger` AFTER DELETE ON `stock_transfer_detail` FOR EACH ROW INSERT INTO 
  gurulog.`stock_transfer_detail_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `transfer_detail_id`=OLD.transfer_detail_id,
  `stock_transfer_id`=OLD.stock_transfer_id,
  `tunch_textbox`=OLD.tunch_textbox,
  `category_id`=OLD.category_id,
  `item_id`=OLD.item_id,
  `tunch`=OLD.tunch,
  `grwt`=OLD.grwt,
  `less`=OLD.less,
  `ntwt`=OLD.ntwt,
  `wstg`=OLD.wstg,
  `fine`=OLD.fine,
  `from_item_stock_rfid_id`=OLD.from_item_stock_rfid_id,
  `to_item_stock_rfid_id`=OLD.to_item_stock_rfid_id,
  `rfid_number`=OLD.rfid_number,
  `purchase_sell_item_id`=OLD.purchase_sell_item_id,
  `stock_type`=OLD.stock_type,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `stock_transfer_detail_insert_after_trigger` AFTER INSERT ON `stock_transfer_detail` FOR EACH ROW INSERT INTO 
  gurulog.`stock_transfer_detail_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `transfer_detail_id`=NEW.transfer_detail_id,
  `stock_transfer_id`=NEW.stock_transfer_id,
  `tunch_textbox`=NEW.tunch_textbox,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `tunch`=NEW.tunch,
  `grwt`=NEW.grwt,
  `less`=NEW.less,
  `ntwt`=NEW.ntwt,
  `wstg`=NEW.wstg,
  `fine`=NEW.fine,
  `from_item_stock_rfid_id`=NEW.from_item_stock_rfid_id,
  `to_item_stock_rfid_id`=NEW.to_item_stock_rfid_id,
  `rfid_number`=NEW.rfid_number,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `stock_transfer_detail_update_after_trigger` AFTER UPDATE ON `stock_transfer_detail` FOR EACH ROW INSERT INTO 
  gurulog.`stock_transfer_detail_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `transfer_detail_id`=NEW.transfer_detail_id,
  `stock_transfer_id`=NEW.stock_transfer_id,
  `tunch_textbox`=NEW.tunch_textbox,
  `category_id`=NEW.category_id,
  `item_id`=NEW.item_id,
  `tunch`=NEW.tunch,
  `grwt`=NEW.grwt,
  `less`=NEW.less,
  `ntwt`=NEW.ntwt,
  `wstg`=NEW.wstg,
  `fine`=NEW.fine,
  `from_item_stock_rfid_id`=NEW.from_item_stock_rfid_id,
  `to_item_stock_rfid_id`=NEW.to_item_stock_rfid_id,
  `rfid_number`=NEW.rfid_number,
  `purchase_sell_item_id`=NEW.purchase_sell_item_id,
  `stock_type`=NEW.stock_type,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `transfer_id` int(11) NOT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `naam_jama` tinyint(1) DEFAULT NULL COMMENT '1 = Naam, 2 = Jama',
  `transfer_account_id` int(11) DEFAULT NULL,
  `transfer_gold` double DEFAULT NULL,
  `transfer_silver` double DEFAULT NULL,
  `transfer_amount` double DEFAULT NULL,
  `c_amt` double NOT NULL DEFAULT '0',
  `r_amt` double NOT NULL DEFAULT '0',
  `transfer_narration` text,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `transfer`
--
DELIMITER $$
CREATE TRIGGER `transfer_delete_after_trigger` AFTER DELETE ON `transfer` FOR EACH ROW INSERT INTO 
  gurulog.`transfer_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `transfer_id`=OLD.transfer_id,
  `sell_id`=OLD.sell_id,
  `naam_jama`=OLD.naam_jama,
  `transfer_account_id`=OLD.transfer_account_id,
  `transfer_gold`=OLD.transfer_gold,
  `transfer_silver`=OLD.transfer_silver,
  `transfer_amount`=OLD.transfer_amount,
  `transfer_narration`=OLD.transfer_narration,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `transfer_insert_after_trigger` AFTER INSERT ON `transfer` FOR EACH ROW INSERT INTO 
  gurulog.`transfer_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `transfer_id`=NEW.transfer_id,
  `sell_id`=NEW.sell_id,
  `naam_jama`=NEW.naam_jama,
  `transfer_account_id`=NEW.transfer_account_id,
  `transfer_gold`=NEW.transfer_gold,
  `transfer_silver`=NEW.transfer_silver,
  `transfer_amount`=NEW.transfer_amount,
  `transfer_narration`=NEW.transfer_narration,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `transfer_update_after_trigger` AFTER UPDATE ON `transfer` FOR EACH ROW INSERT INTO 
  gurulog.`transfer_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `transfer_id`=NEW.transfer_id,
  `sell_id`=NEW.sell_id,
  `naam_jama`=NEW.naam_jama,
  `transfer_account_id`=NEW.transfer_account_id,
  `transfer_gold`=NEW.transfer_gold,
  `transfer_silver`=NEW.transfer_silver,
  `transfer_amount`=NEW.transfer_amount,
  `transfer_narration`=NEW.transfer_narration,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tunch_testing`
--

CREATE TABLE `tunch_testing` (
  `tunch_testing_id` int(11) NOT NULL,
  `entry_date` date DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `remark` text,
  `purchase_gr_wt` double DEFAULT NULL,
  `purchase_tunch` double DEFAULT NULL,
  `purchase_fine` double DEFAULT NULL,
  `payment_no` int(11) DEFAULT NULL,
  `payment_amount` double DEFAULT NULL,
  `receipt_amount` double DEFAULT NULL,
  `gold_bhav_type_id` tinyint(1) DEFAULT NULL COMMENT '1 = Sell, 2 = Purchase',
  `gold_bhav_gr_wt` double DEFAULT NULL,
  `gold_bhav_rate` double DEFAULT NULL,
  `gold_bhav_amount` double DEFAULT NULL,
  `sell_gr_wt` double DEFAULT NULL,
  `sell_tunch` double DEFAULT NULL,
  `sell_fine` double DEFAULT NULL,
  `auto_fill_pending_wt` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `twilio_webhook_demo`
--

CREATE TABLE `twilio_webhook_demo` (
  `id` int(11) NOT NULL,
  `webhook_type` varchar(255) DEFAULT NULL,
  `webhook_content` text CHARACTER SET utf8,
  `message_from` varchar(100) DEFAULT NULL,
  `message_to` varchar(100) DEFAULT NULL,
  `message_body` text CHARACTER SET utf8,
  `message_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `twilio_webhook_demo`
--
DELIMITER $$
CREATE TRIGGER `twilio_webhook_demo_delete_after_trigger` AFTER DELETE ON `twilio_webhook_demo` FOR EACH ROW INSERT INTO 
  gurulog.`twilio_webhook_demo_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `ai_id`=OLD.id,
  `webhook_type`=OLD.webhook_type,
  `webhook_content`=OLD.webhook_content,
  `message_from`=OLD.message_from,
  `message_to`=OLD.message_to,
  `message_body`=OLD.message_body,
  `message_status`=OLD.message_status,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `twilio_webhook_demo_insert_after_trigger` AFTER INSERT ON `twilio_webhook_demo` FOR EACH ROW INSERT INTO 
  gurulog.`twilio_webhook_demo_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `ai_id`=NEW.id,
  `webhook_type`=NEW.webhook_type,
  `webhook_content`=NEW.webhook_content,
  `message_from`=NEW.message_from,
  `message_to`=NEW.message_to,
  `message_body`=NEW.message_body,
  `message_status`=NEW.message_status,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `twilio_webhook_demo_update_after_trigger` AFTER UPDATE ON `twilio_webhook_demo` FOR EACH ROW INSERT INTO 
  gurulog.`twilio_webhook_demo_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `ai_id`=NEW.id,
  `webhook_type`=NEW.webhook_type,
  `webhook_content`=NEW.webhook_content,
  `message_from`=NEW.message_from,
  `message_to`=NEW.message_to,
  `message_body`=NEW.message_body,
  `message_status`=NEW.message_status,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_account_group`
--

CREATE TABLE `user_account_group` (
  `ud_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `account_group_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `user_account_group`
--
DELIMITER $$
CREATE TRIGGER `user_account_group_delete_after_trigger` AFTER DELETE ON `user_account_group` FOR EACH ROW INSERT INTO 
  gurulog.`user_account_group_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `ud_id`=OLD.ud_id,
  `user_id`=OLD.user_id,
  `account_group_id`=OLD.account_group_id,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_account_group_insert_after_trigger` AFTER INSERT ON `user_account_group` FOR EACH ROW INSERT INTO 
  gurulog.`user_account_group_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `ud_id`=NEW.ud_id,
  `user_id`=NEW.user_id,
  `account_group_id`=NEW.account_group_id,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_account_group_update_after_trigger` AFTER UPDATE ON `user_account_group` FOR EACH ROW INSERT INTO 
  gurulog.`user_account_group_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `ud_id`=NEW.ud_id,
  `user_id`=NEW.user_id,
  `account_group_id`=NEW.account_group_id,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_department`
--

CREATE TABLE `user_department` (
  `ud_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `user_department`
--
DELIMITER $$
CREATE TRIGGER `user_department_delete_after_trigger` AFTER DELETE ON `user_department` FOR EACH ROW INSERT INTO 
  gurulog.`user_department_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `ud_id`=OLD.ud_id,
  `user_id`=OLD.user_id,
  `department_id`=OLD.department_id,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_department_insert_after_trigger` AFTER INSERT ON `user_department` FOR EACH ROW INSERT INTO 
  gurulog.`user_department_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `ud_id`=NEW.ud_id,
  `user_id`=NEW.user_id,
  `department_id`=NEW.department_id,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_department_update_after_trigger` AFTER UPDATE ON `user_department` FOR EACH ROW INSERT INTO 
  gurulog.`user_department_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `ud_id`=NEW.ud_id,
  `user_id`=NEW.user_id,
  `department_id`=NEW.department_id,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_family_member`
--

CREATE TABLE `user_family_member` (
  `fm_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  `member_phone_no` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `user_family_member`
--
DELIMITER $$
CREATE TRIGGER `user_family_member_delete_after_trigger` AFTER DELETE ON `user_family_member` FOR EACH ROW INSERT INTO 
  gurulog.`user_family_member_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `fm_id`=OLD.fm_id,
  `user_id`=OLD.user_id,
  `member_name`=OLD.member_name,
  `member_phone_no`=OLD.member_phone_no,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_family_member_insert_after_trigger` AFTER INSERT ON `user_family_member` FOR EACH ROW INSERT INTO 
  gurulog.`user_family_member_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `fm_id`=NEW.fm_id,
  `user_id`=NEW.user_id,
  `member_name`=NEW.member_name,
  `member_phone_no`=NEW.member_phone_no,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_family_member_update_after_trigger` AFTER UPDATE ON `user_family_member` FOR EACH ROW INSERT INTO 
  gurulog.`user_family_member_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `fm_id`=NEW.fm_id,
  `user_id`=NEW.user_id,
  `member_name`=NEW.member_name,
  `member_phone_no`=NEW.member_phone_no,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE `user_master` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `login_username` varchar(255) DEFAULT NULL,
  `user_mobile` varchar(15) DEFAULT NULL,
  `user_type` tinyint(1) DEFAULT NULL COMMENT '1 = Admin, 2 = User',
  `is_cad_designer` tinyint(1) NOT NULL DEFAULT '0',
  `default_department_id` int(11) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `allow_all_accounts` tinyint(1) DEFAULT '1' COMMENT '1=Allow All, 2=Allow Only Selected',
  `selected_accounts` text,
  `files` text,
  `default_user_photo` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT 'Active=0; Inactive = 1;',
  `is_login` tinyint(1) DEFAULT '0' COMMENT '1 = login, 0 = not login',
  `socket_id` varchar(255) DEFAULT NULL,
  `otp_value` varchar(255) DEFAULT NULL,
  `otp_on_user` tinyint(1) DEFAULT NULL COMMENT '1=Yes;0=No',
  `designation` varchar(255) DEFAULT NULL,
  `aadhaar_no` varchar(100) DEFAULT NULL,
  `pan_no` varchar(100) DEFAULT NULL,
  `licence_no` varchar(100) DEFAULT NULL,
  `voter_id_no` varchar(100) DEFAULT NULL,
  `esi_no` varchar(255) DEFAULT NULL,
  `pf_no` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `order_display_only_assigned_account` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = Not Checked, 1 = Checked',
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_branch` varchar(255) DEFAULT NULL,
  `bank_acc_name` varchar(255) DEFAULT NULL,
  `bank_acc_no` varchar(255) DEFAULT NULL,
  `bank_ifsc` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_id`, `user_name`, `login_username`, `user_mobile`, `user_type`, `is_cad_designer`, `default_department_id`, `user_password`, `salary`, `blood_group`, `allow_all_accounts`, `selected_accounts`, `files`, `default_user_photo`, `status`, `is_login`, `socket_id`, `otp_value`, `otp_on_user`, `designation`, `aadhaar_no`, `pan_no`, `licence_no`, `voter_id_no`, `esi_no`, `pf_no`, `date_of_birth`, `order_display_only_assigned_account`, `bank_name`, `bank_branch`, `bank_acc_name`, `bank_acc_no`, `bank_ifsc`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'admin', 'admin', '1234567890', 1, 0, 361, 'admin', 121000, '', 1, NULL, NULL, NULL, 0, 0, NULL, '491851', NULL, 'md', '123456789123', '', '', '', '', '', NULL, 1, '', '', '', '', '', 1, '2019-09-16 17:57:53', 1, '2021-11-07 16:27:45');

--
-- Triggers `user_master`
--
DELIMITER $$
CREATE TRIGGER `user_master_delete_after_trigger` AFTER DELETE ON `user_master` FOR EACH ROW INSERT INTO 
  gurulog.`user_master_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `user_id`=OLD.user_id,
  `user_name`=OLD.user_name,
  `login_username`=OLD.login_username,
  `user_mobile`=OLD.user_mobile,
  `user_type`=OLD.user_type,
  `is_cad_designer`=OLD.is_cad_designer,
  `default_department_id`=OLD.default_department_id,
  `user_password`=OLD.user_password,
  `salary`=OLD.salary,
  `blood_group`=OLD.blood_group,
  `allow_all_accounts`=OLD.allow_all_accounts,
  `selected_accounts`=OLD.selected_accounts,
  `files`=OLD.files,
  `default_user_photo`=OLD.default_user_photo,
  `status`=OLD.status,
  `is_login`=OLD.is_login,
  `socket_id`=OLD.socket_id,
  `otp_value`=OLD.otp_value,
  `otp_on_user`=OLD.otp_on_user,
  `designation`=OLD.designation,
  `aadhaar_no`=OLD.aadhaar_no,
  `pan_no`=OLD.pan_no,
  `licence_no`=OLD.licence_no,
  `voter_id_no`=OLD.voter_id_no,
  `esi_no`=OLD.esi_no,
  `pf_no`=OLD.pf_no,
  `date_of_birth`=OLD.date_of_birth,
  `order_display_only_assigned_account`=OLD.order_display_only_assigned_account,
  `bank_name`=OLD.bank_name,
  `bank_branch`=OLD.bank_branch,
  `bank_acc_name`=OLD.bank_acc_name,
  `bank_acc_no`=OLD.bank_acc_no,
  `bank_ifsc`=OLD.bank_ifsc,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_master_insert_after_trigger` AFTER INSERT ON `user_master` FOR EACH ROW INSERT INTO 
  gurulog.`user_master_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `user_id`=NEW.user_id,
  `user_name`=NEW.user_name,
  `login_username`=NEW.login_username,
  `user_mobile`=NEW.user_mobile,
  `user_type`=NEW.user_type,
  `is_cad_designer`=NEW.is_cad_designer,
  `default_department_id`=NEW.default_department_id,
  `user_password`=NEW.user_password,
  `salary`=NEW.salary,
  `blood_group`=NEW.blood_group,
  `allow_all_accounts`=NEW.allow_all_accounts,
  `selected_accounts`=NEW.selected_accounts,
  `files`=NEW.files,
  `default_user_photo`=NEW.default_user_photo,
  `status`=NEW.status,
  `is_login`=NEW.is_login,
  `socket_id`=NEW.socket_id,
  `otp_value`=NEW.otp_value,
  `otp_on_user`=NEW.otp_on_user,
  `designation`=NEW.designation,
  `aadhaar_no`=NEW.aadhaar_no,
  `pan_no`=NEW.pan_no,
  `licence_no`=NEW.licence_no,
  `voter_id_no`=NEW.voter_id_no,
  `esi_no`=NEW.esi_no,
  `pf_no`=NEW.pf_no,
  `date_of_birth`=NEW.date_of_birth,
  `order_display_only_assigned_account`=NEW.order_display_only_assigned_account,
  `bank_name`=NEW.bank_name,
  `bank_branch`=NEW.bank_branch,
  `bank_acc_name`=NEW.bank_acc_name,
  `bank_acc_no`=NEW.bank_acc_no,
  `bank_ifsc`=NEW.bank_ifsc,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_master_update_after_trigger` AFTER UPDATE ON `user_master` FOR EACH ROW INSERT INTO 
  gurulog.`user_master_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `user_id`=NEW.user_id,
  `user_name`=NEW.user_name,
  `login_username`=NEW.login_username,
  `user_mobile`=NEW.user_mobile,
  `user_type`=NEW.user_type,
  `is_cad_designer`=NEW.is_cad_designer,
  `default_department_id`=NEW.default_department_id,
  `user_password`=NEW.user_password,
  `salary`=NEW.salary,
  `blood_group`=NEW.blood_group,
  `allow_all_accounts`=NEW.allow_all_accounts,
  `selected_accounts`=NEW.selected_accounts,
  `files`=NEW.files,
  `default_user_photo`=NEW.default_user_photo,
  `status`=NEW.status,
  `is_login`=NEW.is_login,
  `socket_id`=NEW.socket_id,
  `otp_value`=NEW.otp_value,
  `otp_on_user`=NEW.otp_on_user,
  `designation`=NEW.designation,
  `aadhaar_no`=NEW.aadhaar_no,
  `pan_no`=NEW.pan_no,
  `licence_no`=NEW.licence_no,
  `voter_id_no`=NEW.voter_id_no,
  `esi_no`=NEW.esi_no,
  `pf_no`=NEW.pf_no,
  `date_of_birth`=NEW.date_of_birth,
  `order_display_only_assigned_account`=NEW.order_display_only_assigned_account,
  `bank_name`=NEW.bank_name,
  `bank_branch`=NEW.bank_branch,
  `bank_acc_name`=NEW.bank_acc_name,
  `bank_acc_no`=NEW.bank_acc_no,
  `bank_ifsc`=NEW.bank_ifsc,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_order_department`
--

CREATE TABLE `user_order_department` (
  `ud_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `user_order_department`
--
DELIMITER $$
CREATE TRIGGER `user_order_department_delete_after_trigger` AFTER DELETE ON `user_order_department` FOR EACH ROW INSERT INTO 
  gurulog.`user_order_department_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `ud_id`=OLD.ud_id,
  `user_id`=OLD.user_id,
  `department_id`=OLD.department_id,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_order_department_insert_after_trigger` AFTER INSERT ON `user_order_department` FOR EACH ROW INSERT INTO 
  gurulog.`user_order_department_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `ud_id`=NEW.ud_id,
  `user_id`=NEW.user_id,
  `department_id`=NEW.department_id,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_order_department_update_after_trigger` AFTER UPDATE ON `user_order_department` FOR EACH ROW INSERT INTO 
  gurulog.`user_order_department_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `ud_id`=NEW.ud_id,
  `user_id`=NEW.user_id,
  `department_id`=NEW.department_id,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `website_module_id` int(11) DEFAULT NULL,
  `role_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `user_roles`
--
DELIMITER $$
CREATE TRIGGER `user_roles_delete_after_trigger` AFTER DELETE ON `user_roles` FOR EACH ROW INSERT INTO 
  gurulog.`user_roles_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `user_role_id`=OLD.user_role_id,
  `user_id`=OLD.user_id,
  `website_module_id`=OLD.website_module_id,
  `role_type_id`=OLD.role_type_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_roles_insert_after_trigger` AFTER INSERT ON `user_roles` FOR EACH ROW INSERT INTO 
  gurulog.`user_roles_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `user_role_id`=NEW.user_role_id,
  `user_id`=NEW.user_id,
  `website_module_id`=NEW.website_module_id,
  `role_type_id`=NEW.role_type_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_roles_update_after_trigger` AFTER UPDATE ON `user_roles` FOR EACH ROW INSERT INTO 
  gurulog.`user_roles_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `user_role_id`=NEW.user_role_id,
  `user_id`=NEW.user_id,
  `website_module_id`=NEW.website_module_id,
  `role_type_id`=NEW.role_type_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `user_type_id` int(11) NOT NULL,
  `user_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`user_type_id`, `user_type`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Worker'),
(4, 'Salesman');

--
-- Triggers `user_type`
--
DELIMITER $$
CREATE TRIGGER `user_type_delete_after_trigger` AFTER DELETE ON `user_type` FOR EACH ROW INSERT INTO 
  gurulog.`user_type_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `user_type_id`=OLD.user_type_id,
  `user_type`=OLD.user_type
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_type_insert_after_trigger` AFTER INSERT ON `user_type` FOR EACH ROW INSERT INTO 
  gurulog.`user_type_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `user_type_id`=NEW.user_type_id,
  `user_type`=NEW.user_type
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_type_update_after_trigger` AFTER UPDATE ON `user_type` FOR EACH ROW INSERT INTO 
  gurulog.`user_type_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `user_type_id`=NEW.user_type_id,
  `user_type`=NEW.user_type
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_modules`
--

CREATE TABLE `website_modules` (
  `website_module_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `main_module` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `website_modules`
--

INSERT INTO `website_modules` (`website_module_id`, `title`, `main_module`) VALUES
(1, 'Master', '1'),
(2, 'Master >> Category', '1.1'),
(3, 'Master >> Method', '1.2'),
(4, 'Master >> Tunch', '1.3'),
(6, 'Master >> Item Master', '1.5'),
(7, 'Master >> User Master', '1.6'),
(9, 'Master >> State', '1.8'),
(10, 'Master >> City', '1.9'),
(11, 'Master >> User Rights', '1.10'),
(12, 'Account', '2'),
(13, 'Order', '3'),
(14, 'Order >> Order', '3.1'),
(15, 'Order >> Order Slider', '3.2'),
(16, 'Sell/Purchase', '4'),
(17, 'Stock Transfer', '5'),
(18, 'Reports', '6'),
(19, 'Reports >> Daybook', '6.1'),
(20, 'Reports >> Stock Status', '6.2'),
(21, 'Reports >> Outstanding', '6.3'),
(22, 'Index', '7'),
(23, 'Demo', '8'),
(25, 'Journal', '9'),
(26, 'Master >> Design Master', '1.11'),
(27, 'Reports >> Goldbook', '6.2'),
(28, 'Reports >> Silverbook', '6.2'),
(29, 'Cashbook', '10'),
(30, 'Stock Adjust', '11'),
(31, 'Cash Adjust', '12'),
(32, 'Yearly Leaves', '13'),
(33, 'Apply Leave', '14'),
(34, 'Master >> Opening Stock', '1.12'),
(35, 'Present Hours', '15'),
(36, 'Reports >> Interest', '6.4'),
(37, 'Employee Salary', '16'),
(38, 'HR', '17'),
(39, 'Manufacture', '18'),
(40, 'Manufacture >> Issue/Receive', '18.1'),
(41, 'Sell/Purchase >> Sell/Purchase', '4.1'),
(42, 'Sell/Purchase >> Other Entry', '4.2'),
(43, 'Reports >> Balance Sheet', '6.3'),
(44, 'Manufacture >> Operation', '18.2'),
(45, 'Manufacture >> Hand Made', '18.3'),
(46, 'HR >> Attendance', '17.1'),
(47, 'Balance', '19'),
(48, 'Account >> Account Group', ' 2.1'),
(49, 'Server Shutdown', ' 20'),
(50, 'Manufacture >> Machine Chain Operation', '18.4'),
(51, 'Manufacture >> Machine Chain Entry', '18.5'),
(52, 'Reports >> Trading PL', '6.5'),
(53, 'Hallmark', '21'),
(54, 'Reports >> Calculations', '6.6'),
(55, 'Hallmark >> Receipt', '21.1'),
(56, 'Hallmark >> Xrf', '21.2'),
(57, 'Hallmark >> Item Master', '21.0'),
(58, 'Manufacture >> Casting', '18.3.1'),
(59, 'Manufacture >> I/R Silver', '18.1.1'),
(60, 'Reports >> Reminder', '6.7'),
(61, 'Master >> AD Master', '1.13'),
(62, 'Master >> Stamp', '1.14'),
(63, 'Import Data', '5.1'),
(64, 'Master >> company Details', '1.15'),
(65, 'Manufacture >> Refinery', '18.4');

--
-- Triggers `website_modules`
--
DELIMITER $$
CREATE TRIGGER `website_modules_delete_after_trigger` AFTER DELETE ON `website_modules` FOR EACH ROW INSERT INTO 
  gurulog.`website_modules_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `website_module_id`=OLD.website_module_id,
  `title`=OLD.title,
  `main_module`=OLD.main_module
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `website_modules_insert_after_trigger` AFTER INSERT ON `website_modules` FOR EACH ROW INSERT INTO 
  gurulog.`website_modules_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `website_module_id`=NEW.website_module_id,
  `title`=NEW.title,
  `main_module`=NEW.main_module
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `website_modules_update_after_trigger` AFTER UPDATE ON `website_modules` FOR EACH ROW INSERT INTO 
  gurulog.`website_modules_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `website_module_id`=NEW.website_module_id,
  `title`=NEW.title,
  `main_module`=NEW.main_module
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `worker_entry`
--

CREATE TABLE `worker_entry` (
  `worker_entry_id` int(11) NOT NULL,
  `person_name` varchar(255) DEFAULT NULL,
  `process_id` int(111) NOT NULL,
  `salary` double DEFAULT NULL,
  `worker_type_id` int(11) DEFAULT NULL,
  `files` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `worker_entry`
--

INSERT INTO `worker_entry` (`worker_entry_id`, `person_name`, `process_id`, `salary`, `worker_type_id`, `files`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(2, 'sanjay', 0, 5000, 2, NULL, NULL, NULL, NULL, NULL),
(8, NULL, 0, NULL, NULL, NULL, '2018-09-26 17:47:28', 1, NULL, NULL);

--
-- Triggers `worker_entry`
--
DELIMITER $$
CREATE TRIGGER `worker_entry_delete_after_trigger` AFTER DELETE ON `worker_entry` FOR EACH ROW INSERT INTO 
  gurulog.`worker_entry_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `worker_entry_id`=OLD.worker_entry_id,
  `person_name`=OLD.person_name,
  `process_id`=OLD.process_id,
  `salary`=OLD.salary,
  `worker_type_id`=OLD.worker_type_id,
  `files`=OLD.files,
  `created_at`=OLD.created_at,
  `created_by`=OLD.created_by,
  `updated_at`=OLD.updated_at,
  `updated_by`=OLD.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `worker_entry_insert_after_trigger` AFTER INSERT ON `worker_entry` FOR EACH ROW INSERT INTO 
  gurulog.`worker_entry_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `worker_entry_id`=NEW.worker_entry_id,
  `person_name`=NEW.person_name,
  `process_id`=NEW.process_id,
  `salary`=NEW.salary,
  `worker_type_id`=NEW.worker_type_id,
  `files`=NEW.files,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `worker_entry_update_after_trigger` AFTER UPDATE ON `worker_entry` FOR EACH ROW INSERT INTO 
  gurulog.`worker_entry_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `worker_entry_id`=NEW.worker_entry_id,
  `person_name`=NEW.person_name,
  `process_id`=NEW.process_id,
  `salary`=NEW.salary,
  `worker_type_id`=NEW.worker_type_id,
  `files`=NEW.files,
  `created_at`=NEW.created_at,
  `created_by`=NEW.created_by,
  `updated_at`=NEW.updated_at,
  `updated_by`=NEW.updated_by
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `worker_hisab`
--

CREATE TABLE `worker_hisab` (
  `worker_hisab_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL COMMENT 'This Record will Not come in Stock/Ledger of Department : We are storing this ID just for reference',
  `worker_id` int(11) DEFAULT NULL,
  `against_account_id` int(11) DEFAULT NULL COMMENT 'MF LOSS account_id',
  `is_module` int(10) DEFAULT NULL COMMENT '1 = Manufacture Issue/Receive, 2 = Manufacture Hand Made, 3 = Manufacture Machin chain, 4 = Manufacture I/R Silver',
  `hisab_date` date DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `total_fine_adjusted` double DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `worker_hisab`
--
DELIMITER $$
CREATE TRIGGER `worker_hisab_delete_after_trigger` AFTER DELETE ON `worker_hisab` FOR EACH ROW INSERT INTO 
  gurulog.`worker_hisab_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `worker_hisab_id`=OLD.worker_hisab_id,
  `department_id`=OLD.department_id,
  `worker_id`=OLD.worker_id,
  `against_account_id`=OLD.against_account_id,
  `is_module`=OLD.is_module,
  `hisab_date`=OLD.hisab_date,
  `fine`=OLD.fine,
  `total_fine_adjusted`=OLD.total_fine_adjusted,
  `created_by`=OLD.created_by,
  `created_at`=OLD.created_at,
  `updated_by`=OLD.updated_by,
  `updated_at`=OLD.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `worker_hisab_insert_after_trigger` AFTER INSERT ON `worker_hisab` FOR EACH ROW INSERT INTO 
  gurulog.`worker_hisab_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `worker_hisab_id`=NEW.worker_hisab_id,
  `department_id`=NEW.department_id,
  `worker_id`=NEW.worker_id,
  `against_account_id`=NEW.against_account_id,
  `is_module`=NEW.is_module,
  `hisab_date`=NEW.hisab_date,
  `fine`=NEW.fine,
  `total_fine_adjusted`=NEW.total_fine_adjusted,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `worker_hisab_update_after_trigger` AFTER UPDATE ON `worker_hisab` FOR EACH ROW INSERT INTO 
  gurulog.`worker_hisab_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `worker_hisab_id`=NEW.worker_hisab_id,
  `department_id`=NEW.department_id,
  `worker_id`=NEW.worker_id,
  `against_account_id`=NEW.against_account_id,
  `is_module`=NEW.is_module,
  `hisab_date`=NEW.hisab_date,
  `fine`=NEW.fine,
  `total_fine_adjusted`=NEW.total_fine_adjusted,
  `created_by`=NEW.created_by,
  `created_at`=NEW.created_at,
  `updated_by`=NEW.updated_by,
  `updated_at`=NEW.updated_at
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `worker_hisab_detail`
--

CREATE TABLE `worker_hisab_detail` (
  `wsd_id` int(11) NOT NULL,
  `worker_hisab_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  `against_account_id` int(11) DEFAULT NULL COMMENT 'MF LOSS account_id',
  `relation_id` int(11) DEFAULT NULL,
  `is_module` int(10) DEFAULT NULL COMMENT '1 = Manufacture Issue/Receive, 2 = Manufacture Hand Made',
  `balance_fine` double DEFAULT NULL,
  `fine_adjusted` double DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '1 = Issue, 2 = Receive'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `worker_hisab_detail`
--
DELIMITER $$
CREATE TRIGGER `worker_hisab_detail_delete_after_trigger` AFTER DELETE ON `worker_hisab_detail` FOR EACH ROW INSERT INTO 
  gurulog.`worker_hisab_detail_log` 
SET 
  trigger_status = 'DELETE',
  `trigger_run_at`=NOW(),
  `wsd_id`=OLD.wsd_id,
  `worker_hisab_id`=OLD.worker_hisab_id,
  `worker_id`=OLD.worker_id,
  `against_account_id`=OLD.against_account_id,
  `relation_id`=OLD.relation_id,
  `is_module`=OLD.is_module,
  `balance_fine`=OLD.balance_fine,
  `fine_adjusted`=OLD.fine_adjusted,
  `type_id`=OLD.type_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `worker_hisab_detail_insert_after_trigger` AFTER INSERT ON `worker_hisab_detail` FOR EACH ROW INSERT INTO 
  gurulog.`worker_hisab_detail_log` 
SET 
  trigger_status = 'INSERT',
  `trigger_run_at`=NOW(),
  `wsd_id`=NEW.wsd_id,
  `worker_hisab_id`=NEW.worker_hisab_id,
  `worker_id`=NEW.worker_id,
  `against_account_id`=NEW.against_account_id,
  `relation_id`=NEW.relation_id,
  `is_module`=NEW.is_module,
  `balance_fine`=NEW.balance_fine,
  `fine_adjusted`=NEW.fine_adjusted,
  `type_id`=NEW.type_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `worker_hisab_detail_update_after_trigger` AFTER UPDATE ON `worker_hisab_detail` FOR EACH ROW INSERT INTO 
  gurulog.`worker_hisab_detail_log` 
SET 
  trigger_status = 'UPDATE',
  `trigger_run_at`=NOW(),
  `wsd_id`=NEW.wsd_id,
  `worker_hisab_id`=NEW.worker_hisab_id,
  `worker_id`=NEW.worker_id,
  `against_account_id`=NEW.against_account_id,
  `relation_id`=NEW.relation_id,
  `is_module`=NEW.is_module,
  `balance_fine`=NEW.balance_fine,
  `fine_adjusted`=NEW.fine_adjusted,
  `type_id`=NEW.type_id
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `account_group_id` (`account_group_id`);

--
-- Indexes for table `account_group`
--
ALTER TABLE `account_group`
  ADD PRIMARY KEY (`account_group_id`);

--
-- Indexes for table `ad`
--
ALTER TABLE `ad`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `carat`
--
ALTER TABLE `carat`
  ADD PRIMARY KEY (`carat_id`);

--
-- Indexes for table `casting_entry`
--
ALTER TABLE `casting_entry`
  ADD PRIMARY KEY (`ce_id`);

--
-- Indexes for table `casting_entry_design_files`
--
ALTER TABLE `casting_entry_design_files`
  ADD PRIMARY KEY (`design_file_id`);

--
-- Indexes for table `casting_entry_details`
--
ALTER TABLE `casting_entry_details`
  ADD PRIMARY KEY (`ce_detail_id`);

--
-- Indexes for table `casting_entry_order_items`
--
ALTER TABLE `casting_entry_order_items`
  ADD PRIMARY KEY (`ce_oi_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `category_group`
--
ALTER TABLE `category_group`
  ADD PRIMARY KEY (`category_group_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `company_details`
--
ALTER TABLE `company_details`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `design_master`
--
ALTER TABLE `design_master`
  ADD PRIMARY KEY (`design_id`);

--
-- Indexes for table `employee_salary`
--
ALTER TABLE `employee_salary`
  ADD PRIMARY KEY (`employee_salary_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `gold_bhav`
--
ALTER TABLE `gold_bhav`
  ADD PRIMARY KEY (`gold_id`);

--
-- Indexes for table `hallmark_item_master`
--
ALTER TABLE `hallmark_item_master`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `hallmark_receipt`
--
ALTER TABLE `hallmark_receipt`
  ADD PRIMARY KEY (`receipt_id`);

--
-- Indexes for table `hallmark_receipt_details`
--
ALTER TABLE `hallmark_receipt_details`
  ADD PRIMARY KEY (`rd_id`);

--
-- Indexes for table `hallmark_xrf`
--
ALTER TABLE `hallmark_xrf`
  ADD PRIMARY KEY (`xrf_id`);

--
-- Indexes for table `hallmark_xrf_items`
--
ALTER TABLE `hallmark_xrf_items`
  ADD PRIMARY KEY (`xrf_item_id`);

--
-- Indexes for table `hr_apply_leave`
--
ALTER TABLE `hr_apply_leave`
  ADD PRIMARY KEY (`apply_leave_id`);

--
-- Indexes for table `hr_attendance`
--
ALTER TABLE `hr_attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `hr_present_hours`
--
ALTER TABLE `hr_present_hours`
  ADD PRIMARY KEY (`present_hour_id`);

--
-- Indexes for table `hr_yearly_leave`
--
ALTER TABLE `hr_yearly_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue_receive`
--
ALTER TABLE `issue_receive`
  ADD PRIMARY KEY (`ir_id`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `issue_receive_details`
--
ALTER TABLE `issue_receive_details`
  ADD PRIMARY KEY (`ird_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `issue_receive_silver`
--
ALTER TABLE `issue_receive_silver`
  ADD PRIMARY KEY (`irs_id`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `issue_receive_silver_details`
--
ALTER TABLE `issue_receive_silver_details`
  ADD PRIMARY KEY (`irsd_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `item_bom`
--
ALTER TABLE `item_bom`
  ADD PRIMARY KEY (`item_bom_id`);

--
-- Indexes for table `item_master`
--
ALTER TABLE `item_master`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `category_id_3` (`category_id`),
  ADD KEY `category_id_4` (`category_id`);

--
-- Indexes for table `item_stock`
--
ALTER TABLE `item_stock`
  ADD PRIMARY KEY (`item_stock_id`);

--
-- Indexes for table `item_stock_rfid`
--
ALTER TABLE `item_stock_rfid`
  ADD PRIMARY KEY (`item_stock_rfid_id`),
  ADD KEY `rfid_ad_id` (`rfid_ad_id`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`journal_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD PRIMARY KEY (`jd_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `kaleyra_webhook_demo`
--
ALTER TABLE `kaleyra_webhook_demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `machine_chain`
--
ALTER TABLE `machine_chain`
  ADD PRIMARY KEY (`machine_chain_id`),
  ADD KEY `operation_id` (`operation_id`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `machine_chain_details`
--
ALTER TABLE `machine_chain_details`
  ADD PRIMARY KEY (`machine_chain_detail_id`);

--
-- Indexes for table `machine_chain_detail_order_items`
--
ALTER TABLE `machine_chain_detail_order_items`
  ADD PRIMARY KEY (`machine_chain_detail_oi_id`);

--
-- Indexes for table `machine_chain_operation`
--
ALTER TABLE `machine_chain_operation`
  ADD PRIMARY KEY (`operation_id`);

--
-- Indexes for table `machine_chain_operation_department`
--
ALTER TABLE `machine_chain_operation_department`
  ADD PRIMARY KEY (`od_id`);

--
-- Indexes for table `machine_chain_operation_worker`
--
ALTER TABLE `machine_chain_operation_worker`
  ADD PRIMARY KEY (`ow_id`);

--
-- Indexes for table `machine_chain_order_items`
--
ALTER TABLE `machine_chain_order_items`
  ADD PRIMARY KEY (`machine_chain_oi_id`);

--
-- Indexes for table `manufacture_status`
--
ALTER TABLE `manufacture_status`
  ADD PRIMARY KEY (`manufacture_status_id`);

--
-- Indexes for table `manu_hand_made`
--
ALTER TABLE `manu_hand_made`
  ADD PRIMARY KEY (`mhm_id`),
  ADD KEY `operation_id` (`operation_id`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `manu_hand_made_ads`
--
ALTER TABLE `manu_hand_made_ads`
  ADD PRIMARY KEY (`mhm_ad_id`),
  ADD KEY `ad_id` (`ad_id`);

--
-- Indexes for table `manu_hand_made_details`
--
ALTER TABLE `manu_hand_made_details`
  ADD PRIMARY KEY (`mhm_detail_id`);

--
-- Indexes for table `manu_hand_made_order_items`
--
ALTER TABLE `manu_hand_made_order_items`
  ADD PRIMARY KEY (`mhm_oi_id`);

--
-- Indexes for table `metal_payment_receipt`
--
ALTER TABLE `metal_payment_receipt`
  ADD PRIMARY KEY (`metal_pr_id`);

--
-- Indexes for table `module_roles`
--
ALTER TABLE `module_roles`
  ADD PRIMARY KEY (`module_role_id`);

--
-- Indexes for table `new_order`
--
ALTER TABLE `new_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `process_id` (`process_id`),
  ADD KEY `process_id_2` (`process_id`),
  ADD KEY `party_id` (`party_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `opening_stock`
--
ALTER TABLE `opening_stock`
  ADD PRIMARY KEY (`opening_stock_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`operation_id`);

--
-- Indexes for table `operation_department`
--
ALTER TABLE `operation_department`
  ADD PRIMARY KEY (`od_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `operation_worker`
--
ALTER TABLE `operation_worker`
  ADD PRIMARY KEY (`ow_id`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `worker_id_2` (`worker_id`);

--
-- Indexes for table `order_lot_item`
--
ALTER TABLE `order_lot_item`
  ADD PRIMARY KEY (`order_lot_item_id`),
  ADD KEY `touch_id` (`touch_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `touch_id_2` (`touch_id`),
  ADD KEY `touch_id_3` (`touch_id`),
  ADD KEY `item_id_2` (`item_id`),
  ADD KEY `item_id_3` (`item_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`order_status_id`);

--
-- Indexes for table `other`
--
ALTER TABLE `other`
  ADD PRIMARY KEY (`other_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `other_items`
--
ALTER TABLE `other_items`
  ADD PRIMARY KEY (`other_item_id`);

--
-- Indexes for table `party_item_details`
--
ALTER TABLE `party_item_details`
  ADD PRIMARY KEY (`party_item_id`);

--
-- Indexes for table `payment_receipt`
--
ALTER TABLE `payment_receipt`
  ADD PRIMARY KEY (`pay_rec_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `process_master`
--
ALTER TABLE `process_master`
  ADD PRIMARY KEY (`process_id`);

--
-- Indexes for table `refinery_entry`
--
ALTER TABLE `refinery_entry`
  ADD PRIMARY KEY (`r_entry_id`);

--
-- Indexes for table `reminder`
--
ALTER TABLE `reminder`
  ADD PRIMARY KEY (`reminder_id`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `sell`
--
ALTER TABLE `sell`
  ADD PRIMARY KEY (`sell_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `process_id` (`process_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `sell_adjust_cr`
--
ALTER TABLE `sell_adjust_cr`
  ADD PRIMARY KEY (`sell_adjust_cr_id`);

--
-- Indexes for table `sell_ad_charges`
--
ALTER TABLE `sell_ad_charges`
  ADD PRIMARY KEY (`sell_ad_charges_id`),
  ADD KEY `ad_id` (`ad_id`);

--
-- Indexes for table `sell_items`
--
ALTER TABLE `sell_items`
  ADD PRIMARY KEY (`sell_item_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `purchase_sell_item_id` (`purchase_sell_item_id`),
  ADD KEY `order_lot_item_id` (`order_lot_item_id`);

--
-- Indexes for table `sell_items_with_gst`
--
ALTER TABLE `sell_items_with_gst`
  ADD PRIMARY KEY (`sell_item_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `purchase_sell_item_id` (`purchase_sell_item_id`),
  ADD KEY `order_lot_item_id` (`order_lot_item_id`);

--
-- Indexes for table `sell_item_charges_details`
--
ALTER TABLE `sell_item_charges_details`
  ADD PRIMARY KEY (`sell_item_charges_details_id`),
  ADD KEY `sell_item_charges_details_ad_id` (`sell_item_charges_details_ad_id`);

--
-- Indexes for table `sell_less_ad_details`
--
ALTER TABLE `sell_less_ad_details`
  ADD PRIMARY KEY (`sell_less_ad_details_id`),
  ADD KEY `less_ad_details_ad_id` (`less_ad_details_ad_id`);

--
-- Indexes for table `sell_type`
--
ALTER TABLE `sell_type`
  ADD PRIMARY KEY (`sell_type_id`);

--
-- Indexes for table `sell_with_gst`
--
ALTER TABLE `sell_with_gst`
  ADD PRIMARY KEY (`sell_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `process_id` (`process_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indexes for table `setting_mac_address`
--
ALTER TABLE `setting_mac_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `silver_bhav`
--
ALTER TABLE `silver_bhav`
  ADD PRIMARY KEY (`silver_id`);

--
-- Indexes for table `stamp`
--
ALTER TABLE `stamp`
  ADD PRIMARY KEY (`stamp_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `stock_transfer`
--
ALTER TABLE `stock_transfer`
  ADD PRIMARY KEY (`stock_transfer_id`),
  ADD KEY `from_department` (`from_department`),
  ADD KEY `to_department` (`to_department`);

--
-- Indexes for table `stock_transfer_detail`
--
ALTER TABLE `stock_transfer_detail`
  ADD PRIMARY KEY (`transfer_detail_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`transfer_id`);

--
-- Indexes for table `tunch_testing`
--
ALTER TABLE `tunch_testing`
  ADD PRIMARY KEY (`tunch_testing_id`);

--
-- Indexes for table `twilio_webhook_demo`
--
ALTER TABLE `twilio_webhook_demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_account_group`
--
ALTER TABLE `user_account_group`
  ADD PRIMARY KEY (`ud_id`);

--
-- Indexes for table `user_department`
--
ALTER TABLE `user_department`
  ADD PRIMARY KEY (`ud_id`);

--
-- Indexes for table `user_family_member`
--
ALTER TABLE `user_family_member`
  ADD PRIMARY KEY (`fm_id`);

--
-- Indexes for table `user_master`
--
ALTER TABLE `user_master`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_order_department`
--
ALTER TABLE `user_order_department`
  ADD PRIMARY KEY (`ud_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_role_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`user_type_id`);

--
-- Indexes for table `website_modules`
--
ALTER TABLE `website_modules`
  ADD PRIMARY KEY (`website_module_id`);

--
-- Indexes for table `worker_entry`
--
ALTER TABLE `worker_entry`
  ADD PRIMARY KEY (`worker_entry_id`);

--
-- Indexes for table `worker_hisab`
--
ALTER TABLE `worker_hisab`
  ADD PRIMARY KEY (`worker_hisab_id`);

--
-- Indexes for table `worker_hisab_detail`
--
ALTER TABLE `worker_hisab_detail`
  ADD PRIMARY KEY (`wsd_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=363;

--
-- AUTO_INCREMENT for table `account_group`
--
ALTER TABLE `account_group`
  MODIFY `account_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `ad`
--
ALTER TABLE `ad`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `carat`
--
ALTER TABLE `carat`
  MODIFY `carat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `casting_entry`
--
ALTER TABLE `casting_entry`
  MODIFY `ce_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `casting_entry_design_files`
--
ALTER TABLE `casting_entry_design_files`
  MODIFY `design_file_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `casting_entry_details`
--
ALTER TABLE `casting_entry_details`
  MODIFY `ce_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `casting_entry_order_items`
--
ALTER TABLE `casting_entry_order_items`
  MODIFY `ce_oi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `category_group`
--
ALTER TABLE `category_group`
  MODIFY `category_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `company_details`
--
ALTER TABLE `company_details`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `design_master`
--
ALTER TABLE `design_master`
  MODIFY `design_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_salary`
--
ALTER TABLE `employee_salary`
  MODIFY `employee_salary_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gold_bhav`
--
ALTER TABLE `gold_bhav`
  MODIFY `gold_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hallmark_item_master`
--
ALTER TABLE `hallmark_item_master`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hallmark_receipt`
--
ALTER TABLE `hallmark_receipt`
  MODIFY `receipt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hallmark_receipt_details`
--
ALTER TABLE `hallmark_receipt_details`
  MODIFY `rd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hallmark_xrf`
--
ALTER TABLE `hallmark_xrf`
  MODIFY `xrf_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hallmark_xrf_items`
--
ALTER TABLE `hallmark_xrf_items`
  MODIFY `xrf_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_apply_leave`
--
ALTER TABLE `hr_apply_leave`
  MODIFY `apply_leave_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_attendance`
--
ALTER TABLE `hr_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_present_hours`
--
ALTER TABLE `hr_present_hours`
  MODIFY `present_hour_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_yearly_leave`
--
ALTER TABLE `hr_yearly_leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `issue_receive`
--
ALTER TABLE `issue_receive`
  MODIFY `ir_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_receive_details`
--
ALTER TABLE `issue_receive_details`
  MODIFY `ird_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_receive_silver`
--
ALTER TABLE `issue_receive_silver`
  MODIFY `irs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `issue_receive_silver_details`
--
ALTER TABLE `issue_receive_silver_details`
  MODIFY `irsd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_bom`
--
ALTER TABLE `item_bom`
  MODIFY `item_bom_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_master`
--
ALTER TABLE `item_master`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=626;

--
-- AUTO_INCREMENT for table `item_stock`
--
ALTER TABLE `item_stock`
  MODIFY `item_stock_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_stock_rfid`
--
ALTER TABLE `item_stock_rfid`
  MODIFY `item_stock_rfid_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journal`
--
ALTER TABLE `journal`
  MODIFY `journal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journal_details`
--
ALTER TABLE `journal_details`
  MODIFY `jd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kaleyra_webhook_demo`
--
ALTER TABLE `kaleyra_webhook_demo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `machine_chain`
--
ALTER TABLE `machine_chain`
  MODIFY `machine_chain_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `machine_chain_details`
--
ALTER TABLE `machine_chain_details`
  MODIFY `machine_chain_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `machine_chain_detail_order_items`
--
ALTER TABLE `machine_chain_detail_order_items`
  MODIFY `machine_chain_detail_oi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `machine_chain_operation`
--
ALTER TABLE `machine_chain_operation`
  MODIFY `operation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `machine_chain_operation_department`
--
ALTER TABLE `machine_chain_operation_department`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `machine_chain_operation_worker`
--
ALTER TABLE `machine_chain_operation_worker`
  MODIFY `ow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `machine_chain_order_items`
--
ALTER TABLE `machine_chain_order_items`
  MODIFY `machine_chain_oi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacture_status`
--
ALTER TABLE `manufacture_status`
  MODIFY `manufacture_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `manu_hand_made`
--
ALTER TABLE `manu_hand_made`
  MODIFY `mhm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manu_hand_made_ads`
--
ALTER TABLE `manu_hand_made_ads`
  MODIFY `mhm_ad_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manu_hand_made_details`
--
ALTER TABLE `manu_hand_made_details`
  MODIFY `mhm_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manu_hand_made_order_items`
--
ALTER TABLE `manu_hand_made_order_items`
  MODIFY `mhm_oi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metal_payment_receipt`
--
ALTER TABLE `metal_payment_receipt`
  MODIFY `metal_pr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module_roles`
--
ALTER TABLE `module_roles`
  MODIFY `module_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `new_order`
--
ALTER TABLE `new_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opening_stock`
--
ALTER TABLE `opening_stock`
  MODIFY `opening_stock_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation`
--
ALTER TABLE `operation`
  MODIFY `operation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `operation_department`
--
ALTER TABLE `operation_department`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `operation_worker`
--
ALTER TABLE `operation_worker`
  MODIFY `ow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `order_lot_item`
--
ALTER TABLE `order_lot_item`
  MODIFY `order_lot_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `other`
--
ALTER TABLE `other`
  MODIFY `other_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `other_items`
--
ALTER TABLE `other_items`
  MODIFY `other_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `party_item_details`
--
ALTER TABLE `party_item_details`
  MODIFY `party_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_receipt`
--
ALTER TABLE `payment_receipt`
  MODIFY `pay_rec_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `process_master`
--
ALTER TABLE `process_master`
  MODIFY `process_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `refinery_entry`
--
ALTER TABLE `refinery_entry`
  MODIFY `r_entry_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reminder`
--
ALTER TABLE `reminder`
  MODIFY `reminder_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell`
--
ALTER TABLE `sell`
  MODIFY `sell_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_adjust_cr`
--
ALTER TABLE `sell_adjust_cr`
  MODIFY `sell_adjust_cr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_ad_charges`
--
ALTER TABLE `sell_ad_charges`
  MODIFY `sell_ad_charges_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_items`
--
ALTER TABLE `sell_items`
  MODIFY `sell_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_items_with_gst`
--
ALTER TABLE `sell_items_with_gst`
  MODIFY `sell_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_item_charges_details`
--
ALTER TABLE `sell_item_charges_details`
  MODIFY `sell_item_charges_details_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_less_ad_details`
--
ALTER TABLE `sell_less_ad_details`
  MODIFY `sell_less_ad_details_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sell_type`
--
ALTER TABLE `sell_type`
  MODIFY `sell_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sell_with_gst`
--
ALTER TABLE `sell_with_gst`
  MODIFY `sell_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `setting_mac_address`
--
ALTER TABLE `setting_mac_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `silver_bhav`
--
ALTER TABLE `silver_bhav`
  MODIFY `silver_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stamp`
--
ALTER TABLE `stamp`
  MODIFY `stamp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stock_transfer`
--
ALTER TABLE `stock_transfer`
  MODIFY `stock_transfer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_transfer_detail`
--
ALTER TABLE `stock_transfer_detail`
  MODIFY `transfer_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tunch_testing`
--
ALTER TABLE `tunch_testing`
  MODIFY `tunch_testing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `twilio_webhook_demo`
--
ALTER TABLE `twilio_webhook_demo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_account_group`
--
ALTER TABLE `user_account_group`
  MODIFY `ud_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_department`
--
ALTER TABLE `user_department`
  MODIFY `ud_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_family_member`
--
ALTER TABLE `user_family_member`
  MODIFY `fm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_master`
--
ALTER TABLE `user_master`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `user_order_department`
--
ALTER TABLE `user_order_department`
  MODIFY `ud_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `website_modules`
--
ALTER TABLE `website_modules`
  MODIFY `website_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `worker_entry`
--
ALTER TABLE `worker_entry`
  MODIFY `worker_entry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `worker_hisab`
--
ALTER TABLE `worker_hisab`
  MODIFY `worker_hisab_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worker_hisab_detail`
--
ALTER TABLE `worker_hisab_detail`
  MODIFY `wsd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `Fk_account_group` FOREIGN KEY (`account_group_id`) REFERENCES `account_group` (`account_group_id`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_StateCity` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`);

--
-- Constraints for table `employee_salary`
--
ALTER TABLE `employee_salary`
  ADD CONSTRAINT `Fk_EmpSalaryAccountId` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `issue_receive`
--
ALTER TABLE `issue_receive`
  ADD CONSTRAINT `Fk_AccountIrDepartment` FOREIGN KEY (`department_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `Fk_IrWorker` FOREIGN KEY (`worker_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `issue_receive_details`
--
ALTER TABLE `issue_receive_details`
  ADD CONSTRAINT `Fk_ItemIr` FOREIGN KEY (`item_id`) REFERENCES `item_master` (`item_id`);

--
-- Constraints for table `item_master`
--
ALTER TABLE `item_master`
  ADD CONSTRAINT `FK_Item_masterCategory` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `item_stock_rfid`
--
ALTER TABLE `item_stock_rfid`
  ADD CONSTRAINT `Fk_item_stock_rfid` FOREIGN KEY (`rfid_ad_id`) REFERENCES `ad` (`ad_id`);

--
-- Constraints for table `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `Fk_Account_journal` FOREIGN KEY (`department_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `journal_details`
--
ALTER TABLE `journal_details`
  ADD CONSTRAINT `Fk_AccountJournal` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `machine_chain`
--
ALTER TABLE `machine_chain`
  ADD CONSTRAINT `Fk_AccountMachine_chain_Worker` FOREIGN KEY (`worker_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `Fk_AccountMachine_chain_department` FOREIGN KEY (`department_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `Fk_OperationMachineChain` FOREIGN KEY (`operation_id`) REFERENCES `machine_chain_operation` (`operation_id`);

--
-- Constraints for table `manu_hand_made`
--
ALTER TABLE `manu_hand_made`
  ADD CONSTRAINT `Fk_AccountManu_hand_made_Worker` FOREIGN KEY (`worker_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `Fk_AccountManu_hand_made_department` FOREIGN KEY (`department_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `Fk_OperationManuHandMade` FOREIGN KEY (`operation_id`) REFERENCES `operation` (`operation_id`);

--
-- Constraints for table `manu_hand_made_ads`
--
ALTER TABLE `manu_hand_made_ads`
  ADD CONSTRAINT `Fk_manu_hand_made_ads` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`ad_id`);

--
-- Constraints for table `new_order`
--
ALTER TABLE `new_order`
  ADD CONSTRAINT `Fk_AccountOrderParty` FOREIGN KEY (`party_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `Fk_AccountOrderProcess` FOREIGN KEY (`process_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `Fk_AccountOrderSupplier` FOREIGN KEY (`supplier_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `opening_stock`
--
ALTER TABLE `opening_stock`
  ADD CONSTRAINT `FK_itemOpening` FOREIGN KEY (`item_id`) REFERENCES `item_master` (`item_id`);

--
-- Constraints for table `operation_department`
--
ALTER TABLE `operation_department`
  ADD CONSTRAINT `Fk_AccountOperationDepartment` FOREIGN KEY (`department_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `operation_worker`
--
ALTER TABLE `operation_worker`
  ADD CONSTRAINT `Fk_AccountOperationWorker` FOREIGN KEY (`worker_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `Fk_OperationWorker` FOREIGN KEY (`worker_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `order_lot_item`
--
ALTER TABLE `order_lot_item`
  ADD CONSTRAINT `Fk_ItemCaret` FOREIGN KEY (`touch_id`) REFERENCES `carat` (`carat_id`),
  ADD CONSTRAINT `Fk_ItemOrder` FOREIGN KEY (`item_id`) REFERENCES `item_master` (`item_id`);

--
-- Constraints for table `other`
--
ALTER TABLE `other`
  ADD CONSTRAINT `Fk_OtherAccount` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `Fk_OtherDepartment` FOREIGN KEY (`department_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `payment_receipt`
--
ALTER TABLE `payment_receipt`
  ADD CONSTRAINT `Fk_AccountCashbook` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `sell`
--
ALTER TABLE `sell`
  ADD CONSTRAINT `Fk_AccountSellProcess` FOREIGN KEY (`process_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `Fk_SellAccount` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `Fk_SellOrder` FOREIGN KEY (`order_id`) REFERENCES `new_order` (`order_id`);

--
-- Constraints for table `sell_ad_charges`
--
ALTER TABLE `sell_ad_charges`
  ADD CONSTRAINT `Fk_sell_ad_charges` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`ad_id`);

--
-- Constraints for table `sell_items`
--
ALTER TABLE `sell_items`
  ADD CONSTRAINT `FK_OrderSell` FOREIGN KEY (`order_lot_item_id`) REFERENCES `order_lot_item` (`order_lot_item_id`),
  ADD CONSTRAINT `Fk_ItemSell` FOREIGN KEY (`item_id`) REFERENCES `item_master` (`item_id`);

--
-- Constraints for table `sell_item_charges_details`
--
ALTER TABLE `sell_item_charges_details`
  ADD CONSTRAINT `Fk_sell_item_charges_details` FOREIGN KEY (`sell_item_charges_details_ad_id`) REFERENCES `ad` (`ad_id`);

--
-- Constraints for table `sell_less_ad_details`
--
ALTER TABLE `sell_less_ad_details`
  ADD CONSTRAINT `Fk_sell_less_ad_details` FOREIGN KEY (`less_ad_details_ad_id`) REFERENCES `ad` (`ad_id`);

--
-- Constraints for table `stock_transfer`
--
ALTER TABLE `stock_transfer`
  ADD CONSTRAINT `Fk_Account_from_stock_transfer` FOREIGN KEY (`from_department`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `Fk_Account_to_stock_transfer` FOREIGN KEY (`to_department`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `stock_transfer_detail`
--
ALTER TABLE `stock_transfer_detail`
  ADD CONSTRAINT `Fk_ItemStockTransfer` FOREIGN KEY (`item_id`) REFERENCES `item_master` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
