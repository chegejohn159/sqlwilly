-- MariaDB dump 10.17  Distrib 10.5.5-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: nv
-- ------------------------------------------------------
-- Server version	10.5.5-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_seq`
--

DROP TABLE IF EXISTS `account_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_seq`
--

LOCK TABLES `account_seq` WRITE;
/*!40000 ALTER TABLE `account_seq` DISABLE KEYS */;
INSERT INTO `account_seq` VALUES (1100,1,9223372036854775806,100,1,1000,0,0);
/*!40000 ALTER TABLE `account_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_statements`
--

DROP TABLE IF EXISTS `account_statements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_statements` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(11) COLLATE utf8mb4_bin NOT NULL,
  `balance` double DEFAULT NULL,
  `cr` double DEFAULT NULL,
  `dr` double DEFAULT NULL,
  `mapped_account` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `mapped_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `part_tran_type` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `reference_no` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `source` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_details` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `transaction_value_date` date DEFAULT NULL,
  `uploaded_time` date NOT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_statements`
--

LOCK TABLES `account_statements` WRITE;
/*!40000 ALTER TABLE `account_statements` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_statements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `account_sn` int(11) NOT NULL,
  `account_manager` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `account_ownership` varchar(2) COLLATE utf8mb4_bin NOT NULL,
  `account_reference` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `balance` double NOT NULL,
  `cust_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `delete_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `gl_sub_head` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `scheme_code` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `sol_code` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  `customer_sn` int(11) DEFAULT NULL,
  `office_sn` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_sn`),
  UNIQUE KEY `UK_5crpmoln9qdupcq25yvmoqi37` (`account_reference`),
  KEY `FKq9eaovqlspl480ayyok4s1nxw` (`customer_sn`),
  KEY `FK5arhorqs1frvxdfyhsic6g5tb` (`office_sn`),
  CONSTRAINT `FK5arhorqs1frvxdfyhsic6g5tb` FOREIGN KEY (`office_sn`) REFERENCES `office_customers` (`sn`),
  CONSTRAINT `FKq9eaovqlspl480ayyok4s1nxw` FOREIGN KEY (`customer_sn`) REFERENCES `customers` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (101,'SYSTEM','S','S001ISO101',0,NULL,'N',NULL,'SYSTEM','Y','2021-06-29 14:57:35.428000','SYSTEM','S001','Y','2021-06-29 14:57:35.428000',NULL,1000),(106,'SYSTEM','O','S001GSH1106',3000,NULL,'N','Disbursement Account','GSH1','Y','2021-06-29 15:44:02.545000','L1N1','S001','Y','2021-06-29 15:06:26.143000',NULL,NULL),(108,'SYSTEM','O','S001GSH1108',-1000,NULL,'N','Repayment Account','GSH1','Y','2021-06-29 16:06:09.453000','L1N1','S001','Y','2021-06-29 15:06:42.551000',NULL,NULL),(110,'SYSTEM','O','S001GSH1110',5400.000000000001,NULL,'N','Interest Accrual Account','GSH1','Y','2021-06-29 16:06:09.583000','L1N1','S001','Y','2021-06-29 15:07:13.758000',NULL,NULL),(112,'SYSTEM','O','S001GSH1112',1800,NULL,'N','Interest Income Account','GSH1','Y','2021-06-29 16:06:09.429000','L1N1','S001','Y','2021-06-29 15:07:19.972000',NULL,NULL),(115,'1','CL','S001L1N1113',-9200,'CUST104','N',NULL,'GSH1','Y','2021-06-29 16:06:09.484000','L1N1','S001','Y','2021-06-29 15:44:01.303000',1001,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amount_slabs`
--

DROP TABLE IF EXISTS `amount_slabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amount_slabs` (
  `slab_sn` int(11) NOT NULL,
  `dr_cr` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `delete_flag` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `from_amount` double DEFAULT NULL,
  `interest_code` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `posted_by` int(11) NOT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `rate` double NOT NULL,
  `slab_code` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `to_amount` double DEFAULT NULL,
  `verified_by` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  `interest_sn` int(11) NOT NULL,
  PRIMARY KEY (`slab_sn`),
  UNIQUE KEY `UK_i0t3rrr15cws98tklwamxxqge` (`slab_code`),
  KEY `FKrcbebvgw8e2oxsdtwy70sobki` (`interest_sn`),
  CONSTRAINT `FKrcbebvgw8e2oxsdtwy70sobki` FOREIGN KEY (`interest_sn`) REFERENCES `interest_definition` (`interest_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amount_slabs`
--

LOCK TABLES `amount_slabs` WRITE;
/*!40000 ALTER TABLE `amount_slabs` DISABLE KEYS */;
INSERT INTO `amount_slabs` VALUES (102,'D','N',NULL,'ino8',1,'Y','2021-06-29 16:11:24.214000',3,'SL102',NULL,NULL,'N',NULL,1),(104,'D','N',NULL,'ino5',1,'Y','2021-06-29 16:29:27.777000',1,'SL104',NULL,NULL,'N',NULL,2),(106,'D','N',NULL,'in12',1,'Y','2021-06-29 16:48:14.172000',7,'SL106',NULL,NULL,'N',NULL,3),(108,'C','N',NULL,'inp7',1,'Y','2021-06-29 16:37:49.195000',15,'SL108',NULL,NULL,'N',NULL,4),(110,'C','N',NULL,'jp67',1,'Y','2021-06-29 16:36:36.761000',17,'SL110',NULL,NULL,'N',NULL,5),(112,'D','N',NULL,'indt',1,'Y','2021-06-29 15:51:09.287000',17,'SL112',NULL,NULL,'N',NULL,6);
/*!40000 ALTER TABLE `amount_slabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_classification`
--

DROP TABLE IF EXISTS `asset_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_classification` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `classification` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `delete_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `max` int(11) NOT NULL,
  `min` int(11) NOT NULL,
  `posted_by` int(11) NOT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `verified_by` int(11) NOT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_classification`
--

LOCK TABLES `asset_classification` WRITE;
/*!40000 ALTER TABLE `asset_classification` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_info`
--

DROP TABLE IF EXISTS `business_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avg_daily_cash_sale` double NOT NULL,
  `business_name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `businesstype` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `establishment_year` date NOT NULL,
  `land_mark` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `licenced` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `road` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_sn` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_b5kqde82tlr5jlnu6w4552s9n` (`customer_sn`),
  CONSTRAINT `FK6hieo1vkwrru1yedfbk4jxn4h` FOREIGN KEY (`customer_sn`) REFERENCES `customers` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_info`
--

LOCK TABLES `business_info` WRITE;
/*!40000 ALTER TABLE `business_info` DISABLE KEYS */;
INSERT INTO `business_info` VALUES (1,234,'E&m TECHNOLOGY HOUSE LTD','E&m TECHNOLOGY HOUSE LTD','2021-05-31','Church','N','ASDFA',1001);
/*!40000 ALTER TABLE `business_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_master_table`
--

DROP TABLE IF EXISTS `calendar_master_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_master_table` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `delete_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `holiday_string` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `month` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_by` int(11) NOT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `verified_by` int(11) NOT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  `year` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_master_table`
--

LOCK TABLES `calendar_master_table` WRITE;
/*!40000 ALTER TABLE `calendar_master_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar_master_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collateral_info`
--

DROP TABLE IF EXISTS `collateral_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collateral_info` (
  `collateral_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `est_market_value` double DEFAULT NULL,
  `identification` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `customer_sn` int(11) DEFAULT NULL,
  `guarantor_sn` int(11) DEFAULT NULL,
  PRIMARY KEY (`collateral_id`),
  KEY `FKrgmecf0d9g3fsmv8wtbo6v643` (`customer_sn`),
  KEY `FK987gnnjdq2yx361u8pxw0eo56` (`guarantor_sn`),
  CONSTRAINT `FK987gnnjdq2yx361u8pxw0eo56` FOREIGN KEY (`guarantor_sn`) REFERENCES `guarantors` (`sn`),
  CONSTRAINT `FKrgmecf0d9g3fsmv8wtbo6v643` FOREIGN KEY (`customer_sn`) REFERENCES `customers` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collateral_info`
--

LOCK TABLES `collateral_info` WRITE;
/*!40000 ALTER TABLE `collateral_info` DISABLE KEYS */;
INSERT INTO `collateral_info` VALUES (1,'df',675,'yuytfgvh','dfs',1001,NULL),(2,'sadf',23344434,'ffggyhu','asdfd',1001,NULL),(3,'dsf',44,'jkhg','dfasds',1001,NULL),(4,'sd',556,'yjyjj','sdaf',1001,NULL),(5,'Ramton',34452,'Tea','zxc',NULL,1002),(6,'zxc',253423,'refereeRelationship','qrw',NULL,1002),(7,'qwer',2345,'zxc','sdfg',NULL,1002),(8,NULL,2345,NULL,'qwre',NULL,1002);
/*!40000 ALTER TABLE `collateral_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_info`
--

DROP TABLE IF EXISTS `contact_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_info` (
  `contact_sn` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `county` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `mobile_no` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `postal_address` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `postal_code` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_sn` int(11) DEFAULT NULL,
  `guarantor_sn` int(11) DEFAULT NULL,
  PRIMARY KEY (`contact_sn`),
  KEY `FKd2cl4tol6m910qmsvdx1qjlv2` (`customer_sn`),
  KEY `FKibc0uijrektv1n73rm9vicyeq` (`guarantor_sn`),
  CONSTRAINT `FKd2cl4tol6m910qmsvdx1qjlv2` FOREIGN KEY (`customer_sn`) REFERENCES `customers` (`sn`),
  CONSTRAINT `FKibc0uijrektv1n73rm9vicyeq` FOREIGN KEY (`guarantor_sn`) REFERENCES `guarantors` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_info`
--

LOCK TABLES `contact_info` WRITE;
/*!40000 ALTER TABLE `contact_info` DISABLE KEYS */;
INSERT INTO `contact_info` VALUES (1,'','C4','0708881885','23790','00100',1001,NULL),(2,'','C3','0708881885','23790','00100',NULL,1002);
/*!40000 ALTER TABLE `contact_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_seq`
--

DROP TABLE IF EXISTS `cust_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_seq`
--

LOCK TABLES `cust_seq` WRITE;
/*!40000 ALTER TABLE `cust_seq` DISABLE KEYS */;
INSERT INTO `cust_seq` VALUES (2000,1,9223372036854775806,1000,1,1000,0,0);
/*!40000 ALTER TABLE `cust_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `sn` int(11) NOT NULL,
  `customer_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `delete_flag` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` date NOT NULL,
  `first_name` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `gender` varchar(2) COLLATE utf8mb4_bin NOT NULL,
  `id_no` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `last_name` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `marital_status` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `middle_name` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `posted_on` datetime(6) DEFAULT NULL,
  `residential` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `sol_code` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `UK_iphh9rmjyvs9nep0k833i3bm9` (`id_no`),
  UNIQUE KEY `UK_iqv746oh5t5is1vr4p2nl79r6` (`customer_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1001,'CUST104','N','2021-06-07','Jane','A0','12323','Mwas','B1','Mwikali','Y','2021-06-29 15:19:56.000000','B5','S001','A4','Y','2021-06-29 15:19:54.000000');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eod`
--

DROP TABLE IF EXISTS `eod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eod` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `account_reference` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `eod_balance` double NOT NULL,
  `date` datetime(6) NOT NULL,
  `posted_by` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `verified_by` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eod`
--

LOCK TABLES `eod` WRITE;
/*!40000 ALTER TABLE `eod` DISABLE KEYS */;
/*!40000 ALTER TABLE `eod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gl`
--

DROP TABLE IF EXISTS `gl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gl` (
  `gl_sn` int(11) NOT NULL AUTO_INCREMENT,
  `delete_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `gl_code` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `gl_description` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`gl_sn`),
  UNIQUE KEY `UK_kugo9srb3i8k6nfhqxupfuqjd` (`gl_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gl`
--

LOCK TABLES `gl` WRITE;
/*!40000 ALTER TABLE `gl` DISABLE KEYS */;
INSERT INTO `gl` VALUES (1,'N','GL1','Liability','Y','2021-06-29 14:58:17.877000','Y','2021-06-29 14:58:17.877000'),(2,'N','GL2','assets updated','Y','2021-06-29 17:07:51.168000','Y','2021-06-29 17:07:51.168000');
/*!40000 ALTER TABLE `gl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gl_subhead_code`
--

DROP TABLE IF EXISTS `gl_subhead_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gl_subhead_code` (
  `subhead_sn` int(11) NOT NULL AUTO_INCREMENT,
  `delete_flag` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `gl_code` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `posted_time` datetime(6) DEFAULT NULL,
  `gl_sub_head_code` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `gl_sub_head_description` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  `gl_sn` int(11) DEFAULT NULL,
  PRIMARY KEY (`subhead_sn`),
  UNIQUE KEY `UK_ix15beqspwbedfnficy6khkt3` (`gl_sub_head_code`),
  KEY `FK413iggccravansck904iko3p` (`gl_sn`),
  CONSTRAINT `FK413iggccravansck904iko3p` FOREIGN KEY (`gl_sn`) REFERENCES `gl` (`gl_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gl_subhead_code`
--

LOCK TABLES `gl_subhead_code` WRITE;
/*!40000 ALTER TABLE `gl_subhead_code` DISABLE KEYS */;
INSERT INTO `gl_subhead_code` VALUES (1,'N','GL1','Y','2021-06-29 15:28:41.136000','GSH1','Loan Collection','Y','2021-06-29 15:28:41.136000',1),(2,'N','GL1','Y','2021-06-29 15:33:21.792000','GSH2','Loan Collection siskii finya','Y','2021-06-29 15:33:21.792000',1);
/*!40000 ALTER TABLE `gl_subhead_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guarantors`
--

DROP TABLE IF EXISTS `guarantors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guarantors` (
  `sn` int(11) NOT NULL,
  `dob` date NOT NULL,
  `first_name` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL,
  `gender` varchar(2) COLLATE utf8mb4_bin NOT NULL,
  `guarantor_id` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `id_no` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `last_name` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `marital_status` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `middle_name` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `occupation` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `relationship` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `residential` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_sn` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `UK_mj29y39q6r1inpqjmeyna172q` (`guarantor_id`),
  KEY `FKnmpt8aubnqebo5kola4kf2cdp` (`customer_sn`),
  CONSTRAINT `FKnmpt8aubnqebo5kola4kf2cdp` FOREIGN KEY (`customer_sn`) REFERENCES `customers` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guarantors`
--

LOCK TABLES `guarantors` WRITE;
/*!40000 ALTER TABLE `guarantors` DISABLE KEYS */;
INSERT INTO `guarantors` VALUES (1002,'2021-05-31','tjtyty','A0',NULL,'324','huh','B0','jjnj','jkjk',NULL,'B4','A3',1001);
/*!40000 ALTER TABLE `guarantors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header_seq`
--

DROP TABLE IF EXISTS `header_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `header_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header_seq`
--

LOCK TABLES `header_seq` WRITE;
/*!40000 ALTER TABLE `header_seq` DISABLE KEYS */;
INSERT INTO `header_seq` VALUES (101000,1,9223372036854775806,100000,1,1000,0,0);
/*!40000 ALTER TABLE `header_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1001,1,9223372036854775806,1,1,1000,0,0);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information_master`
--

DROP TABLE IF EXISTS `information_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information_master` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `info_code` varchar(2) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `value` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `delete_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_by` int(11) NOT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `verified_by` int(11) NOT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information_master`
--

LOCK TABLES `information_master` WRITE;
/*!40000 ALTER TABLE `information_master` DISABLE KEYS */;
INSERT INTO `information_master` VALUES (1,'A0','Male','gender','M','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(2,'A1','Female','gender','F','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(3,'A2','Mr.','salutation','Mr.','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(4,'A3','Mrs.','salutation','Mrs.','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(5,'A4','Ms.','salutation','Ms.','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(6,'A5','Doctor','salutation','Dr.','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(7,'A6','Professor','salutation','Prof.','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(8,'A7','Reverend','salutation','Rev.','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(9,'A8','Bishop','salutation','Bishop','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(10,'A9','Pastor','salutation','Pst.','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(11,'B0','Single','marital','Single','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(12,'B1','Married','marital','Married','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(13,'B2','Divorced','marital','Divorced','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(14,'B3','Owned Property','residential','Owned','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(15,'B4','Livig in a Rental','residential','Rental','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(16,'B5','family Property','residential','Family','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(17,'B6','Father','relationship','Father','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(18,'B7','Mother','relationship','Mother','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(19,'B8','Son','relationship','Son','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(20,'B9','Daughter','relationship','Daughter','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(21,'C0','Uncle','relationship','Uncle','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(22,'C1','Aunt','relationship','Aunt','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(23,'C2','Cousin','relationship','Cousin','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(24,'C3','Mombasa County','county','Mombasa','',0,'','0000-00-00 00:00:00.000000',0,'',NULL),(25,'C4','Nairobi County','county','Nairobi','',0,'','0000-00-00 00:00:00.000000',0,'',NULL);
/*!40000 ALTER TABLE `information_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest_definition`
--

DROP TABLE IF EXISTS `interest_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest_definition` (
  `interest_sn` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(5) COLLATE utf8mb4_bin DEFAULT NULL,
  `delete_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `end_date` date DEFAULT NULL,
  `full_diff` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `interest_code` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `posted_by` int(11) NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `start_date` date DEFAULT NULL,
  `verified_by` int(11) DEFAULT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `verified_on` date DEFAULT NULL,
  PRIMARY KEY (`interest_sn`),
  UNIQUE KEY `UK_9d9r8w5uhmjhsg2ir2wruy4e2` (`interest_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest_definition`
--

LOCK TABLES `interest_definition` WRITE;
/*!40000 ALTER TABLE `interest_definition` DISABLE KEYS */;
INSERT INTO `interest_definition` VALUES (1,'KES','Y','2021-06-30','F','ino8',1,'2021-06-29 14:57:02.959000','2021-05-31',NULL,'N',NULL),(2,'KES','N','2021-06-30','F','ino5',1,'2021-06-29 15:33:43.190000','2021-05-31',NULL,'N',NULL),(3,'KES','N','2021-06-16','F','in12',1,'2021-06-29 15:37:32.633000','2021-05-30',NULL,'N',NULL),(4,'KES','N','2021-05-31','F','inp7',1,'2021-06-29 15:39:34.721000','2021-06-07',NULL,'N',NULL),(5,'KES','Y','2021-06-30','F','jp67',1,'2021-06-29 15:47:02.357000','2021-05-31',NULL,'N',NULL),(6,'KES','Y','2021-06-30','F','indt',1,'2021-06-29 15:51:09.287000','2021-05-31',NULL,'N',NULL);
/*!40000 ALTER TABLE `interest_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_demand`
--

DROP TABLE IF EXISTS `loan_demand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_demand` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `acid` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `adj_amount` double DEFAULT NULL,
  `adj_date` datetime(6) DEFAULT NULL,
  `created_by` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `deleted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `demand_amount` double NOT NULL,
  `demand_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `demand_date` date NOT NULL,
  `demand_type` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `loan_sn` int(11) DEFAULT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `UK_hy80dp207oqlylltc2dsag7jn` (`demand_code`),
  KEY `FKmfy02p5cpn7kqy9hyj5jt6xfh` (`loan_sn`),
  CONSTRAINT `FKmfy02p5cpn7kqy9hyj5jt6xfh` FOREIGN KEY (`loan_sn`) REFERENCES `loans` (`loan_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_demand`
--

LOCK TABLES `loan_demand` WRITE;
/*!40000 ALTER TABLE `loan_demand` DISABLE KEYS */;
INSERT INTO `loan_demand` VALUES (5,'S001L1N1113',700,'2021-06-29 15:43:35.216000','SYSTEM','2021-06-29 15:43:35.216000','N',700,'DMD5','2021-06-29','INFEE',102),(6,'S001L1N1113',200,'2021-06-29 15:43:35.216000','SYSTEM','2021-06-29 15:43:35.216000','N',200,'DMD6','2021-06-29','PRFEE',102);
/*!40000 ALTER TABLE `loan_demand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_seq`
--

DROP TABLE IF EXISTS `loan_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_seq`
--

LOCK TABLES `loan_seq` WRITE;
/*!40000 ALTER TABLE `loan_seq` DISABLE KEYS */;
INSERT INTO `loan_seq` VALUES (1100,1,9223372036854775806,100,1,1000,0,0);
/*!40000 ALTER TABLE `loan_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loans` (
  `loan_sn` int(11) NOT NULL,
  `demand_carry_forward` int(11) DEFAULT NULL,
  `disbursement_amount` double NOT NULL,
  `interest_demand_amount` double NOT NULL,
  `next_repayment_date` date DEFAULT NULL,
  `overflow_amount` double NOT NULL,
  `principal_demand_amount` double NOT NULL,
  `repayment_period` int(11) NOT NULL,
  `sum_principal_demand` double NOT NULL,
  `account_sn` int(11) NOT NULL,
  PRIMARY KEY (`loan_sn`),
  UNIQUE KEY `UK_qsfpus46m0htevo3g41w8jsca` (`account_sn`),
  CONSTRAINT `FKlu9y7r99rj1vi3lgaa0efmusl` FOREIGN KEY (`account_sn`) REFERENCES `accounts` (`account_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (102,0,3000,210.00000000000003,'2021-07-06',1100,100,30,0,115);
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `next_of_kins`
--

DROP TABLE IF EXISTS `next_of_kins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `next_of_kins` (
  `kin_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `middle_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `occupation` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `relation_to_borrower` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`kin_id`),
  KEY `FKeqipmoatitf6cmxih2e98ec8d` (`customer_id`),
  CONSTRAINT `FKeqipmoatitf6cmxih2e98ec8d` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `next_of_kins`
--

LOCK TABLES `next_of_kins` WRITE;
/*!40000 ALTER TABLE `next_of_kins` DISABLE KEYS */;
INSERT INTO `next_of_kins` VALUES (1,'Wilfred','mwangi njuguna','xsd',NULL,'B7',1001);
/*!40000 ALTER TABLE `next_of_kins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_customers`
--

DROP TABLE IF EXISTS `office_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_customers` (
  `sn` int(11) NOT NULL,
  `delete_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `owned_by` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `posted_by` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `verified_by` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_customers`
--

LOCK TABLES `office_customers` WRITE;
/*!40000 ALTER TABLE `office_customers` DISABLE KEYS */;
INSERT INTO `office_customers` VALUES (1000,'N','Thika Branch ISO Account','S001','SYSTEM','Y','2021-06-29 14:55:51.490000',NULL,'N',NULL);
/*!40000 ALTER TABLE `office_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_sequence`
--

DROP TABLE IF EXISTS `office_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_sequence` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_sequence`
--

LOCK TABLES `office_sequence` WRITE;
/*!40000 ALTER TABLE `office_sequence` DISABLE KEYS */;
INSERT INTO `office_sequence` VALUES (2000,1,9223372036854775806,1000,1,1000,0,0);
/*!40000 ALTER TABLE `office_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_tran`
--

DROP TABLE IF EXISTS `part_tran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_tran` (
  `sn` int(11) NOT NULL,
  `acid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `iso_account` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `part_tran_sn` int(11) NOT NULL,
  `part_tran_type` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `tran_amount` double NOT NULL,
  `tran_date` datetime(6) DEFAULT NULL,
  `tran_particulars` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `tran_id` int(11) NOT NULL,
  PRIMARY KEY (`sn`),
  KEY `FK6d8d9mumyb0798vmvjtnu2119` (`tran_id`),
  CONSTRAINT `FK6d8d9mumyb0798vmvjtnu2119` FOREIGN KEY (`tran_id`) REFERENCES `tran_headers` (`tran_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_tran`
--

LOCK TABLES `part_tran` WRITE;
/*!40000 ALTER TABLE `part_tran` DISABLE KEYS */;
INSERT INTO `part_tran` VALUES (1,'S001GSH1110','N',1,'C',6300.000000000001,'2021-06-29 15:44:01.627000','Crediting Interest Accrual Account',100000),(2,'S001L1N1113','N',2,'D',200,'2021-06-29 15:44:01.627000','Debiting Customer Loan Account with Loan Processing fee',100000),(3,'S001GSH1112','N',3,'C',700,'2021-06-29 15:44:01.627000','Crediting Interest Income Account with Loan Intake fee',100000),(4,'S001L1N1113','N',4,'D',6300.000000000001,'2021-06-29 15:44:01.627000','Debiting Customer Loan Account with Interest Demand Amount',100000),(5,'S001L1N1113','N',5,'D',3000,'2021-06-29 15:44:01.627000','Debiting Customer Loa Account with Principal Demand Amount',100000),(6,'S001GSH1112','N',6,'C',200,'2021-06-29 15:44:01.627000','Crediting the Interest Income Account with Processing Fee',100000),(7,'S001GSH1106','N',7,'C',3000,'2021-06-29 15:44:01.627000','Crediting Loan Disbursement Table',100000),(8,'S001L1N1113','N',8,'D',700,'2021-06-29 15:44:01.627000','Debiting Customer Loan Account with the Loan Intake Fee',100000),(9,'S001GSH1112','N',1,'C',200,'2021-06-29 15:47:21.680000',NULL,100001),(10,'S001GSH1112','N',2,'C',700,'2021-06-29 15:47:21.680000',NULL,100001),(11,'S001GSH1108','N',3,'D',1000,'2021-06-29 15:47:21.680000',NULL,100001),(12,'S001L1N1113','N',4,'C',1000,'2021-06-29 15:47:21.680000',NULL,100001),(13,'S001GSH1110','N',5,'D',200,'2021-06-29 15:47:21.680000',NULL,100001),(14,'S001GSH1110','N',6,'D',700,'2021-06-29 15:47:21.680000',NULL,100001);
/*!40000 ALTER TABLE `part_tran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_tran_seq`
--

DROP TABLE IF EXISTS `part_tran_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_tran_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_tran_seq`
--

LOCK TABLES `part_tran_seq` WRITE;
/*!40000 ALTER TABLE `part_tran_seq` DISABLE KEYS */;
INSERT INTO `part_tran_seq` VALUES (1001,1,9223372036854775806,1,1,1000,0,0);
/*!40000 ALTER TABLE `part_tran_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_sn` int(11) NOT NULL AUTO_INCREMENT,
  `apply_late_repayment_fee` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `calculation_base` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `created_by` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `created_on` date NOT NULL,
  `deleted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `disbursement_account` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `intake_fee` double DEFAULT NULL,
  `interest_accrual_account` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `interest_base` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `interest_code` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `interest_income_account` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `interest_type` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `late_repayment_fee` double DEFAULT NULL,
  `processing_fee` double DEFAULT NULL,
  `product_code` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `product_description` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `repayment_account` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `repayment_base` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`product_sn`),
  UNIQUE KEY `UK_922x4t23nx64422orei4meb2y` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Y','C','1','2021-06-29','N','S001GSH1106',700,'S001GSH1110','W','ino8','S001GSH1112','S',300,200,'L1N1','Monthly Loans','S001GSH1108','W','C');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referees`
--

DROP TABLE IF EXISTS `referees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referees` (
  `referee_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `middle_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `mobile_no` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `relationship` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `surname` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `customer_sn` int(11) DEFAULT NULL,
  PRIMARY KEY (`referee_id`),
  KEY `FKym10a1y8n0qdxlq5ck6uj5s8` (`customer_sn`),
  CONSTRAINT `FKym10a1y8n0qdxlq5ck6uj5s8` FOREIGN KEY (`customer_sn`) REFERENCES `customers` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referees`
--

LOCK TABLES `referees` WRITE;
/*!40000 ALTER TABLE `referees` DISABLE KEYS */;
INSERT INTO `referees` VALUES (1,'Wilfred','xsa','0708881885','B8','mwangi njuguna',1001);
/*!40000 ALTER TABLE `referees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slab_seq`
--

DROP TABLE IF EXISTS `slab_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slab_seq` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slab_seq`
--

LOCK TABLES `slab_seq` WRITE;
/*!40000 ALTER TABLE `slab_seq` DISABLE KEYS */;
INSERT INTO `slab_seq` VALUES (1101,1,9223372036854775806,101,1,1000,0,0);
/*!40000 ALTER TABLE `slab_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sol`
--

DROP TABLE IF EXISTS `sol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sol` (
  `sol_sn` int(11) NOT NULL,
  `delete_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `location` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `phone_number` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `posted_by` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `sol_code` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sol_description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `verified_by` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`sol_sn`),
  UNIQUE KEY `UK_8xmna44g1olbrehgmrsukkyns` (`email`),
  UNIQUE KEY `UK_3eup25rl3pse0wreoylkmcypu` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sol`
--

LOCK TABLES `sol` WRITE;
/*!40000 ALTER TABLE `sol` DISABLE KEYS */;
INSERT INTO `sol` VALUES (1,'N','thika@gmail.com','Thika Town','111111111111','U1','Y','2021-06-29 14:57:33.259000','S001','Thika Branch','U1','Y','2021-06-29 14:57:33.259000');
/*!40000 ALTER TABLE `sol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tran_headers`
--

DROP TABLE IF EXISTS `tran_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tran_headers` (
  `tran_id` int(11) NOT NULL,
  `chq_no` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `currency` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `delete_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `exchange_rate` double DEFAULT NULL,
  `posted_by` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `tran_sub_type` varchar(2) COLLATE utf8mb4_bin DEFAULT NULL,
  `tran_type` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `verified_by` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`tran_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tran_headers`
--

LOCK TABLES `tran_headers` WRITE;
/*!40000 ALTER TABLE `tran_headers` DISABLE KEYS */;
INSERT INTO `tran_headers` VALUES (100000,NULL,'KES','N',NULL,'SYSTEM','Y','2021-06-29 15:44:01.627000','NC','C','SYSTEM','Y','2021-06-29 15:44:01.627000'),(100001,NULL,'KES','N',NULL,'user','Y','2021-06-29 15:47:21.680000','NC','C','user','Y','2021-06-29 15:47:21.680000');
/*!40000 ALTER TABLE `tran_headers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions_history`
--

DROP TABLE IF EXISTS `transactions_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions_history` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `acid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `chq_no` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_bin NOT NULL,
  `delete_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `exchange_rate` double DEFAULT NULL,
  `part_tran_sn` int(11) NOT NULL,
  `part_tran_type` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_by` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `posted_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `posted_time` datetime(6) NOT NULL,
  `tran_amount` double NOT NULL,
  `tran_date` date DEFAULT NULL,
  `tran_id` int(11) DEFAULT NULL,
  `tran_particulars` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `tran_sub_type` varchar(2) COLLATE utf8mb4_bin DEFAULT NULL,
  `tran_type` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `verified_by` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `verified_flag` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `verified_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions_history`
--

LOCK TABLES `transactions_history` WRITE;
/*!40000 ALTER TABLE `transactions_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-29 20:19:44
