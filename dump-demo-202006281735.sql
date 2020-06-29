-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `buy_datetime` datetime DEFAULT NULL,
  `buy_price_actual` double DEFAULT '-999',
  `buy_price_market` double DEFAULT NULL,
  `gain_actual` double DEFAULT NULL,
  `gain_market` double DEFAULT NULL,
  `sell_datetime` datetime DEFAULT NULL,
  `sell_price_actual` double DEFAULT '-999',
  `sell_price_market` double DEFAULT NULL,
  `stock_symbol` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `units_purchased` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `unit_gain_market` double DEFAULT NULL,
  `unit_gain_actual` double DEFAULT NULL,
  `transaction_status` varchar(35) DEFAULT NULL,
  `month` int NOT NULL,
  PRIMARY KEY (`id`,`user_id`,`month`),
  KEY `FKsg7jp0aj6qipr50856wf6vbw1` (`user_id`),
  KEY `indx_dt_tr` (`buy_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
/*!50100 PARTITION BY RANGE (`month`)
SUBPARTITION BY HASH (`user_id`)
SUBPARTITIONS 5
(PARTITION p1 VALUES LESS THAN (2) ENGINE = InnoDB,
 PARTITION p2 VALUES LESS THAN (3) ENGINE = InnoDB,
 PARTITION p3 VALUES LESS THAN (4) ENGINE = InnoDB,
 PARTITION p4 VALUES LESS THAN (5) ENGINE = InnoDB,
 PARTITION p5 VALUES LESS THAN (6) ENGINE = InnoDB,
 PARTITION p6 VALUES LESS THAN (7) ENGINE = InnoDB,
 PARTITION p7 VALUES LESS THAN (8) ENGINE = InnoDB,
 PARTITION p8 VALUES LESS THAN (9) ENGINE = InnoDB,
 PARTITION p9 VALUES LESS THAN (10) ENGINE = InnoDB,
 PARTITION p10 VALUES LESS THAN (11) ENGINE = InnoDB,
 PARTITION p11 VALUES LESS THAN (12) ENGINE = InnoDB,
 PARTITION p12 VALUES LESS THAN (13) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (3,'2020-05-12 22:47:43',165.1,165,28,30,'2020-05-12 22:52:43',167.9,168,'APPL','ACTUAL',10,2020,6,'2020-05-12',3,2.8,'COMPLETE',5),(4,'2020-05-13 14:57:11',165.1,165,28,30,'2020-05-13 15:02:11',167.9,168,'APPL','ACTUAL',10,2020,6,'2020-05-13',3,2.8,'COMPLETE',5),(5,'2020-05-13 14:57:17',265.1,265,28,30,'2020-05-13 15:02:17',267.9,268,'BABA','ACTUAL',10,2020,6,'2020-05-13',3,2.8,'COMPLETE',5),(6,'2020-05-17 19:30:55',165.1,165,28,30,'2020-05-17 19:35:55',167.9,168,'APPL','ACTUAL',10,2020,6,'2020-05-17',3,2.8,'COMPLETE',5),(7,'2020-05-17 19:30:59',265.1,265,28,30,'2020-05-17 19:35:59',267.9,268,'BABA','ACTUAL',10,2020,6,'2020-05-17',3,2.8,'COMPLETE',5),(8,'2020-05-18 00:00:55',466,465,NULL,NULL,NULL,-999,NULL,'TSLA','ACTUAL',10,2020,6,'2020-05-18',NULL,NULL,'IN PROGRESS',5),(9,'2020-05-18 00:01:01',-999,45,NULL,NULL,NULL,-999,NULL,'AMD','ACTUAL',35,2020,6,'2020-05-18',NULL,NULL,'IN PROGRESS',5),(10,'2020-05-18 00:01:07',165.1,165,28,30,'2020-05-18 00:06:07',167.9,168,'APPL','ACTUAL',10,2020,6,'2020-05-18',3,2.8,'COMPLETE',5),(11,'2020-05-18 12:29:37',265.1,265,28,30,'2020-05-18 12:34:37',267.9,268,'BABA','ACTUAL',10,2020,6,'2020-05-18',3,2.8,'COMPLETE',5),(12,'2020-05-18 12:29:44',265.1,265,-9,-9,'2020-05-18 12:34:44',262.1,262,'ZM','ACTUAL',3,2020,6,'2020-05-18',-3,-3,'COMPLETE',5),(13,'2020-05-18 12:29:53',205.2,200,NULL,50,'2020-05-18 12:34:53',-999,205,'NVD','ACTUAL',10,2020,6,'2020-05-18',5,NULL,'COMPUTE PENDING',5),(29,'2020-06-27 22:11:41',265.1,265,-9,-9,'2020-06-27 22:16:41',262.1,262,'ZM','ACTUAL',3,2020,6,'2020-06-27',-3,-3,'COMPLETE',6),(30,'2020-06-27 22:11:59',265.1,265,28,30,'2020-06-27 22:16:59',267.9,268,'BABA','ACTUAL',10,2020,6,'2020-06-27',3,2.8,'COMPLETE',6),(31,'2020-06-27 22:12:10',165.1,165,28,30,'2020-06-27 22:17:10',167.9,168,'APPL','ACTUAL',10,2020,6,'2020-06-27',3,2.8,'COMPLETE',6),(32,'2020-06-27 22:18:21',466,465,NULL,NULL,NULL,-999,NULL,'TSLA','ACTUAL',10,2020,6,'2020-06-27',NULL,NULL,'IN PROGRESS',6);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_opportunity`
--

DROP TABLE IF EXISTS `transaction_opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_opportunity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `buy_datetime` datetime DEFAULT NULL,
  `buy_price_actual` double DEFAULT '-999',
  `buy_price_market` double DEFAULT NULL,
  `gain_actual` double DEFAULT NULL,
  `gain_market` double DEFAULT NULL,
  `sell_datetime` datetime DEFAULT NULL,
  `sell_price_actual` double DEFAULT '-999',
  `sell_price_market` double DEFAULT NULL,
  `stock_symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `units_purchased` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `unit_gain_market` double DEFAULT NULL,
  `unit_gain_actual` double DEFAULT NULL,
  `transaction_status` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `month` int NOT NULL,
  PRIMARY KEY (`id`,`user_id`,`month`),
  KEY `indx_dt_tr_opp` (`buy_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_opportunity`
--

LOCK TABLES `transaction_opportunity` WRITE;
/*!40000 ALTER TABLE `transaction_opportunity` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_options`
--

DROP TABLE IF EXISTS `transaction_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `buy_datetime` datetime DEFAULT NULL,
  `buy_price_actual` double DEFAULT '-999',
  `buy_price_market` double DEFAULT NULL,
  `gain_actual` double DEFAULT NULL,
  `gain_market` double DEFAULT NULL,
  `sell_datetime` datetime DEFAULT NULL,
  `sell_price_actual` double DEFAULT '-999',
  `sell_price_market` double DEFAULT NULL,
  `stock_symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `units_purchased` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `unit_gain_market` double DEFAULT NULL,
  `unit_gain_actual` double DEFAULT NULL,
  `transaction_status` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `month` int NOT NULL,
  PRIMARY KEY (`id`,`user_id`,`month`),
  KEY `indx_dt_tr_options` (`buy_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_options`
--

LOCK TABLES `transaction_options` WRITE;
/*!40000 ALTER TABLE `transaction_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (6,'2020-03-29 03:25:57','Rishabh Taneja','ryshabtaneja@gmail.com','','2020-03-29 03:25:57','$2a$10$eUvb5Hi4Po5yMUOMg4gEsOVdp5YYTCv0e5Uho.pfjA2sZ9dkz5QRW','google','113495821259901218794'),(8,'2020-03-29 03:31:17','Jyoti Batra','jyoti2111@gmail.com','','2020-03-29 03:31:17','$2a$10$UBhwhl8F/7fzFaufkAmYgexGwZG2L3IkbDDIhbljbXX9Ii/KGOMrC','google','101876891746633048332'),(9,'2020-05-04 22:33:28','Rishabh Taneja','rishabh.taneja.mn22@gmail.com','','2020-05-04 22:33:28','$2a$10$FEHgIC/HseaEYqVtFzskPu8/APxW382gS2sd9WqoWWV4/iE142laC','google','115657969078221332997'),(10,'2020-05-04 23:13:21','Rishabh Taneja','rishabh.taneja.mn@gmail.com','','2020-05-04 23:13:21','$2a$10$TwqgwQnP4mTBSlZcFfn/se8pMErA78beGa4veqNJ52vr29.Fs/vgC','google','115657969078221332997');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_info`
--

DROP TABLE IF EXISTS `user_account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account_info` (
  `user_id` bigint NOT NULL,
  `is_day_trade_enabled` tinyint(1) DEFAULT NULL,
  `day_trades_allowed` int DEFAULT NULL,
  `actual_trading_enabled` tinyint(1) DEFAULT NULL,
  `amount_per_trade` double DEFAULT NULL,
  `day_trades_available_today_before_market` int DEFAULT NULL,
  `next_day_trade_date` date DEFAULT NULL,
  `amount_available` double DEFAULT NULL,
  `amount_invested` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `total_gain_amount` double DEFAULT NULL,
  `total_gain_percent` double DEFAULT NULL,
  `account_type` varchar(30) DEFAULT NULL,
  KEY `user_account_settings_fk` (`user_id`) USING BTREE,
  CONSTRAINT `user_account_settings_fk_copy` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_info`
--

LOCK TABLES `user_account_info` WRITE;
/*!40000 ALTER TABLE `user_account_info` DISABLE KEYS */;
INSERT INTO `user_account_info` VALUES (6,1,10,1,3000,8,NULL,35000,15000,50000,3000,10,'ACTUAL');
/*!40000 ALTER TABLE `user_account_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_settings`
--

DROP TABLE IF EXISTS `user_account_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account_settings` (
  `user_id` bigint NOT NULL,
  `is_day_trade_enabled` tinyint(1) DEFAULT NULL,
  `day_trades_alllowed` int DEFAULT NULL,
  `actual_trading_enabled` tinyint(1) DEFAULT NULL,
  `amount_per_trade` double DEFAULT NULL,
  `day_trades_available_today_before_marked` int DEFAULT NULL,
  `next_day_trade_date` date DEFAULT NULL,
  KEY `user_account_settings_fk` (`user_id`),
  CONSTRAINT `user_account_settings_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_settings`
--

LOCK TABLES `user_account_settings` WRITE;
/*!40000 ALTER TABLE `user_account_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_account_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_balance`
--

DROP TABLE IF EXISTS `user_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_balance` (
  `user_id` bigint NOT NULL,
  `amount_available` double DEFAULT NULL,
  `amount_invested` double DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `total_gain_amount` double DEFAULT NULL,
  `total_gain_percent` double DEFAULT NULL,
  KEY `user_balance_fk` (`user_id`),
  CONSTRAINT `user_balance_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_balance`
--

LOCK TABLES `user_balance` WRITE;
/*!40000 ALTER TABLE `user_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_information_view_settings`
--

DROP TABLE IF EXISTS `user_information_view_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_information_view_settings` (
  `user_id` bigint DEFAULT NULL,
  `transaction_history_months` int DEFAULT NULL,
  KEY `user_information_view_settings_fk` (`user_id`),
  CONSTRAINT `user_information_view_settings_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_information_view_settings`
--

LOCK TABLES `user_information_view_settings` WRITE;
/*!40000 ALTER TABLE `user_information_view_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_information_view_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_role_fk` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_role_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (9,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_transaction_summary`
--

DROP TABLE IF EXISTS `user_transaction_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_transaction_summary` (
  `user_id` bigint NOT NULL,
  `month` varchar(20) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `total_month_gain_percent` double DEFAULT NULL,
  `total_month_gain_amount` double DEFAULT NULL,
  `transaction_type` varchar(20) DEFAULT NULL,
  KEY `user_transaction_summary_fk` (`user_id`),
  CONSTRAINT `user_transaction_summary_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_transaction_summary`
--

LOCK TABLES `user_transaction_summary` WRITE;
/*!40000 ALTER TABLE `user_transaction_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_transaction_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'demo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-28 17:35:04
