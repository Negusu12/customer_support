-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: css_db
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_type` tinyint(1) NOT NULL COMMENT '1= admin, 2= staff,3= customer',
  `ticket_id` int NOT NULL,
  `comment` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,1,1,'&lt;p&gt;Sample Comment only&lt;/p&gt; ','2020-11-09 14:52:16'),(3,2,3,1,'&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;','2020-11-09 15:36:56'),(4,2,2,3,'&lt;p&gt;what&amp;#x2019;s the document number&lt;/p&gt;','2023-05-03 02:53:25'),(5,4,3,3,'&lt;p&gt;0033&lt;/p&gt;','2023-05-03 02:53:47'),(6,2,2,3,'&lt;p&gt;ok it&amp;#x2019;s fixed now please check again&lt;/p&gt;','2023-05-03 02:54:45'),(7,4,3,3,'&lt;p&gt;works fine thanks&lt;/p&gt;','2023-05-03 02:55:05'),(8,5,2,12,'&lt;p&gt;what version of office do u use&lt;/p&gt;','2023-05-11 10:53:13'),(9,8,3,12,'&lt;p&gt;office 16 and win 10&lt;/p&gt;','2023-05-11 10:54:01'),(10,5,2,12,'&lt;p&gt;ok coming&lt;/p&gt;','2023-05-11 10:54:17'),(11,2,2,13,'&lt;p&gt;fgnhfg&lt;/p&gt;','2023-05-12 04:15:47'),(12,4,2,14,'&lt;p&gt;elaborate&lt;/p&gt;','2023-05-13 03:16:12'),(13,9,3,14,'&lt;p&gt;ftghgfh&lt;/p&gt;','2023-05-13 03:16:27'),(14,4,2,14,'&lt;p&gt;vgnv&lt;/p&gt;','2023-05-13 03:16:58');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `department_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (3,'liya','Getanhe','G/Egziabher','0912121212','Addis Ababa','liya@abhpartners.com','81dc9bdb52d04dc20036dbd8313ed055','2023-05-02 11:20:11',5),(4,'Etenesh','Workflow','Asres','1235436748536','AA','Etenesh@abhpartners.com','d41d8cd98f00b204e9800998ecf8427e','2023-05-03 02:50:19',4),(6,'Chernet','Getanhe','Getu','1235436748536','Addis Ababa','chernet@abhpartners.com','81dc9bdb52d04dc20036dbd8313ed055','2023-05-09 09:45:05',5),(7,'Mercy','Wondimu','admasu','1235436748','Oromia, Sebeta; ,','mercy@abhpartners.com','81dc9bdb52d04dc20036dbd8313ed055','2023-05-09 10:11:28',4),(8,'Tihtina','Asfaw','Shiferaw','1235436748536','AA','t@abhpartners.com','81dc9bdb52d04dc20036dbd8313ed055','2023-05-11 10:48:48',6),(9,'Ketema','Getanhe','yoni','0912121212','Addis Ababa, ; ,, ,','k@abhpartners.com','81dc9bdb52d04dc20036dbd8313ed055','2023-05-13 03:00:19',6);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deapartment_report`
--

DROP TABLE IF EXISTS `deapartment_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deapartment_report` (
  `department_name` text,
  `request_count` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deapartment_report`
--

LOCK TABLES `deapartment_report` WRITE;
/*!40000 ALTER TABLE `deapartment_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `deapartment_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'I.T. Department','Information technology Department','2020-11-09 11:43:18'),(4,'HR','Human Resources','2023-05-03 07:52:47'),(5,'Finance Dept','Finance Dept','2023-05-09 09:45:24'),(6,'Operation Department','Operation Department','2023-05-11 10:47:48');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_support`
--

DROP TABLE IF EXISTS `report_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_support` (
  `staff_name` text,
  `support_count` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_support`
--

LOCK TABLES `report_support` WRITE;
/*!40000 ALTER TABLE `report_support` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL,
  `department_id` int NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (2,1,'Negusu','Wondimu','Solomon','ABH066','Addis Ababa','negusu@abhpartners.com','81dc9bdb52d04dc20036dbd8313ed055','2023-05-03 02:50:57'),(3,1,'yohannes','b','a','0912121212','Addis Ababa','yohannes@abhpartners.com','81dc9bdb52d04dc20036dbd8313ed055','2023-05-09 06:20:15'),(4,1,'Zerihun','reta','sisay','0912121212','AA','Zerihun@abhpartners.com','81dc9bdb52d04dc20036dbd8313ed055','2023-05-09 09:48:36'),(5,1,'Getachew','Getanhe','Bishwe','1235436748536','Addis Ababa','getachew@abhpartners.com','81dc9bdb52d04dc20036dbd8313ed055','2023-05-11 10:50:00');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int NOT NULL,
  `subject` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=Pending,1=on process,2= Closed',
  `department_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `admin_id` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (3,'0','&lt;p&gt;Contact Finish date shows error message&lt;/p&gt;',2,1,4,2,0,'2023-05-03 02:52:19'),(4,'0','&lt;p&gt;IDK&lt;/p&gt;',2,1,4,4,0,'2023-05-03 03:27:02'),(5,'0','&lt;p&gt;aaaaa bbbb cccc dddd eee&lt;/p&gt;',2,1,4,0,0,'2023-05-03 07:22:46'),(8,'0','&lt;p&gt;Team Viewer Setup help&lt;br&gt;&lt;/p&gt;',2,1,4,3,0,'2023-05-09 07:41:12'),(9,'0','',2,1,4,3,0,'2023-05-09 07:48:22'),(10,'0','&lt;p&gt;Sticky Note pin please help&lt;br&gt;&lt;/p&gt;',2,1,6,4,0,'2023-05-09 09:47:26'),(11,'0','&lt;p&gt;Please help adobe&lt;/p&gt;',2,1,7,3,0,'2023-05-09 10:36:12'),(12,'0','&lt;p&gt;features are hidden in office&lt;/p&gt;',2,1,8,2,0,'2023-05-11 10:52:18'),(13,'0','bothside print',2,1,8,2,0,'2023-05-12 04:07:06'),(14,'0','&lt;p&gt;Activate Office and Windows&amp;nbsp;Activate Office and Windows&lt;br&gt;&lt;/p&gt;',0,1,9,2,0,'2023-05-13 03:02:25'),(39,'Networking','&lt;p&gt;network fail&lt;/p&gt;',1,1,8,3,0,'2023-05-16 08:35:16'),(40,'Printer','&lt;p&gt;pppppppp&lt;/p&gt;',2,1,8,2,0,'2023-05-16 08:42:24'),(41,'Printer','&lt;p&gt;ppp&lt;/p&gt;',0,1,8,0,0,'2023-05-16 10:03:12'),(42,'Printer','&lt;p&gt;wwww&lt;/p&gt;',0,1,8,3,1,'2023-05-16 10:03:29');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_report`
--

DROP TABLE IF EXISTS `tickets_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_report` (
  `id` int DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `description` text,
  `status` tinyint(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `customer_name` text,
  `staff_name` text,
  `department_name` text,
  `customer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_report`
--

LOCK TABLES `tickets_report` WRITE;
/*!40000 ALTER TABLE `tickets_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `role` tinyint(1) NOT NULL COMMENT '1 = Admin,2=support',
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `date_created` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrator','','',1,'admin','0192023a7bbd73250516f069df18b500',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-12  9:17:46
