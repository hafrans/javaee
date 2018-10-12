-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: inspur
-- ------------------------------------------------------
-- Server version	5.5.53

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` decimal(5,2) DEFAULT '0.01',
  `publishdate` datetime NOT NULL DEFAULT '2018-09-09 00:00:01',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (10,'测试3',256.00,'2018-01-30 00:00:00'),(16,'测试2334',15.66,'2018-09-04 00:00:00'),(23,'测2试2333',11.99,'2018-09-11 13:18:23'),(24,'3213',123.00,'2018-09-11 00:00:00');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gzcrm_cinfo`
--

DROP TABLE IF EXISTS `gzcrm_cinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gzcrm_cinfo` (
  `C_KEY` int(11) NOT NULL DEFAULT '0',
  `C_CM_ID` int(11) DEFAULT NULL,
  `C_SSN` varchar(18) DEFAULT NULL,
  `C_NAME` varchar(8) DEFAULT NULL,
  `C_TEL` varchar(26) DEFAULT NULL,
  `C_SALARY` double(12,2) DEFAULT NULL,
  `C_BALANCE` double(12,2) DEFAULT NULL,
  `C_DEBT` double(12,2) DEFAULT NULL,
  `C_BUSINESS` varchar(255) DEFAULT NULL,
  `C_UNIT` varchar(100) DEFAULT NULL,
  `C_ADD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`C_KEY`),
  KEY `FK_GID` (`C_CM_ID`),
  CONSTRAINT `FK_GID` FOREIGN KEY (`C_CM_ID`) REFERENCES `yc_member` (`MEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gzcrm_cinfo`
--

LOCK TABLES `gzcrm_cinfo` WRITE;
/*!40000 ALTER TABLE `gzcrm_cinfo` DISABLE KEYS */;
INSERT INTO `gzcrm_cinfo` VALUES (1,1,'372323191121210213','test1','13721138901',3000.00,700.00,300.32,'','',''),(2,2,'372323191121210232','test2','13621138901',4000.00,700.00,300.32,'','',''),(3,1,'372323191121210213','test3','13821138901',3000.00,700.00,300.32,'','',''),(4,2,'372323191121210232','test4','13121138901',4000.00,700.00,300.32,'','',''),(5,1,'372323191121210213','test5','13221138901',3000.00,700.00,300.32,'','',''),(6,2,'372323191121210232','test6','13321138901',4000.00,700.00,300.32,'','',''),(7,1,'372323191121210213','test7','13421138901',3000.00,700.00,300.32,'','',''),(8,2,'372323191121210232','test8','13521138901',4000.00,700.00,300.32,'','',''),(9,1,'372323191121210213','test9','13621138901',3000.00,700.00,300.32,'','',''),(10,2,'372323191121210232','test10','15721138901',4000.00,700.00,300.32,'','',''),(11,1,'372323191121210213','test11','18721138901',3000.00,700.00,300.32,'','',''),(12,2,'372323191121210232','test12','18721138901',4000.00,700.00,300.32,'','',''),(13,2,'372323191121210232','test13','18721138901',4000.00,700.00,300.32,'','',''),(14,2,'372323191121210232','test14','18721138901',4000.00,700.00,300.32,'','',''),(15,2,'372323191121210232','test15','18721138901',4000.00,700.00,300.32,'','','');
/*!40000 ALTER TABLE `gzcrm_cinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gzcrm_cminfo_work`
--

DROP TABLE IF EXISTS `gzcrm_cminfo_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gzcrm_cminfo_work` (
  `CM_KEY` int(11) NOT NULL AUTO_INCREMENT,
  `CM_ID` char(6) DEFAULT NULL COMMENT '客户经理编号',
  `CM_MANAGEMENT` varchar(255) DEFAULT NULL COMMENT '客户管理及维护情况',
  `CM_PRODUCT` varchar(255) DEFAULT NULL COMMENT '产品信息',
  `CM_LOAN` varchar(255) DEFAULT NULL COMMENT '贷后管理',
  `CM_WARNING` varchar(255) DEFAULT NULL COMMENT '风险预警',
  `CM_ISSUE` varchar(255) DEFAULT NULL COMMENT '发现问题',
  `CM_WORK_PROPOSAL` text COMMENT '工作建议以及感悟',
  `CM_DATE` date DEFAULT NULL COMMENT '录入日期',
  PRIMARY KEY (`CM_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客户经理工作管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gzcrm_cminfo_work`
--

LOCK TABLES `gzcrm_cminfo_work` WRITE;
/*!40000 ALTER TABLE `gzcrm_cminfo_work` DISABLE KEYS */;
INSERT INTO `gzcrm_cminfo_work` VALUES (1,NULL,'新增加一个客户','购买基金','继续跟踪',NULL,NULL,'真诚对待每个客户','2016-04-16');
/*!40000 ALTER TABLE `gzcrm_cminfo_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yc_member`
--

DROP TABLE IF EXISTS `yc_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yc_member` (
  `MEM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CNAME` varchar(50) DEFAULT NULL,
  `MEM_PASS` varchar(400) DEFAULT NULL,
  `MEM_SEX` varchar(4) DEFAULT NULL,
  `MEM_BORN` datetime DEFAULT NULL,
  `MEM_MAIL` varchar(50) DEFAULT NULL,
  `MEM_QUESTION` varchar(50) DEFAULT NULL,
  `MEM_ANSWER` varchar(50) DEFAULT NULL,
  `REGISTER_TIME` datetime DEFAULT NULL,
  `LAST_TIME` datetime DEFAULT NULL,
  `ISENABLE` varchar(1) DEFAULT NULL,
  `ROLEID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MEM_ID`),
  UNIQUE KEY `NAME_UNIQUE` (`CNAME`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=1019 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yc_member`
--

LOCK TABLES `yc_member` WRITE;
/*!40000 ALTER TABLE `yc_member` DISABLE KEYS */;
INSERT INTO `yc_member` VALUES (1,'admin','1','F','1980-01-01 00:00:00','212121212@qq.com','myqq','212121212','2016-01-01 00:00:00','2018-10-09 11:20:42','T',''),(2,'Tom','1','M','1983-01-01 00:00:00','212121213@qq.com','myqq','212121212','2016-01-01 00:00:00','2016-11-02 00:00:00','T',''),(3,'Lily','1','M','1982-01-01 00:00:00','212121214@qq.com','myqq','212121212','2016-01-01 00:00:00','2016-11-03 00:00:00','T',''),(4,'zhangsan','1','F','1981-01-01 00:00:00','212121215@qq.com','myqq','212121212','2016-01-01 00:00:00','2016-11-04 00:00:00','T',''),(5,'lisi','1','M','1989-01-01 00:00:00','212121216@qq.com','myqq','212121212','2016-01-01 00:00:00','2016-11-05 00:00:00','F',''),(6,'wangwu','1','M','1980-01-01 00:00:00','212121217@qq.com','myqq','212121212','2016-01-01 00:00:00','2016-11-06 00:00:00','F',''),(1000,'中国联通','666','F','2018-09-23 00:00:00','hafrans@163.com','Q','A','2018-09-23 20:32:31','2018-09-23 20:32:31','T',NULL),(1009,'中国移动','666','F','2018-09-25 20:29:30','hafrans@163.com','Q','A','2018-09-25 20:29:30','2018-09-25 20:29:30','T',NULL),(1010,'公告管理',NULL,'M','2018-01-01 00:00:00',NULL,NULL,NULL,'2018-10-08 10:52:29','2018-10-08 10:52:29','F','1'),(1014,'公告管理2',NULL,'M','2018-10-13 00:00:00',NULL,NULL,NULL,'2018-10-08 10:54:13','2018-10-08 10:54:13','F','1'),(1015,'222',NULL,'M','2018-10-03 00:00:00',NULL,NULL,NULL,'2018-10-08 10:54:21','2018-10-08 10:54:21','F','1'),(1018,'185185485',NULL,'M','2018-10-13 00:00:00',NULL,NULL,NULL,'2018-10-08 16:07:31','2018-10-08 16:07:31',NULL,'1');
/*!40000 ALTER TABLE `yc_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-12  8:17:29
