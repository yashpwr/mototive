-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2019 at 06:45 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('ACTIVE','DE-ACTIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_has_permission`
--

CREATE TABLE `admin_user_has_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advance_salary_request`
--

CREATE TABLE `advance_salary_request` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `date_of_submit` date NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advance_salary_request`
--

INSERT INTO `advance_salary_request` (`id`, `name`, `employee_id`, `company_id`, `date_of_submit`, `comments`, `file_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'mahendra', 3, 1, '2019-11-27', 'vcvcxvcxvxc', '1574854038.jpg', 'approve', '2019-11-27 05:57:18', '2019-11-27 06:00:09'),
(2, 'mahendra', 3, 1, '2019-11-30', 'vxcvxcvxc', '1574854259.jpg', 'reject', '2019-11-27 06:00:59', '2019-11-27 06:05:08');

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expiry_date` date DEFAULT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id`, `company_id`, `title`, `status`, `content`, `date`, `expiry_date`, `time`, `created_at`, `updated_at`) VALUES
(1, 1, 'test', 'ACTIVE', 'xcxcx', '2019-11-19 18:30:00', '2019-11-20', '01:00:00', '2019-11-20 02:19:11', '2019-11-20 02:19:11'),
(2, 1, 'Test', 'ACTIVE', 'cxvxcv', '2019-11-26 18:30:00', '2019-12-07', '00:30:00', '2019-11-27 07:47:30', '2019-11-27 07:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `attendance` enum('present','absent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_history`
--

CREATE TABLE `attendance_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_id` int(11) DEFAULT NULL,
  `time_change_request_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance_history`
--

INSERT INTO `attendance_history` (`id`, `company_id`, `employee_id`, `leave_id`, `time_change_request_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, NULL, 1, '2019-11-27 07:31:59', '2019-11-27 07:31:59');

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE `award` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `award` int(11) NOT NULL,
  `date` date NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `file_attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calendar_events`
--

CREATE TABLE `calendar_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chat_message`
--

INSERT INTO `chat_message` (`message_id`, `to_user_id`, `from_user_id`, `chat_message`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'jkbjhxzcbjzx', '2019-11-26 07:20:38', '2019-11-26 07:20:38'),
(2, 1, 2, 'sdasd', '2019-11-26 07:20:53', '2019-11-26 07:20:53'),
(3, 2, 8, 'xcxcx', '2019-11-26 07:23:13', '2019-11-26 07:23:13'),
(4, 1, 2, 'sdsdssa', '2019-11-26 07:24:06', '2019-11-26 07:24:06'),
(5, 3, 2, 'gffsdfs', '2019-11-27 04:03:31', '2019-11-27 04:03:31'),
(6, 3, 2, 'gffsdfs', '2019-11-27 04:03:51', '2019-11-27 04:03:51'),
(7, 3, 2, 'gffsdfs', '2019-11-27 04:07:00', '2019-11-27 04:07:00'),
(8, 3, 2, 'vcvcx', '2019-11-27 04:08:40', '2019-11-27 04:08:40'),
(9, 3, 2, 'cxcz', '2019-11-27 04:08:56', '2019-11-27 04:08:56'),
(10, 3, 2, 'czxzcx', '2019-11-27 04:09:07', '2019-11-27 04:09:07'),
(11, 3, 2, 'czxzcx', '2019-11-27 04:11:41', '2019-11-27 04:11:41'),
(12, 3, 2, 'cxcx', '2019-11-27 04:15:25', '2019-11-27 04:15:25'),
(13, 3, 2, 'vcv', '2019-11-27 04:16:24', '2019-11-27 04:16:24'),
(14, 3, 2, 'cxcx', '2019-11-27 04:44:00', '2019-11-27 04:44:00'),
(15, 3, 2, 'cxcz', '2019-11-27 04:44:09', '2019-11-27 04:44:09'),
(16, 3, 2, 'cxczzCzxc', '2019-11-27 04:44:27', '2019-11-27 04:44:27'),
(17, 3, 2, 'vzccxv', '2019-11-27 04:46:11', '2019-11-27 04:46:11'),
(18, 3, 2, 'cxcx', '2019-11-27 04:48:34', '2019-11-27 04:48:34'),
(19, 3, 2, 'cdzvxcv', '2019-11-27 04:49:14', '2019-11-27 04:49:14'),
(20, 3, 2, 'cxcxcxc', '2019-11-27 04:49:39', '2019-11-27 04:49:39'),
(21, 3, 2, 'vcxvxc', '2019-11-27 05:27:15', '2019-11-27 05:27:15'),
(22, 3, 2, 'vcfddf', '2019-11-27 05:32:04', '2019-11-27 05:32:04'),
(23, 3, 2, 'cxcxczx', '2019-11-27 05:33:47', '2019-11-27 05:33:47'),
(24, 3, 2, 'cxzczxcz', '2019-11-27 05:34:13', '2019-11-27 05:34:13'),
(25, 3, 2, 'swwaw', '2019-11-27 05:35:22', '2019-11-27 05:35:22'),
(26, 3, 2, 'swwaw', '2019-11-27 05:36:06', '2019-11-27 05:36:06'),
(27, 2, 2, 'ccv', '2019-11-27 05:49:48', '2019-11-27 05:49:48');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `national_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `work` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_joining` date NOT NULL,
  `bank` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `iban` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `account_number` int(11) NOT NULL,
  `phone_number` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_number` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` int(11) NOT NULL,
  `country` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_report`
--

CREATE TABLE `client_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_page`
--

CREATE TABLE `cms_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` (`id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Home Page', 'test', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(2, 'About us Page', 'test', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(3, 'Support Page', 'test', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(4, 'Login Page', 'test', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(5, 'Signup Page', 'test', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(6, 'Disclaimer Page', 'test', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(7, 'Services Page', 'test', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(8, 'Term and Condition Page', 'test', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(9, 'Enquiry and contact Page ', 'test', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(10, 'Login and register with social site', 'Login and register with \n            social site ', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(11, 'Plan and package page', 'plan and package page', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(12, 'Get free trial account ', 'get free trial account', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(13, 'User guide page', 'User guide page', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(14, 'Video tutorial about the requested feature', 'video tutorial about the requested feature', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(15, 'client portfolio page', 'client portfolio page ', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(16, 'Testimonial pages ', 'testimonial pages ', 1, NULL, NULL),
(17, 'FAQ Page', 'FAQ Page ', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(18, 'Blog Page', 'Blog Page ', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(19, 'News and event page', 'News and event page', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(20, 'Knowladge base page', 'knowladge base page', 1, '2019-01-29 12:42:31', '2019-01-29 12:42:31'),
(21, 'Ticket support page', '<h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px; color: rgb(0, 0, 0);\">Why do we use it?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br><br></p><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px; color: rgb(0, 0, 0);\">What is Lorem Ipsum?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p></p></p></p>', 1, '2019-01-29 12:42:31', '2019-02-26 15:04:29');

-- --------------------------------------------------------

--
-- Table structure for table `comapnies`
--

CREATE TABLE `comapnies` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','DE-ACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `subcription` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comapnies`
--

INSERT INTO `comapnies` (`id`, `user_id`, `company_name`, `email`, `password`, `company_image`, `status`, `subcription`, `expiry_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'company', 'company@gmail.com', '$2y$10$ENxKRC0IoThVA/Wv8ZzuuunY7d8uiaSqfzFklN2TcUfzFN6JHQnj6', 'admin1573821804.jpg', 'ACTIVE', 'Basic Plan', '2019-12-30 18:30:00', '2019-11-15 07:13:24', '2019-11-15 07:13:24'),
(5, 6, 'Uray Infortech', 'urayinfotech@gmail.com', '$2y$10$5htMMGctvmaihgLqu13jyuxSc20xtBAfT2Y6esOgMwuUd06dOnnEa', 'admin1573824130.jpg', 'ACTIVE', 'GOLD 2019', '2020-06-29 18:30:00', '2019-11-15 07:52:10', '2019-11-15 07:52:10'),
(6, 7, 'Mototive Web Solution', 'mototivewebsolution@gmail.com', '$2y$10$fIQ1pW1fD7Vpx3O4AkUO..UDa4esiQTScN/kx.JvyW7.AwyliAFCi', 'admin1573824186.jpg', 'ACTIVE', 'PLATINUM 2019', '2020-12-30 18:30:00', '2019-11-15 07:53:06', '2019-11-15 07:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `communication`
--

CREATE TABLE `communication` (
  `id` int(10) UNSIGNED NOT NULL,
  `communication_id` int(15) DEFAULT NULL,
  `send_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) DEFAULT NULL,
  `send_emp_id` int(10) DEFAULT NULL,
  `recieve_emp_id` int(10) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` int(11) NOT NULL,
  `is_trash` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `communication_reply`
--

CREATE TABLE `communication_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `communication_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_report`
--

CREATE TABLE `company_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_report_number` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `download_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CK', 'Cook Islands'),
(51, 'CR', 'Costa Rica'),
(52, 'HR', 'Croatia (Hrvatska)'),
(53, 'CU', 'Cuba'),
(54, 'CY', 'Cyprus'),
(55, 'CZ', 'Czech Republic'),
(56, 'DK', 'Denmark'),
(57, 'DJ', 'Djibouti'),
(58, 'DM', 'Dominica'),
(59, 'DO', 'Dominican Republic'),
(60, 'TP', 'East Timor'),
(61, 'EC', 'Ecuador'),
(62, 'EG', 'Egypt'),
(63, 'SV', 'El Salvador'),
(64, 'GQ', 'Equatorial Guinea'),
(65, 'ER', 'Eritrea'),
(66, 'EE', 'Estonia'),
(67, 'ET', 'Ethiopia'),
(68, 'FK', 'Falkland Islands (Malvinas)'),
(69, 'FO', 'Faroe Islands'),
(70, 'FJ', 'Fiji'),
(71, 'FI', 'Finland'),
(72, 'FR', 'France'),
(73, 'FX', 'France, Metropolitan'),
(74, 'GF', 'French Guiana'),
(75, 'PF', 'French Polynesia'),
(76, 'TF', 'French Southern Territories'),
(77, 'GA', 'Gabon'),
(78, 'GM', 'Gambia'),
(79, 'GE', 'Georgia'),
(80, 'DE', 'Germany'),
(81, 'GH', 'Ghana'),
(82, 'GI', 'Gibraltar'),
(83, 'GK', 'Guernsey'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'IM', 'Isle of Man'),
(101, 'ID', 'Indonesia'),
(102, 'IR', 'Iran (Islamic Republic of)'),
(103, 'IQ', 'Iraq'),
(104, 'IE', 'Ireland'),
(105, 'IL', 'Israel'),
(106, 'IT', 'Italy'),
(107, 'CI', 'Ivory Coast'),
(108, 'JE', 'Jersey'),
(109, 'JM', 'Jamaica'),
(110, 'JP', 'Japan'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea, Democratic People\'s Republic of'),
(116, 'KR', 'Korea, Republic of'),
(117, 'XK', 'Kosovo'),
(118, 'KW', 'Kuwait'),
(119, 'KG', 'Kyrgyzstan'),
(120, 'LA', 'Lao People\'s Democratic Republic'),
(121, 'LV', 'Latvia'),
(122, 'LB', 'Lebanon'),
(123, 'LS', 'Lesotho'),
(124, 'LR', 'Liberia'),
(125, 'LY', 'Libyan Arab Jamahiriya'),
(126, 'LI', 'Liechtenstein'),
(127, 'LT', 'Lithuania'),
(128, 'LU', 'Luxembourg'),
(129, 'MO', 'Macau'),
(130, 'MK', 'North Macedonia'),
(131, 'MG', 'Madagascar'),
(132, 'MW', 'Malawi'),
(133, 'MY', 'Malaysia'),
(134, 'MV', 'Maldives'),
(135, 'ML', 'Mali'),
(136, 'MT', 'Malta'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'TY', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia, Federated States of'),
(144, 'MD', 'Moldova, Republic of'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'ME', 'Montenegro'),
(148, 'MS', 'Montserrat'),
(149, 'MA', 'Morocco'),
(150, 'MZ', 'Mozambique'),
(151, 'MM', 'Myanmar'),
(152, 'NA', 'Namibia'),
(153, 'NR', 'Nauru'),
(154, 'NP', 'Nepal'),
(155, 'NL', 'Netherlands'),
(156, 'AN', 'Netherlands Antilles'),
(157, 'NC', 'New Caledonia'),
(158, 'NZ', 'New Zealand'),
(159, 'NI', 'Nicaragua'),
(160, 'NE', 'Niger'),
(161, 'NG', 'Nigeria'),
(162, 'NU', 'Niue'),
(163, 'NF', 'Norfolk Island'),
(164, 'MP', 'Northern Mariana Islands'),
(165, 'NO', 'Norway'),
(166, 'OM', 'Oman'),
(167, 'PK', 'Pakistan'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestine'),
(170, 'PA', 'Panama'),
(171, 'PG', 'Papua New Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Peru'),
(174, 'PH', 'Philippines'),
(175, 'PN', 'Pitcairn'),
(176, 'PL', 'Poland'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'RE', 'Reunion'),
(181, 'RO', 'Romania'),
(182, 'RU', 'Russian Federation'),
(183, 'RW', 'Rwanda'),
(184, 'KN', 'Saint Kitts and Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'VC', 'Saint Vincent and the Grenadines'),
(187, 'WS', 'Samoa'),
(188, 'SM', 'San Marino'),
(189, 'ST', 'Sao Tome and Principe'),
(190, 'SA', 'Saudi Arabia'),
(191, 'SN', 'Senegal'),
(192, 'RS', 'Serbia'),
(193, 'SC', 'Seychelles'),
(194, 'SL', 'Sierra Leone'),
(195, 'SG', 'Singapore'),
(196, 'SK', 'Slovakia'),
(197, 'SI', 'Slovenia'),
(198, 'SB', 'Solomon Islands'),
(199, 'SO', 'Somalia'),
(200, 'ZA', 'South Africa'),
(201, 'GS', 'South Georgia South Sandwich Islands'),
(202, 'SS', 'South Sudan'),
(203, 'ES', 'Spain'),
(204, 'LK', 'Sri Lanka'),
(205, 'SH', 'St. Helena'),
(206, 'PM', 'St. Pierre and Miquelon'),
(207, 'SD', 'Sudan'),
(208, 'SR', 'Suriname'),
(209, 'SJ', 'Svalbard and Jan Mayen Islands'),
(210, 'SZ', 'Swaziland'),
(211, 'SE', 'Sweden'),
(212, 'CH', 'Switzerland'),
(213, 'SY', 'Syrian Arab Republic'),
(214, 'TW', 'Taiwan'),
(215, 'TJ', 'Tajikistan'),
(216, 'TZ', 'Tanzania, United Republic of'),
(217, 'TH', 'Thailand'),
(218, 'TG', 'Togo'),
(219, 'TK', 'Tokelau'),
(220, 'TO', 'Tonga'),
(221, 'TT', 'Trinidad and Tobago'),
(222, 'TN', 'Tunisia'),
(223, 'TR', 'Turkey'),
(224, 'TM', 'Turkmenistan'),
(225, 'TC', 'Turks and Caicos Islands'),
(226, 'TV', 'Tuvalu'),
(227, 'UG', 'Uganda'),
(228, 'UA', 'Ukraine'),
(229, 'AE', 'United Arab Emirates'),
(230, 'GB', 'United Kingdom'),
(231, 'US', 'United States'),
(232, 'UM', 'United States minor outlying islands'),
(233, 'UY', 'Uruguay'),
(234, 'UZ', 'Uzbekistan'),
(235, 'VU', 'Vanuatu'),
(236, 'VA', 'Vatican City State'),
(237, 'VE', 'Venezuela'),
(238, 'VN', 'Vietnam'),
(239, 'VG', 'Virgin Islands (British)'),
(240, 'VI', 'Virgin Islands (U.S.)'),
(241, 'WF', 'Wallis and Futuna Islands'),
(242, 'EH', 'Western Sahara'),
(243, 'YE', 'Yemen'),
(244, 'ZR', 'Zaire'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

CREATE TABLE `demo` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('F','M') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'M',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `department_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `co_manager_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `company_id`, `department_name`, `manager_name`, `co_manager_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'graduate', '8', '8', '2019-12-02 05:38:51', '2019-12-02 05:38:51'),
(2, 1, 'master', NULL, NULL, '2019-12-02 05:40:34', '2019-12-02 05:40:34');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supervisor_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `department_id`, `designation_name`, `supervisor_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Logo Maker', '8', '2019-12-02 05:38:51', '2019-12-02 05:38:51'),
(2, 2, 'Logo Maker', NULL, '2019-12-02 05:40:34', '2019-12-02 05:40:34'),
(3, 2, 'Logo Makeraasdf', NULL, '2019-12-02 05:40:34', '2019-12-02 05:40:34');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `father_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Male',
  `phone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `local_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` int(11) DEFAULT NULL,
  `martial_status` enum('Married','Unmarried') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unmarried',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` int(11) DEFAULT NULL,
  `designation` int(11) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `joining_salary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Inactive',
  `account_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resume_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_letter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_letter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_agreement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `natonal_iqama_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iqama_expire_date` date DEFAULT NULL,
  `passport` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_expire_date` date DEFAULT NULL,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `user_id`, `company_id`, `name`, `father_name`, `date_of_birth`, `gender`, `phone`, `local_address`, `permanent_address`, `nationality`, `martial_status`, `photo`, `email`, `password`, `employee_id`, `department`, `designation`, `date_of_joining`, `joining_salary`, `status`, `account_holder_name`, `account_number`, `bank_name`, `branch`, `resume_file`, `offer_letter`, `joining_letter`, `contact_agreement`, `other`, `religion`, `driver_license`, `natonal_iqama_id`, `iqama_expire_date`, `passport`, `passport_expire_date`, `job_title`, `employee_type`, `created_at`, `updated_at`) VALUES
(8, 14, 1, 'mahendra', 'ahir', '2019-12-11', 'Male', '09825251897', 'devnarayan pan parlor', 'up the store', 99, 'Married', '', 'admin@admin.com', '$2y$10$eLsWu5gTHRy1BWaF8jCTPeInoz3ZPEUclNle.TZzszXCcMCg4VJ3e', '123', 3, 5, '2019-12-10', '1', 'Active', 'BOI', 'BOI', 'bank', 'bankdr', '', '', '', '', '', 'Neo-Paganism', '', '123', '2019-12-17', '', '1970-01-01', 'dsafgdfg', 'temporary', '2019-12-02 05:32:49', '2019-12-02 05:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `exprience_basd_leave_count`
--

CREATE TABLE `exprience_basd_leave_count` (
  `id` int(10) UNSIGNED NOT NULL,
  `leave_categories_id` int(11) NOT NULL,
  `employee_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_report`
--

CREATE TABLE `finance_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `num_of_report` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `downloaded_report_timeperiod` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `download_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holiday_report`
--

CREATE TABLE `holiday_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `holiday_report_number` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `download_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `emp_id` int(11) NOT NULL,
  `cmp_id` int(11) NOT NULL,
  `type_of_req_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_categories`
--

CREATE TABLE `leave_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `leave_cat_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `leave_type` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leave_unit` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicable_for` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_location` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `marital_status` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `period` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `for_employee_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `leave_count` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leave_categories`
--

INSERT INTO `leave_categories` (`id`, `company_id`, `leave_cat_name`, `type`, `leave_type`, `leave_unit`, `description`, `applicable_for`, `role`, `work_location`, `gender`, `marital_status`, `period`, `for_employee_type`, `leave_count`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test', 'Paid', 'time_change_request', 'Days', 'cxcxc', 'Employee', '1', '2', 'All', 'All', '1', 'all_emp', '0', '2019-11-27 07:31:25', '2019-11-27 07:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_active` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`id`, `user_id`, `last_active`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-11-15 06:27:28', NULL, NULL),
(2, 1, '2019-11-16 02:23:53', NULL, NULL),
(3, 2, '2019-11-20 02:12:11', NULL, NULL),
(4, 2, '2019-11-20 03:26:22', NULL, NULL),
(5, 2, '2019-11-25 02:35:59', NULL, NULL),
(6, 8, '2019-11-25 06:11:36', NULL, NULL),
(7, 2, '2019-11-25 06:42:24', NULL, NULL),
(8, 2, '2019-11-25 13:08:20', NULL, NULL),
(9, 2, '2019-11-26 01:54:56', NULL, NULL),
(10, 8, '2019-11-26 02:06:25', NULL, NULL),
(11, 2, '2019-11-26 02:11:46', NULL, NULL),
(12, 2, '2019-11-26 02:30:58', NULL, NULL),
(13, 2, '2019-11-26 02:30:58', NULL, NULL),
(14, 8, '2019-11-26 03:44:58', NULL, NULL),
(15, 8, '2019-11-26 05:22:14', NULL, NULL),
(16, 8, '2019-11-26 07:22:48', NULL, NULL),
(17, 2, '2019-11-27 03:50:21', NULL, NULL),
(18, 10, '2019-11-27 05:56:53', NULL, NULL),
(19, 2, '2019-11-28 04:21:16', NULL, NULL),
(20, 8, '2019-11-28 04:38:12', NULL, NULL),
(21, 2, '2019-11-28 04:47:21', NULL, NULL),
(22, 2, '2019-11-28 04:53:46', NULL, NULL),
(23, 8, '2019-11-28 04:59:24', NULL, NULL),
(24, 2, '2019-11-28 05:06:25', NULL, NULL),
(25, 2, '2019-11-29 02:08:00', NULL, NULL),
(26, 2, '2019-11-29 02:18:22', NULL, NULL),
(27, 1, '2019-12-02 00:58:43', NULL, NULL),
(28, 2, '2019-12-02 00:59:12', NULL, NULL),
(29, 1, '2019-12-05 05:19:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nominate_employee`
--

CREATE TABLE `nominate_employee` (
  `id` int(10) UNSIGNED NOT NULL,
  `training_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `non_working_date`
--

CREATE TABLE `non_working_date` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `non_working_date`
--

INSERT INTO `non_working_date` (`id`, `company_id`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-11-29', '2019-11-25 04:16:24', '2019-11-25 04:16:24'),
(2, 1, '2019-12-01', '2019-11-25 04:16:36', '2019-11-25 04:16:36');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_master_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `user_id`, `notification_master_id`, `message`, `route`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 'cxcxc is a new task.', 'emp-task-list', 0, '2019-11-27 03:55:27', '2019-11-27 03:55:27'),
(2, 8, 1, 'dxsdsa is a new task.', 'emp-task-list', 0, '2019-11-27 03:57:14', '2019-11-27 03:57:14'),
(3, 10, 1, 'vcvcv is a new task.', 'emp-task-list', 0, '2019-11-27 03:58:47', '2019-11-27 03:58:47'),
(4, 10, 2, 'mahendra is a new information in payroll.', 'payroll-employee', 0, '2019-11-27 04:01:03', '2019-11-27 04:01:03'),
(5, 10, 4, 'Performance is a new evaluates update.', 'emp-performance', 0, '2019-11-27 04:02:26', '2019-11-27 04:02:26'),
(6, 10, 20, 'Chat in  New Message.', 'employee/employee-chatnew/2', 0, '2019-11-27 04:49:18', '2019-11-27 04:49:18'),
(7, 10, 20, 'Chat in  New Message.', 'employee/employee-chatnew/2', 0, '2019-11-27 04:49:43', '2019-11-27 04:49:43'),
(8, 10, 20, 'Chat in  New Message.', 'employee/employee-chatnew/2', 0, '2019-11-27 05:27:26', '2019-11-27 05:27:26'),
(9, 10, 20, 'Chat in  New Message.', 'employee/employee-chatnew/2', 0, '2019-11-27 05:32:16', '2019-11-27 05:32:16'),
(10, 10, 20, 'Chat in  New Message.', 'employee/employee-chatnew/2', 0, '2019-11-27 05:33:56', '2019-11-27 05:33:56'),
(11, 10, 20, 'Chat in  New Message.', 'employee/employee-chatnew/2', 0, '2019-11-27 05:34:31', '2019-11-27 05:34:31'),
(12, 10, 20, 'Chat in  New Message.', 'employee/employee-chatnew/2', 0, '2019-11-27 05:36:13', '2019-11-27 05:36:13'),
(13, 9, 20, 'Chat in  New Message.', 'employee/employee-chatnew/2', 0, '2019-11-27 05:49:56', '2019-11-27 05:49:56'),
(14, 2, 12, 'mahendra selery request you.', 'campany-advance-salary-request', 0, '2019-11-27 05:57:18', '2019-11-27 05:57:18'),
(15, 10, 6, 'Company advance selery request approved.', 'advance-salary-request', 0, '2019-11-27 06:00:17', '2019-11-27 06:00:17'),
(16, 2, 12, 'mahendra selery request you.', 'campany-advance-salary-request', 0, '2019-11-27 06:00:59', '2019-11-27 06:00:59'),
(17, 10, 6, 'Company Advance selery request rejected.', 'advance-salary-request', 0, '2019-11-27 06:05:13', '2019-11-27 06:05:13'),
(18, 10, 7, 'Company has added a new training.', 'employee-training', 0, '2019-11-27 06:12:15', '2019-11-27 06:12:15'),
(19, 8, 7, 'Company has added a new training.', 'employee-training', 0, '2019-11-27 06:12:20', '2019-11-27 06:12:20'),
(20, 0, 8, 'Test is a new ticket.', 'ticket-list-emp', 0, '2019-11-27 07:02:26', '2019-11-27 07:02:26'),
(21, 10, 9, 'Company time change request approved.', 'manage-time-change-request', 0, '2019-11-27 07:37:37', '2019-11-27 07:37:37'),
(22, 10, 9, 'Company time change request rejected.', 'manage-time-change-request', 0, '2019-11-27 07:38:39', '2019-11-27 07:38:39'),
(23, 1, 1, ' is a new Announcement.', 'employee-notification-list', 0, '2019-11-27 07:47:37', '2019-11-27 07:47:37'),
(24, 2, 1, ' is a new Announcement.', 'employee-notification-list', 0, '2019-11-27 07:47:41', '2019-11-27 07:47:41'),
(25, 3, 1, ' is a new Announcement.', 'employee-notification-list', 0, '2019-11-27 07:47:46', '2019-11-27 07:47:46'),
(26, 10, 7, 'Company has added a new training.', 'employee-training', 0, '2019-11-28 04:25:06', '2019-11-28 04:25:06'),
(27, 10, 7, 'Company has added a new training.', 'employee-training', 0, '2019-11-28 04:25:09', '2019-11-28 04:25:09'),
(28, 8, 7, 'Company has added a new training.', 'employee-training', 0, '2019-11-28 04:48:19', '2019-11-28 04:48:19'),
(29, 0, 8, 'hjgjk is a new ticket.', 'ticket-list-emp', 0, '2019-11-29 02:08:57', '2019-11-29 02:08:57'),
(30, 0, 8, 'holiday is a new ticket.', 'ticket-list-emp', 0, '2019-11-29 02:19:42', '2019-11-29 02:19:42'),
(31, 0, 8, 'holiday is a new ticket.', 'ticket-list-emp', 0, '2019-11-29 03:48:00', '2019-11-29 03:48:00'),
(32, 0, 8, 'holiday is a new ticket.', 'ticket-list-emp', 0, '2019-11-29 03:49:21', '2019-11-29 03:49:21'),
(33, 0, 8, 'holiday is a new ticket.', 'ticket-list-emp', 0, '2019-11-29 03:49:23', '2019-11-29 03:49:23');

-- --------------------------------------------------------

--
-- Table structure for table `notification_master`
--

CREATE TABLE `notification_master` (
  `id` int(11) NOT NULL,
  `key` enum('Admin','Company','Employee') NOT NULL,
  `notification_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_master`
--

INSERT INTO `notification_master` (`id`, `key`, `notification_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Employee', 'Employee Task', 'If there is a new task.', NULL, NULL),
(2, 'Employee', 'Employee Payroll', 'If the company update the employee information in payroll', NULL, NULL),
(3, 'Employee', 'Employee Award', 'If there is a new award.', NULL, NULL),
(4, 'Employee', 'Employee Performance', 'If the company evaluates the employee', NULL, NULL),
(5, 'Employee', 'Employee Communication', 'If a message is received', NULL, NULL),
(6, 'Employee', 'Employee Advance Salary Request', 'If the company accept or rejects the request', NULL, NULL),
(7, 'Employee', 'Employee Training', 'If the company has added a new training .', NULL, NULL),
(8, 'Employee', 'Employee Ticket', 'If there is a new ticket.', NULL, NULL),
(9, 'Employee', 'Employee Manage Time Change Requrst', 'If the company accept or rejects the request.', NULL, NULL),
(10, 'Employee', 'Employee Announcement', 'If the company added an Announcement .', NULL, NULL),
(11, 'Company', 'Company Communication', 'If a new Communication message is received .', NULL, NULL),
(12, 'Company', 'Company Advance Salary Request', 'If a request for a advance salary is obtained from the employee', NULL, NULL),
(13, 'Company', 'Company Attendance Leave', 'If the employee requested a new leave .', NULL, NULL),
(14, 'Company', 'Company Change time Request', 'If the employee requests a change of time request.', NULL, NULL),
(15, 'Company', 'Company Task', 'If the employee updates the task.', NULL, NULL),
(16, 'Company', 'Company Task', 'If the task has expired.', NULL, NULL),
(17, 'Company', 'Company Ticket', 'If the employee updates the ticket.', NULL, NULL),
(18, 'Company', 'Company Ticket', 'If the ticket has expired', NULL, NULL),
(19, 'Company', 'Company Recruitment', 'Recruitment Notification of the expiry of the submission period on the work offer .', NULL, NULL),
(20, 'Employee', 'Employee Message.', 'If there is a new message.', NULL, NULL),
(21, 'Company', 'Company Message', 'If there is a new message.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcription` int(11) NOT NULL,
  `request_type` int(11) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `company_name`, `company_email`, `subcription`, `request_type`, `payment_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Golden Gate', 'goldengate@gmail.com', 1, 1, 2, NULL, '2019-11-15 09:14:43', '2019-11-15 09:14:43'),
(2, 'Test', 'test@gmail.com', 1, 1, 2, NULL, '2019-11-15 09:16:27', '2019-11-15 09:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `order_report`
--

CREATE TABLE `order_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `num_of_report` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `downloaded_report_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `download_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_setting`
--

CREATE TABLE `payroll_setting` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `grade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basic_salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payroll_setting`
--

INSERT INTO `payroll_setting` (`id`, `company_id`, `grade`, `basic_salary`, `payment_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'Greade 1', '10000', '01/Month', '2019-11-25 04:20:02', '2019-11-25 04:20:02'),
(2, 1, 'Grade 2', '20000', '01/Month', '2019-11-25 04:20:21', '2019-11-25 04:20:21');

-- --------------------------------------------------------

--
-- Table structure for table `pay_roll`
--

CREATE TABLE `pay_roll` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salary_grade` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_salary` double(10,2) NOT NULL,
  `over_time` decimal(10,2) NOT NULL,
  `due_date` date DEFAULT NULL,
  `housing` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medical` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transportation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `travel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `award` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_allowance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_deduction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pay_roll`
--

INSERT INTO `pay_roll` (`id`, `employee_id`, `salary_grade`, `basic_salary`, `over_time`, `due_date`, `housing`, `medical`, `transportation`, `travel`, `award`, `month`, `year`, `remarks`, `extra_allowance`, `extra_deduction`, `created_at`, `updated_at`) VALUES
(3, 1, 'Greade 1', 10000.00, '1.00', '0000-00-00', '1', '1', '1', '1', NULL, 1, 2019, 'Test', 'null', 'null', '2019-11-26 07:44:03', '2019-11-26 07:44:03'),
(4, 1, 'Greade 1', 10000.00, '1.00', '0000-00-00', '1', '1', '1', '1', '0', 2, 2019, NULL, 'null', 'null', '2019-11-26 07:45:07', '2019-11-26 07:45:07'),
(5, 1, 'Greade 1', 10000.00, '1.00', '0000-00-00', '1', '1', '1', '1', '0', 12, 2019, '1', 'null', 'null', '2019-11-26 07:45:32', '2019-11-26 07:45:32'),
(6, 1, 'Greade 1', 10000.00, '1.00', '0000-00-00', '1', '1', '1', '1', '0', 9, 2019, '1', 'null', 'null', '2019-11-26 07:45:57', '2019-11-26 07:45:57'),
(7, 3, 'Greade 1', 10000.00, '1.00', '0000-00-00', '1', '1', '1', '1', NULL, 1, 2019, 'vcxzvcxz', 'null', 'null', '2019-11-27 04:00:59', '2019-11-27 04:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `performances`
--

CREATE TABLE `performances` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  `dependability` int(11) NOT NULL DEFAULT 0,
  `job_knowledge` int(11) NOT NULL DEFAULT 0,
  `quality` int(11) NOT NULL DEFAULT 0,
  `productivity` int(11) NOT NULL DEFAULT 0,
  `working_relationship` int(11) NOT NULL DEFAULT 0,
  `honesty` int(11) NOT NULL DEFAULT 0,
  `notes_and_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `file_attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `performances`
--

INSERT INTO `performances` (`id`, `employee_id`, `company_id`, `availability`, `dependability`, `job_knowledge`, `quality`, `productivity`, `working_relationship`, `honesty`, `notes_and_details`, `month`, `year`, `file_attachment`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 5, 5, 5, 5, 5, 5, 5, NULL, 10, 2019, '', '2019-11-26 02:15:31', '2019-11-26 02:15:31'),
(2, 2, 1, 5, 5, 5, 5, 5, 5, 5, 'cxcxzczx', 1, 2018, '', '2019-11-26 07:17:53', '2019-11-26 07:17:53'),
(3, 3, 1, 5, 5, 5, 5, 5, 5, 5, 'xzczcvc', 2, 2018, 'performance1574847141.jpg', '2019-11-27 04:02:21', '2019-11-27 04:02:21');

-- --------------------------------------------------------

--
-- Table structure for table `period`
--

CREATE TABLE `period` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `period` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `period`
--

INSERT INTO `period` (`id`, `company_id`, `period`, `created_at`, `updated_at`) VALUES
(1, 1, 'fdg', '2019-11-20 04:46:28', '2019-11-20 04:46:28'),
(2, 1, 'cxc', '2019-11-20 04:48:02', '2019-11-20 04:48:02'),
(3, 1, 'fdfd', '2019-11-20 04:48:59', '2019-11-20 04:48:59');

-- --------------------------------------------------------

--
-- Table structure for table `permission_master`
--

CREATE TABLE `permission_master` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `type` enum('COMPANY','ADMIN') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission_master`
--

INSERT INTO `permission_master` (`id`, `name`, `is_active`, `type`, `created_at`, `updated_at`) VALUES
(3, 'Task', 1, 'COMPANY', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(4, 'Ticket', 1, 'COMPANY', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(5, 'Performance', 1, 'COMPANY', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(6, 'CMS Page', 1, 'ADMIN', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(7, 'Client', 1, 'ADMIN', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(8, 'Communication', 1, 'ADMIN', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(9, 'SMS', 1, 'ADMIN', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(11, 'Social Media', 1, 'ADMIN', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(12, 'Payroll', 1, 'COMPANY', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(13, 'Pay Slip', 1, 'COMPANY', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(14, 'Advance Salary Request', 1, 'COMPANY', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(15, 'Approved Advance Salary', 1, 'COMPANY', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(16, 'Daily Attendance', 1, 'COMPANY', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(17, 'Attendance Report', 1, 'COMPANY', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(18, 'Manage Attendance History', 1, 'COMPANY', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(19, 'Manage Time Change Request', 1, 'COMPANY', '2019-04-27 18:51:35', '2019-04-27 18:51:35'),
(20, 'ALL', 1, 'ADMIN', '2019-04-27 18:51:35', '2019-04-27 18:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `plan_and_package_report`
--

CREATE TABLE `plan_and_package_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `num_of_report` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `downloaded_report_subscription` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `download_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plan_features`
--

CREATE TABLE `plan_features` (
  `id` int(10) UNSIGNED NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_features`
--

INSERT INTO `plan_features` (`id`, `display_name`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Manage Profile', 'manage_profile', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(3, 'Manage Calendar', 'manage_calendar', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(4, 'Attendance Management', 'attandence_management', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(5, 'Leave Management', 'leave_management', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(6, 'Manage Payroll', 'manage_payroll', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(7, 'Manage Bank and Cash', 'manage_bank_and_cash', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(8, 'Manage Advance Salary', 'manage_advance_salary', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(10, 'Manage Recruitment', 'manage_recruitment', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(11, 'Manage Performance', 'manage_performance', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(12, 'Annoucement Management', 'annoucement_management', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(13, 'Manage Task', 'manage_task', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(14, 'Manage Award', 'manage_award', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(15, 'Manage Client', 'manage_client', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(16, 'Communication', 'communication', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(17, 'Report Management', 'reoprt_management', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(18, 'User Management', 'user_management', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(19, 'Department Management', 'department_management', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(20, 'Manage Setting', 'manage_setting', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(21, 'Manage Chat', 'manage_chat', '2019-04-20 18:30:00', '2019-04-20 18:30:00'),
(22, 'User Role', 'user_role', '2019-04-20 18:30:00', '2019-04-20 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `plan_managent`
--

CREATE TABLE `plan_managent` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `duration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `plan_feature` text COLLATE utf8_unicode_ci NOT NULL,
  `charge` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `expiration` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `plan_managent`
--

INSERT INTO `plan_managent` (`id`, `code`, `duration`, `plan_feature`, `charge`, `title`, `expiration`, `created_at`, `updated_at`) VALUES
(1, 'BASIC-2019', '2', '{\"manage_profile\":\"true\",\"manage_calendar\":\"true\",\"attandence_management\":\"true\",\"leave_management\":\"true\",\"manage_payroll\":\"true\",\"manage_bank_and_cash\":\"true\",\"manage_advance_salary\":\"true\",\"manage_recruitment\":\"true\",\"manage_performance\":\"true\",\"annoucement_management\":\"true\",\"manage_task\":\"true\",\"manage_award\":\"true\",\"manage_client\":\"true\",\"communication\":\"true\",\"reoprt_management\":\"true\",\"user_management\":\"true\",\"department_management\":\"true\",\"manage_setting\":\"true\",\"manage_chat\":\"true\",\"user_role\":\"true\"}', '10000', 'Basic Plan', '2020-01-31', '2019-11-15 06:29:29', '2019-11-15 06:29:29'),
(2, 'Gold-2019', '3', '{\"manage_profile\":\"true\",\"manage_calendar\":\"true\",\"attandence_management\":\"true\",\"leave_management\":\"true\",\"manage_payroll\":\"true\",\"manage_bank_and_cash\":\"true\",\"manage_advance_salary\":\"true\",\"manage_recruitment\":\"true\",\"manage_performance\":\"true\",\"annoucement_management\":\"true\",\"manage_task\":\"true\",\"manage_award\":\"true\",\"manage_client\":\"true\",\"communication\":\"true\",\"reoprt_management\":\"true\",\"user_management\":\"true\",\"department_management\":\"true\",\"manage_setting\":\"true\",\"manage_chat\":\"true\",\"user_role\":\"true\"}', '20000', 'GOLD 2019', '2020-06-30', '2019-11-15 06:30:40', '2019-11-15 06:30:40'),
(3, 'platinum-2019', '4', '{\"manage_profile\":\"true\",\"manage_calendar\":\"true\",\"attandence_management\":\"true\",\"leave_management\":\"true\",\"manage_payroll\":\"true\",\"manage_bank_and_cash\":\"true\",\"manage_advance_salary\":\"true\",\"manage_recruitment\":\"true\",\"manage_performance\":\"true\",\"annoucement_management\":\"true\",\"manage_task\":\"true\",\"manage_award\":\"true\",\"manage_client\":\"true\",\"communication\":\"true\",\"reoprt_management\":\"true\",\"user_management\":\"true\",\"department_management\":\"true\",\"manage_setting\":\"true\",\"manage_chat\":\"true\",\"user_role\":\"true\"}', '30000', 'PLATINUM 2019', '2020-12-31', '2019-11-15 06:32:03', '2019-11-15 06:32:03');

-- --------------------------------------------------------

--
-- Table structure for table `recruitment`
--

CREATE TABLE `recruitment` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `task` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `responsibility` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requirement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience_level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobtime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conatact_us` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `job_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `role_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `company_id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'add', '2019-11-20 04:10:56', '2019-11-20 04:10:57'),
(2, 1, 'add1', '2019-11-20 04:11:14', '2019-11-20 04:11:14'),
(3, 1, 'add1', '2019-11-20 04:15:46', '2019-11-20 04:15:46'),
(4, 1, 'cxcx', '2019-11-20 04:19:15', '2019-11-20 04:19:15'),
(5, 1, 'vcvc', '2019-11-20 04:25:39', '2019-11-20 04:25:39'),
(6, 1, 'fgd', '2019-11-20 04:26:44', '2019-11-20 04:26:44'),
(7, 1, 'cxcxcx', '2019-11-20 04:27:33', '2019-11-20 04:27:33'),
(8, 1, 'xzxz', '2019-11-20 04:29:36', '2019-11-20 04:29:36');

-- --------------------------------------------------------

--
-- Table structure for table `send_sms`
--

CREATE TABLE `send_sms` (
  `id` int(10) UNSIGNED NOT NULL,
  `emp_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_tagline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` time NOT NULL,
  `dateformate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customdate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeformate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customtime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weekstart` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siteurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `site_title`, `site_tagline`, `email`, `timezone`, `dateformate`, `customdate`, `timeformate`, `customtime`, `weekstart`, `language`, `siteurl`, `created_at`, `updated_at`) VALUES
(1, 'Mototive web solution', 'mototive', 'mototive@gmail.com', '00:00:01', '1', '', '1', '', 'monday', 'english', 'www.mototivewebsolution.com', '2019-11-15 08:55:08', '2019-11-15 08:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `accounts` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deliver_to` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deliver_date` datetime DEFAULT NULL,
  `deliver_time` datetime DEFAULT NULL,
  `status` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_media_files`
--

CREATE TABLE `social_media_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `social_media_id` int(11) NOT NULL,
  `file_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_media_token`
--

CREATE TABLE `social_media_token` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `account_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'facebook',
  `account_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` text COLLATE utf8_unicode_ci NOT NULL,
  `token_secret` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_generate_no`
--

CREATE TABLE `system_generate_no` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `generated_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_generate_no`
--

INSERT INTO `system_generate_no` (`id`, `report_name`, `generated_no`, `created_at`, `updated_at`) VALUES
(1, 'ticket_report', '0061', NULL, NULL),
(2, 'holiday_report', '0016', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `system_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `system_name`, `system_title`, `address`, `phone_number`, `email`, `language`, `image`, `created_at`, `updated_at`, `company_id`) VALUES
(1, 'test', 'test', 'test', '972746663', 'test@gmail.com', 'English', 'system_img1574249305.jpg', '2019-11-20 05:58:25', '2019-11-20 05:58:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `assign_date` date DEFAULT NULL,
  `deadline_date` date DEFAULT NULL,
  `task` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_task` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `complete_progress` int(11) NOT NULL DEFAULT 0,
  `task_status` int(11) NOT NULL DEFAULT 0,
  `emp_updated_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `company_id`, `department_id`, `employee_id`, `assign_date`, `deadline_date`, `task`, `priority`, `about_task`, `location`, `file`, `created_at`, `updated_at`, `complete_progress`, `task_status`, `emp_updated_file`) VALUES
(1, 1, 2, 1, '2019-11-01', '2019-11-30', 'Test', 'HIGH', 'cxcxc', 'Test', 'tasks1574764595.jpg', '2019-11-26 05:06:35', '2019-11-26 05:06:35', 0, 0, NULL),
(2, 1, 2, 3, '2019-11-01', '2019-11-14', 'cxcxc', 'HIGH', 'cxzczx', 'cxxzcxz', 'tasks1574846717.jpg', '2019-11-27 03:55:17', '2019-11-27 03:55:17', 0, 0, NULL),
(3, 1, 2, 1, '2019-11-01', '2019-11-20', 'dxsdsa', 'NORMAL', 'dsadsadsa', 'dsdas', 'tasks1574846830.jpg', '2019-11-27 03:57:10', '2019-11-27 03:57:10', 0, 0, NULL),
(4, 1, 2, 3, '2019-11-01', '2019-11-30', 'vcvcv', 'NORMAL', 'cxvxc', 'cvxc', 'tasks1574846923.jpg', '2019-11-27 03:58:43', '2019-11-27 03:58:43', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `task_comments`
--

CREATE TABLE `task_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_report`
--

CREATE TABLE `task_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `task_report_number` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `download_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `tax_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assign_to` int(11) NOT NULL,
  `department_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `complete_progress` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `company_id`, `code`, `subject`, `status`, `priority`, `assign_to`, `department_id`, `manager_name`, `details`, `created_by`, `due_date`, `created_at`, `updated_at`, `complete_progress`) VALUES
(1, 1, '123123', 'holiday', 'New', 'High', 8, '1', 'null', 'parth khunt', 'COMPANY', '2019-11-30', '2019-11-29 03:47:48', '2019-11-29 03:47:48', 0),
(2, 1, '1231234', 'holiday', 'New', 'Normal', 9, '2', 'null', 'kartik desai', 'COMPANY', '1970-01-01', '2019-11-29 03:49:16', '2019-11-29 03:49:16', 0),
(3, 1, '1231234', 'holiday', 'New', 'Normal', 9, '2', 'null', 'kartik desai', 'COMPANY', '2019-11-30', '2019-11-29 03:49:19', '2019-11-29 03:49:19', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachments`
--

CREATE TABLE `ticket_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `file_attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_attachments`
--

INSERT INTO `ticket_attachments` (`id`, `ticket_id`, `file_attachment`, `created_at`, `updated_at`) VALUES
(1, 1, 'ticket_attachment1575019068.menu.pdf', '2019-11-29 03:47:48', '2019-11-29 03:47:48'),
(2, 2, 'ticket_attachment1575019156.heredelivery.sql', '2019-11-29 03:49:16', '2019-11-29 03:49:16'),
(3, 3, 'ticket_attachment1575019159.heredelivery.sql', '2019-11-29 03:49:19', '2019-11-29 03:49:19');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_comments`
--

INSERT INTO `ticket_comments` (`id`, `user_id`, `ticket_id`, `comments`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'hiii kartik', '2019-11-29 04:14:56', '2019-11-29 04:14:56');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_report`
--

CREATE TABLE `ticket_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `ticket_report_number` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `download_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_change_requests`
--

CREATE TABLE `time_change_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `date_of_submit` date DEFAULT NULL,
  `request_type` int(11) NOT NULL,
  `total_hours` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_change_requests`
--

INSERT INTO `time_change_requests` (`id`, `employee_id`, `company_id`, `from_date`, `to_date`, `date_of_submit`, `request_type`, `total_hours`, `request_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2019-11-30', '2019-12-07', '2019-11-01', 1, '4', 'test', 'reject', '2019-11-27 07:31:59', '2019-11-27 07:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `budget` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requirement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`id`, `company_id`, `location`, `department_id`, `budget`, `requirement`, `number`, `type`, `created_at`, `updated_at`) VALUES
(3, 1, 'Test', 2, '1000', 'test', '1234567890', NULL, '2019-11-28 04:24:54', '2019-11-28 04:24:54'),
(5, 1, 'test', 2, '123', 'test', '123', NULL, '2019-11-28 04:48:11', '2019-11-28 04:48:11');

-- --------------------------------------------------------

--
-- Table structure for table `training_emp_dept`
--

CREATE TABLE `training_emp_dept` (
  `id` int(10) UNSIGNED NOT NULL,
  `training_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `training_emp_dept`
--

INSERT INTO `training_emp_dept` (`id`, `training_id`, `employee_id`, `department_id`, `created_at`, `updated_at`) VALUES
(7, 5, 1, 2, '2019-11-28 04:48:11', '2019-11-28 04:48:11'),
(5, 3, 3, 2, '2019-11-28 04:24:54', '2019-11-28 04:24:54');

-- --------------------------------------------------------

--
-- Table structure for table `type_of_request`
--

CREATE TABLE `type_of_request` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `request_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('ADMIN','EMPLOYEE','COMPANY') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EMPLOYEE',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_image`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin11', 'admin@gmail.com', '$2y$10$1x9n9BA3f/20uvq/XM.soe/2BNGwpx93r.C4Eg0BBxes9og0AqTi.', NULL, 'ADMIN', 'UfNMtFCmWJEhFT8NJjugYnrZ1bRDZKN7coIcDIC1fYul2QXGRRvTecg9nGAn', '2019-11-14 18:30:00', '2019-12-05 05:42:48'),
(2, 'company', 'company@gmail.com', '$2y$10$I3ymTrgPSH.sXPhGga6CweE06ssti07UzE7LZd9fiEjZbeEM.NfRe', 'admin1573821804.jpg', 'COMPANY', 'BigLN7RSmjwjZ6f3q3iOIUVU5M4zwMazu6raAeRCawCadkqvkGSiNwtNPaT8', '2019-11-15 07:13:24', '2019-11-15 07:13:24'),
(4, 'Uray Infortech', 'urayinfotech@gmail.com', '$2y$10$u2feGZ/q/nKxYpUMedHtzutAAxMRbMZB/j4ZsqvIK2L8SM6Ii6N9y', 'admin1573824130.jpg', 'COMPANY', NULL, '2019-11-15 07:52:10', '2019-11-15 07:52:10'),
(7, 'Mototive Web Solution', 'mototivewebsolution@gmail.com', '$2y$10$2mtEahto7V/kPihWHW6iwexMhsCcs6FjUhVZrMj8CKHPZ2j/KsA46', 'admin1573824186.jpg', 'COMPANY', NULL, '2019-11-15 07:53:06', '2019-11-15 07:53:06'),
(14, 'mahendra', 'admin@admin.com', '$2y$10$YSKXEVthEpRXxbO.z8n0luOXRSd7Sz.z/R8q3iKmy/VTG5oQJhW0O', '', 'EMPLOYEE', NULL, '2019-12-02 05:32:49', '2019-12-02 05:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_notification`
--

CREATE TABLE `user_notification` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `notification_master_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_notification`
--

INSERT INTO `user_notification` (`id`, `company_id`, `notification_master_id`, `status`) VALUES
(1, 2, 1, 1),
(2, 2, 2, 1),
(3, 2, 3, 1),
(4, 2, 4, 1),
(5, 2, 5, 1),
(6, 2, 6, 1),
(7, 2, 7, 1),
(8, 2, 8, 1),
(9, 2, 9, 1),
(10, 2, 10, 1),
(11, 2, 11, 1),
(12, 2, 12, 1),
(13, 2, 13, 1),
(14, 2, 14, 1),
(15, 2, 15, 1),
(16, 2, 16, 1),
(17, 2, 17, 1),
(18, 2, 18, 1),
(19, 2, 19, 1),
(20, 2, 20, 1),
(21, 2, 21, 1),
(22, 3, 1, 0),
(23, 3, 2, 0),
(24, 3, 3, 0),
(25, 3, 4, 0),
(26, 3, 5, 0),
(27, 3, 6, 0),
(28, 3, 7, 0),
(29, 3, 8, 0),
(30, 3, 9, 0),
(31, 3, 10, 0),
(32, 3, 11, 0),
(33, 3, 12, 0),
(34, 3, 13, 0),
(35, 3, 14, 0),
(36, 3, 15, 0),
(37, 3, 16, 0),
(38, 3, 17, 0),
(39, 3, 18, 0),
(40, 3, 19, 0),
(41, 3, 20, 0),
(42, 3, 21, 0),
(43, 4, 1, 0),
(44, 4, 2, 0),
(45, 4, 3, 0),
(46, 4, 4, 0),
(47, 4, 5, 0),
(48, 4, 6, 0),
(49, 4, 7, 0),
(50, 4, 8, 0),
(51, 4, 9, 0),
(52, 4, 10, 0),
(53, 4, 11, 0),
(54, 4, 12, 0),
(55, 4, 13, 0),
(56, 4, 14, 0),
(57, 4, 15, 0),
(58, 4, 16, 0),
(59, 4, 17, 0),
(60, 4, 18, 0),
(61, 4, 19, 0),
(62, 4, 20, 0),
(63, 4, 21, 0),
(64, 5, 1, 0),
(65, 5, 2, 0),
(66, 5, 3, 0),
(67, 5, 4, 0),
(68, 5, 5, 0),
(69, 5, 6, 0),
(70, 5, 7, 0),
(71, 5, 8, 0),
(72, 5, 9, 0),
(73, 5, 10, 0),
(74, 5, 11, 0),
(75, 5, 12, 0),
(76, 5, 13, 0),
(77, 5, 14, 0),
(78, 5, 15, 0),
(79, 5, 16, 0),
(80, 5, 17, 0),
(81, 5, 18, 0),
(82, 5, 19, 0),
(83, 5, 20, 0),
(84, 5, 21, 0),
(85, 6, 1, 0),
(86, 6, 2, 0),
(87, 6, 3, 0),
(88, 6, 4, 0),
(89, 6, 5, 0),
(90, 6, 6, 0),
(91, 6, 7, 0),
(92, 6, 8, 0),
(93, 6, 9, 0),
(94, 6, 10, 0),
(95, 6, 11, 0),
(96, 6, 12, 0),
(97, 6, 13, 0),
(98, 6, 14, 0),
(99, 6, 15, 0),
(100, 6, 16, 0),
(101, 6, 17, 0),
(102, 6, 18, 0),
(103, 6, 19, 0),
(104, 6, 20, 0),
(105, 6, 21, 0),
(106, 7, 1, 0),
(107, 7, 2, 0),
(108, 7, 3, 0),
(109, 7, 4, 0),
(110, 7, 5, 0),
(111, 7, 6, 0),
(112, 7, 7, 0),
(113, 7, 8, 0),
(114, 7, 9, 0),
(115, 7, 10, 0),
(116, 7, 11, 0),
(117, 7, 12, 0),
(118, 7, 13, 0),
(119, 7, 14, 0),
(120, 7, 15, 0),
(121, 7, 16, 0),
(122, 7, 17, 0),
(123, 7, 18, 0),
(124, 7, 19, 0),
(125, 7, 20, 0),
(126, 7, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_notification_type`
--

CREATE TABLE `user_notification_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_notification_id` int(11) NOT NULL,
  `user_notification_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notification_type`
--

INSERT INTO `user_notification_type` (`id`, `user_notification_id`, `user_notification_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2019-11-15 07:13:25', '2019-11-15 07:13:25'),
(2, 1, 2, 1, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(3, 1, 3, 0, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(4, 1, 4, 1, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(5, 2, 1, 1, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(6, 2, 2, 1, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(7, 2, 3, 0, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(8, 2, 4, 1, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(9, 3, 1, 0, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(10, 3, 2, 0, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(11, 3, 3, 0, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(12, 3, 4, 0, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(13, 4, 1, 1, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(14, 4, 2, 1, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(15, 4, 3, 0, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(16, 4, 4, 1, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(17, 5, 1, 1, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(18, 5, 2, 1, '2019-11-15 07:13:26', '2019-11-15 07:13:26'),
(19, 5, 3, 0, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(20, 5, 4, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(21, 6, 1, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(22, 6, 2, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(23, 6, 3, 0, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(24, 6, 4, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(25, 7, 1, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(26, 7, 2, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(27, 7, 3, 0, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(28, 7, 4, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(29, 8, 1, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(30, 8, 2, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(31, 8, 3, 0, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(32, 8, 4, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(33, 9, 1, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(34, 9, 2, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(35, 9, 3, 0, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(36, 9, 4, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(37, 10, 1, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(38, 10, 2, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(39, 10, 3, 0, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(40, 10, 4, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(41, 11, 1, 1, '2019-11-15 07:13:27', '2019-11-15 07:13:27'),
(42, 11, 2, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(43, 11, 3, 0, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(44, 11, 4, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(45, 12, 1, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(46, 12, 2, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(47, 12, 3, 0, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(48, 12, 4, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(49, 13, 1, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(50, 13, 2, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(51, 13, 3, 0, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(52, 13, 4, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(53, 14, 1, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(54, 14, 2, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(55, 14, 3, 0, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(56, 14, 4, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(57, 15, 1, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(58, 15, 2, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(59, 15, 3, 0, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(60, 15, 4, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(61, 16, 1, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(62, 16, 2, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(63, 16, 3, 0, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(64, 16, 4, 1, '2019-11-15 07:13:28', '2019-11-15 07:13:28'),
(65, 17, 1, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(66, 17, 2, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(67, 17, 3, 0, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(68, 17, 4, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(69, 18, 1, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(70, 18, 2, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(71, 18, 3, 0, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(72, 18, 4, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(73, 19, 1, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(74, 19, 2, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(75, 19, 3, 0, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(76, 19, 4, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(77, 20, 1, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(78, 20, 2, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(79, 20, 3, 0, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(80, 20, 4, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(81, 21, 1, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(82, 21, 2, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(83, 21, 3, 0, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(84, 21, 4, 1, '2019-11-15 07:13:29', '2019-11-15 07:13:29'),
(85, 22, 1, 0, '2019-11-15 07:23:35', '2019-11-15 07:23:35'),
(86, 22, 2, 0, '2019-11-15 07:23:35', '2019-11-15 07:23:35'),
(87, 22, 3, 0, '2019-11-15 07:23:35', '2019-11-15 07:23:35'),
(88, 22, 4, 0, '2019-11-15 07:23:35', '2019-11-15 07:23:35'),
(89, 23, 1, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(90, 23, 2, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(91, 23, 3, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(92, 23, 4, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(93, 24, 1, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(94, 24, 2, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(95, 24, 3, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(96, 24, 4, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(97, 25, 1, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(98, 25, 2, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(99, 25, 3, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(100, 25, 4, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(101, 26, 1, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(102, 26, 2, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(103, 26, 3, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(104, 26, 4, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(105, 27, 1, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(106, 27, 2, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(107, 27, 3, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(108, 27, 4, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(109, 28, 1, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(110, 28, 2, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(111, 28, 3, 0, '2019-11-15 07:23:36', '2019-11-15 07:23:36'),
(112, 28, 4, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(113, 29, 1, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(114, 29, 2, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(115, 29, 3, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(116, 29, 4, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(117, 30, 1, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(118, 30, 2, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(119, 30, 3, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(120, 30, 4, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(121, 31, 1, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(122, 31, 2, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(123, 31, 3, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(124, 31, 4, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(125, 32, 1, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(126, 32, 2, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(127, 32, 3, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(128, 32, 4, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(129, 33, 1, 0, '2019-11-15 07:23:37', '2019-11-15 07:23:37'),
(130, 33, 2, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(131, 33, 3, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(132, 33, 4, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(133, 34, 1, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(134, 34, 2, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(135, 34, 3, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(136, 34, 4, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(137, 35, 1, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(138, 35, 2, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(139, 35, 3, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(140, 35, 4, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(141, 36, 1, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(142, 36, 2, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(143, 36, 3, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(144, 36, 4, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(145, 37, 1, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(146, 37, 2, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(147, 37, 3, 0, '2019-11-15 07:23:38', '2019-11-15 07:23:38'),
(148, 37, 4, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(149, 38, 1, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(150, 38, 2, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(151, 38, 3, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(152, 38, 4, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(153, 39, 1, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(154, 39, 2, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(155, 39, 3, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(156, 39, 4, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(157, 40, 1, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(158, 40, 2, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(159, 40, 3, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(160, 40, 4, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(161, 41, 1, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(162, 41, 2, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(163, 41, 3, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(164, 41, 4, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(165, 42, 1, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(166, 42, 2, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(167, 42, 3, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(168, 42, 4, 0, '2019-11-15 07:23:39', '2019-11-15 07:23:39'),
(169, 43, 1, 0, '2019-11-15 07:28:33', '2019-11-15 07:28:33'),
(170, 43, 2, 0, '2019-11-15 07:28:33', '2019-11-15 07:28:33'),
(171, 43, 3, 0, '2019-11-15 07:28:33', '2019-11-15 07:28:33'),
(172, 43, 4, 0, '2019-11-15 07:28:33', '2019-11-15 07:28:33'),
(173, 44, 1, 0, '2019-11-15 07:28:33', '2019-11-15 07:28:33'),
(174, 44, 2, 0, '2019-11-15 07:28:33', '2019-11-15 07:28:33'),
(175, 44, 3, 0, '2019-11-15 07:28:33', '2019-11-15 07:28:33'),
(176, 44, 4, 0, '2019-11-15 07:28:33', '2019-11-15 07:28:33'),
(177, 45, 1, 0, '2019-11-15 07:28:33', '2019-11-15 07:28:33'),
(178, 45, 2, 0, '2019-11-15 07:28:33', '2019-11-15 07:28:33'),
(179, 45, 3, 0, '2019-11-15 07:28:33', '2019-11-15 07:28:33'),
(180, 45, 4, 0, '2019-11-15 07:28:33', '2019-11-15 07:28:33'),
(181, 46, 1, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(182, 46, 2, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(183, 46, 3, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(184, 46, 4, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(185, 47, 1, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(186, 47, 2, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(187, 47, 3, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(188, 47, 4, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(189, 48, 1, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(190, 48, 2, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(191, 48, 3, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(192, 48, 4, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(193, 49, 1, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(194, 49, 2, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(195, 49, 3, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(196, 49, 4, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(197, 50, 1, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(198, 50, 2, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(199, 50, 3, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(200, 50, 4, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(201, 51, 1, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(202, 51, 2, 0, '2019-11-15 07:28:34', '2019-11-15 07:28:34'),
(203, 51, 3, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(204, 51, 4, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(205, 52, 1, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(206, 52, 2, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(207, 52, 3, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(208, 52, 4, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(209, 53, 1, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(210, 53, 2, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(211, 53, 3, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(212, 53, 4, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(213, 54, 1, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(214, 54, 2, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(215, 54, 3, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(216, 54, 4, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(217, 55, 1, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(218, 55, 2, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(219, 55, 3, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(220, 55, 4, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(221, 56, 1, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(222, 56, 2, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(223, 56, 3, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(224, 56, 4, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(225, 57, 1, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(226, 57, 2, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(227, 57, 3, 0, '2019-11-15 07:28:35', '2019-11-15 07:28:35'),
(228, 57, 4, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(229, 58, 1, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(230, 58, 2, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(231, 58, 3, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(232, 58, 4, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(233, 59, 1, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(234, 59, 2, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(235, 59, 3, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(236, 59, 4, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(237, 60, 1, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(238, 60, 2, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(239, 60, 3, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(240, 60, 4, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(241, 61, 1, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(242, 61, 2, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(243, 61, 3, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(244, 61, 4, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(245, 62, 1, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(246, 62, 2, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(247, 62, 3, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(248, 62, 4, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(249, 63, 1, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(250, 63, 2, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(251, 63, 3, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(252, 63, 4, 0, '2019-11-15 07:28:36', '2019-11-15 07:28:36'),
(253, 64, 1, 0, '2019-11-15 07:47:03', '2019-11-15 07:47:03'),
(254, 64, 2, 0, '2019-11-15 07:47:03', '2019-11-15 07:47:03'),
(255, 64, 3, 0, '2019-11-15 07:47:03', '2019-11-15 07:47:03'),
(256, 64, 4, 0, '2019-11-15 07:47:03', '2019-11-15 07:47:03'),
(257, 65, 1, 0, '2019-11-15 07:47:03', '2019-11-15 07:47:03'),
(258, 65, 2, 0, '2019-11-15 07:47:03', '2019-11-15 07:47:03'),
(259, 65, 3, 0, '2019-11-15 07:47:03', '2019-11-15 07:47:03'),
(260, 65, 4, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(261, 66, 1, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(262, 66, 2, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(263, 66, 3, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(264, 66, 4, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(265, 67, 1, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(266, 67, 2, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(267, 67, 3, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(268, 67, 4, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(269, 68, 1, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(270, 68, 2, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(271, 68, 3, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(272, 68, 4, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(273, 69, 1, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(274, 69, 2, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(275, 69, 3, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(276, 69, 4, 0, '2019-11-15 07:47:04', '2019-11-15 07:47:04'),
(277, 70, 1, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(278, 70, 2, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(279, 70, 3, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(280, 70, 4, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(281, 71, 1, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(282, 71, 2, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(283, 71, 3, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(284, 71, 4, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(285, 72, 1, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(286, 72, 2, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(287, 72, 3, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(288, 72, 4, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(289, 73, 1, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(290, 73, 2, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(291, 73, 3, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(292, 73, 4, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(293, 74, 1, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(294, 74, 2, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(295, 74, 3, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(296, 74, 4, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(297, 75, 1, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(298, 75, 2, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(299, 75, 3, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(300, 75, 4, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(301, 76, 1, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(302, 76, 2, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(303, 76, 3, 0, '2019-11-15 07:47:05', '2019-11-15 07:47:05'),
(304, 76, 4, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(305, 77, 1, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(306, 77, 2, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(307, 77, 3, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(308, 77, 4, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(309, 78, 1, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(310, 78, 2, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(311, 78, 3, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(312, 78, 4, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(313, 79, 1, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(314, 79, 2, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(315, 79, 3, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(316, 79, 4, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(317, 80, 1, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(318, 80, 2, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(319, 80, 3, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(320, 80, 4, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(321, 81, 1, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(322, 81, 2, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(323, 81, 3, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(324, 81, 4, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(325, 82, 1, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(326, 82, 2, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(327, 82, 3, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(328, 82, 4, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(329, 83, 1, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(330, 83, 2, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(331, 83, 3, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(332, 83, 4, 0, '2019-11-15 07:47:06', '2019-11-15 07:47:06'),
(333, 84, 1, 0, '2019-11-15 07:47:07', '2019-11-15 07:47:07'),
(334, 84, 2, 0, '2019-11-15 07:47:07', '2019-11-15 07:47:07'),
(335, 84, 3, 0, '2019-11-15 07:47:07', '2019-11-15 07:47:07'),
(336, 84, 4, 0, '2019-11-15 07:47:07', '2019-11-15 07:47:07'),
(337, 85, 1, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(338, 85, 2, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(339, 85, 3, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(340, 85, 4, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(341, 86, 1, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(342, 86, 2, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(343, 86, 3, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(344, 86, 4, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(345, 87, 1, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(346, 87, 2, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(347, 87, 3, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(348, 87, 4, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(349, 88, 1, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(350, 88, 2, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(351, 88, 3, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(352, 88, 4, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(353, 89, 1, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(354, 89, 2, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(355, 89, 3, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(356, 89, 4, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(357, 90, 1, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(358, 90, 2, 0, '2019-11-15 07:52:11', '2019-11-15 07:52:11'),
(359, 90, 3, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(360, 90, 4, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(361, 91, 1, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(362, 91, 2, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(363, 91, 3, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(364, 91, 4, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(365, 92, 1, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(366, 92, 2, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(367, 92, 3, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(368, 92, 4, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(369, 93, 1, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(370, 93, 2, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(371, 93, 3, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(372, 93, 4, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(373, 94, 1, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(374, 94, 2, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(375, 94, 3, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(376, 94, 4, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(377, 95, 1, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(378, 95, 2, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(379, 95, 3, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(380, 95, 4, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(381, 96, 1, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(382, 96, 2, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(383, 96, 3, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(384, 96, 4, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(385, 97, 1, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(386, 97, 2, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(387, 97, 3, 0, '2019-11-15 07:52:12', '2019-11-15 07:52:12'),
(388, 97, 4, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(389, 98, 1, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(390, 98, 2, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(391, 98, 3, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(392, 98, 4, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(393, 99, 1, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(394, 99, 2, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(395, 99, 3, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(396, 99, 4, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(397, 100, 1, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(398, 100, 2, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(399, 100, 3, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(400, 100, 4, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(401, 101, 1, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(402, 101, 2, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(403, 101, 3, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(404, 101, 4, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(405, 102, 1, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(406, 102, 2, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(407, 102, 3, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(408, 102, 4, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(409, 103, 1, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(410, 103, 2, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(411, 103, 3, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(412, 103, 4, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(413, 104, 1, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(414, 104, 2, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(415, 104, 3, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(416, 104, 4, 0, '2019-11-15 07:52:13', '2019-11-15 07:52:13'),
(417, 105, 1, 0, '2019-11-15 07:52:14', '2019-11-15 07:52:14'),
(418, 105, 2, 0, '2019-11-15 07:52:14', '2019-11-15 07:52:14'),
(419, 105, 3, 0, '2019-11-15 07:52:14', '2019-11-15 07:52:14'),
(420, 105, 4, 0, '2019-11-15 07:52:14', '2019-11-15 07:52:14'),
(421, 106, 1, 0, '2019-11-15 07:53:07', '2019-11-15 07:53:07'),
(422, 106, 2, 0, '2019-11-15 07:53:07', '2019-11-15 07:53:07'),
(423, 106, 3, 0, '2019-11-15 07:53:07', '2019-11-15 07:53:07'),
(424, 106, 4, 0, '2019-11-15 07:53:07', '2019-11-15 07:53:07'),
(425, 107, 1, 0, '2019-11-15 07:53:07', '2019-11-15 07:53:07'),
(426, 107, 2, 0, '2019-11-15 07:53:07', '2019-11-15 07:53:07'),
(427, 107, 3, 0, '2019-11-15 07:53:07', '2019-11-15 07:53:07'),
(428, 107, 4, 0, '2019-11-15 07:53:07', '2019-11-15 07:53:07'),
(429, 108, 1, 0, '2019-11-15 07:53:07', '2019-11-15 07:53:07'),
(430, 108, 2, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(431, 108, 3, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(432, 108, 4, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(433, 109, 1, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(434, 109, 2, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(435, 109, 3, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(436, 109, 4, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(437, 110, 1, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(438, 110, 2, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(439, 110, 3, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(440, 110, 4, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(441, 111, 1, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(442, 111, 2, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(443, 111, 3, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(444, 111, 4, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(445, 112, 1, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(446, 112, 2, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(447, 112, 3, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(448, 112, 4, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(449, 113, 1, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(450, 113, 2, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(451, 113, 3, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(452, 113, 4, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(453, 114, 1, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(454, 114, 2, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(455, 114, 3, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(456, 114, 4, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(457, 115, 1, 0, '2019-11-15 07:53:08', '2019-11-15 07:53:08'),
(458, 115, 2, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(459, 115, 3, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(460, 115, 4, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(461, 116, 1, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(462, 116, 2, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(463, 116, 3, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(464, 116, 4, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(465, 117, 1, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(466, 117, 2, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(467, 117, 3, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(468, 117, 4, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(469, 118, 1, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(470, 118, 2, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(471, 118, 3, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(472, 118, 4, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(473, 119, 1, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(474, 119, 2, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(475, 119, 3, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(476, 119, 4, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(477, 120, 1, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(478, 120, 2, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(479, 120, 3, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(480, 120, 4, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(481, 121, 1, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(482, 121, 2, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(483, 121, 3, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(484, 121, 4, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(485, 122, 1, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(486, 122, 2, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(487, 122, 3, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(488, 122, 4, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(489, 123, 1, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(490, 123, 2, 0, '2019-11-15 07:53:09', '2019-11-15 07:53:09'),
(491, 123, 3, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(492, 123, 4, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(493, 124, 1, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(494, 124, 2, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(495, 124, 3, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(496, 124, 4, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(497, 125, 1, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(498, 125, 2, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(499, 125, 3, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(500, 125, 4, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(501, 126, 1, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(502, 126, 2, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(503, 126, 3, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10'),
(504, 126, 4, 0, '2019-11-15 07:53:10', '2019-11-15 07:53:10');

-- --------------------------------------------------------

--
-- Table structure for table `working_day_setting`
--

CREATE TABLE `working_day_setting` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `monday_status` tinyint(4) NOT NULL,
  `monday_work` tinyint(4) NOT NULL,
  `monday_from` time NOT NULL,
  `monday_to` time NOT NULL,
  `tuesday_status` tinyint(4) NOT NULL,
  `tuesday_work` tinyint(4) NOT NULL,
  `tuesday_from` time NOT NULL,
  `tuesday_to` time NOT NULL,
  `wednesday_status` tinyint(4) NOT NULL,
  `wednesday_work` tinyint(4) NOT NULL,
  `wednesday_from` time NOT NULL,
  `wednesday_to` time NOT NULL,
  `thursday_status` tinyint(4) NOT NULL,
  `thursday_work` tinyint(4) NOT NULL,
  `thursday_from` time NOT NULL,
  `thursday_to` time NOT NULL,
  `friday_status` tinyint(4) NOT NULL,
  `friday_work` tinyint(4) NOT NULL,
  `friday_from` time NOT NULL,
  `friday_to` time NOT NULL,
  `saturday_status` tinyint(4) NOT NULL,
  `saturday_work` tinyint(4) NOT NULL,
  `saturday_from` time NOT NULL,
  `saturday_to` time NOT NULL,
  `sunday_status` tinyint(4) NOT NULL,
  `sunday_work` tinyint(4) NOT NULL,
  `sunday_from` time NOT NULL,
  `sunday_to` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worklocation`
--

CREATE TABLE `worklocation` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `work_location_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `worklocation`
--

INSERT INTO `worklocation` (`id`, `company_id`, `work_location_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'xccxcx', '2019-11-20 04:34:46', '2019-11-20 04:34:46'),
(2, 1, 'cxcx', '2019-11-20 04:47:43', '2019-11-20 04:47:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_has_permission`
--
ALTER TABLE `admin_user_has_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advance_salary_request`
--
ALTER TABLE `advance_salary_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_history`
--
ALTER TABLE `attendance_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_report`
--
ALTER TABLE `client_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_page`
--
ALTER TABLE `cms_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comapnies`
--
ALTER TABLE `comapnies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comapnies_email_unique` (`email`);

--
-- Indexes for table `communication`
--
ALTER TABLE `communication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `communication_reply`
--
ALTER TABLE `communication_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_report`
--
ALTER TABLE `company_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `demo`
--
ALTER TABLE `demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exprience_basd_leave_count`
--
ALTER TABLE `exprience_basd_leave_count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_report`
--
ALTER TABLE `finance_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holiday_report`
--
ALTER TABLE `holiday_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_categories`
--
ALTER TABLE `leave_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nominate_employee`
--
ALTER TABLE `nominate_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `non_working_date`
--
ALTER TABLE `non_working_date`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_master`
--
ALTER TABLE `notification_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_report`
--
ALTER TABLE `order_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_setting`
--
ALTER TABLE `payroll_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_roll`
--
ALTER TABLE `pay_roll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `performances`
--
ALTER TABLE `performances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `period`
--
ALTER TABLE `period`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_master`
--
ALTER TABLE `permission_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_and_package_report`
--
ALTER TABLE `plan_and_package_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_features`
--
ALTER TABLE `plan_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_managent`
--
ALTER TABLE `plan_managent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recruitment`
--
ALTER TABLE `recruitment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_sms`
--
ALTER TABLE `send_sms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `send_sms_emp_id_foreign` (`emp_id`),
  ADD KEY `send_sms_company_id_foreign` (`company_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media_files`
--
ALTER TABLE `social_media_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media_token`
--
ALTER TABLE `social_media_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_generate_no`
--
ALTER TABLE `system_generate_no`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_report`
--
ALTER TABLE `task_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_report`
--
ALTER TABLE `ticket_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_change_requests`
--
ALTER TABLE `time_change_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `training_emp_dept`
--
ALTER TABLE `training_emp_dept`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_of_request`
--
ALTER TABLE `type_of_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_notification`
--
ALTER TABLE `user_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notification_type`
--
ALTER TABLE `user_notification_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `working_day_setting`
--
ALTER TABLE `working_day_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `worklocation`
--
ALTER TABLE `worklocation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_user_has_permission`
--
ALTER TABLE `admin_user_has_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advance_salary_request`
--
ALTER TABLE `advance_salary_request`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_history`
--
ALTER TABLE `attendance_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `award`
--
ALTER TABLE `award`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_report`
--
ALTER TABLE `client_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_page`
--
ALTER TABLE `cms_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `comapnies`
--
ALTER TABLE `comapnies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `communication`
--
ALTER TABLE `communication`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `communication_reply`
--
ALTER TABLE `communication_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_report`
--
ALTER TABLE `company_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `demo`
--
ALTER TABLE `demo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `exprience_basd_leave_count`
--
ALTER TABLE `exprience_basd_leave_count`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_report`
--
ALTER TABLE `finance_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holiday_report`
--
ALTER TABLE `holiday_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_categories`
--
ALTER TABLE `leave_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_details`
--
ALTER TABLE `login_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nominate_employee`
--
ALTER TABLE `nominate_employee`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `non_working_date`
--
ALTER TABLE `non_working_date`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `notification_master`
--
ALTER TABLE `notification_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_report`
--
ALTER TABLE `order_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_setting`
--
ALTER TABLE `payroll_setting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pay_roll`
--
ALTER TABLE `pay_roll`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `performances`
--
ALTER TABLE `performances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `period`
--
ALTER TABLE `period`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permission_master`
--
ALTER TABLE `permission_master`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `plan_and_package_report`
--
ALTER TABLE `plan_and_package_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan_features`
--
ALTER TABLE `plan_features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `plan_managent`
--
ALTER TABLE `plan_managent`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recruitment`
--
ALTER TABLE `recruitment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `send_sms`
--
ALTER TABLE `send_sms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_media_files`
--
ALTER TABLE `social_media_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_media_token`
--
ALTER TABLE `social_media_token`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_generate_no`
--
ALTER TABLE `system_generate_no`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_report`
--
ALTER TABLE `task_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ticket_attachments`
--
ALTER TABLE `ticket_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_report`
--
ALTER TABLE `ticket_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_change_requests`
--
ALTER TABLE `time_change_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `training_emp_dept`
--
ALTER TABLE `training_emp_dept`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `type_of_request`
--
ALTER TABLE `type_of_request`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_notification`
--
ALTER TABLE `user_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `user_notification_type`
--
ALTER TABLE `user_notification_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- AUTO_INCREMENT for table `working_day_setting`
--
ALTER TABLE `working_day_setting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `worklocation`
--
ALTER TABLE `worklocation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
