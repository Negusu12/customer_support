-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2023 at 09:58 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `css_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `user_type` tinyint(1) NOT NULL COMMENT '1= admin, 2= staff,3= customer',
  `ticket_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `user_type`, `ticket_id`, `comment`, `date_created`) VALUES
(1, 1, 1, 1, '&lt;p&gt;Sample Comment only&lt;/p&gt; ', '2020-11-09 14:52:16'),
(3, 2, 3, 1, '&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;', '2020-11-09 15:36:56'),
(4, 2, 2, 3, '&lt;p&gt;what&amp;#x2019;s the document number&lt;/p&gt;', '2023-05-03 02:53:25'),
(5, 4, 3, 3, '&lt;p&gt;0033&lt;/p&gt;', '2023-05-03 02:53:47'),
(6, 2, 2, 3, '&lt;p&gt;ok it&amp;#x2019;s fixed now please check again&lt;/p&gt;', '2023-05-03 02:54:45'),
(7, 4, 3, 3, '&lt;p&gt;works fine thanks&lt;/p&gt;', '2023-05-03 02:55:05'),
(8, 5, 2, 12, '&lt;p&gt;what version of office do u use&lt;/p&gt;', '2023-05-11 10:53:13'),
(9, 8, 3, 12, '&lt;p&gt;office 16 and win 10&lt;/p&gt;', '2023-05-11 10:54:01'),
(10, 5, 2, 12, '&lt;p&gt;ok coming&lt;/p&gt;', '2023-05-11 10:54:17');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `middlename`, `contact`, `address`, `email`, `password`, `date_created`, `department_id`) VALUES
(3, 'liya', 'Getanhe', 'G/Egziabher', '0912121212', 'Addis Ababa', 'liya@abhpartners.com', '81dc9bdb52d04dc20036dbd8313ed055', '2023-05-02 11:20:11', 5),
(4, 'Etenesh', 'Workflow', 'Asres', '1235436748536', 'AA', 'Etenesh@abhpartners.com', 'd41d8cd98f00b204e9800998ecf8427e', '2023-05-03 02:50:19', 4),
(6, 'Chernet', 'Getanhe', 'Getu', '1235436748536', 'Addis Ababa', 'chernet@abhpartners.com', '81dc9bdb52d04dc20036dbd8313ed055', '2023-05-09 09:45:05', 5),
(7, 'Mercy', 'Wondimu', 'admasu', '1235436748', 'Oromia, Sebeta; ,', 'mercy@abhpartners.com', '81dc9bdb52d04dc20036dbd8313ed055', '2023-05-09 10:11:28', 4),
(8, 'Tihtina', 'Asfaw', 'Shiferaw', '1235436748536', 'AA', 't@abhpartners.com', '81dc9bdb52d04dc20036dbd8313ed055', '2023-05-11 10:48:48', 6);

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_request_report`
-- (See below for the actual view)
--
CREATE TABLE `customer_request_report` (
`customer_name` varchar(200)
,`customer_request_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `deapartment_report`
-- (See below for the actual view)
--
CREATE TABLE `deapartment_report` (
`department_name` text
,`request_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `description`, `date_created`) VALUES
(1, 'I.T. Department', 'Information technology Department', '2020-11-09 11:43:18'),
(4, 'HR', 'Human Resources', '2023-05-03 07:52:47'),
(5, 'Finance Dept', 'Finance Dept', '2023-05-09 09:45:24'),
(6, 'Operation Department', 'Operation Department', '2023-05-11 10:47:48');

-- --------------------------------------------------------

--
-- Stand-in structure for view `report_support`
-- (See below for the actual view)
--
CREATE TABLE `report_support` (
`staff_name` varchar(200)
,`support_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(30) NOT NULL,
  `department_id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `department_id`, `firstname`, `lastname`, `middlename`, `contact`, `address`, `email`, `password`, `date_created`) VALUES
(2, 1, 'Negusu', 'Wondimu', 'Solomon', 'ABH066', 'Addis Ababa', 'negusu@abhpartners.com', '81dc9bdb52d04dc20036dbd8313ed055', '2023-05-03 02:50:57'),
(3, 1, 'yohannes', 'b', 'a', '0912121212', 'Addis Ababa', 'yohannes@abhpartners.com', '81dc9bdb52d04dc20036dbd8313ed055', '2023-05-09 06:20:15'),
(4, 1, 'Zerihun', 'reta', 'sisay', '0912121212', 'AA', 'Zerihun@abhpartners.com', '81dc9bdb52d04dc20036dbd8313ed055', '2023-05-09 09:48:36'),
(5, 1, 'Getachew', 'Getanhe', 'Bishwe', '1235436748536', 'Addis Ababa', 'getachew@abhpartners.com', '81dc9bdb52d04dc20036dbd8313ed055', '2023-05-11 10:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(30) NOT NULL,
  `subject` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=Pending,1=on process,2= Closed',
  `department_id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `staff_id` int(30) NOT NULL,
  `admin_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `subject`, `description`, `status`, `department_id`, `customer_id`, `staff_id`, `admin_id`, `date_created`) VALUES
(3, 'ERP', '&lt;p&gt;Contact Finish date shows error message&lt;/p&gt;', 2, 1, 4, 2, 0, '2023-05-03 02:52:19'),
(4, 'Printer Issue', '&lt;p&gt;IDK&lt;/p&gt;', 2, 1, 4, 4, 0, '2023-05-03 03:27:02'),
(5, 'she wamnna vibe', '&lt;p&gt;aaaaa bbbb cccc dddd eee&lt;/p&gt;', 2, 1, 4, 0, 0, '2023-05-03 07:22:46'),
(8, 'Team Viewer Setup', '&lt;p&gt;Team Viewer Setup help&lt;br&gt;&lt;/p&gt;', 2, 1, 4, 3, 0, '2023-05-09 07:41:12'),
(9, 'Ut iure excepturi si', '', 2, 1, 4, 3, 0, '2023-05-09 07:48:22'),
(10, 'Sticky Note', '&lt;p&gt;Sticky Note pin please help&lt;br&gt;&lt;/p&gt;', 2, 1, 6, 4, 0, '2023-05-09 09:47:26'),
(11, 'letter format', '&lt;p&gt;Please help adobe&lt;/p&gt;', 2, 1, 7, 3, 0, '2023-05-09 10:36:12'),
(12, 'Activate Office and Windows', '&lt;p&gt;features are hidden in office&lt;/p&gt;', 2, 1, 8, 5, 0, '2023-05-11 10:52:18');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tickets_report`
-- (See below for the actual view)
--
CREATE TABLE `tickets_report` (
`id` int(30)
,`subject` text
,`description` text
,`status` tinyint(1)
,`date_created` datetime
,`customer_name` varchar(200)
,`staff_name` varchar(200)
,`department_name` text
,`customer_id` int(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `role` tinyint(1) NOT NULL COMMENT '1 = Admin,2=support',
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `role`, `username`, `password`, `date_created`) VALUES
(1, 'Administrator', '', '', 1, 'admin', '0192023a7bbd73250516f069df18b500', 0);

-- --------------------------------------------------------

--
-- Structure for view `customer_request_report`
--
DROP TABLE IF EXISTS `customer_request_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_request_report`  AS SELECT `tickets_report`.`customer_name` AS `customer_name`, count(0) AS `customer_request_count` FROM `tickets_report` GROUP BY `tickets_report`.`customer_name``customer_name`  ;

-- --------------------------------------------------------

--
-- Structure for view `deapartment_report`
--
DROP TABLE IF EXISTS `deapartment_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `deapartment_report`  AS SELECT `tickets_report`.`department_name` AS `department_name`, count(0) AS `request_count` FROM `tickets_report` WHERE `tickets_report`.`department_name` is not null GROUP BY `tickets_report`.`department_name``department_name`  ;

-- --------------------------------------------------------

--
-- Structure for view `report_support`
--
DROP TABLE IF EXISTS `report_support`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `report_support`  AS SELECT `tickets_report`.`staff_name` AS `staff_name`, count(0) AS `support_count` FROM `tickets_report` GROUP BY `tickets_report`.`staff_name``staff_name`  ;

-- --------------------------------------------------------

--
-- Structure for view `tickets_report`
--
DROP TABLE IF EXISTS `tickets_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tickets_report`  AS SELECT `t`.`id` AS `id`, `t`.`subject` AS `subject`, `t`.`description` AS `description`, `t`.`status` AS `status`, `t`.`date_created` AS `date_created`, `c`.`firstname` AS `customer_name`, `s`.`firstname` AS `staff_name`, `d`.`name` AS `department_name`, `t`.`customer_id` AS `customer_id` FROM (((`tickets` `t` left join `customers` `c` on(`t`.`customer_id` = `c`.`id`)) left join `staff` `s` on(`t`.`staff_id` = `s`.`id`)) left join `departments` `d` on(`c`.`department_id` = `d`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
