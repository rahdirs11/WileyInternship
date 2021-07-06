-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: students
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `tbl_course`
--

DROP TABLE IF EXISTS `tbl_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_course` (
  `COURSE_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(10) NOT NULL,
  PRIMARY KEY (`COURSE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_course`
--

LOCK TABLES `tbl_course` WRITE;
/*!40000 ALTER TABLE `tbl_course` DISABLE KEYS */;
INSERT INTO `tbl_course` VALUES (1,'EXCEL'),(2,'VBA'),(3,'TABLEAU'),(4,'JAVA'),(5,'PYTHON'),(6,'SAS'),(7,'SQL'),(8,'R'),(9,'DOT NET'),(10,'PHP');
/*!40000 ALTER TABLE `tbl_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mapping`
--

DROP TABLE IF EXISTS `tbl_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mapping` (
  `STU_ID` int DEFAULT NULL,
  `COURSE_ID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mapping`
--

LOCK TABLES `tbl_mapping` WRITE;
/*!40000 ALTER TABLE `tbl_mapping` DISABLE KEYS */;
INSERT INTO `tbl_mapping` VALUES (1,1),(1,2),(1,3),(2,5),(2,8),(5,1),(5,2),(5,3),(5,5),(5,7),(5,8);
/*!40000 ALTER TABLE `tbl_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_student`
--

DROP TABLE IF EXISTS `tbl_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_student` (
  `STU_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DOB` datetime NOT NULL,
  `PHONE_CUS` char(12) DEFAULT NULL,
  `EMAIL_CUS` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`STU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_student`
--

LOCK TABLES `tbl_student` WRITE;
/*!40000 ALTER TABLE `tbl_student` DISABLE KEYS */;
INSERT INTO `tbl_student` VALUES (1,'Kallie Blackwood','1975-01-01 00:00:00','415-9170-276','kallie.blackwood@abc.com'),(2,'Johnetta Abdallah','1995-01-01 00:00:00','919-6014-934','johnetta_abdallah@abc.com'),(3,'Bobbye Rhym','1972-01-01 00:00:00','650-5905-578','brhym@abc.com'),(4,'Micaela Rhymes','1967-01-01 00:00:00','925-1192-329','micaela_rhymes@abc.com'),(5,'Tamar Hoogland','1994-01-01 00:00:00','740-1061-857','tamar@abc.com');
/*!40000 ALTER TABLE `tbl_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_mapping`
--

DROP TABLE IF EXISTS `vw_mapping`;
/*!50001 DROP VIEW IF EXISTS `vw_mapping`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mapping` AS SELECT 
 1 AS `stu_id`,
 1 AS `count(stu_id)`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'students'
--

--
-- Final view structure for view `vw_mapping`
--

/*!50001 DROP VIEW IF EXISTS `vw_mapping`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mapping` AS select `tbl_mapping`.`STU_ID` AS `stu_id`,count(`tbl_mapping`.`STU_ID`) AS `count(stu_id)` from `tbl_mapping` group by `tbl_mapping`.`STU_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-28  8:29:05
