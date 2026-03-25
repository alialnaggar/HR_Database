-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: databasehr
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `academic_department`
--

DROP TABLE IF EXISTS `academic_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_department` (
  `Department_ID` int NOT NULL,
  `Faculty_ID` int NOT NULL,
  PRIMARY KEY (`Department_ID`,`Faculty_ID`),
  KEY `fk_acad_dep_faculty` (`Faculty_ID`),
  CONSTRAINT `fk_acad_dep_department` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`),
  CONSTRAINT `fk_acad_dep_faculty` FOREIGN KEY (`Faculty_ID`) REFERENCES `faculty` (`Faculty_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_department`
--

LOCK TABLES `academic_department` WRITE;
/*!40000 ALTER TABLE `academic_department` DISABLE KEYS */;
INSERT INTO `academic_department` VALUES (1,1),(2,1),(3,2),(4,2),(5,2),(6,3),(7,3),(8,4),(9,5),(10,5),(11,6),(12,7);
/*!40000 ALTER TABLE `academic_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrative_department`
--

DROP TABLE IF EXISTS `administrative_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrative_department` (
  `Department_ID` int NOT NULL,
  `University_ID` int NOT NULL,
  PRIMARY KEY (`Department_ID`,`University_ID`),
  KEY `fk_admin_dep_university` (`University_ID`),
  CONSTRAINT `fk_admin_dep_department` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`),
  CONSTRAINT `fk_admin_dep_university` FOREIGN KEY (`University_ID`) REFERENCES `university` (`University_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrative_department`
--

LOCK TABLES `administrative_department` WRITE;
/*!40000 ALTER TABLE `administrative_department` DISABLE KEYS */;
INSERT INTO `administrative_department` VALUES (13,1),(14,1),(15,1),(16,1);
/*!40000 ALTER TABLE `administrative_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appeal`
--

DROP TABLE IF EXISTS `appeal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appeal` (
  `Appeal_ID` int NOT NULL AUTO_INCREMENT,
  `Appraisal_ID` int DEFAULT NULL,
  `Submission_Date` date DEFAULT NULL,
  `Reason` varchar(500) DEFAULT NULL,
  `Original_Score` decimal(5,2) DEFAULT NULL,
  `Approval_Status` varchar(20) DEFAULT NULL,
  `appeal_outcome_Score` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Appeal_ID`),
  KEY `fk_appeal_appraisal` (`Appraisal_ID`),
  CONSTRAINT `fk_appeal_appraisal` FOREIGN KEY (`Appraisal_ID`) REFERENCES `appraisal` (`Appraisal_ID`) ON DELETE SET NULL,
  CONSTRAINT `appeal_chk_1` CHECK ((`Approval_Status` in (_utf8mb4'Pending',_utf8mb4'Approved',_utf8mb4'Rejected'))),
  CONSTRAINT `appeal_chk_2` CHECK (((`appeal_outcome_Score` is null) or (`appeal_outcome_Score` between 1 and 5)))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appeal`
--

LOCK TABLES `appeal` WRITE;
/*!40000 ALTER TABLE `appeal` DISABLE KEYS */;
INSERT INTO `appeal` VALUES (1,7,'2025-01-01','Employee requests score review citing misalignment between targets and assigned workload.',3.00,'Pending',NULL),(2,8,'2024-12-31','Employee requests score review citing misalignment between targets and assigned workload.',3.00,'Approved',3.50),(3,10,'2024-12-31','Employee requests score review citing misalignment between targets and assigned workload.',3.00,'Pending',NULL),(4,16,'2025-01-01','Employee requests score review citing misalignment between targets and assigned workload.',3.00,'Approved',3.50),(5,36,'2025-01-04','Employee requests score review citing misalignment between targets and assigned workload.',3.00,'Approved',3.50),(6,37,'2025-01-03','Employee requests score review citing misalignment between targets and assigned workload.',3.00,'Rejected',NULL),(7,44,'2025-07-09','Employee requests score review citing misalignment between targets and assigned workload.',3.00,'Approved',3.50),(8,46,'2025-07-09','Employee requests score review citing misalignment between targets and assigned workload.',3.00,'Pending',NULL),(9,49,'2025-06-22','Employee requests score review citing misalignment between targets and assigned workload.',3.00,'Rejected',NULL),(10,53,'2025-06-19','Employee requests score review citing misalignment between targets and assigned workload.',3.00,'Rejected',NULL),(11,55,'2025-07-09','Employee requests score review citing misalignment between targets and assigned workload.',3.00,'Pending',NULL),(12,62,'2025-07-09','Employee requests score review citing misalignment between targets and assigned workload.',3.00,'Pending',NULL);
/*!40000 ALTER TABLE `appeal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appraisal`
--

DROP TABLE IF EXISTS `appraisal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appraisal` (
  `Appraisal_ID` int NOT NULL AUTO_INCREMENT,
  `Assignment_ID` int DEFAULT NULL,
  `Cycle_ID` int DEFAULT NULL,
  `Appraisal_Date` date DEFAULT NULL,
  `Overall_Score` decimal(5,2) DEFAULT NULL,
  `Manager_Comments` varchar(500) DEFAULT NULL,
  `HR_Comments` varchar(500) DEFAULT NULL,
  `Employee_Comments` varchar(500) DEFAULT NULL,
  `Reviewer_ID` int DEFAULT NULL,
  PRIMARY KEY (`Appraisal_ID`),
  KEY `fk_appraisal_assignment` (`Assignment_ID`),
  KEY `fk_appraisal_cycle` (`Cycle_ID`),
  KEY `fk_appraisal_reviewer` (`Reviewer_ID`),
  CONSTRAINT `fk_appraisal_assignment` FOREIGN KEY (`Assignment_ID`) REFERENCES `job_assignment` (`Assignment_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_appraisal_cycle` FOREIGN KEY (`Cycle_ID`) REFERENCES `performance_cycle` (`Cycle_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_appraisal_reviewer` FOREIGN KEY (`Reviewer_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE SET NULL,
  CONSTRAINT `appraisal_chk_1` CHECK ((`Overall_Score` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraisal`
--

LOCK TABLES `appraisal` WRITE;
/*!40000 ALTER TABLE `appraisal` DISABLE KEYS */;
INSERT INTO `appraisal` VALUES (1,1,1,'2024-12-30',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',1),(2,2,1,'2024-12-29',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',1),(3,3,1,'2024-12-28',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',1),(4,6,1,'2024-12-25',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',6),(5,7,1,'2024-12-24',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',6),(6,8,1,'2024-12-23',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',6),(7,9,1,'2024-12-22',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',6),(8,11,1,'2024-12-20',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',11),(9,12,1,'2024-12-19',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',11),(10,13,1,'2024-12-18',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',11),(11,14,1,'2024-12-17',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',11),(12,15,1,'2024-12-16',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',11),(13,19,1,'2024-12-12',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(14,20,1,'2024-12-31',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(15,21,1,'2024-12-30',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(16,22,1,'2024-12-29',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(17,23,1,'2024-12-28',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(18,24,1,'2024-12-27',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',19),(19,25,1,'2024-12-26',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(20,26,1,'2024-12-25',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',19),(21,27,1,'2024-12-24',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(22,28,1,'2024-12-23',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(23,29,1,'2024-12-22',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(24,30,1,'2024-12-21',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',29),(25,31,1,'2024-12-20',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(26,32,1,'2024-12-19',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(27,33,1,'2024-12-18',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(28,34,1,'2024-12-17',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(29,35,1,'2024-12-16',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',35),(30,36,1,'2024-12-15',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',35),(31,37,1,'2024-12-14',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',35),(32,38,1,'2024-12-13',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',35),(33,40,1,'2024-12-31',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',40),(34,41,1,'2024-12-30',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',40),(35,42,1,'2024-12-29',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',40),(36,43,1,'2024-12-28',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',40),(37,45,1,'2024-12-26',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',45),(38,46,1,'2024-12-25',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',45),(39,49,1,'2024-12-22',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',49),(40,53,1,'2024-12-18',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',53),(41,1,2,'2025-06-29',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',1),(42,2,2,'2025-06-28',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',1),(43,3,2,'2025-06-27',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',1),(44,6,2,'2025-06-24',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',6),(45,7,2,'2025-06-23',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',6),(46,8,2,'2025-06-22',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',6),(47,9,2,'2025-06-21',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',6),(48,11,2,'2025-06-19',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',11),(49,12,2,'2025-06-18',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',11),(50,13,2,'2025-06-17',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',11),(51,14,2,'2025-06-16',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',11),(52,15,2,'2025-06-15',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',11),(53,19,2,'2025-06-11',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(54,20,2,'2025-06-30',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(55,21,2,'2025-06-29',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(56,22,2,'2025-06-28',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(57,23,2,'2025-06-27',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',19),(58,24,2,'2025-06-26',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(59,25,2,'2025-06-25',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(60,26,2,'2025-06-24',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(61,27,2,'2025-06-23',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(62,28,2,'2025-06-22',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(63,29,2,'2025-06-21',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(64,30,2,'2025-06-20',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(65,31,2,'2025-06-19',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(66,32,2,'2025-06-18',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(67,33,2,'2025-06-17',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(68,34,2,'2025-06-16',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(69,35,2,'2025-06-15',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',35),(70,36,2,'2025-06-14',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',35),(71,37,2,'2025-06-13',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',35),(72,38,2,'2025-06-12',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',35),(73,40,2,'2025-06-30',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',40),(74,41,2,'2025-06-29',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',40),(75,42,2,'2025-06-28',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',40),(76,43,2,'2025-06-27',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',40),(77,45,2,'2025-06-25',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',45),(78,46,2,'2025-06-24',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',45),(79,49,2,'2025-06-21',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',49),(80,53,2,'2025-06-17',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',53),(81,61,2,'2025-06-29',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',61),(82,62,2,'2025-06-28',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',61),(83,63,2,'2025-06-27',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',61),(84,64,2,'2025-06-26',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',61),(85,67,2,'2025-06-23',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',67),(86,70,2,'2025-06-20',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',70),(87,1,3,'2025-12-30',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',1),(88,2,3,'2025-12-29',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',1),(89,3,3,'2025-12-28',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',1),(90,6,3,'2025-12-25',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',6),(91,7,3,'2025-12-24',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',6),(92,8,3,'2025-12-23',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',6),(93,9,3,'2025-12-22',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',6),(94,11,3,'2025-12-20',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',11),(95,12,3,'2025-12-19',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',11),(96,13,3,'2025-12-18',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',11),(97,14,3,'2025-12-17',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',11),(98,15,3,'2025-12-16',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',11),(99,19,3,'2025-12-12',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(100,20,3,'2025-12-31',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(101,21,3,'2025-12-30',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(102,22,3,'2025-12-29',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',19),(103,23,3,'2025-12-28',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(104,24,3,'2025-12-27',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(105,25,3,'2025-12-26',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(106,26,3,'2025-12-25',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(107,27,3,'2025-12-24',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(108,28,3,'2025-12-23',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',19),(109,29,3,'2025-12-22',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(110,30,3,'2025-12-21',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(111,31,3,'2025-12-20',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(112,32,3,'2025-12-19',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(113,33,3,'2025-12-18',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(114,34,3,'2025-12-17',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',29),(115,35,3,'2025-12-16',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',35),(116,36,3,'2025-12-15',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',35),(117,37,3,'2025-12-14',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',35),(118,38,3,'2025-12-13',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',35),(119,40,3,'2025-12-31',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',40),(120,41,3,'2025-12-30',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',40),(121,42,3,'2025-12-29',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',40),(122,43,3,'2025-12-28',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',40),(123,45,3,'2025-12-26',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',45),(124,46,3,'2025-12-25',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',45),(125,49,3,'2025-12-22',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',49),(126,53,3,'2025-12-18',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',53),(127,61,3,'2025-12-30',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',61),(128,62,3,'2025-12-29',3.50,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',61),(129,63,3,'2025-12-28',4.00,'Good performance. Met expectations with solid delivery and reliable outcomes.','HR note: Eligible for recognition and development opportunities.','Employee acknowledged results and is motivated to sustain performance.',61),(130,64,3,'2025-12-27',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',61),(131,67,3,'2025-12-24',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',67),(132,70,3,'2025-12-21',3.00,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',70),(133,76,3,'2025-12-15',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',76),(134,77,3,'2025-12-14',3.67,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',76),(135,78,3,'2025-12-13',3.33,'Satisfactory performance. Some areas need improvement and better consistency.','HR note: Recommend targeted training and continued monitoring.','Employee acknowledged feedback and agreed on improvement actions.',76);
/*!40000 ALTER TABLE `appraisal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `Contract_ID` int NOT NULL AUTO_INCREMENT,
  `Contract_Name` varchar(200) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Default_Duration` int DEFAULT NULL,
  `Work_Modality` varchar(50) DEFAULT NULL,
  `Eligibility_Criteria` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Contract_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,'Full-Time Academic (Permanent)','Permanent','Standard full-time academic contract for teaching, supervision, and departmental service.',36,'On-site','PhD or MSc depending on role; teaching/research background.'),(2,'Full-Time Administrative (Permanent)','Permanent','Standard full-time administrative contract for operational and support functions.',36,'On-site','Relevant bachelor degree; administrative/operations experience preferred.'),(3,'Fixed-Term Academic (2 Years)','Fixed-Term','Fixed-term academic contract for lecturers and academic staff on time-bound needs.',24,'On-site','Relevant degree; contract renewal based on performance and departmental needs.'),(4,'Part-Time Lecturer (1 Year)','Part-Time','Part-time teaching contract for specific modules or semesters.',12,'Hybrid','Relevant MSc/PhD (or industry expertise); availability for scheduled sessions.'),(5,'Research Assistant (1 Year)','Fixed-Term','Research-focused role supporting labs, grants, and publications.',12,'On-site','Bachelor/MSc in relevant field; strong research and analytical skills.'),(6,'Internship / Probation (6 Months)','Probation','Entry-level probationary contract used for new hires or interns.',6,'On-site','New graduate or early career; evaluation required for confirmation.'),(7,'Remote Specialist (1 Year)','Fixed-Term','Remote contract for roles such as BI developer, data analyst, or systems support.',12,'Remote','Proven experience; ability to work remotely with documented deliverables.'),(8,'Consultant / Advisory (3 Months)','Consultancy','Short advisory engagement for audits, governance, or specialized projects.',3,'Hybrid','Senior expertise; defined scope and deliverables required.');
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Department_ID` int NOT NULL AUTO_INCREMENT,
  `Department_Name` varchar(200) NOT NULL,
  `Department_Type` varchar(50) DEFAULT NULL,
  `Location` varchar(200) DEFAULT NULL,
  `Contact_Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Department_ID`),
  CONSTRAINT `department_chk_1` CHECK ((`Department_Type` in (_utf8mb4'Academic',_utf8mb4'Administrative')))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Civil Engineering','Academic','Engineering Building','civil.dep@giu.edu.eg'),(2,'Mechanical Engineering','Academic','Engineering Building','mech.dep@giu.edu.eg'),(3,'Computer Science','Academic','Informatics Building','cs.dep@giu.edu.eg'),(4,'Business Informatics','Academic','Informatics Building','bi.dep@giu.edu.eg'),(5,'Data Science & AI','Academic','Informatics Building','dsai.dep@giu.edu.eg'),(6,'Accounting & Finance','Academic','Business Building','accfin.dep@giu.edu.eg'),(7,'Operations & Supply Chain','Academic','Business Building','ops.dep@giu.edu.eg'),(8,'Mathematics & Statistics','Academic','Science Building','mathstats.dep@giu.edu.eg'),(9,'Architecture','Academic','Architecture Studios','arch.dep@giu.edu.eg'),(10,'Interior Design','Academic','Architecture Studios','interior.dep@giu.edu.eg'),(11,'Economics & International Studies','Academic','Econ Building','econ.dep@giu.edu.eg'),(12,'Business Law & Technology Governance','Academic','Law Building','lawtech.dep@giu.edu.eg'),(13,'Human Resources','Administrative','Admin Building','hr@giu.edu.eg'),(14,'Finance Office','Administrative','Admin Building','finance@giu.edu.eg'),(15,'IT Services','Administrative','Admin Building','it@giu.edu.eg'),(16,'Admissions & Student Affairs','Administrative','Admin Building','admissions@giu.edu.eg');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dim_department`
--

DROP TABLE IF EXISTS `dim_department`;
/*!50001 DROP VIEW IF EXISTS `dim_department`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dim_department` AS SELECT 
 1 AS `Department_ID`,
 1 AS `Department_Name`,
 1 AS `Department_Type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `educational_qualification`
--

DROP TABLE IF EXISTS `educational_qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educational_qualification` (
  `Qualification_ID` int NOT NULL AUTO_INCREMENT,
  `Employee_ID` int DEFAULT NULL,
  `Institution_Name` varchar(200) DEFAULT NULL,
  `Major` varchar(200) DEFAULT NULL,
  `Degree_Type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Qualification_ID`),
  KEY `fk_eduq_employee` (`Employee_ID`),
  CONSTRAINT `fk_eduq_employee` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educational_qualification`
--

LOCK TABLES `educational_qualification` WRITE;
/*!40000 ALTER TABLE `educational_qualification` DISABLE KEYS */;
INSERT INTO `educational_qualification` VALUES (1,1,'Ain Shams University','Computer Science','PhD'),(2,2,'Alexandria University','Data Science & Artificial Intelligence','MSc'),(3,3,'German University in Cairo (GUC)','Civil Engineering','MSc'),(4,4,'American University in Cairo (AUC)','Mechanical Engineering','PhD'),(5,5,'Helwan University','Accounting & Finance','MSc'),(6,6,'Cairo University','Operations & Supply Chain Management','MSc'),(7,7,'Ain Shams University','Mathematics & Statistics','PhD'),(8,8,'Alexandria University','Architecture','MSc'),(9,9,'German University in Cairo (GUC)','Interior Design','MSc'),(10,10,'American University in Cairo (AUC)','Economics & International Studies','MSc'),(11,11,'Helwan University','Business Law & Technology Governance','PhD'),(12,12,'Cairo University','Business Informatics','MSc'),(13,13,'Ain Shams University','Computer Science','MSc'),(14,14,'Alexandria University','Data Science & Artificial Intelligence','MSc'),(15,15,'German University in Cairo (GUC)','Civil Engineering','PhD'),(16,16,'American University in Cairo (AUC)','Mechanical Engineering','MSc'),(17,17,'Helwan University','Accounting & Finance','MSc'),(18,18,'Cairo University','Operations & Supply Chain Management','MSc'),(19,19,'Ain Shams University','Mathematics & Statistics','MSc'),(20,20,'Alexandria University','Architecture','MSc'),(21,21,'German University in Cairo (GUC)','Interior Design','MSc'),(22,22,'American University in Cairo (AUC)','Economics & International Studies','MSc'),(23,23,'Helwan University','Business Law & Technology Governance','PhD'),(24,24,'Cairo University','Business Informatics','MSc'),(25,25,'Ain Shams University','Computer Science','MSc'),(26,26,'Alexandria University','Data Science & Artificial Intelligence','MSc'),(27,27,'German University in Cairo (GUC)','Civil Engineering','BSc'),(28,28,'American University in Cairo (AUC)','Mechanical Engineering','BSc'),(29,29,'Helwan University','Accounting & Finance','BSc'),(30,30,'Cairo University','Operations & Supply Chain Management','BSc'),(31,31,'Ain Shams University','Mathematics & Statistics','PhD'),(32,32,'Alexandria University','Architecture','BSc'),(33,33,'German University in Cairo (GUC)','Interior Design','BSc'),(34,34,'American University in Cairo (AUC)','Economics & International Studies','BSc'),(35,35,'Helwan University','Business Law & Technology Governance','BSc'),(36,36,'Cairo University','Business Informatics','BSc'),(37,37,'Ain Shams University','Computer Science','BSc'),(38,38,'Alexandria University','Data Science & Artificial Intelligence','BSc'),(39,39,'German University in Cairo (GUC)','Civil Engineering','BSc'),(40,40,'American University in Cairo (AUC)','Mechanical Engineering','BSc'),(41,41,'Technische Universität Berlin','Accounting & Finance','BSc'),(42,42,'Humboldt-Universität zu Berlin','Operations & Supply Chain Management','BSc'),(43,43,'Ain Shams University','Mathematics & Statistics','BSc'),(44,44,'Alexandria University','Architecture','BSc'),(45,45,'German University in Cairo (GUC)','Interior Design','BSc'),(46,46,'American University in Cairo (AUC)','Economics & International Studies','BSc'),(47,47,'Helwan University','Business Law & Technology Governance','BSc'),(48,48,'Cairo University','Business Informatics','BSc'),(49,49,'Ain Shams University','Computer Science','PhD'),(50,50,'Alexandria University','Data Science & Artificial Intelligence','BSc'),(51,51,'German University in Cairo (GUC)','Civil Engineering','BSc'),(52,52,'American University in Cairo (AUC)','Mechanical Engineering','BSc'),(53,53,'Helwan University','Accounting & Finance','BSc'),(54,54,'Cairo University','Operations & Supply Chain Management','BSc'),(55,55,'Ain Shams University','Mathematics & Statistics','BSc'),(56,56,'Alexandria University','Architecture','BSc'),(57,57,'German University in Cairo (GUC)','Interior Design','BSc'),(58,58,'American University in Cairo (AUC)','Economics & International Studies','BSc'),(59,59,'Helwan University','Business Law & Technology Governance','BSc'),(60,60,'Cairo University','Business Informatics','BSc'),(61,61,'Ain Shams University','Computer Science','BSc'),(62,62,'Alexandria University','Data Science & Artificial Intelligence','BSc'),(63,63,'German University in Cairo (GUC)','Civil Engineering','BSc'),(64,64,'American University in Cairo (AUC)','Mechanical Engineering','BSc'),(65,65,'Helwan University','Accounting & Finance','BSc'),(66,66,'Cairo University','Operations & Supply Chain Management','BSc'),(67,67,'Ain Shams University','Mathematics & Statistics','PhD'),(68,68,'Alexandria University','Architecture','BSc'),(69,69,'German University in Cairo (GUC)','Interior Design','BSc'),(70,70,'American University in Cairo (AUC)','Economics & International Studies','BSc'),(71,71,'Helwan University','Business Law & Technology Governance','BSc'),(72,72,'Cairo University','Business Informatics','BSc'),(73,73,'Ain Shams University','Computer Science','BSc'),(74,74,'Alexandria University','Data Science & Artificial Intelligence','BSc'),(75,75,'German University in Cairo (GUC)','Civil Engineering','PhD'),(76,76,'American University in Cairo (AUC)','Mechanical Engineering','BSc'),(77,77,'Helwan University','Accounting & Finance','BSc'),(78,78,'Cairo University','Operations & Supply Chain Management','BSc'),(79,79,'Ain Shams University','Mathematics & Statistics','BSc'),(80,80,'Alexandria University','Architecture','BSc');
/*!40000 ALTER TABLE `educational_qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Employee_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(100) NOT NULL,
  `Middle_Name` varchar(100) DEFAULT NULL,
  `Last_Name` varchar(100) NOT NULL,
  `Arabic_Name` varchar(200) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Nationality` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Place_of_Birth` varchar(100) DEFAULT NULL,
  `Marital_Status` varchar(20) DEFAULT NULL,
  `Religion` varchar(50) DEFAULT NULL,
  `Employment_Status` varchar(20) DEFAULT NULL,
  `Mobile_Phone` varchar(30) DEFAULT NULL,
  `Work_Phone` varchar(30) DEFAULT NULL,
  `Work_Email` varchar(100) DEFAULT NULL,
  `Personal_Email` varchar(100) DEFAULT NULL,
  `Emergency_Contact_Name` varchar(200) DEFAULT NULL,
  `Emergency_Contact_Phone` varchar(30) DEFAULT NULL,
  `Emergency_Contact_Relationship` varchar(50) DEFAULT NULL,
  `Residential_City` varchar(100) DEFAULT NULL,
  `Residential_Area` varchar(100) DEFAULT NULL,
  `Residential_Street` varchar(200) DEFAULT NULL,
  `Residential_Country` varchar(100) DEFAULT NULL,
  `Permanent_City` varchar(100) DEFAULT NULL,
  `Permanent_Area` varchar(100) DEFAULT NULL,
  `Permanent_Street` varchar(200) DEFAULT NULL,
  `Permanent_Country` varchar(100) DEFAULT NULL,
  `Medical_Clearance_Status` varchar(20) DEFAULT NULL,
  `Criminal_Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  CONSTRAINT `employee_chk_1` CHECK ((`Gender` in (_utf8mb4'Male',_utf8mb4'Female',_utf8mb4'Other'))),
  CONSTRAINT `employee_chk_2` CHECK ((`Marital_Status` in (_utf8mb4'Single',_utf8mb4'Married',_utf8mb4'Divorced',_utf8mb4'Widowed'))),
  CONSTRAINT `employee_chk_3` CHECK ((`Employment_Status` in (_utf8mb4'Active',_utf8mb4'Probation',_utf8mb4'Leave',_utf8mb4'Retired'))),
  CONSTRAINT `employee_chk_4` CHECK ((`Medical_Clearance_Status` in (_utf8mb4'Cleared',_utf8mb4'Pending',_utf8mb4'Not Cleared'))),
  CONSTRAINT `employee_chk_5` CHECK ((`Criminal_Status` in (_utf8mb4'Clear',_utf8mb4'Pending',_utf8mb4'Record')))
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Ahmed','Hassan','El-Sayed',NULL,'Male','Egyptian','1988-03-14',NULL,'Married',NULL,'Active','01010000001',NULL,'ahmed.elsayed01@giu.edu.eg','ahmed.elsayed01@gmail.com','Mona El-Sayed','01090000001','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(2,'Sara','Mahmoud','Ibrahim',NULL,'Female','Egyptian','1997-11-22',NULL,'Single',NULL,'Active','01010000002',NULL,'sara.ibrahim02@giu.edu.eg','sara.ibrahim02@gmail.com','Mahmoud Ibrahim','01090000002','Parent','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(3,'Omar','Youssef','Mostafa',NULL,'Male','Egyptian','1995-06-08',NULL,'Single',NULL,'Active','01010000003',NULL,'omar.mostafa03@giu.edu.eg','omar.mostafa03@gmail.com','Heba Mostafa','01090000003','Sibling','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(4,'Nour','Ali','Farouk',NULL,'Female','Egyptian','1999-01-30',NULL,'Single',NULL,'Probation','01010000004',NULL,'nour.farouk04@giu.edu.eg','nour.farouk04@gmail.com','Ali Farouk','01090000004','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Pending','Clear'),(5,'Karim','Adel','Hegazy',NULL,'Male','Egyptian','1992-09-19',NULL,'Married',NULL,'Active','01010000005',NULL,'karim.hegazy05@giu.edu.eg','karim.hegazy05@gmail.com','Aya Hegazy','01090000005','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(6,'Mariam','Tarek','Nabil',NULL,'Female','Egyptian','1986-12-03',NULL,'Married',NULL,'Active','01010000006',NULL,'mariam.nabil06@giu.edu.eg','mariam.nabil06@gmail.com','Tarek Nabil','01090000006','Spouse','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(7,'Youssef','Samir','Khalil',NULL,'Male','Egyptian','1998-04-11',NULL,'Single',NULL,'Active','01010000007',NULL,'youssef.khalil07@giu.edu.eg','youssef.khalil07@gmail.com','Samir Khalil','01090000007','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(8,'Dina','Hany','Saad',NULL,'Female','Egyptian','1996-07-25',NULL,'Single',NULL,'Leave','01010000008',NULL,'dina.saad08@giu.edu.eg','dina.saad08@gmail.com','Hany Saad','01090000008','Parent','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Pending'),(9,'Mohamed','Ayman','Fathy',NULL,'Male','Egyptian','1981-02-16',NULL,'Married',NULL,'Active','01010000009',NULL,'mohamed.fathy09@giu.edu.eg','mohamed.fathy09@gmail.com','Rania Fathy','01090000009','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(10,'Salma','Sayed','Hassan',NULL,'Female','Egyptian','2000-10-05',NULL,'Single',NULL,'Probation','01010000010',NULL,'salma.hassan10@giu.edu.eg','salma.hassan10@gmail.com','Sayed Hassan','01090000010','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Pending','Clear'),(11,'Hassan','Ibrahim','Reda',NULL,'Male','Egyptian','1978-05-09',NULL,'Married',NULL,'Active','01010000011',NULL,'hassan.reda11@giu.edu.eg','hassan.reda11@gmail.com','Maha Reda','01090000011','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(12,'Hana','Fouad','El-Badry',NULL,'Female','Egyptian','1994-08-21',NULL,'Married',NULL,'Active','01010000012',NULL,'hana.elbadry12@giu.edu.eg','hana.elbadry12@gmail.com','Fouad El-Badry','01090000012','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(13,'Amr','Sherif','Zaki',NULL,'Male','Egyptian','1991-01-12',NULL,'Single',NULL,'Active','01010000013',NULL,'amr.zaki13@giu.edu.eg','amr.zaki13@gmail.com','Sherif Zaki','01090000013','Parent','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(14,'Farah','Mohsen','Gamal',NULL,'Female','Egyptian','1998-09-02',NULL,'Single',NULL,'Active','01010000014',NULL,'farah.gamal14@giu.edu.eg','farah.gamal14@gmail.com','Mohsen Gamal','01090000014','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(15,'Mahmoud','Hossam','El-Naggar',NULL,'Male','Egyptian','1984-06-27',NULL,'Married',NULL,'Active','01010000015',NULL,'mahmoud.elnaggar15@giu.edu.eg','mahmoud.elnaggar15@gmail.com','Noha El-Naggar','01090000015','Spouse','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(16,'Aya','Kamal','Shehata',NULL,'Female','Egyptian','1997-03-18',NULL,'Single',NULL,'Active','01010000016',NULL,'aya.shehata16@giu.edu.eg','aya.shehata16@gmail.com','Kamal Shehata','01090000016','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(17,'Khaled','Maged','Salem',NULL,'Male','Egyptian','1993-11-07',NULL,'Married',NULL,'Active','01010000017',NULL,'khaled.salem17@giu.edu.eg','khaled.salem17@gmail.com','Riham Salem','01090000017','Spouse','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(18,'Menna','Ashraf','Eid',NULL,'Female','Egyptian','2001-02-23',NULL,'Single',NULL,'Probation','01010000018',NULL,'menna.eid18@giu.edu.eg','menna.eid18@gmail.com','Ashraf Eid','01090000018','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Pending','Clear'),(19,'Seif','Nader','Hatem',NULL,'Male','Egyptian','1999-12-15',NULL,'Single',NULL,'Active','01010000019',NULL,'seif.hatem19@giu.edu.eg','seif.hatem19@gmail.com','Nader Hatem','01090000019','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(20,'Reem','Tamer','Shahin',NULL,'Female','Egyptian','1995-05-04',NULL,'Married',NULL,'Active','01010000020',NULL,'reem.shahin20@giu.edu.eg','reem.shahin20@gmail.com','Tamer Shahin','01090000020','Spouse','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(21,'Adham','Fady','Nassar',NULL,'Male','Egyptian','1996-04-29',NULL,'Single',NULL,'Active','01010000021',NULL,'adham.nassar21@giu.edu.eg','adham.nassar21@gmail.com','Fady Nassar','01090000021','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(22,'Nada','Hussein','Abdelrahman',NULL,'Female','Egyptian','1998-06-10',NULL,'Single',NULL,'Active','01010000022',NULL,'nada.abdelrahman22@giu.edu.eg','nada.abdelrahman22@gmail.com','Hussein Abdelrahman','01090000022','Parent','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(23,'Tarek','Walid','Aziz',NULL,'Male','Egyptian','1980-09-13',NULL,'Married',NULL,'Active','01010000023',NULL,'tarek.aziz23@giu.edu.eg','tarek.aziz23@gmail.com','Hala Aziz','01090000023','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(24,'Jana','Omar','Hassan',NULL,'Female','Egyptian','2002-01-08',NULL,'Single',NULL,'Probation','01010000024',NULL,'jana.hassan24@giu.edu.eg','jana.hassan24@gmail.com','Omar Hassan','01090000024','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Pending','Clear'),(25,'Mostafa','Ramy','Sultan',NULL,'Male','Egyptian','1994-02-20',NULL,'Single',NULL,'Active','01010000025',NULL,'mostafa.sultan25@giu.edu.eg','mostafa.sultan25@gmail.com','Ramy Sultan','01090000025','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(26,'Laila','Samir','Hassan',NULL,'Female','Egyptian','1987-07-01',NULL,'Married',NULL,'Active','01010000026',NULL,'laila.hassan26@giu.edu.eg','laila.hassan26@gmail.com','Samir Hassan','01090000026','Spouse','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(27,'Ziad','Kareem','Nabil',NULL,'Male','Egyptian','1997-10-26',NULL,'Single',NULL,'Active','01010000027',NULL,'ziad.nabil27@giu.edu.eg','ziad.nabil27@gmail.com','Kareem Nabil','01090000027','Parent','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(28,'Mayar','Alaa','Fouad',NULL,'Female','Egyptian','1999-03-09',NULL,'Single',NULL,'Active','01010000028',NULL,'mayar.fouad28@giu.edu.eg','mayar.fouad28@gmail.com','Alaa Fouad','01090000028','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(29,'Bilal','Hani','Nasser',NULL,'Male','Egyptian','1992-12-02',NULL,'Married',NULL,'Active','01010000029',NULL,'bilal.nasser29@giu.edu.eg','bilal.nasser29@gmail.com','Hani Nasser','01090000029','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(30,'Rana','Khaled','Saber',NULL,'Female','Egyptian','1996-08-17',NULL,'Single',NULL,'Leave','01010000030',NULL,'rana.saber30@giu.edu.eg','rana.saber30@gmail.com','Khaled Saber','01090000030','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(31,'Hatem','Sami','Fouda',NULL,'Male','Egyptian','1974-11-11',NULL,'Married',NULL,'Active','01010000031',NULL,'hatem.fouda31@giu.edu.eg','hatem.fouda31@gmail.com','Sami Fouda','01090000031','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(32,'Esraa','Mohamed','Yassin',NULL,'Female','Egyptian','1993-05-22',NULL,'Married',NULL,'Active','01010000032',NULL,'esraa.yassin32@giu.edu.eg','esraa.yassin32@gmail.com','Mohamed Yassin','01090000032','Spouse','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(33,'Sherif','Hossam','Mousa',NULL,'Male','Egyptian','1989-01-28',NULL,'Married',NULL,'Active','01010000033',NULL,'sherif.mousa33@giu.edu.eg','sherif.mousa33@gmail.com','Hossam Mousa','01090000033','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(34,'Yara','Adel','Fathi',NULL,'Female','Egyptian','1998-02-14',NULL,'Single',NULL,'Active','01010000034',NULL,'yara.fathi34@giu.edu.eg','yara.fathi34@gmail.com','Adel Fathi','01090000034','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(35,'Nader','Khalil','Salah',NULL,'Male','Egyptian','1995-09-30',NULL,'Single',NULL,'Active','01010000035',NULL,'nader.salah35@giu.edu.eg','nader.salah35@gmail.com','Khalil Salah','01090000035','Parent','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(36,'Marwa','Ayman','Rashad',NULL,'Female','Egyptian','1992-06-06',NULL,'Married',NULL,'Active','01010000036',NULL,'marwa.rashad36@giu.edu.eg','marwa.rashad36@gmail.com','Ayman Rashad','01090000036','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(37,'Hisham','Fares','Kamel',NULL,'Male','Egyptian','1983-03-03',NULL,'Married',NULL,'Active','01010000037',NULL,'hisham.kamel37@giu.edu.eg','hisham.kamel37@gmail.com','Fares Kamel','01090000037','Parent','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(38,'Maha','Sameh','Nasr',NULL,'Female','Egyptian','1985-12-19',NULL,'Married',NULL,'Active','01010000038',NULL,'maha.nasr38@giu.edu.eg','maha.nasr38@gmail.com','Sameh Nasr','01090000038','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(39,'Fady','Rober','Mikhail',NULL,'Male','Egyptian','1996-07-12',NULL,'Single',NULL,'Active','01010000039',NULL,'fady.mikhail39@giu.edu.eg','fady.mikhail39@gmail.com','Rober Mikhail','01090000039','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(40,'Nadine','Youssef','Hanna',NULL,'Female','Egyptian','1999-04-27',NULL,'Single',NULL,'Probation','01010000040',NULL,'nadine.hanna40@giu.edu.eg','nadine.hanna40@gmail.com','Youssef Hanna','01090000040','Parent','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Pending','Clear'),(41,'Omar','Ali','Schneider',NULL,'Male','German','1987-02-10',NULL,'Married',NULL,'Active','01010000041',NULL,'omar.schneider41@giu.edu.eg','omar.schneider41@gmail.com','Lena Schneider','01090000041','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(42,'Mona','Hassan','Weber',NULL,'Female','German','1991-10-04',NULL,'Married',NULL,'Active','01010000042',NULL,'mona.weber42@giu.edu.eg','mona.weber42@gmail.com','Hassan Weber','01090000042','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(43,'Yazan','Ahmad','Al-Khateeb',NULL,'Male','Jordanian','1994-03-21',NULL,'Single',NULL,'Active','01010000043',NULL,'yazan.alkhateeb43@giu.edu.eg','yazan.alkhateeb43@gmail.com','Ahmad Al-Khateeb','01090000043','Parent','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(44,'Lina','Khaled','Abu-Saleh',NULL,'Female','Palestinian','1997-09-08',NULL,'Single',NULL,'Active','01010000044',NULL,'lina.abusaleh44@giu.edu.eg','lina.abusaleh44@gmail.com','Khaled Abu-Saleh','01090000044','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(45,'Osman','Yasir','El-Tayeb',NULL,'Male','Sudanese','1982-08-15',NULL,'Married',NULL,'Active','01010000045',NULL,'osman.eltayeb45@giu.edu.eg','osman.eltayeb45@gmail.com','Yasir El-Tayeb','01090000045','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(46,'Rasha','Mahmoud','Saleh',NULL,'Female','Egyptian','1990-01-17',NULL,'Married',NULL,'Active','01010000046',NULL,'rasha.saleh46@giu.edu.eg','rasha.saleh46@gmail.com','Mahmoud Saleh','01090000046','Spouse','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(47,'Aly','Hassan','Ismail',NULL,'Male','Egyptian','1998-12-09',NULL,'Single',NULL,'Active','01010000047',NULL,'aly.ismail47@giu.edu.eg','aly.ismail47@gmail.com','Hassan Ismail','01090000047','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(48,'Hager','Yasser','Zahran',NULL,'Female','Egyptian','1996-05-26',NULL,'Single',NULL,'Active','01010000048',NULL,'hager.zahran48@giu.edu.eg','hager.zahran48@gmail.com','Yasser Zahran','01090000048','Parent','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(49,'Samir','Adham','Kassem',NULL,'Male','Egyptian','1970-04-02',NULL,'Married',NULL,'Active','01010000049',NULL,'samir.kassem49@giu.edu.eg','samir.kassem49@gmail.com','Dalia Kassem','01090000049','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(50,'Huda','Ibrahim','Fouad',NULL,'Female','Egyptian','1966-11-29',NULL,'Widowed',NULL,'Retired','01010000050',NULL,'huda.fouad50@giu.edu.eg','huda.fouad50@gmail.com','Ibrahim Fouad','01090000050','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(51,'Moustafa','Sami','Hassan',NULL,'Male','Egyptian','1962-02-07',NULL,'Married',NULL,'Retired','01010000051',NULL,'moustafa.hassan51@giu.edu.eg','moustafa.hassan51@gmail.com','Sami Hassan','01090000051','Sibling','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(52,'Noura','Fady','Ibrahim',NULL,'Female','Egyptian','1991-06-16',NULL,'Divorced',NULL,'Active','01010000052',NULL,'noura.ibrahim52@giu.edu.eg','noura.ibrahim52@gmail.com','Fady Ibrahim','01090000052','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(53,'Islam','Hany','Badr',NULL,'Male','Egyptian','1999-09-01',NULL,'Single',NULL,'Active','01010000053',NULL,'islam.badr53@giu.edu.eg','islam.badr53@gmail.com','Hany Badr','01090000053','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(54,'Nahla','Tamer','Khalifa',NULL,'Female','Egyptian','1984-12-18',NULL,'Married',NULL,'Active','01010000054',NULL,'nahla.khalifa54@giu.edu.eg','nahla.khalifa54@gmail.com','Tamer Khalifa','01090000054','Spouse','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(55,'Ehab','Youssef','Shawky',NULL,'Male','Egyptian','1986-05-05',NULL,'Married',NULL,'Active','01010000055',NULL,'ehab.shawky55@giu.edu.eg','ehab.shawky55@gmail.com','Nour Shawky','01090000055','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(56,'Malak','Hussein','Gaber',NULL,'Female','Egyptian','2001-07-19',NULL,'Single',NULL,'Probation','01010000056',NULL,'malak.gaber56@giu.edu.eg','malak.gaber56@gmail.com','Hussein Gaber','01090000056','Parent','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Pending','Clear'),(57,'Hany','Mahmoud','El-Gendy',NULL,'Male','Egyptian','1993-03-26',NULL,'Married',NULL,'Active','01010000057',NULL,'hany.elgendy57@giu.edu.eg','hany.elgendy57@gmail.com','Mahmoud El-Gendy','01090000057','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(58,'Rania','Kareem','Zedan',NULL,'Female','Egyptian','1997-02-11',NULL,'Single',NULL,'Active','01010000058',NULL,'rania.zedan58@giu.edu.eg','rania.zedan58@gmail.com','Kareem Zedan','01090000058','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(59,'Bassam','Alaa','Sharaf',NULL,'Male','Egyptian','1994-10-22',NULL,'Single',NULL,'Leave','01010000059',NULL,'bassam.sharaf59@giu.edu.eg','bassam.sharaf59@gmail.com','Alaa Sharaf','01090000059','Parent','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Pending'),(60,'Sahar','Ahmed','Hussein',NULL,'Female','Egyptian','1989-08-30',NULL,'Married',NULL,'Active','01010000060',NULL,'sahar.hussein60@giu.edu.eg','sahar.hussein60@gmail.com','Ahmed Hussein','01090000060','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(61,'Mina','George','Fahmy',NULL,'Male','Egyptian','1992-01-09',NULL,'Married',NULL,'Active','01010000061',NULL,'mina.fahmy61@giu.edu.eg','mina.fahmy61@gmail.com','George Fahmy','01090000061','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(62,'Nancy','Adel','Mansour',NULL,'Female','Egyptian','1998-04-06',NULL,'Single',NULL,'Active','01010000062',NULL,'nancy.mansour62@giu.edu.eg','nancy.mansour62@gmail.com','Adel Mansour','01090000062','Parent','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(63,'Bassem','Sayed','Kamel',NULL,'Male','Egyptian','1997-06-28',NULL,'Single',NULL,'Active','01010000063',NULL,'bassem.kamel63@giu.edu.eg','bassem.kamel63@gmail.com','Sayed Kamel','01090000063','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(64,'Hala','Mahmoud','Rizk',NULL,'Female','Egyptian','1990-03-15',NULL,'Married',NULL,'Active','01010000064',NULL,'hala.rizk64@giu.edu.eg','hala.rizk64@gmail.com','Mahmoud Rizk','01090000064','Spouse','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(65,'Sami','Hossam','Abdallah',NULL,'Male','Egyptian','1981-07-07',NULL,'Married',NULL,'Active','01010000065',NULL,'sami.abdallah65@giu.edu.eg','sami.abdallah65@gmail.com','Hossam Abdallah','01090000065','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(66,'Dalia','Ayman','Taha',NULL,'Female','Egyptian','1996-12-23',NULL,'Single',NULL,'Active','01010000066',NULL,'dalia.taha66@giu.edu.eg','dalia.taha66@gmail.com','Ayman Taha','01090000066','Parent','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(67,'Yehia','Nabil','Hassan',NULL,'Male','Egyptian','1976-09-20',NULL,'Married',NULL,'Active','01010000067',NULL,'yehia.hassan67@giu.edu.eg','yehia.hassan67@gmail.com','Nabil Hassan','01090000067','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(68,'Doaa','Hany','Saeed',NULL,'Female','Egyptian','1983-02-01',NULL,'Married',NULL,'Active','01010000068',NULL,'doaa.saeed68@giu.edu.eg','doaa.saeed68@gmail.com','Hany Saeed','01090000068','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(69,'Badr','Maher','Soliman',NULL,'Male','Egyptian','1999-05-18',NULL,'Single',NULL,'Active','01010000069',NULL,'badr.soliman69@giu.edu.eg','badr.soliman69@gmail.com','Maher Soliman','01090000069','Parent','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(70,'Yasmin','Omar','Lotfy',NULL,'Female','Egyptian','2000-09-14',NULL,'Single',NULL,'Probation','01010000070',NULL,'yasmin.lotfy70@giu.edu.eg','yasmin.lotfy70@gmail.com','Omar Lotfy','01090000070','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Pending','Clear'),(71,'Faris','Tamer','Younis',NULL,'Male','Egyptian','1995-11-02',NULL,'Single',NULL,'Active','01010000071',NULL,'faris.younis71@giu.edu.eg','faris.younis71@gmail.com','Tamer Younis','01090000071','Parent','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(72,'Noor','Khaled','Sayed',NULL,'Female','Egyptian','1997-01-24',NULL,'Single',NULL,'Active','01010000072',NULL,'noor.sayed72@giu.edu.eg','noor.sayed72@gmail.com','Khaled Sayed','01090000072','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(73,'Rami','Hassan','Helmy',NULL,'Male','Egyptian','1988-06-13',NULL,'Married',NULL,'Active','01010000073',NULL,'rami.helmy73@giu.edu.eg','rami.helmy73@gmail.com','Hassan Helmy','01090000073','Parent','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(74,'Asmaa','Mahmoud','Nasser',NULL,'Female','Egyptian','1994-09-09',NULL,'Married',NULL,'Active','01010000074',NULL,'asmaa.nasser74@giu.edu.eg','asmaa.nasser74@gmail.com','Mahmoud Nasser','01090000074','Spouse','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(75,'Wael','Mostafa','Ibrahim',NULL,'Male','Egyptian','1972-03-05',NULL,'Married',NULL,'Active','01010000075',NULL,'wael.ibrahim75@giu.edu.eg','wael.ibrahim75@gmail.com','Mostafa Ibrahim','01090000075','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(76,'Heba','Aly','Fathy',NULL,'Female','Egyptian','1987-10-12',NULL,'Married',NULL,'Active','01010000076',NULL,'heba.fathy76@giu.edu.eg','heba.fathy76@gmail.com','Aly Fathy','01090000076','Spouse','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(77,'Mazen','Kareem','Saad',NULL,'Male','Egyptian','1998-02-02',NULL,'Single',NULL,'Active','01010000077',NULL,'mazen.saad77@giu.edu.eg','mazen.saad77@gmail.com','Kareem Saad','01090000077','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(78,'Rita','Samy','Habib',NULL,'Female','Egyptian','1993-04-18',NULL,'Married',NULL,'Active','01010000078',NULL,'rita.habib78@giu.edu.eg','rita.habib78@gmail.com','Samy Habib','01090000078','Spouse','Alexandria',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear'),(79,'Eman','Hossam','Ali',NULL,'Female','Egyptian','1999-08-08',NULL,'Single',NULL,'Leave','01010000079',NULL,'eman.ali79@giu.edu.eg','eman.ali79@gmail.com','Hossam Ali','01090000079','Parent','Cairo',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Pending'),(80,'Khaled','Sameh','Hassan',NULL,'Male','Egyptian','1965-12-20',NULL,'Married',NULL,'Retired','01010000080',NULL,'khaled.hassan80@giu.edu.eg','khaled.hassan80@gmail.com','Sameh Hassan','01090000080','Sibling','Giza',NULL,NULL,'Egypt',NULL,NULL,NULL,NULL,'Cleared','Clear');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_disability`
--

DROP TABLE IF EXISTS `employee_disability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_disability` (
  `Disability_ID` int NOT NULL AUTO_INCREMENT,
  `Employee_ID` int DEFAULT NULL,
  `Disability_Type` varchar(200) DEFAULT NULL,
  `Severity_Level` varchar(50) DEFAULT NULL,
  `Required_Support` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Disability_ID`),
  KEY `fk_disability_employee` (`Employee_ID`),
  CONSTRAINT `fk_disability_employee` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_disability`
--

LOCK TABLES `employee_disability` WRITE;
/*!40000 ALTER TABLE `employee_disability` DISABLE KEYS */;
INSERT INTO `employee_disability` VALUES (1,4,'Visual Impairment','Moderate','Screen reader support and larger-font workstation settings.'),(2,8,'Mobility Limitation','Moderate','Accessible workspace and closer parking / elevator access.'),(3,18,'Hearing Impairment','Low','Meeting notes provided and optional hearing assistance device.'),(4,30,'Chronic Condition','Low','Flexible scheduling for medical appointments as needed.'),(5,47,'Neurodiversity','Low','Quiet workspace option and clear written task instructions.'),(6,62,'Upper Limb Limitation','Low','Ergonomic keyboard/mouse and adjustable desk setup.'),(7,70,'Visual Strain Condition','Low','Anti-glare monitor and breaks during prolonged screen work.'),(8,79,'Mobility Limitation','Low','Remote-work option when required and accessible seating.');
/*!40000 ALTER TABLE `employee_disability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_kpi_score`
--

DROP TABLE IF EXISTS `employee_kpi_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_kpi_score` (
  `Score_ID` int NOT NULL AUTO_INCREMENT,
  `Assignment_ID` int DEFAULT NULL,
  `KPI_ID` int DEFAULT NULL,
  `Performance_Cycle_ID` int DEFAULT NULL,
  `Actual_Value` decimal(12,2) DEFAULT NULL,
  `Employee_Score` decimal(5,2) DEFAULT NULL,
  `Weighted_Score` decimal(5,2) DEFAULT NULL,
  `Reviewer_ID` int DEFAULT NULL,
  `Comments` varchar(500) DEFAULT NULL,
  `Review_Date` date DEFAULT NULL,
  PRIMARY KEY (`Score_ID`),
  KEY `fk_score_assignment` (`Assignment_ID`),
  KEY `fk_score_kpi` (`KPI_ID`),
  KEY `fk_score_cycle` (`Performance_Cycle_ID`),
  KEY `fk_score_reviewer` (`Reviewer_ID`),
  CONSTRAINT `fk_score_assignment` FOREIGN KEY (`Assignment_ID`) REFERENCES `job_assignment` (`Assignment_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_score_cycle` FOREIGN KEY (`Performance_Cycle_ID`) REFERENCES `performance_cycle` (`Cycle_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_score_kpi` FOREIGN KEY (`KPI_ID`) REFERENCES `objective_kpi` (`KPI_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_score_reviewer` FOREIGN KEY (`Reviewer_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE SET NULL,
  CONSTRAINT `employee_kpi_score_chk_1` CHECK ((`Employee_Score` between 1 and 5)),
  CONSTRAINT `employee_kpi_score_chk_2` CHECK ((`Weighted_Score` between 0 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=1534 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_kpi_score`
--

LOCK TABLES `employee_kpi_score` WRITE;
/*!40000 ALTER TABLE `employee_kpi_score` DISABLE KEYS */;
INSERT INTO `employee_kpi_score` VALUES (1,1,1,1,81.00,4.00,2.00,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(2,1,76,1,3.69,4.00,1.20,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(3,1,151,1,76.50,4.00,0.80,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(4,1,2,1,90.00,4.50,2.25,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(5,1,77,1,81.00,4.50,1.35,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(6,1,152,1,72.00,4.50,0.90,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(7,1,3,1,1.80,2.50,1.25,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(8,1,78,1,3.60,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(9,1,153,1,2.70,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(10,2,4,1,90.25,3.50,1.75,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-03'),(11,2,79,1,4.09,3.50,1.05,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-03'),(12,2,154,1,9.50,3.50,0.70,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-03'),(13,2,5,1,13.30,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(14,2,80,1,3.80,4.00,1.20,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-03'),(15,2,155,1,90.25,4.00,0.80,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-03'),(16,2,6,1,2.85,4.50,2.25,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-03'),(17,2,81,1,3.99,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(18,2,156,1,6.65,4.50,0.90,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-03'),(19,3,4,1,95.00,4.00,2.00,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-04'),(20,3,79,1,4.30,4.00,1.20,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-04'),(21,3,154,1,10.00,4.00,0.80,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-04'),(22,3,5,1,14.00,4.50,2.25,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-04'),(23,3,80,1,4.00,4.50,1.35,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-04'),(24,3,155,1,95.00,4.50,0.90,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-04'),(25,3,6,1,3.00,2.50,1.25,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-04'),(26,3,81,1,4.20,2.50,0.75,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-04'),(27,3,156,1,7.00,2.50,0.50,1,'Cycle 1 KPI score (generated for dashboards)','2024-11-04'),(28,6,7,1,81.00,4.50,2.25,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-07'),(29,6,82,1,3.69,4.50,1.35,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-07'),(30,6,157,1,76.50,4.50,0.90,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-07'),(31,6,8,1,90.00,2.50,1.25,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-07'),(32,6,83,1,81.00,2.50,0.75,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-07'),(33,6,158,1,72.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(34,6,9,1,1.80,3.00,1.50,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-07'),(35,6,84,1,3.60,3.00,0.90,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-07'),(36,6,159,1,2.70,3.00,0.60,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-07'),(37,7,10,1,90.25,4.00,2.00,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-08'),(38,7,85,1,4.09,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(39,7,160,1,9.50,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(40,7,11,1,13.30,4.50,2.25,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-08'),(41,7,86,1,3.80,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(42,7,161,1,90.25,4.50,0.90,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-08'),(43,7,12,1,2.85,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(44,7,87,1,3.99,2.50,0.75,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-08'),(45,7,162,1,6.65,2.50,0.50,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-08'),(46,8,10,1,95.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(47,8,85,1,4.30,4.50,1.35,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-09'),(48,8,160,1,10.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(49,8,11,1,14.00,2.50,1.25,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-09'),(50,8,86,1,4.00,2.50,0.75,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-09'),(51,8,161,1,95.00,2.50,0.50,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-09'),(52,8,12,1,3.00,3.00,1.50,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-09'),(53,8,87,1,4.20,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(54,8,162,1,7.00,3.00,0.60,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-09'),(55,9,10,1,99.75,2.50,1.25,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-10'),(56,9,85,1,4.52,2.50,0.75,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-10'),(57,9,160,1,10.50,2.50,0.50,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-10'),(58,9,11,1,14.70,3.00,1.50,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-10'),(59,9,86,1,4.20,3.00,0.90,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-10'),(60,9,161,1,99.75,3.00,0.60,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-10'),(61,9,12,1,3.15,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(62,9,87,1,4.41,3.50,1.05,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-10'),(63,9,162,1,7.35,3.50,0.70,6,'Cycle 1 KPI score (generated for dashboards)','2024-11-10'),(64,11,13,1,81.00,2.50,1.25,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-12'),(65,11,88,1,3.69,2.50,0.75,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-12'),(66,11,163,1,76.50,2.50,0.50,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-12'),(67,11,14,1,90.00,3.00,1.50,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-12'),(68,11,89,1,81.00,3.00,0.90,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-12'),(69,11,164,1,72.00,3.00,0.60,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-12'),(70,11,15,1,1.80,3.50,1.75,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-12'),(71,11,90,1,3.60,3.50,1.05,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-12'),(72,11,165,1,2.70,3.50,0.70,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-12'),(73,12,16,1,90.25,4.50,2.25,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-13'),(74,12,91,1,4.09,4.50,1.35,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-13'),(75,12,166,1,9.50,4.50,0.90,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-13'),(76,12,17,1,13.30,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(77,12,92,1,3.80,2.50,0.75,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-13'),(78,12,167,1,90.25,2.50,0.50,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-13'),(79,12,18,1,2.85,3.00,1.50,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-13'),(80,12,93,1,3.99,3.00,0.90,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-13'),(81,12,168,1,6.65,3.00,0.60,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-13'),(82,13,16,1,95.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(83,13,91,1,4.30,2.50,0.75,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-14'),(84,13,166,1,10.00,2.50,0.50,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-14'),(85,13,17,1,14.00,3.00,1.50,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-14'),(86,13,92,1,4.00,3.00,0.90,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-14'),(87,13,167,1,95.00,3.00,0.60,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-14'),(88,13,18,1,3.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(89,13,93,1,4.20,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(90,13,168,1,7.00,3.50,0.70,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-14'),(91,14,16,1,99.75,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(92,14,91,1,4.52,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(93,14,166,1,10.50,3.00,0.60,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-15'),(94,14,17,1,14.70,3.50,1.75,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-15'),(95,14,92,1,4.20,3.50,1.05,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-15'),(96,14,167,1,99.75,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(97,14,18,1,3.15,4.00,2.00,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-15'),(98,14,93,1,4.41,4.00,1.20,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-15'),(99,14,168,1,7.35,4.00,0.80,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-15'),(100,15,16,1,80.75,3.50,1.75,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-16'),(101,15,91,1,3.66,3.50,1.05,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-16'),(102,15,17,1,11.90,4.00,2.00,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-16'),(103,15,92,1,3.40,4.00,1.20,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-16'),(104,15,18,1,2.55,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(105,15,93,1,3.57,4.50,1.35,11,'Cycle 1 KPI score (generated for dashboards)','2024-11-16'),(106,19,19,1,94.50,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(107,19,94,1,4.20,4.50,1.35,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-20'),(108,19,169,1,7.35,4.50,0.90,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-20'),(109,19,20,1,104.48,2.50,1.25,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-20'),(110,19,95,1,4.20,2.50,0.75,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-20'),(111,19,170,1,5.25,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(112,19,21,1,7.35,3.00,1.50,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-20'),(113,19,96,1,102.90,3.00,0.90,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-20'),(114,19,171,1,5.25,3.00,0.60,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-20'),(115,20,22,1,80.75,4.00,2.00,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-21'),(116,20,97,1,3.66,4.00,1.20,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-21'),(117,20,23,1,11.90,4.50,2.25,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-21'),(118,20,98,1,3.40,4.50,1.35,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-21'),(119,20,24,1,76.50,2.50,1.25,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-21'),(120,20,99,1,3.40,2.50,0.75,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-21'),(121,21,22,1,85.50,4.50,2.25,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-22'),(122,21,97,1,3.87,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(123,21,172,1,9.00,4.50,0.90,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-22'),(124,21,23,1,12.60,2.50,1.25,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-22'),(125,21,98,1,3.60,2.50,0.75,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-22'),(126,21,173,1,85.50,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(127,21,24,1,81.00,3.00,1.50,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-22'),(128,21,99,1,3.60,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(129,21,174,1,6.30,3.00,0.60,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-22'),(130,22,22,1,90.25,2.50,1.25,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-23'),(131,22,97,1,4.09,2.50,0.75,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-23'),(132,22,172,1,9.50,2.50,0.50,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-23'),(133,22,23,1,13.30,3.00,1.50,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-23'),(134,22,98,1,3.80,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(135,22,173,1,90.25,3.00,0.60,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-23'),(136,22,24,1,85.50,3.50,1.75,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-23'),(137,22,99,1,3.80,3.50,1.05,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-23'),(138,22,174,1,6.65,3.50,0.70,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-23'),(139,23,22,1,95.00,3.00,1.50,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-24'),(140,23,97,1,4.30,3.00,0.90,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-24'),(141,23,172,1,10.00,3.00,0.60,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-24'),(142,23,23,1,14.00,3.50,1.75,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-24'),(143,23,98,1,4.00,3.50,1.05,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-24'),(144,23,173,1,95.00,3.50,0.70,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-24'),(145,23,24,1,90.00,4.00,2.00,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-24'),(146,23,99,1,4.00,4.00,1.20,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-24'),(147,23,174,1,7.00,4.00,0.80,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-24'),(148,24,22,1,99.75,3.50,1.75,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-25'),(149,24,97,1,4.52,3.50,1.05,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-25'),(150,24,172,1,10.50,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(151,24,23,1,14.70,4.00,2.00,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-25'),(152,24,98,1,4.20,4.00,1.20,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-25'),(153,24,173,1,99.75,4.00,0.80,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-25'),(154,24,24,1,94.50,4.50,2.25,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-25'),(155,24,99,1,4.20,4.50,1.35,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-25'),(156,24,174,1,7.35,4.50,0.90,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-25'),(157,25,22,1,80.75,4.00,2.00,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-26'),(158,25,97,1,3.66,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(159,25,23,1,11.90,4.50,2.25,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-26'),(160,25,98,1,3.40,4.50,1.35,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-26'),(161,25,24,1,76.50,2.50,1.25,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-26'),(162,25,99,1,3.40,2.50,0.75,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-26'),(163,26,25,1,6.30,3.50,1.75,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-27'),(164,26,100,1,88.20,3.50,1.05,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-27'),(165,26,175,1,4.50,3.50,0.70,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-27'),(166,26,26,1,1.80,4.00,2.00,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-27'),(167,26,101,1,88.20,4.00,1.20,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-27'),(168,26,176,1,6.30,4.00,0.80,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-27'),(169,26,27,1,81.00,4.50,2.25,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-27'),(170,26,102,1,3.60,4.50,1.35,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-27'),(171,26,177,1,6.30,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(172,27,25,1,6.65,4.00,2.00,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-28'),(173,27,100,1,93.10,4.00,1.20,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-28'),(174,27,175,1,4.75,4.00,0.80,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-28'),(175,27,26,1,1.90,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(176,27,101,1,93.10,4.50,1.35,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-28'),(177,27,176,1,6.65,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(178,27,27,1,85.50,2.50,1.25,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-28'),(179,27,102,1,3.80,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(180,27,177,1,6.65,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(181,28,25,1,7.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(182,28,100,1,98.00,4.50,1.35,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-29'),(183,28,175,1,5.00,4.50,0.90,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-29'),(184,28,26,1,2.00,2.50,1.25,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-29'),(185,28,101,1,98.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(186,28,176,1,7.00,2.50,0.50,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-29'),(187,28,27,1,90.00,3.00,1.50,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-29'),(188,28,102,1,4.00,3.00,0.90,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-29'),(189,28,177,1,7.00,3.00,0.60,19,'Cycle 1 KPI score (generated for dashboards)','2024-11-29'),(190,29,28,1,94.50,4.00,2.00,29,'Cycle 1 KPI score (generated for dashboards)','2024-11-30'),(191,29,103,1,4.31,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(192,29,178,1,89.25,4.00,0.80,29,'Cycle 1 KPI score (generated for dashboards)','2024-11-30'),(193,29,29,1,2.10,4.50,2.25,29,'Cycle 1 KPI score (generated for dashboards)','2024-11-30'),(194,29,104,1,4.20,4.50,1.35,29,'Cycle 1 KPI score (generated for dashboards)','2024-11-30'),(195,29,179,1,3.15,4.50,0.90,29,'Cycle 1 KPI score (generated for dashboards)','2024-11-30'),(196,29,30,1,94.50,2.50,1.25,29,'Cycle 1 KPI score (generated for dashboards)','2024-11-30'),(197,29,105,1,4.20,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(198,29,180,1,7.35,2.50,0.50,29,'Cycle 1 KPI score (generated for dashboards)','2024-11-30'),(199,30,31,1,80.75,3.50,1.75,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-01'),(200,30,106,1,3.66,3.50,1.05,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-01'),(201,30,32,1,11.90,4.00,2.00,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-01'),(202,30,107,1,3.40,4.00,1.20,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-01'),(203,30,33,1,2.55,4.50,2.25,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-01'),(204,30,108,1,3.57,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(205,31,31,1,85.50,4.00,2.00,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-02'),(206,31,106,1,3.87,4.00,1.20,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-02'),(207,31,181,1,9.00,4.00,0.80,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-02'),(208,31,32,1,12.60,4.50,2.25,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-02'),(209,31,107,1,3.60,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(210,31,182,1,85.50,4.50,0.90,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-02'),(211,31,33,1,2.70,2.50,1.25,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-02'),(212,31,108,1,3.78,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(213,31,183,1,6.30,2.50,0.50,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-02'),(214,32,31,1,90.25,4.50,2.25,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-03'),(215,32,106,1,4.09,4.50,1.35,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-03'),(216,32,181,1,9.50,4.50,0.90,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-03'),(217,32,32,1,13.30,2.50,1.25,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-03'),(218,32,107,1,3.80,2.50,0.75,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-03'),(219,32,182,1,90.25,2.50,0.50,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-03'),(220,32,33,1,2.85,3.00,1.50,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-03'),(221,32,108,1,3.99,3.00,0.90,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-03'),(222,32,183,1,6.65,3.00,0.60,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-03'),(223,33,34,1,2.00,4.00,2.00,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-04'),(224,33,109,1,4.00,4.00,1.20,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-04'),(225,33,184,1,3.00,4.00,0.80,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-04'),(226,33,35,1,2.00,4.50,2.25,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-04'),(227,33,110,1,98.00,4.50,1.35,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-04'),(228,33,185,1,7.00,4.50,0.90,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-04'),(229,33,36,1,7.00,2.50,1.25,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-04'),(230,33,111,1,98.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(231,33,186,1,5.00,2.50,0.50,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-04'),(232,34,34,1,2.10,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(233,34,109,1,4.20,4.50,1.35,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-05'),(234,34,184,1,3.15,4.50,0.90,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-05'),(235,34,35,1,2.10,2.50,1.25,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-05'),(236,34,110,1,102.90,2.50,0.75,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-05'),(237,34,185,1,7.35,2.50,0.50,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-05'),(238,34,36,1,7.35,3.00,1.50,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-05'),(239,34,111,1,102.90,3.00,0.90,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-05'),(240,34,186,1,5.25,3.00,0.60,29,'Cycle 1 KPI score (generated for dashboards)','2024-12-05'),(241,35,37,1,76.50,4.00,2.00,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-06'),(242,35,112,1,3.49,4.00,1.20,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-06'),(243,35,38,1,85.00,4.50,2.25,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-06'),(244,35,113,1,76.50,4.50,1.35,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-06'),(245,35,39,1,76.50,2.50,1.25,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-06'),(246,35,114,1,3.40,2.50,0.75,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-06'),(247,36,40,1,85.50,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(248,36,115,1,3.87,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(249,36,190,1,9.00,3.50,0.70,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-07'),(250,36,41,1,12.60,4.00,2.00,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-07'),(251,36,116,1,3.60,4.00,1.20,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-07'),(252,36,191,1,85.50,4.00,0.80,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-07'),(253,36,42,1,2.70,4.50,2.25,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-07'),(254,36,117,1,3.78,4.50,1.35,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-07'),(255,36,192,1,6.30,4.50,0.90,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-07'),(256,37,40,1,90.25,4.00,2.00,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-08'),(257,37,115,1,4.09,4.00,1.20,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-08'),(258,37,190,1,9.50,4.00,0.80,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-08'),(259,37,41,1,13.30,4.50,2.25,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-08'),(260,37,116,1,3.80,4.50,1.35,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-08'),(261,37,191,1,90.25,4.50,0.90,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-08'),(262,37,42,1,2.85,2.50,1.25,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-08'),(263,37,117,1,3.99,2.50,0.75,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-08'),(264,37,192,1,6.65,2.50,0.50,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-08'),(265,38,40,1,95.00,4.50,2.25,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-09'),(266,38,115,1,4.30,4.50,1.35,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-09'),(267,38,190,1,10.00,4.50,0.90,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-09'),(268,38,41,1,14.00,2.50,1.25,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-09'),(269,38,116,1,4.00,2.50,0.75,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-09'),(270,38,191,1,95.00,2.50,0.50,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-09'),(271,38,42,1,3.00,3.00,1.50,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-09'),(272,38,117,1,4.20,3.00,0.90,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-09'),(273,38,192,1,7.00,3.00,0.60,35,'Cycle 1 KPI score (generated for dashboards)','2024-12-09'),(274,40,43,1,76.50,4.50,2.25,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-11'),(275,40,118,1,3.49,4.50,1.35,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-11'),(276,40,44,1,85.00,2.50,1.25,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-11'),(277,40,119,1,76.50,2.50,0.75,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-11'),(278,40,45,1,76.50,3.00,1.50,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-11'),(279,40,120,1,3.40,3.00,0.90,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-11'),(280,41,46,1,85.50,4.00,2.00,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-12'),(281,41,121,1,3.87,4.00,1.20,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-12'),(282,41,196,1,9.00,4.00,0.80,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-12'),(283,41,47,1,12.60,4.50,2.25,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-12'),(284,41,122,1,3.60,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(285,41,197,1,85.50,4.50,0.90,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-12'),(286,41,48,1,2.70,2.50,1.25,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-12'),(287,41,123,1,3.78,2.50,0.75,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-12'),(288,41,198,1,6.30,2.50,0.50,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-12'),(289,42,46,1,90.25,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(290,42,121,1,4.09,4.50,1.35,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-13'),(291,42,196,1,9.50,4.50,0.90,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-13'),(292,42,47,1,13.30,2.50,1.25,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-13'),(293,42,122,1,3.80,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(294,42,197,1,90.25,2.50,0.50,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-13'),(295,42,48,1,2.85,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(296,42,123,1,3.99,3.00,0.90,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-13'),(297,42,198,1,6.65,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(298,43,46,1,95.00,2.50,1.25,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-14'),(299,43,121,1,4.30,2.50,0.75,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-14'),(300,43,196,1,10.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(301,43,47,1,14.00,3.00,1.50,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-14'),(302,43,122,1,4.00,3.00,0.90,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-14'),(303,43,197,1,95.00,3.00,0.60,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-14'),(304,43,48,1,3.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(305,43,123,1,4.20,3.50,1.05,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-14'),(306,43,198,1,7.00,3.50,0.70,40,'Cycle 1 KPI score (generated for dashboards)','2024-12-14'),(307,45,49,1,80.75,2.50,1.25,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-01'),(308,45,124,1,3.66,2.50,0.75,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-01'),(309,45,50,1,11.90,3.00,1.50,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-01'),(310,45,125,1,3.40,3.00,0.90,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-01'),(311,45,51,1,76.50,3.50,1.75,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-01'),(312,45,126,1,3.40,3.50,1.05,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-01'),(313,46,49,1,85.50,3.00,1.50,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(314,46,124,1,3.87,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(315,46,199,1,9.00,3.00,0.60,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(316,46,50,1,12.60,3.50,1.75,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(317,46,125,1,3.60,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(318,46,200,1,85.50,3.50,0.70,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(319,46,51,1,81.00,4.00,2.00,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(320,46,126,1,3.60,4.00,1.20,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(321,46,201,1,6.30,4.00,0.80,45,'Cycle 1 KPI score (generated for dashboards)','2024-11-02'),(322,49,52,1,94.50,3.50,1.75,49,'Cycle 1 KPI score (generated for dashboards)','2024-11-05'),(323,49,127,1,4.31,3.50,1.05,49,'Cycle 1 KPI score (generated for dashboards)','2024-11-05'),(324,49,202,1,89.25,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(325,49,53,1,14.70,4.00,2.00,49,'Cycle 1 KPI score (generated for dashboards)','2024-11-05'),(326,49,128,1,4.20,4.00,1.20,49,'Cycle 1 KPI score (generated for dashboards)','2024-11-05'),(327,49,203,1,99.75,4.00,0.80,49,'Cycle 1 KPI score (generated for dashboards)','2024-11-05'),(328,49,54,1,104.48,4.50,2.25,49,'Cycle 1 KPI score (generated for dashboards)','2024-11-05'),(329,49,129,1,4.20,4.50,1.35,49,'Cycle 1 KPI score (generated for dashboards)','2024-11-05'),(330,49,204,1,5.25,4.50,0.90,49,'Cycle 1 KPI score (generated for dashboards)','2024-11-05'),(331,53,55,1,90.00,4.50,2.25,53,'Cycle 1 KPI score (generated for dashboards)','2024-11-09'),(332,53,130,1,4.10,4.50,1.35,53,'Cycle 1 KPI score (generated for dashboards)','2024-11-09'),(333,53,205,1,85.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(334,53,56,1,14.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(335,53,131,1,4.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(336,53,206,1,95.00,2.50,0.50,53,'Cycle 1 KPI score (generated for dashboards)','2024-11-09'),(337,53,57,1,90.00,3.00,1.50,53,'Cycle 1 KPI score (generated for dashboards)','2024-11-09'),(338,53,132,1,4.00,NULL,NULL,NULL,'Cycle 1 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(339,53,207,1,7.00,3.00,0.60,53,'Cycle 1 KPI score (generated for dashboards)','2024-11-09'),(512,1,1,2,81.00,4.50,2.25,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-02'),(513,1,76,2,3.69,4.50,1.35,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-02'),(514,1,151,2,76.50,4.50,0.90,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-02'),(515,1,2,2,90.00,2.50,1.25,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-02'),(516,1,77,2,81.00,2.50,0.75,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-02'),(517,1,152,2,72.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(518,1,3,2,1.80,3.00,1.50,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-02'),(519,1,78,2,3.60,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(520,1,153,2,2.70,3.00,0.60,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-02'),(521,2,4,2,90.25,4.00,2.00,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-03'),(522,2,79,2,4.09,4.00,1.20,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-03'),(523,2,154,2,9.50,4.00,0.80,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-03'),(524,2,5,2,13.30,4.50,2.25,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-03'),(525,2,80,2,3.80,4.50,1.35,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-03'),(526,2,155,2,90.25,4.50,0.90,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-03'),(527,2,6,2,2.85,2.50,1.25,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-03'),(528,2,81,2,3.99,2.50,0.75,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-03'),(529,2,156,2,6.65,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(530,3,4,2,95.00,4.50,2.25,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-04'),(531,3,79,2,4.30,4.50,1.35,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-04'),(532,3,154,2,10.00,4.50,0.90,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-04'),(533,3,5,2,14.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(534,3,80,2,4.00,2.50,0.75,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-04'),(535,3,155,2,95.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(536,3,6,2,3.00,3.00,1.50,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-04'),(537,3,81,2,4.20,3.00,0.90,1,'Cycle 2 KPI score (generated for dashboards)','2025-05-04'),(538,3,156,2,7.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(539,6,7,2,81.00,2.50,1.25,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(540,6,82,2,3.69,2.50,0.75,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(541,6,157,2,76.50,2.50,0.50,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(542,6,8,2,90.00,3.00,1.50,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(543,6,83,2,81.00,3.00,0.90,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(544,6,158,2,72.00,3.00,0.60,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(545,6,9,2,1.80,3.50,1.75,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(546,6,84,2,3.60,3.50,1.05,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(547,6,159,2,2.70,3.50,0.70,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(548,7,10,2,90.25,4.50,2.25,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(549,7,85,2,4.09,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(550,7,160,2,9.50,4.50,0.90,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(551,7,11,2,13.30,2.50,1.25,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(552,7,86,2,3.80,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(553,7,161,2,90.25,2.50,0.50,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(554,7,12,2,2.85,3.00,1.50,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(555,7,87,2,3.99,3.00,0.90,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(556,7,162,2,6.65,3.00,0.60,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(557,8,10,2,95.00,2.50,1.25,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(558,8,85,2,4.30,2.50,0.75,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(559,8,160,2,10.00,2.50,0.50,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(560,8,11,2,14.00,3.00,1.50,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(561,8,86,2,4.00,3.00,0.90,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(562,8,161,2,95.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(563,8,12,2,3.00,3.50,1.75,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(564,8,87,2,4.20,3.50,1.05,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(565,8,162,2,7.00,3.50,0.70,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(566,9,10,2,99.75,3.00,1.50,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(567,9,85,2,4.52,3.00,0.90,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(568,9,160,2,10.50,3.00,0.60,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(569,9,11,2,14.70,3.50,1.75,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(570,9,86,2,4.20,3.50,1.05,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(571,9,161,2,99.75,3.50,0.70,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(572,9,12,2,3.15,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(573,9,87,2,4.41,4.00,1.20,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(574,9,162,2,7.35,4.00,0.80,6,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(575,11,13,2,81.00,3.00,1.50,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-12'),(576,11,88,2,3.69,3.00,0.90,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-12'),(577,11,163,2,76.50,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(578,11,14,2,90.00,3.50,1.75,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-12'),(579,11,89,2,81.00,3.50,1.05,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-12'),(580,11,164,2,72.00,3.50,0.70,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-12'),(581,11,15,2,1.80,4.00,2.00,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-12'),(582,11,90,2,3.60,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(583,11,165,2,2.70,4.00,0.80,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-12'),(584,12,16,2,90.25,2.50,1.25,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-13'),(585,12,91,2,4.09,2.50,0.75,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-13'),(586,12,166,2,9.50,2.50,0.50,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-13'),(587,12,17,2,13.30,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(588,12,92,2,3.80,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(589,12,167,2,90.25,3.00,0.60,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-13'),(590,12,18,2,2.85,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(591,12,93,2,3.99,3.50,1.05,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-13'),(592,12,168,2,6.65,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(593,13,16,2,95.00,3.00,1.50,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-14'),(594,13,91,2,4.30,3.00,0.90,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-14'),(595,13,166,2,10.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(596,13,17,2,14.00,3.50,1.75,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-14'),(597,13,92,2,4.00,3.50,1.05,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-14'),(598,13,167,2,95.00,3.50,0.70,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-14'),(599,13,18,2,3.00,4.00,2.00,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-14'),(600,13,93,2,4.20,4.00,1.20,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-14'),(601,13,168,2,7.00,4.00,0.80,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-14'),(602,14,16,2,99.75,3.50,1.75,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-15'),(603,14,91,2,4.52,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(604,14,166,2,10.50,3.50,0.70,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-15'),(605,14,17,2,14.70,4.00,2.00,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-15'),(606,14,92,2,4.20,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(607,14,167,2,99.75,4.00,0.80,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-15'),(608,14,18,2,3.15,4.50,2.25,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-15'),(609,14,93,2,4.41,4.50,1.35,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-15'),(610,14,168,2,7.35,4.50,0.90,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-15'),(611,15,16,2,80.75,4.00,2.00,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-16'),(612,15,91,2,3.66,4.00,1.20,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-16'),(613,15,17,2,11.90,4.50,2.25,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-16'),(614,15,92,2,3.40,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(615,15,18,2,2.55,2.50,1.25,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-16'),(616,15,93,2,3.57,2.50,0.75,11,'Cycle 2 KPI score (generated for dashboards)','2025-05-16'),(617,19,19,2,94.50,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(618,19,94,2,4.20,2.50,0.75,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-20'),(619,19,169,2,7.35,2.50,0.50,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-20'),(620,19,20,2,104.48,3.00,1.50,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-20'),(621,19,95,2,4.20,3.00,0.90,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-20'),(622,19,170,2,5.25,3.00,0.60,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-20'),(623,19,21,2,7.35,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(624,19,96,2,102.90,3.50,1.05,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-20'),(625,19,171,2,5.25,3.50,0.70,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-20'),(626,20,22,2,80.75,4.50,2.25,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-21'),(627,20,97,2,3.66,4.50,1.35,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-21'),(628,20,23,2,11.90,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(629,20,98,2,3.40,2.50,0.75,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-21'),(630,20,24,2,76.50,3.00,1.50,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-21'),(631,20,99,2,3.40,3.00,0.90,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-21'),(632,21,22,2,85.50,2.50,1.25,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-22'),(633,21,97,2,3.87,2.50,0.75,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-22'),(634,21,172,2,9.00,2.50,0.50,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-22'),(635,21,23,2,12.60,3.00,1.50,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-22'),(636,21,98,2,3.60,3.00,0.90,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-22'),(637,21,173,2,85.50,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(638,21,24,2,81.00,3.50,1.75,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-22'),(639,21,99,2,3.60,3.50,1.05,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-22'),(640,21,174,2,6.30,3.50,0.70,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-22'),(641,22,22,2,90.25,3.00,1.50,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-23'),(642,22,97,2,4.09,3.00,0.90,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-23'),(643,22,172,2,9.50,3.00,0.60,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-23'),(644,22,23,2,13.30,3.50,1.75,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-23'),(645,22,98,2,3.80,3.50,1.05,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-23'),(646,22,173,2,90.25,3.50,0.70,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-23'),(647,22,24,2,85.50,4.00,2.00,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-23'),(648,22,99,2,3.80,4.00,1.20,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-23'),(649,22,174,2,6.65,4.00,0.80,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-23'),(650,23,22,2,95.00,3.50,1.75,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-24'),(651,23,97,2,4.30,3.50,1.05,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-24'),(652,23,172,2,10.00,3.50,0.70,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-24'),(653,23,23,2,14.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(654,23,98,2,4.00,4.00,1.20,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-24'),(655,23,173,2,95.00,4.00,0.80,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-24'),(656,23,24,2,90.00,4.50,2.25,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-24'),(657,23,99,2,4.00,4.50,1.35,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-24'),(658,23,174,2,7.00,4.50,0.90,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-24'),(659,24,22,2,99.75,4.00,2.00,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-25'),(660,24,97,2,4.52,4.00,1.20,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-25'),(661,24,172,2,10.50,4.00,0.80,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-25'),(662,24,23,2,14.70,4.50,2.25,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-25'),(663,24,98,2,4.20,4.50,1.35,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-25'),(664,24,173,2,99.75,4.50,0.90,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-25'),(665,24,24,2,94.50,2.50,1.25,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-25'),(666,24,99,2,4.20,2.50,0.75,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-25'),(667,24,174,2,7.35,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(668,25,22,2,80.75,4.50,2.25,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-26'),(669,25,97,2,3.66,4.50,1.35,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-26'),(670,25,23,2,11.90,2.50,1.25,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-26'),(671,25,98,2,3.40,2.50,0.75,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-26'),(672,25,24,2,76.50,3.00,1.50,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-26'),(673,25,99,2,3.40,3.00,0.90,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-26'),(674,26,25,2,6.30,4.00,2.00,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-27'),(675,26,100,2,88.20,4.00,1.20,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-27'),(676,26,175,2,4.50,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(677,26,26,2,1.80,4.50,2.25,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-27'),(678,26,101,2,88.20,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(679,26,176,2,6.30,4.50,0.90,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-27'),(680,26,27,2,81.00,2.50,1.25,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-27'),(681,26,102,2,3.60,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(682,26,177,2,6.30,2.50,0.50,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-27'),(683,27,25,2,6.65,4.50,2.25,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-28'),(684,27,100,2,93.10,4.50,1.35,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-28'),(685,27,175,2,4.75,4.50,0.90,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-28'),(686,27,26,2,1.90,2.50,1.25,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-28'),(687,27,101,2,93.10,2.50,0.75,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-28'),(688,27,176,2,6.65,2.50,0.50,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-28'),(689,27,27,2,85.50,3.00,1.50,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-28'),(690,27,102,2,3.80,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(691,27,177,2,6.65,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(692,28,25,2,7.00,2.50,1.25,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-29'),(693,28,100,2,98.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(694,28,175,2,5.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(695,28,26,2,2.00,3.00,1.50,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-29'),(696,28,101,2,98.00,3.00,0.90,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-29'),(697,28,176,2,7.00,3.00,0.60,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-29'),(698,28,27,2,90.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(699,28,102,2,4.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(700,28,177,2,7.00,3.50,0.70,19,'Cycle 2 KPI score (generated for dashboards)','2025-05-29'),(701,29,28,2,94.50,4.50,2.25,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-30'),(702,29,103,2,4.31,4.50,1.35,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-30'),(703,29,178,2,89.25,4.50,0.90,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-30'),(704,29,29,2,2.10,2.50,1.25,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-30'),(705,29,104,2,4.20,2.50,0.75,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-30'),(706,29,179,2,3.15,2.50,0.50,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-30'),(707,29,30,2,94.50,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(708,29,105,2,4.20,3.00,0.90,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-30'),(709,29,180,2,7.35,3.00,0.60,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-30'),(710,30,31,2,80.75,4.00,2.00,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-31'),(711,30,106,2,3.66,4.00,1.20,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-31'),(712,30,32,2,11.90,4.50,2.25,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-31'),(713,30,107,2,3.40,4.50,1.35,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-31'),(714,30,33,2,2.55,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(715,30,108,2,3.57,2.50,0.75,29,'Cycle 2 KPI score (generated for dashboards)','2025-05-31'),(716,31,31,2,85.50,4.50,2.25,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-01'),(717,31,106,2,3.87,4.50,1.35,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-01'),(718,31,181,2,9.00,4.50,0.90,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-01'),(719,31,32,2,12.60,2.50,1.25,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-01'),(720,31,107,2,3.60,2.50,0.75,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-01'),(721,31,182,2,85.50,2.50,0.50,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-01'),(722,31,33,2,2.70,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(723,31,108,2,3.78,3.00,0.90,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-01'),(724,31,183,2,6.30,3.00,0.60,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-01'),(725,32,31,2,90.25,2.50,1.25,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-02'),(726,32,106,2,4.09,2.50,0.75,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-02'),(727,32,181,2,9.50,2.50,0.50,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-02'),(728,32,32,2,13.30,3.00,1.50,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-02'),(729,32,107,2,3.80,3.00,0.90,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-02'),(730,32,182,2,90.25,3.00,0.60,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-02'),(731,32,33,2,2.85,3.50,1.75,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-02'),(732,32,108,2,3.99,3.50,1.05,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-02'),(733,32,183,2,6.65,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(734,33,34,2,2.00,4.50,2.25,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-03'),(735,33,109,2,4.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(736,33,184,2,3.00,4.50,0.90,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-03'),(737,33,35,2,2.00,2.50,1.25,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-03'),(738,33,110,2,98.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(739,33,185,2,7.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(740,33,36,2,7.00,3.00,1.50,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-03'),(741,33,111,2,98.00,3.00,0.90,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-03'),(742,33,186,2,5.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(743,34,34,2,2.10,2.50,1.25,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-04'),(744,34,109,2,4.20,2.50,0.75,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-04'),(745,34,184,2,3.15,2.50,0.50,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-04'),(746,34,35,2,2.10,3.00,1.50,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-04'),(747,34,110,2,102.90,3.00,0.90,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-04'),(748,34,185,2,7.35,3.00,0.60,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-04'),(749,34,36,2,7.35,3.50,1.75,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-04'),(750,34,111,2,102.90,3.50,1.05,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-04'),(751,34,186,2,5.25,3.50,0.70,29,'Cycle 2 KPI score (generated for dashboards)','2025-06-04'),(752,35,37,2,76.50,4.50,2.25,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-05'),(753,35,112,2,3.49,4.50,1.35,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-05'),(754,35,38,2,85.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(755,35,113,2,76.50,2.50,0.75,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-05'),(756,35,39,2,76.50,3.00,1.50,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-05'),(757,35,114,2,3.40,3.00,0.90,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-05'),(758,36,40,2,85.50,4.00,2.00,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-06'),(759,36,115,2,3.87,4.00,1.20,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-06'),(760,36,190,2,9.00,4.00,0.80,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-06'),(761,36,41,2,12.60,4.50,2.25,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-06'),(762,36,116,2,3.60,4.50,1.35,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-06'),(763,36,191,2,85.50,4.50,0.90,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-06'),(764,36,42,2,2.70,2.50,1.25,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-06'),(765,36,117,2,3.78,2.50,0.75,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-06'),(766,36,192,2,6.30,2.50,0.50,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-06'),(767,37,40,2,90.25,4.50,2.25,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-07'),(768,37,115,2,4.09,4.50,1.35,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-07'),(769,37,190,2,9.50,4.50,0.90,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-07'),(770,37,41,2,13.30,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(771,37,116,2,3.80,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(772,37,191,2,90.25,2.50,0.50,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-07'),(773,37,42,2,2.85,3.00,1.50,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-07'),(774,37,117,2,3.99,3.00,0.90,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-07'),(775,37,192,2,6.65,3.00,0.60,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-07'),(776,38,40,2,95.00,2.50,1.25,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-08'),(777,38,115,2,4.30,2.50,0.75,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-08'),(778,38,190,2,10.00,2.50,0.50,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-08'),(779,38,41,2,14.00,3.00,1.50,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-08'),(780,38,116,2,4.00,3.00,0.90,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-08'),(781,38,191,2,95.00,3.00,0.60,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-08'),(782,38,42,2,3.00,3.50,1.75,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-08'),(783,38,117,2,4.20,3.50,1.05,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-08'),(784,38,192,2,7.00,3.50,0.70,35,'Cycle 2 KPI score (generated for dashboards)','2025-06-08'),(785,40,43,2,76.50,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(786,40,118,2,3.49,2.50,0.75,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-10'),(787,40,44,2,85.00,3.00,1.50,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-10'),(788,40,119,2,76.50,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(789,40,45,2,76.50,3.50,1.75,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-10'),(790,40,120,2,3.40,3.50,1.05,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-10'),(791,41,46,2,85.50,4.50,2.25,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-11'),(792,41,121,2,3.87,4.50,1.35,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-11'),(793,41,196,2,9.00,4.50,0.90,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-11'),(794,41,47,2,12.60,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(795,41,122,2,3.60,2.50,0.75,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-11'),(796,41,197,2,85.50,2.50,0.50,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-11'),(797,41,48,2,2.70,3.00,1.50,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-11'),(798,41,123,2,3.78,3.00,0.90,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-11'),(799,41,198,2,6.30,3.00,0.60,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-11'),(800,42,46,2,90.25,2.50,1.25,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-12'),(801,42,121,2,4.09,2.50,0.75,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-12'),(802,42,196,2,9.50,2.50,0.50,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-12'),(803,42,47,2,13.30,3.00,1.50,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-12'),(804,42,122,2,3.80,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(805,42,197,2,90.25,3.00,0.60,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-12'),(806,42,48,2,2.85,3.50,1.75,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-12'),(807,42,123,2,3.99,3.50,1.05,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-12'),(808,42,198,2,6.65,3.50,0.70,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-12'),(809,43,46,2,95.00,3.00,1.50,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-13'),(810,43,121,2,4.30,3.00,0.90,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-13'),(811,43,196,2,10.00,3.00,0.60,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-13'),(812,43,47,2,14.00,3.50,1.75,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-13'),(813,43,122,2,4.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(814,43,197,2,95.00,3.50,0.70,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-13'),(815,43,48,2,3.00,4.00,2.00,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-13'),(816,43,123,2,4.20,4.00,1.20,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-13'),(817,43,198,2,7.00,4.00,0.80,40,'Cycle 2 KPI score (generated for dashboards)','2025-06-13'),(818,45,49,2,80.75,3.00,1.50,45,'Cycle 2 KPI score (generated for dashboards)','2025-06-15'),(819,45,124,2,3.66,3.00,0.90,45,'Cycle 2 KPI score (generated for dashboards)','2025-06-15'),(820,45,50,2,11.90,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(821,45,125,2,3.40,3.50,1.05,45,'Cycle 2 KPI score (generated for dashboards)','2025-06-15'),(822,45,51,2,76.50,4.00,2.00,45,'Cycle 2 KPI score (generated for dashboards)','2025-06-15'),(823,45,126,2,3.40,4.00,1.20,45,'Cycle 2 KPI score (generated for dashboards)','2025-06-15'),(824,46,49,2,85.50,3.50,1.75,45,'Cycle 2 KPI score (generated for dashboards)','2025-06-16'),(825,46,124,2,3.87,3.50,1.05,45,'Cycle 2 KPI score (generated for dashboards)','2025-06-16'),(826,46,199,2,9.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(827,46,50,2,12.60,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(828,46,125,2,3.60,4.00,1.20,45,'Cycle 2 KPI score (generated for dashboards)','2025-06-16'),(829,46,200,2,85.50,4.00,0.80,45,'Cycle 2 KPI score (generated for dashboards)','2025-06-16'),(830,46,51,2,81.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(831,46,126,2,3.60,4.50,1.35,45,'Cycle 2 KPI score (generated for dashboards)','2025-06-16'),(832,46,201,2,6.30,4.50,0.90,45,'Cycle 2 KPI score (generated for dashboards)','2025-06-16'),(833,49,52,2,94.50,4.00,2.00,49,'Cycle 2 KPI score (generated for dashboards)','2025-06-19'),(834,49,127,2,4.31,4.00,1.20,49,'Cycle 2 KPI score (generated for dashboards)','2025-06-19'),(835,49,202,2,89.25,4.00,0.80,49,'Cycle 2 KPI score (generated for dashboards)','2025-06-19'),(836,49,53,2,14.70,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(837,49,128,2,4.20,4.50,1.35,49,'Cycle 2 KPI score (generated for dashboards)','2025-06-19'),(838,49,203,2,99.75,4.50,0.90,49,'Cycle 2 KPI score (generated for dashboards)','2025-06-19'),(839,49,54,2,104.48,2.50,1.25,49,'Cycle 2 KPI score (generated for dashboards)','2025-06-19'),(840,49,129,2,4.20,2.50,0.75,49,'Cycle 2 KPI score (generated for dashboards)','2025-06-19'),(841,49,204,2,5.25,2.50,0.50,49,'Cycle 2 KPI score (generated for dashboards)','2025-06-19'),(842,53,55,2,90.00,2.50,1.25,53,'Cycle 2 KPI score (generated for dashboards)','2025-06-23'),(843,53,130,2,4.10,2.50,0.75,53,'Cycle 2 KPI score (generated for dashboards)','2025-06-23'),(844,53,205,2,85.00,2.50,0.50,53,'Cycle 2 KPI score (generated for dashboards)','2025-06-23'),(845,53,56,2,14.00,3.00,1.50,53,'Cycle 2 KPI score (generated for dashboards)','2025-06-23'),(846,53,131,2,4.00,3.00,0.90,53,'Cycle 2 KPI score (generated for dashboards)','2025-06-23'),(847,53,206,2,95.00,3.00,0.60,53,'Cycle 2 KPI score (generated for dashboards)','2025-06-23'),(848,53,57,2,90.00,3.50,1.75,53,'Cycle 2 KPI score (generated for dashboards)','2025-06-23'),(849,53,132,2,4.00,3.50,1.05,53,'Cycle 2 KPI score (generated for dashboards)','2025-06-23'),(850,53,207,2,7.00,3.50,0.70,53,'Cycle 2 KPI score (generated for dashboards)','2025-06-23'),(851,61,58,2,81.00,3.00,1.50,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(852,61,133,2,3.60,3.00,0.90,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(853,61,208,2,6.30,3.00,0.60,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(854,61,59,2,85.50,3.50,1.75,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(855,61,134,2,3.60,3.50,1.05,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(856,61,209,2,2.70,3.50,0.70,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(857,61,60,2,6.30,4.00,2.00,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(858,61,135,2,88.20,4.00,1.20,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(859,61,210,2,4.50,4.00,0.80,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-07'),(860,62,61,2,94.53,2.50,1.25,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(861,62,136,2,3.80,2.50,0.75,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(862,62,211,2,4.75,2.50,0.50,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(863,62,62,2,85.50,3.00,1.50,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(864,62,137,2,3.80,3.00,0.90,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(865,62,212,2,6.65,3.00,0.60,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(866,62,63,2,85.50,3.50,1.75,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(867,62,138,2,3.80,3.50,1.05,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(868,62,213,2,6.65,3.50,0.70,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-08'),(869,63,61,2,99.50,3.00,1.50,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(870,63,136,2,4.00,3.00,0.90,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(871,63,211,2,5.00,3.00,0.60,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(872,63,62,2,90.00,3.50,1.75,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(873,63,137,2,4.00,3.50,1.05,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(874,63,212,2,7.00,3.50,0.70,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(875,63,63,2,90.00,4.00,2.00,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-09'),(876,63,138,2,4.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(877,63,213,2,7.00,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(878,64,61,2,104.48,3.50,1.75,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(879,64,136,2,4.20,3.50,1.05,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(880,64,211,2,5.25,3.50,0.70,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(881,64,62,2,94.50,4.00,2.00,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(882,64,137,2,4.20,4.00,1.20,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(883,64,212,2,7.35,4.00,0.80,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(884,64,63,2,94.50,4.50,2.25,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(885,64,138,2,4.20,4.50,1.35,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(886,64,213,2,7.35,4.50,0.90,61,'Cycle 2 KPI score (generated for dashboards)','2025-05-10'),(887,67,64,2,4.75,4.00,2.00,67,'Cycle 2 KPI score (generated for dashboards)','2025-05-13'),(888,67,139,2,93.10,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(889,67,214,2,4.75,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(890,67,65,2,4.75,4.50,2.25,67,'Cycle 2 KPI score (generated for dashboards)','2025-05-13'),(891,67,140,2,93.10,4.50,1.35,67,'Cycle 2 KPI score (generated for dashboards)','2025-05-13'),(892,67,215,2,4.75,4.50,0.90,67,'Cycle 2 KPI score (generated for dashboards)','2025-05-13'),(893,67,66,2,6.65,2.50,1.25,67,'Cycle 2 KPI score (generated for dashboards)','2025-05-13'),(894,67,141,2,93.10,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(895,67,216,2,4.75,2.50,0.50,67,'Cycle 2 KPI score (generated for dashboards)','2025-05-13'),(896,70,67,2,84.58,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(897,70,142,2,3.40,4.50,1.35,70,'Cycle 2 KPI score (generated for dashboards)','2025-05-16'),(898,70,68,2,84.58,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(899,70,143,2,3.40,2.50,0.75,70,'Cycle 2 KPI score (generated for dashboards)','2025-05-16'),(900,70,69,2,84.58,NULL,NULL,NULL,'Cycle 2 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(901,70,144,2,3.40,3.00,0.90,70,'Cycle 2 KPI score (generated for dashboards)','2025-05-16'),(1023,1,1,3,81.00,2.50,1.25,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1024,1,76,3,3.69,2.50,0.75,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1025,1,151,3,76.50,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1026,1,2,3,90.00,3.00,1.50,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1027,1,77,3,81.00,3.00,0.90,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1028,1,152,3,72.00,3.00,0.60,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1029,1,3,3,1.80,3.50,1.75,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1030,1,78,3,3.60,3.50,1.05,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1031,1,153,3,2.70,3.50,0.70,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1032,2,4,3,90.25,4.50,2.25,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1033,2,79,3,4.09,4.50,1.35,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1034,2,154,3,9.50,4.50,0.90,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1035,2,5,3,13.30,2.50,1.25,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1036,2,80,3,3.80,2.50,0.75,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1037,2,155,3,90.25,2.50,0.50,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1038,2,6,3,2.85,3.00,1.50,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1039,2,81,3,3.99,3.00,0.90,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1040,2,156,3,6.65,3.00,0.60,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1041,3,4,3,95.00,2.50,1.25,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1042,3,79,3,4.30,2.50,0.75,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1043,3,154,3,10.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1044,3,5,3,14.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1045,3,80,3,4.00,3.00,0.90,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1046,3,155,3,95.00,3.00,0.60,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1047,3,6,3,3.00,3.50,1.75,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1048,3,81,3,4.20,3.50,1.05,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1049,3,156,3,7.00,3.50,0.70,1,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1050,6,7,3,81.00,3.00,1.50,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-07'),(1051,6,82,3,3.69,3.00,0.90,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-07'),(1052,6,157,3,76.50,3.00,0.60,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-07'),(1053,6,8,3,90.00,3.50,1.75,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-07'),(1054,6,83,3,81.00,3.50,1.05,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-07'),(1055,6,158,3,72.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1056,6,9,3,1.80,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1057,6,84,3,3.60,4.00,1.20,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-07'),(1058,6,159,3,2.70,4.00,0.80,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-07'),(1059,7,10,3,90.25,2.50,1.25,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1060,7,85,3,4.09,2.50,0.75,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1061,7,160,3,9.50,2.50,0.50,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1062,7,11,3,13.30,3.00,1.50,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1063,7,86,3,3.80,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1064,7,161,3,90.25,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1065,7,12,3,2.85,3.50,1.75,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1066,7,87,3,3.99,3.50,1.05,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1067,7,162,3,6.65,3.50,0.70,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1068,8,10,3,95.00,3.00,1.50,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-09'),(1069,8,85,3,4.30,3.00,0.90,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-09'),(1070,8,160,3,10.00,3.00,0.60,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-09'),(1071,8,11,3,14.00,3.50,1.75,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-09'),(1072,8,86,3,4.00,3.50,1.05,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-09'),(1073,8,161,3,95.00,3.50,0.70,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-09'),(1074,8,12,3,3.00,4.00,2.00,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-09'),(1075,8,87,3,4.20,4.00,1.20,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-09'),(1076,8,162,3,7.00,4.00,0.80,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-09'),(1077,9,10,3,99.75,3.50,1.75,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-10'),(1078,9,85,3,4.52,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1079,9,160,3,10.50,3.50,0.70,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-10'),(1080,9,11,3,14.70,4.00,2.00,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-10'),(1081,9,86,3,4.20,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1082,9,161,3,99.75,4.00,0.80,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-10'),(1083,9,12,3,3.15,4.50,2.25,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-10'),(1084,9,87,3,4.41,4.50,1.35,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-10'),(1085,9,162,3,7.35,4.50,0.90,6,'Cycle 3 KPI score (generated for dashboards)','2025-10-10'),(1086,11,13,3,81.00,3.50,1.75,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-12'),(1087,11,88,3,3.69,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1088,11,163,3,76.50,3.50,0.70,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-12'),(1089,11,14,3,90.00,4.00,2.00,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-12'),(1090,11,89,3,81.00,4.00,1.20,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-12'),(1091,11,164,3,72.00,4.00,0.80,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-12'),(1092,11,15,3,1.80,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1093,11,90,3,3.60,4.50,1.35,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-12'),(1094,11,165,3,2.70,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1095,12,16,3,90.25,3.00,1.50,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-13'),(1096,12,91,3,4.09,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1097,12,166,3,9.50,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1098,12,17,3,13.30,3.50,1.75,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-13'),(1099,12,92,3,3.80,3.50,1.05,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-13'),(1100,12,167,3,90.25,3.50,0.70,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-13'),(1101,12,18,3,2.85,4.00,2.00,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-13'),(1102,12,93,3,3.99,4.00,1.20,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-13'),(1103,12,168,3,6.65,4.00,0.80,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-13'),(1104,13,16,3,95.00,3.50,1.75,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-14'),(1105,13,91,3,4.30,3.50,1.05,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-14'),(1106,13,166,3,10.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1107,13,17,3,14.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1108,13,92,3,4.00,4.00,1.20,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-14'),(1109,13,167,3,95.00,4.00,0.80,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-14'),(1110,13,18,3,3.00,4.50,2.25,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-14'),(1111,13,93,3,4.20,4.50,1.35,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-14'),(1112,13,168,3,7.00,4.50,0.90,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-14'),(1113,14,16,3,99.75,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1114,14,91,3,4.52,4.00,1.20,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-15'),(1115,14,166,3,10.50,4.00,0.80,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-15'),(1116,14,17,3,14.70,4.50,2.25,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-15'),(1117,14,92,3,4.20,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1118,14,167,3,99.75,4.50,0.90,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-15'),(1119,14,18,3,3.15,2.50,1.25,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-15'),(1120,14,93,3,4.41,2.50,0.75,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-15'),(1121,14,168,3,7.35,2.50,0.50,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-15'),(1122,15,16,3,80.75,4.50,2.25,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-16'),(1123,15,91,3,3.66,4.50,1.35,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-16'),(1124,15,17,3,11.90,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1125,15,92,3,3.40,2.50,0.75,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-16'),(1126,15,18,3,2.55,3.00,1.50,11,'Cycle 3 KPI score (generated for dashboards)','2025-10-16'),(1127,15,93,3,3.57,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1128,19,19,3,94.50,3.00,1.50,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-20'),(1129,19,94,3,4.20,3.00,0.90,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-20'),(1130,19,169,3,7.35,3.00,0.60,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-20'),(1131,19,20,3,104.48,3.50,1.75,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-20'),(1132,19,95,3,4.20,3.50,1.05,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-20'),(1133,19,170,3,5.25,3.50,0.70,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-20'),(1134,19,21,3,7.35,4.00,2.00,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-20'),(1135,19,96,3,102.90,4.00,1.20,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-20'),(1136,19,171,3,5.25,4.00,0.80,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-20'),(1137,20,22,3,80.75,2.50,1.25,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-21'),(1138,20,97,3,3.66,2.50,0.75,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-21'),(1139,20,23,3,11.90,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1140,20,98,3,3.40,3.00,0.90,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-21'),(1141,20,24,3,76.50,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1142,20,99,3,3.40,3.50,1.05,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-21'),(1143,21,22,3,85.50,3.00,1.50,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-22'),(1144,21,97,3,3.87,3.00,0.90,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-22'),(1145,21,172,3,9.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1146,21,23,3,12.60,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1147,21,98,3,3.60,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1148,21,173,3,85.50,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1149,21,24,3,81.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1150,21,99,3,3.60,4.00,1.20,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-22'),(1151,21,174,3,6.30,4.00,0.80,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-22'),(1152,22,22,3,90.25,3.50,1.75,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-23'),(1153,22,97,3,4.09,3.50,1.05,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-23'),(1154,22,172,3,9.50,3.50,0.70,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-23'),(1155,22,23,3,13.30,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1156,22,98,3,3.80,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1157,22,173,3,90.25,4.00,0.80,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-23'),(1158,22,24,3,85.50,4.50,2.25,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-23'),(1159,22,99,3,3.80,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1160,22,174,3,6.65,4.50,0.90,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-23'),(1161,23,22,3,95.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1162,23,97,3,4.30,4.00,1.20,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-24'),(1163,23,172,3,10.00,4.00,0.80,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-24'),(1164,23,23,3,14.00,4.50,2.25,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-24'),(1165,23,98,3,4.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1166,23,173,3,95.00,4.50,0.90,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-24'),(1167,23,24,3,90.00,2.50,1.25,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-24'),(1168,23,99,3,4.00,2.50,0.75,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-24'),(1169,23,174,3,7.00,2.50,0.50,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-24'),(1170,24,22,3,99.75,4.50,2.25,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-25'),(1171,24,97,3,4.52,4.50,1.35,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-25'),(1172,24,172,3,10.50,4.50,0.90,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-25'),(1173,24,23,3,14.70,2.50,1.25,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-25'),(1174,24,98,3,4.20,2.50,0.75,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-25'),(1175,24,173,3,99.75,2.50,0.50,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-25'),(1176,24,24,3,94.50,3.00,1.50,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-25'),(1177,24,99,3,4.20,3.00,0.90,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-25'),(1178,24,174,3,7.35,3.00,0.60,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-25'),(1179,25,22,3,80.75,2.50,1.25,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-26'),(1180,25,97,3,3.66,2.50,0.75,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-26'),(1181,25,23,3,11.90,3.00,1.50,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-26'),(1182,25,98,3,3.40,3.00,0.90,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-26'),(1183,25,24,3,76.50,3.50,1.75,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-26'),(1184,25,99,3,3.40,3.50,1.05,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-26'),(1185,26,25,3,6.30,4.50,2.25,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-27'),(1186,26,100,3,88.20,4.50,1.35,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-27'),(1187,26,175,3,4.50,4.50,0.90,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-27'),(1188,26,26,3,1.80,2.50,1.25,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-27'),(1189,26,101,3,88.20,2.50,0.75,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-27'),(1190,26,176,3,6.30,2.50,0.50,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-27'),(1191,26,27,3,81.00,3.00,1.50,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-27'),(1192,26,102,3,3.60,3.00,0.90,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-27'),(1193,26,177,3,6.30,3.00,0.60,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-27'),(1194,27,25,3,6.65,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1195,27,100,3,93.10,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1196,27,175,3,4.75,2.50,0.50,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-28'),(1197,27,26,3,1.90,3.00,1.50,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-28'),(1198,27,101,3,93.10,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1199,27,176,3,6.65,3.00,0.60,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-28'),(1200,27,27,3,85.50,3.50,1.75,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-28'),(1201,27,102,3,3.80,3.50,1.05,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-28'),(1202,27,177,3,6.65,3.50,0.70,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-28'),(1203,28,25,3,7.00,3.00,1.50,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-29'),(1204,28,100,3,98.00,3.00,0.90,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-29'),(1205,28,175,3,5.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1206,28,26,3,2.00,3.50,1.75,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-29'),(1207,28,101,3,98.00,3.50,1.05,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-29'),(1208,28,176,3,7.00,3.50,0.70,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-29'),(1209,28,27,3,90.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1210,28,102,3,4.00,4.00,1.20,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-29'),(1211,28,177,3,7.00,4.00,0.80,19,'Cycle 3 KPI score (generated for dashboards)','2025-10-29'),(1212,29,28,3,94.50,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1213,29,103,3,4.31,2.50,0.75,29,'Cycle 3 KPI score (generated for dashboards)','2025-10-30'),(1214,29,178,3,89.25,2.50,0.50,29,'Cycle 3 KPI score (generated for dashboards)','2025-10-30'),(1215,29,29,3,2.10,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1216,29,104,3,4.20,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1217,29,179,3,3.15,3.00,0.60,29,'Cycle 3 KPI score (generated for dashboards)','2025-10-30'),(1218,29,30,3,94.50,3.50,1.75,29,'Cycle 3 KPI score (generated for dashboards)','2025-10-30'),(1219,29,105,3,4.20,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1220,29,180,3,7.35,3.50,0.70,29,'Cycle 3 KPI score (generated for dashboards)','2025-10-30'),(1221,30,31,3,80.75,4.50,2.25,29,'Cycle 3 KPI score (generated for dashboards)','2025-10-31'),(1222,30,106,3,3.66,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1223,30,32,3,11.90,2.50,1.25,29,'Cycle 3 KPI score (generated for dashboards)','2025-10-31'),(1224,30,107,3,3.40,2.50,0.75,29,'Cycle 3 KPI score (generated for dashboards)','2025-10-31'),(1225,30,33,3,2.55,3.00,1.50,29,'Cycle 3 KPI score (generated for dashboards)','2025-10-31'),(1226,30,108,3,3.57,3.00,0.90,29,'Cycle 3 KPI score (generated for dashboards)','2025-10-31'),(1227,31,31,3,85.50,2.50,1.25,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-01'),(1228,31,106,3,3.87,2.50,0.75,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-01'),(1229,31,181,3,9.00,2.50,0.50,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-01'),(1230,31,32,3,12.60,3.00,1.50,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-01'),(1231,31,107,3,3.60,3.00,0.90,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-01'),(1232,31,182,3,85.50,3.00,0.60,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-01'),(1233,31,33,3,2.70,3.50,1.75,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-01'),(1234,31,108,3,3.78,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1235,31,183,3,6.30,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1236,32,31,3,90.25,3.00,1.50,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-02'),(1237,32,106,3,4.09,3.00,0.90,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-02'),(1238,32,181,3,9.50,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1239,32,32,3,13.30,3.50,1.75,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-02'),(1240,32,107,3,3.80,3.50,1.05,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-02'),(1241,32,182,3,90.25,3.50,0.70,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-02'),(1242,32,33,3,2.85,4.00,2.00,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-02'),(1243,32,108,3,3.99,4.00,1.20,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-02'),(1244,32,183,3,6.65,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1245,33,34,3,2.00,2.50,1.25,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-03'),(1246,33,109,3,4.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1247,33,184,3,3.00,2.50,0.50,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-03'),(1248,33,35,3,2.00,3.00,1.50,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-03'),(1249,33,110,3,98.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1250,33,185,3,7.00,3.00,0.60,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-03'),(1251,33,36,3,7.00,3.50,1.75,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-03'),(1252,33,111,3,98.00,3.50,1.05,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-03'),(1253,33,186,3,5.00,3.50,0.70,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-03'),(1254,34,34,3,2.10,3.00,1.50,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-04'),(1255,34,109,3,4.20,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1256,34,184,3,3.15,3.00,0.60,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-04'),(1257,34,35,3,2.10,3.50,1.75,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-04'),(1258,34,110,3,102.90,3.50,1.05,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-04'),(1259,34,185,3,7.35,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1260,34,36,3,7.35,4.00,2.00,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-04'),(1261,34,111,3,102.90,4.00,1.20,29,'Cycle 3 KPI score (generated for dashboards)','2025-11-04'),(1262,34,186,3,5.25,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1263,35,37,3,76.50,2.50,1.25,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-05'),(1264,35,112,3,3.49,2.50,0.75,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-05'),(1265,35,38,3,85.00,3.00,1.50,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-05'),(1266,35,113,3,76.50,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1267,35,39,3,76.50,3.50,1.75,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-05'),(1268,35,114,3,3.40,3.50,1.05,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-05'),(1269,36,40,3,85.50,4.50,2.25,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-06'),(1270,36,115,3,3.87,4.50,1.35,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-06'),(1271,36,190,3,9.00,4.50,0.90,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-06'),(1272,36,41,3,12.60,2.50,1.25,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-06'),(1273,36,116,3,3.60,2.50,0.75,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-06'),(1274,36,191,3,85.50,2.50,0.50,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-06'),(1275,36,42,3,2.70,3.00,1.50,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-06'),(1276,36,117,3,3.78,3.00,0.90,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-06'),(1277,36,192,3,6.30,3.00,0.60,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-06'),(1278,37,40,3,90.25,2.50,1.25,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-07'),(1279,37,115,3,4.09,2.50,0.75,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-07'),(1280,37,190,3,9.50,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1281,37,41,3,13.30,3.00,1.50,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-07'),(1282,37,116,3,3.80,3.00,0.90,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-07'),(1283,37,191,3,90.25,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1284,37,42,3,2.85,3.50,1.75,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-07'),(1285,37,117,3,3.99,3.50,1.05,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-07'),(1286,37,192,3,6.65,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1287,38,40,3,95.00,3.00,1.50,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-08'),(1288,38,115,3,4.30,3.00,0.90,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-08'),(1289,38,190,3,10.00,3.00,0.60,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-08'),(1290,38,41,3,14.00,3.50,1.75,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-08'),(1291,38,116,3,4.00,3.50,1.05,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-08'),(1292,38,191,3,95.00,3.50,0.70,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-08'),(1293,38,42,3,3.00,4.00,2.00,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-08'),(1294,38,117,3,4.20,4.00,1.20,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-08'),(1295,38,192,3,7.00,4.00,0.80,35,'Cycle 3 KPI score (generated for dashboards)','2025-11-08'),(1296,40,43,3,76.50,3.00,1.50,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-10'),(1297,40,118,3,3.49,3.00,0.90,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-10'),(1298,40,44,3,85.00,3.50,1.75,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-10'),(1299,40,119,3,76.50,3.50,1.05,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-10'),(1300,40,45,3,76.50,4.00,2.00,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-10'),(1301,40,120,3,3.40,4.00,1.20,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-10'),(1302,41,46,3,85.50,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1303,41,121,3,3.87,2.50,0.75,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-11'),(1304,41,196,3,9.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1305,41,47,3,12.60,3.00,1.50,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-11'),(1306,41,122,3,3.60,3.00,0.90,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-11'),(1307,41,197,3,85.50,3.00,0.60,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-11'),(1308,41,48,3,2.70,3.50,1.75,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-11'),(1309,41,123,3,3.78,3.50,1.05,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-11'),(1310,41,198,3,6.30,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1311,42,46,3,90.25,3.00,1.50,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-12'),(1312,42,121,3,4.09,3.00,0.90,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-12'),(1313,42,196,3,9.50,3.00,0.60,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-12'),(1314,42,47,3,13.30,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1315,42,122,3,3.80,3.50,1.05,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-12'),(1316,42,197,3,90.25,3.50,0.70,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-12'),(1317,42,48,3,2.85,4.00,2.00,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-12'),(1318,42,123,3,3.99,4.00,1.20,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-12'),(1319,42,198,3,6.65,4.00,0.80,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-12'),(1320,43,46,3,95.00,3.50,1.75,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-13'),(1321,43,121,3,4.30,3.50,1.05,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-13'),(1322,43,196,3,10.00,3.50,0.70,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-13'),(1323,43,47,3,14.00,4.00,2.00,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-13'),(1324,43,122,3,4.00,4.00,1.20,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-13'),(1325,43,197,3,95.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1326,43,48,3,3.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1327,43,123,3,4.20,4.50,1.35,40,'Cycle 3 KPI score (generated for dashboards)','2025-11-13'),(1328,43,198,3,7.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1329,45,49,3,80.75,3.50,1.75,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-15'),(1330,45,124,3,3.66,3.50,1.05,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-15'),(1331,45,50,3,11.90,4.00,2.00,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-15'),(1332,45,125,3,3.40,4.00,1.20,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-15'),(1333,45,51,3,76.50,4.50,2.25,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-15'),(1334,45,126,3,3.40,4.50,1.35,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-15'),(1335,46,49,3,85.50,4.00,2.00,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-16'),(1336,46,124,3,3.87,4.00,1.20,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-16'),(1337,46,199,3,9.00,4.00,0.80,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-16'),(1338,46,50,3,12.60,4.50,2.25,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-16'),(1339,46,125,3,3.60,4.50,1.35,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-16'),(1340,46,200,3,85.50,4.50,0.90,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-16'),(1341,46,51,3,81.00,2.50,1.25,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-16'),(1342,46,126,3,3.60,2.50,0.75,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-16'),(1343,46,201,3,6.30,2.50,0.50,45,'Cycle 3 KPI score (generated for dashboards)','2025-11-16'),(1344,49,52,3,94.50,4.50,2.25,49,'Cycle 3 KPI score (generated for dashboards)','2025-11-19'),(1345,49,127,3,4.31,4.50,1.35,49,'Cycle 3 KPI score (generated for dashboards)','2025-11-19'),(1346,49,202,3,89.25,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1347,49,53,3,14.70,2.50,1.25,49,'Cycle 3 KPI score (generated for dashboards)','2025-11-19'),(1348,49,128,3,4.20,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1349,49,203,3,99.75,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1350,49,54,3,104.48,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1351,49,129,3,4.20,3.00,0.90,49,'Cycle 3 KPI score (generated for dashboards)','2025-11-19'),(1352,49,204,3,5.25,3.00,0.60,49,'Cycle 3 KPI score (generated for dashboards)','2025-11-19'),(1353,53,55,3,90.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1354,53,130,3,4.10,3.00,0.90,53,'Cycle 3 KPI score (generated for dashboards)','2025-11-23'),(1355,53,205,3,85.00,3.00,0.60,53,'Cycle 3 KPI score (generated for dashboards)','2025-11-23'),(1356,53,56,3,14.00,3.50,1.75,53,'Cycle 3 KPI score (generated for dashboards)','2025-11-23'),(1357,53,131,3,4.00,3.50,1.05,53,'Cycle 3 KPI score (generated for dashboards)','2025-11-23'),(1358,53,206,3,95.00,3.50,0.70,53,'Cycle 3 KPI score (generated for dashboards)','2025-11-23'),(1359,53,57,3,90.00,4.00,2.00,53,'Cycle 3 KPI score (generated for dashboards)','2025-11-23'),(1360,53,132,3,4.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1361,53,207,3,7.00,4.00,0.80,53,'Cycle 3 KPI score (generated for dashboards)','2025-11-23'),(1362,61,58,3,81.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1363,61,133,3,3.60,3.50,1.05,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1364,61,208,3,6.30,3.50,0.70,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1365,61,59,3,85.50,4.00,2.00,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1366,61,134,3,3.60,4.00,1.20,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1367,61,209,3,2.70,4.00,0.80,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1368,61,60,3,6.30,4.50,2.25,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1369,61,135,3,88.20,4.50,1.35,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1370,61,210,3,4.50,4.50,0.90,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-02'),(1371,62,61,3,94.53,3.00,1.50,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1372,62,136,3,3.80,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1373,62,211,3,4.75,3.00,0.60,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1374,62,62,3,85.50,3.50,1.75,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1375,62,137,3,3.80,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1376,62,212,3,6.65,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1377,62,63,3,85.50,4.00,2.00,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1378,62,138,3,3.80,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1379,62,213,3,6.65,4.00,0.80,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-03'),(1380,63,61,3,99.50,3.50,1.75,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1381,63,136,3,4.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1382,63,211,3,5.00,3.50,0.70,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1383,63,62,3,90.00,4.00,2.00,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1384,63,137,3,4.00,4.00,1.20,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1385,63,212,3,7.00,4.00,0.80,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1386,63,63,3,90.00,4.50,2.25,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1387,63,138,3,4.00,4.50,1.35,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1388,63,213,3,7.00,4.50,0.90,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-04'),(1389,64,61,3,104.48,4.00,2.00,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-05'),(1390,64,136,3,4.20,4.00,1.20,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-05'),(1391,64,211,3,5.25,4.00,0.80,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-05'),(1392,64,62,3,94.50,4.50,2.25,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-05'),(1393,64,137,3,4.20,4.50,1.35,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-05'),(1394,64,212,3,7.35,4.50,0.90,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-05'),(1395,64,63,3,94.50,2.50,1.25,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-05'),(1396,64,138,3,4.20,2.50,0.75,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-05'),(1397,64,213,3,7.35,2.50,0.50,61,'Cycle 3 KPI score (generated for dashboards)','2025-10-05'),(1398,67,64,3,4.75,4.50,2.25,67,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1399,67,139,3,93.10,4.50,1.35,67,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1400,67,214,3,4.75,4.50,0.90,67,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1401,67,65,3,4.75,2.50,1.25,67,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1402,67,140,3,93.10,2.50,0.75,67,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1403,67,215,3,4.75,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1404,67,66,3,6.65,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1405,67,141,3,93.10,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1406,67,216,3,4.75,3.00,0.60,67,'Cycle 3 KPI score (generated for dashboards)','2025-10-08'),(1407,70,67,3,84.58,2.50,1.25,70,'Cycle 3 KPI score (generated for dashboards)','2025-10-11'),(1408,70,142,3,3.40,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1409,70,68,3,84.58,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1410,70,143,3,3.40,3.00,0.90,70,'Cycle 3 KPI score (generated for dashboards)','2025-10-11'),(1411,70,69,3,84.58,3.50,1.75,70,'Cycle 3 KPI score (generated for dashboards)','2025-10-11'),(1412,70,144,3,3.40,3.50,1.05,70,'Cycle 3 KPI score (generated for dashboards)','2025-10-11'),(1413,76,70,3,4.50,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1414,76,145,3,3.69,4.50,1.35,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-17'),(1415,76,220,3,1.80,4.50,0.90,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-17'),(1416,76,71,3,2.70,2.50,1.25,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-17'),(1417,76,146,3,3.78,2.50,0.75,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-17'),(1418,76,221,3,6.30,2.50,0.50,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-17'),(1419,76,72,3,6.30,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1420,76,147,3,88.20,3.00,0.90,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-17'),(1421,76,222,3,4.50,3.00,0.60,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-17'),(1422,77,73,3,4.75,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1423,77,148,3,3.80,4.00,1.20,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-18'),(1424,77,223,3,6.65,4.00,0.80,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-18'),(1425,77,74,3,85.50,4.50,2.25,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-18'),(1426,77,149,3,3.80,4.50,1.35,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-18'),(1427,77,224,3,6.65,4.50,0.90,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-18'),(1428,77,75,3,6.65,2.50,1.25,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-18'),(1429,77,150,3,93.10,2.50,0.75,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-18'),(1430,77,225,3,4.75,2.50,0.50,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-18'),(1431,78,73,3,5.00,4.50,2.25,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-19'),(1432,78,148,3,4.00,4.50,1.35,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-19'),(1433,78,223,3,7.00,NULL,NULL,NULL,'Cycle 3 KPI score (generated for dashboards) | Sim: Not Submitted',NULL),(1434,78,74,3,90.00,2.50,1.25,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-19'),(1435,78,149,3,4.00,2.50,0.75,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-19'),(1436,78,224,3,7.00,2.50,0.50,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-19'),(1437,78,75,3,7.00,3.00,1.50,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-19'),(1438,78,150,3,98.00,3.00,0.90,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-19'),(1439,78,225,3,5.00,3.00,0.60,76,'Cycle 3 KPI score (generated for dashboards)','2025-10-19');
/*!40000 ALTER TABLE `employee_kpi_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_training`
--

DROP TABLE IF EXISTS `employee_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_training` (
  `ET_ID` int NOT NULL AUTO_INCREMENT,
  `Employee_ID` int DEFAULT NULL,
  `Program_ID` int DEFAULT NULL,
  `Completion_Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ET_ID`),
  KEY `fk_et_employee` (`Employee_ID`),
  KEY `fk_et_program` (`Program_ID`),
  CONSTRAINT `fk_et_employee` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_et_program` FOREIGN KEY (`Program_ID`) REFERENCES `training_program` (`Program_ID`) ON DELETE SET NULL,
  CONSTRAINT `employee_training_chk_1` CHECK ((`Completion_Status` in (_utf8mb4'Not Started',_utf8mb4'In Progress',_utf8mb4'Completed',_utf8mb4'Failed')))
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_training`
--

LOCK TABLES `employee_training` WRITE;
/*!40000 ALTER TABLE `employee_training` DISABLE KEYS */;
INSERT INTO `employee_training` VALUES (1,1,4,'Completed'),(2,2,4,'Completed'),(3,3,4,'Completed'),(4,4,4,'In Progress'),(5,5,4,'Completed'),(6,6,3,'Completed'),(7,7,4,'In Progress'),(8,8,11,'In Progress'),(9,9,12,'Completed'),(10,10,4,'In Progress'),(11,11,1,'Completed'),(12,12,2,'Completed'),(13,13,5,'Completed'),(14,14,6,'In Progress'),(15,15,12,'Completed'),(16,16,4,'Completed'),(17,17,1,'Completed'),(18,18,4,'In Progress'),(19,19,1,'Completed'),(20,20,4,'Failed'),(21,21,5,'In Progress'),(22,22,4,'Completed'),(23,23,4,'Completed'),(24,24,4,'In Progress'),(25,25,1,'Completed'),(26,26,4,'Completed'),(27,27,11,'Completed'),(28,28,9,'In Progress'),(29,29,7,'Completed'),(30,30,10,'In Progress'),(31,31,8,'Completed'),(32,32,9,'Completed'),(33,33,3,'Completed'),(34,34,6,'Completed'),(35,35,4,'In Progress'),(36,36,5,'Completed'),(37,37,4,'Completed'),(38,38,6,'Completed'),(39,39,7,'Completed'),(40,40,12,'In Progress'),(41,41,6,'Completed'),(42,42,10,'In Progress'),(43,43,2,'Completed'),(44,44,11,'Completed'),(45,45,11,'Completed'),(46,46,5,'In Progress'),(47,47,12,'Completed'),(48,48,10,'Completed'),(49,49,4,'In Progress'),(50,50,4,'Completed'),(51,51,4,'Completed'),(52,52,4,'Completed'),(53,53,8,'Completed'),(54,54,10,'Completed'),(55,55,10,'Completed'),(56,56,4,'In Progress'),(57,57,8,'Completed'),(58,58,4,'Completed'),(59,59,4,'In Progress'),(60,60,7,'Failed'),(61,61,8,'Completed'),(62,62,2,'Completed'),(63,63,8,'In Progress'),(64,64,4,'Completed'),(65,65,4,'Completed'),(66,66,1,'Not Started'),(67,67,3,'Completed'),(68,68,4,'Completed'),(69,69,4,'Completed'),(70,70,9,'In Progress'),(71,71,5,'Completed'),(72,72,4,'Completed'),(73,73,3,'Completed'),(74,74,6,'Completed'),(75,75,7,'Not Started'),(76,76,9,'Completed'),(77,77,12,'In Progress'),(78,78,2,'Completed'),(79,79,4,'In Progress'),(80,80,4,'Completed'),(128,1,2,'Completed'),(129,2,3,'Completed'),(130,3,7,'Completed'),(131,4,9,'In Progress'),(132,5,11,'Completed'),(133,6,1,'In Progress'),(134,7,2,'Completed'),(135,8,3,'Not Started'),(136,9,7,'Completed'),(137,10,9,'Completed'),(138,11,11,'Completed'),(139,12,1,'In Progress'),(140,13,2,'Completed'),(141,14,3,'Completed'),(142,15,7,'Completed'),(143,16,9,'Not Started'),(144,17,11,'Completed'),(145,18,1,'In Progress'),(146,19,2,'Completed'),(147,20,3,'Completed'),(148,21,7,'Completed'),(149,22,9,'Completed'),(150,23,11,'Completed'),(151,24,1,'Not Started'),(152,25,2,'Completed'),(153,26,3,'Completed'),(154,27,7,'Completed'),(155,28,9,'Completed'),(156,29,11,'Completed'),(157,30,1,'In Progress'),(158,31,2,'Completed'),(159,32,3,'Not Started'),(160,33,7,'Completed'),(161,34,9,'Completed'),(162,35,11,'Completed'),(163,36,1,'In Progress'),(164,37,2,'Completed'),(165,38,3,'Completed'),(166,39,7,'Completed'),(167,40,9,'Not Started');
/*!40000 ALTER TABLE `employee_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `fact_appraisal`
--

DROP TABLE IF EXISTS `fact_appraisal`;
/*!50001 DROP VIEW IF EXISTS `fact_appraisal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fact_appraisal` AS SELECT 
 1 AS `Department_ID`,
 1 AS `Department_Name`,
 1 AS `Cycle_ID`,
 1 AS `Cycle_Name`,
 1 AS `Appraisal_ID`,
 1 AS `Appraisal_Date`,
 1 AS `Overall_Score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `fact_kpi`
--

DROP TABLE IF EXISTS `fact_kpi`;
/*!50001 DROP VIEW IF EXISTS `fact_kpi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fact_kpi` AS SELECT 
 1 AS `Department_ID`,
 1 AS `Department_Name`,
 1 AS `Cycle_ID`,
 1 AS `Cycle_Name`,
 1 AS `KPI_ID`,
 1 AS `KPI_Name`,
 1 AS `Employee_Score`,
 1 AS `Weighted_Score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `fact_training`
--

DROP TABLE IF EXISTS `fact_training`;
/*!50001 DROP VIEW IF EXISTS `fact_training`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fact_training` AS SELECT 
 1 AS `Department_ID`,
 1 AS `Department_Name`,
 1 AS `Program_ID`,
 1 AS `Program_Title`,
 1 AS `Employee_ID`,
 1 AS `Completion_Status`,
 1 AS `Has_Certificate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `Faculty_ID` int NOT NULL AUTO_INCREMENT,
  `Faculty_Name` varchar(200) NOT NULL,
  `Location` varchar(200) DEFAULT NULL,
  `Contact_Email` varchar(100) DEFAULT NULL,
  `University_ID` int DEFAULT NULL,
  PRIMARY KEY (`Faculty_ID`),
  KEY `fk_faculty_university` (`University_ID`),
  CONSTRAINT `fk_faculty_university` FOREIGN KEY (`University_ID`) REFERENCES `university` (`University_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES (1,'Faculty of Engineering','Main Campus','eng.faculty@giu.edu.eg',1),(2,'Faculty of Informatics & Computer Science','Main Campus','cs.faculty@giu.edu.eg',1),(3,'Faculty of Business Administration','Main Campus','business.faculty@giu.edu.eg',1),(4,'Faculty of Applied Sciences','Main Campus','science.faculty@giu.edu.eg',1),(5,'Faculty of Architecture & Design','Main Campus','arch.faculty@giu.edu.eg',1),(6,'Faculty of Economics & International Studies','Main Campus','econ.faculty@giu.edu.eg',1),(7,'Faculty of Law & Technology Governance','Main Campus','law.faculty@giu.edu.eg',1),(8,'Faculty of Media & Digital Communication','Main Campus','media.faculty@giu.edu.eg',1);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `Job_ID` int NOT NULL AUTO_INCREMENT,
  `Job_Code` varchar(50) DEFAULT NULL,
  `Job_Title` varchar(200) NOT NULL,
  `Job_Level` varchar(50) DEFAULT NULL,
  `Job_Category` varchar(100) DEFAULT NULL,
  `Job_Grade` varchar(50) DEFAULT NULL,
  `Min_Salary` decimal(12,2) DEFAULT NULL,
  `Max_Salary` decimal(12,2) DEFAULT NULL,
  `Job_Description` varchar(500) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Department_ID` int DEFAULT NULL,
  `Reports_To` int DEFAULT NULL,
  PRIMARY KEY (`Job_ID`),
  UNIQUE KEY `Job_Code` (`Job_Code`),
  KEY `fk_job_department` (`Department_ID`),
  KEY `fk_job_reports_to` (`Reports_To`),
  CONSTRAINT `fk_job_department` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_job_reports_to` FOREIGN KEY (`Reports_To`) REFERENCES `job` (`Job_ID`) ON DELETE SET NULL,
  CONSTRAINT `chk_job_salary` CHECK (((`Min_Salary` is null) or (`Max_Salary` is null) or (`Min_Salary` <= `Max_Salary`))),
  CONSTRAINT `job_chk_1` CHECK ((`Status` in (_utf8mb4'Open',_utf8mb4'Frozen',_utf8mb4'Closed')))
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'J-101','Head of Civil Engineering','Senior','Academic','A1',28000.00,45000.00,'Leads the Civil Engineering department and oversees academic operations.','Open',1,NULL),(2,'J-102','Lecturer - Civil Engineering','Mid','Academic','A2',16000.00,26000.00,'Delivers civil engineering courses and supports departmental activities.','Open',1,1),(3,'J-103','Teaching Assistant - Civil Engineering','Junior','Academic','A3',9000.00,14000.00,'Assists with tutorials, labs, and grading for civil engineering courses.','Open',1,2),(4,'J-201','Head of Mechanical Engineering','Senior','Academic','A1',28000.00,45000.00,'Leads the Mechanical Engineering department and supervises teaching staff.','Open',2,NULL),(5,'J-202','Lecturer - Mechanical Engineering','Mid','Academic','A2',16000.00,26000.00,'Teaches mechanical engineering modules and supervises student projects.','Open',2,4),(6,'J-203','Lab Engineer - Mechanical Engineering','Mid','Technical','B2',14000.00,22000.00,'Maintains labs, supports experiments, and ensures lab safety compliance.','Frozen',2,4),(7,'J-301','Head of Computer Science','Senior','Academic','A1',30000.00,48000.00,'Leads CS department and manages curriculum and academic quality.','Open',3,NULL),(8,'J-302','Lecturer - Computer Science','Mid','Academic','A2',17000.00,28000.00,'Delivers CS courses and contributes to departmental academic tasks.','Open',3,7),(9,'J-303','Teaching Assistant - Computer Science','Junior','Academic','A3',9000.00,14000.00,'Supports labs, tutorials, and course administration in CS.','Open',3,8),(10,'J-304','Systems Lab Engineer','Mid','Technical','B2',14000.00,23000.00,'Supports networking/systems labs and manages lab infrastructure.','Frozen',3,7),(11,'J-401','BI Program Coordinator','Senior','Academic','A1',28000.00,42000.00,'Coordinates BI curriculum and supports departmental planning.','Open',4,NULL),(12,'J-402','Lecturer - Business Informatics','Mid','Academic','A2',16000.00,26000.00,'Teaches BI modules (databases, analytics, IS design) and supervises projects.','Open',4,11),(13,'J-403','BI Data Analyst (Academic Support)','Mid','Technical','B2',15000.00,24000.00,'Supports analytics reporting and dashboards for BI-related academic needs.','Open',4,11),(14,'J-501','Lecturer - Data Science & AI','Mid','Academic','A2',18000.00,30000.00,'Teaches DS/AI modules and supports research activities.','Open',5,15),(15,'J-502','Head of Data Science & AI','Senior','Academic','A1',30000.00,48000.00,'Leads DS&AI department and oversees research and teaching priorities.','Open',5,NULL),(16,'J-503','Research Assistant - DS&AI','Junior','Academic','A3',10000.00,16000.00,'Assists research tasks, data prep, and lab support for DS&AI projects.','Open',5,15),(17,'J-601','Head of Accounting & Finance','Senior','Academic','A1',28000.00,45000.00,'Leads Accounting & Finance department and manages academic activities.','Open',6,NULL),(18,'J-602','Lecturer - Accounting','Mid','Academic','A2',15000.00,25000.00,'Delivers accounting courses and supports student assessments.','Open',6,17),(19,'J-603','Lecturer - Finance','Mid','Academic','A2',15000.00,25000.00,'Delivers finance courses and supports departmental academic tasks.','Frozen',6,17),(20,'J-701','Lecturer - Operations & Supply Chain','Mid','Academic','A2',15000.00,25000.00,'Teaches operations management and supply chain modules.','Open',7,21),(21,'J-702','Operations Department Chair','Senior','Academic','A1',26000.00,42000.00,'Leads operations & SCM academic planning and module coordination.','Open',7,NULL),(22,'J-703','Teaching Assistant - Operations','Junior','Academic','A3',9000.00,14000.00,'Supports tutorials, grading, and course administration for operations.','Open',7,20),(23,'J-801','Lecturer - Mathematics & Statistics','Mid','Academic','A2',15000.00,24000.00,'Delivers math/statistics modules and supports interdisciplinary teaching.','Open',8,NULL),(24,'J-802','Teaching Assistant - Mathematics & Statistics','Junior','Academic','A3',9000.00,14000.00,'Assists in tutorials, labs, and grading for math/statistics modules.','Open',8,23),(25,'J-901','Head of Architecture','Senior','Academic','A1',28000.00,45000.00,'Leads architecture department and oversees design studios.','Open',9,NULL),(26,'J-902','Studio Instructor - Architecture','Mid','Academic','A2',16000.00,26000.00,'Conducts design studio teaching and supervises student projects.','Open',9,25),(27,'J-1001','Head of Interior Design','Senior','Academic','A1',28000.00,45000.00,'Leads interior design department and manages studio-based learning.','Open',10,NULL),(28,'J-1002','Studio Instructor - Interior Design','Mid','Academic','A2',16000.00,26000.00,'Teaches interior design studios and supports design assessment.','Open',10,27),(29,'J-1101','Lecturer - Economics & International Studies','Mid','Academic','A2',15000.00,25000.00,'Teaches economics and international studies modules.','Open',11,NULL),(30,'J-1102','Research Fellow - Economics','Senior','Academic','A1',22000.00,36000.00,'Conducts research and supports publications/projects in economics.','Closed',11,29),(31,'J-1201','Lecturer - Business Law & Tech Governance','Mid','Academic','A2',16000.00,26000.00,'Teaches business law and technology governance modules.','Open',12,NULL),(32,'J-1202','Compliance & Policy Officer (LawTech)','Mid','Administrative','B2',14000.00,24000.00,'Supports policy compliance, documentation, and governance processes.','Open',12,31),(33,'J-1301','HR Manager','Senior','Administrative','B1',25000.00,40000.00,'Leads HR operations: hiring, policies, and employee relations.','Open',13,NULL),(34,'J-1302','HR Officer','Mid','Administrative','B2',14000.00,23000.00,'Handles recruitment coordination, employee records, and HR support.','Open',13,33),(35,'J-1303','Payroll & Benefits Specialist','Mid','Administrative','B2',15000.00,24000.00,'Manages payroll inputs, benefits processing, and HR reporting.','Open',13,33),(36,'J-1401','Finance Manager','Senior','Administrative','B1',26000.00,42000.00,'Leads finance operations, budgeting, and financial controls.','Open',14,NULL),(37,'J-1402','Accountant','Mid','Administrative','B2',14000.00,23000.00,'Prepares financial records, reconciliations, and reporting.','Open',14,36),(38,'J-1403','Accounts Payable Clerk','Junior','Administrative','B3',9000.00,14000.00,'Processes invoices and supports payments and documentation.','Closed',14,36),(39,'J-1501','IT Services Manager','Senior','Technical','B1',26000.00,42000.00,'Leads IT operations, infrastructure, and service delivery.','Open',15,NULL),(40,'J-1502','Systems Administrator','Mid','Technical','B2',15000.00,26000.00,'Maintains servers, accounts, backups, and system availability.','Open',15,39),(41,'J-1503','Helpdesk Technician','Junior','Technical','B3',9000.00,15000.00,'Provides frontline IT support and ticket resolution.','Open',15,39),(42,'J-1601','Admissions Manager','Senior','Administrative','B1',24000.00,38000.00,'Leads admissions operations and student-facing administrative services.','Open',16,NULL),(43,'J-1602','Admissions Officer','Mid','Administrative','B2',13000.00,22000.00,'Processes applications, supports student inquiries, and manages records.','Open',16,42),(44,'J-1603','Student Affairs Coordinator','Mid','Administrative','B2',13000.00,22000.00,'Coordinates student services, requests, and academic admin support.','Open',16,42);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_assignment`
--

DROP TABLE IF EXISTS `job_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_assignment` (
  `Assignment_ID` int NOT NULL AUTO_INCREMENT,
  `Employee_ID` int DEFAULT NULL,
  `Job_ID` int DEFAULT NULL,
  `Contract_ID` int DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Assigned_Salary` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`Assignment_ID`),
  KEY `fk_assignment_employee` (`Employee_ID`),
  KEY `fk_assignment_job` (`Job_ID`),
  KEY `fk_assignment_contract` (`Contract_ID`),
  CONSTRAINT `fk_assignment_contract` FOREIGN KEY (`Contract_ID`) REFERENCES `contract` (`Contract_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_assignment_employee` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_assignment_job` FOREIGN KEY (`Job_ID`) REFERENCES `job` (`Job_ID`) ON DELETE SET NULL,
  CONSTRAINT `chk_assignment_dates` CHECK (((`Start_Date` is null) or (`End_Date` is null) or (`Start_Date` <= `End_Date`)))
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_assignment`
--

LOCK TABLES `job_assignment` WRITE;
/*!40000 ALTER TABLE `job_assignment` DISABLE KEYS */;
INSERT INTO `job_assignment` VALUES (1,1,1,1,'2018-09-15',NULL,'Active',39050.00),(2,2,2,3,'2018-09-29',NULL,'Active',23500.00),(3,3,2,3,'2018-10-13',NULL,'Active',24500.00),(4,4,3,6,'2018-10-27',NULL,'Probation',11750.00),(5,5,3,5,'2018-11-10',NULL,'Active',12250.00),(6,6,4,1,'2018-11-24',NULL,'Active',40750.00),(7,7,5,3,'2018-12-08',NULL,'Active',24500.00),(8,8,5,3,'2018-12-22',NULL,'On Leave',21500.00),(9,9,5,3,'2019-01-05',NULL,'Active',22500.00),(10,10,6,6,'2019-01-19',NULL,'Probation',20000.00),(11,11,7,1,'2019-02-02',NULL,'Active',45300.00),(12,12,8,3,'2019-02-16',NULL,'Active',23050.00),(13,13,8,3,'2019-03-02',NULL,'Active',24150.00),(14,14,8,3,'2019-03-16',NULL,'Active',25250.00),(15,15,8,3,'2019-03-30',NULL,'Active',26350.00),(16,16,9,5,'2019-04-13',NULL,'Active',11750.00),(17,17,9,5,'2019-04-27',NULL,'Active',12250.00),(18,18,10,6,'2019-05-11',NULL,'Probation',20750.00),(19,19,11,1,'2019-05-25',NULL,'Active',39900.00),(20,20,12,3,'2019-06-08',NULL,'Active',21500.00),(21,21,12,3,'2019-06-22',NULL,'Active',22500.00),(22,22,12,3,'2019-07-06',NULL,'Active',23500.00),(23,23,12,3,'2019-07-20',NULL,'Active',24500.00),(24,24,12,6,'2019-08-03',NULL,'Probation',21500.00),(25,25,12,3,'2019-08-17',NULL,'Active',22500.00),(26,26,13,7,'2019-08-31',NULL,'Active',21750.00),(27,27,13,7,'2019-09-14',NULL,'Active',22650.00),(28,28,13,7,'2019-09-28',NULL,'Active',19950.00),(29,29,15,1,'2019-10-12',NULL,'Active',41700.00),(30,30,14,3,'2019-10-26',NULL,'On Leave',27000.00),(31,31,14,3,'2019-11-09',NULL,'Active',28200.00),(32,32,14,3,'2019-11-23',NULL,'Active',24600.00),(33,33,16,5,'2019-12-07',NULL,'Active',13900.00),(34,34,16,5,'2019-12-21',NULL,'Active',14500.00),(35,35,17,1,'2020-01-04',NULL,'Active',42450.00),(36,36,18,3,'2020-01-18',NULL,'Active',20500.00),(37,37,18,3,'2020-02-01',NULL,'Active',21500.00),(38,38,18,3,'2020-02-15',NULL,'Active',22500.00),(39,39,19,3,'2020-02-29',NULL,'Active',23500.00),(40,40,21,6,'2020-03-14',NULL,'Probation',34800.00),(41,41,20,3,'2020-03-28',NULL,'Active',21500.00),(42,42,20,3,'2020-04-11',NULL,'Active',22500.00),(43,43,20,3,'2020-04-25',NULL,'Active',23500.00),(44,44,22,5,'2020-05-09',NULL,'Active',11750.00),(45,45,23,3,'2020-05-23',NULL,'Active',20850.00),(46,46,23,3,'2020-06-06',NULL,'Active',21750.00),(47,47,24,5,'2020-06-20',NULL,'Active',13250.00),(48,48,24,5,'2020-07-04',NULL,'Active',11750.00),(49,49,25,1,'2020-07-18',NULL,'Active',39050.00),(50,50,26,3,'2020-08-01','2024-12-31','Ended',23500.00),(51,51,26,3,'2020-08-15','2024-12-31','Ended',24500.00),(52,52,26,3,'2020-08-29',NULL,'Active',21500.00),(53,53,27,1,'2020-09-12',NULL,'Active',39050.00),(54,54,28,3,'2020-09-26',NULL,'Active',23500.00),(55,55,29,3,'2020-10-10',NULL,'Active',23500.00),(56,56,29,6,'2020-10-24',NULL,'Probation',20500.00),(57,57,31,3,'2020-11-07',NULL,'Active',22500.00),(58,58,31,3,'2020-11-21',NULL,'Active',23500.00),(59,59,32,2,'2020-12-05',NULL,'On Leave',22500.00),(60,60,32,2,'2020-12-19',NULL,'Active',19500.00),(61,61,33,2,'2021-01-02',NULL,'Active',34750.00),(62,62,34,2,'2021-01-16',NULL,'Active',20750.00),(63,63,34,2,'2021-01-30',NULL,'Active',21650.00),(64,64,34,2,'2021-02-13',NULL,'Active',18950.00),(65,65,35,2,'2021-02-27',NULL,'Active',20850.00),(66,66,35,2,'2021-03-13',NULL,'Active',21750.00),(67,67,36,2,'2021-03-27',NULL,'Active',39600.00),(68,68,37,2,'2021-04-10',NULL,'Active',18950.00),(69,69,37,2,'2021-04-24',NULL,'Active',19850.00),(70,70,39,6,'2021-05-08',NULL,'Probation',38000.00),(71,71,40,7,'2021-05-22',NULL,'Active',24350.00),(72,72,40,7,'2021-06-05',NULL,'Active',21050.00),(73,73,41,2,'2021-06-19',NULL,'Active',12900.00),(74,74,41,2,'2021-07-03',NULL,'Active',13500.00),(75,75,41,2,'2021-07-17',NULL,'Active',14100.00),(76,76,42,2,'2021-07-31',NULL,'Active',31700.00),(77,77,43,2,'2021-08-14',NULL,'Active',18850.00),(78,78,43,2,'2021-08-28',NULL,'Active',19750.00),(79,79,44,2,'2021-09-11',NULL,'On Leave',20650.00),(80,80,44,2,'2021-09-25','2024-12-31','Ended',17950.00),(128,1,2,6,'2016-09-15','2018-09-14','Ended',22000.00),(129,2,3,6,'2016-09-29','2018-09-28','Ended',12000.00),(130,3,3,6,'2016-10-13','2018-10-12','Ended',12000.00),(131,4,3,6,'2016-10-27','2018-10-26','Ended',12000.00),(132,5,3,6,'2016-11-10','2018-11-09','Ended',12000.00),(133,6,5,6,'2016-11-24','2018-11-23','Ended',22000.00),(134,7,6,6,'2016-12-08','2018-12-07','Ended',18800.00),(135,8,6,6,'2016-12-22','2018-12-21','Ended',18800.00),(136,9,6,6,'2017-01-05','2019-01-04','Ended',18800.00),(137,10,6,6,'2017-01-19','2019-01-18','Ended',18800.00);
/*!40000 ALTER TABLE `job_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_objective`
--

DROP TABLE IF EXISTS `job_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_objective` (
  `Objective_ID` int NOT NULL AUTO_INCREMENT,
  `Job_ID` int DEFAULT NULL,
  `Objective_Title` varchar(200) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Weight` decimal(5,2) DEFAULT NULL,
  `Salary` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`Objective_ID`),
  KEY `fk_job_objective_job` (`Job_ID`),
  CONSTRAINT `fk_job_objective_job` FOREIGN KEY (`Job_ID`) REFERENCES `job` (`Job_ID`) ON DELETE SET NULL,
  CONSTRAINT `job_objective_chk_1` CHECK ((`Weight` between 0 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_objective`
--

LOCK TABLES `job_objective` WRITE;
/*!40000 ALTER TABLE `job_objective` DISABLE KEYS */;
INSERT INTO `job_objective` VALUES (1,1,'Academic Leadership & Planning','Lead department planning, staffing, and academic quality initiatives.',40.00,NULL),(2,1,'Curriculum & Quality Assurance','Oversee curriculum alignment, assessment standards, and accreditation readiness.',35.00,NULL),(3,1,'Research & Industry Engagement','Support research output and industry partnerships for the department.',25.00,NULL),(4,2,'Teaching Delivery','Deliver lectures/tutorials and maintain high teaching quality.',40.00,NULL),(5,2,'Assessment & Feedback','Design assessments, grade fairly, and provide timely feedback.',35.00,NULL),(6,2,'Student Support & Advising','Support students through office hours and academic advising.',25.00,NULL),(7,4,'Academic Leadership & Planning','Lead department planning, staffing, and academic quality initiatives.',40.00,NULL),(8,4,'Curriculum & Lab Oversight','Oversee curriculum and lab readiness, safety, and resource planning.',35.00,NULL),(9,4,'Research & Industry Engagement','Support research output and industry collaborations.',25.00,NULL),(10,5,'Teaching Delivery','Deliver lectures/tutorials and maintain high teaching quality.',40.00,NULL),(11,5,'Assessment & Feedback','Design assessments, grade fairly, and provide timely feedback.',35.00,NULL),(12,5,'Student Support & Advising','Support students through office hours and academic advising.',25.00,NULL),(13,7,'Academic Leadership & Planning','Lead CS department planning, staffing, and academic quality initiatives.',40.00,NULL),(14,7,'Curriculum & Program Quality','Oversee curriculum design, learning outcomes, and program improvements.',35.00,NULL),(15,7,'Research & Innovation','Drive research outputs, lab development, and innovation activities.',25.00,NULL),(16,8,'Teaching Delivery','Deliver CS lectures/labs and maintain high teaching quality.',40.00,NULL),(17,8,'Assessment & Feedback','Design assessments, grade fairly, and provide timely feedback.',35.00,NULL),(18,8,'Student Mentoring','Mentor students and supervise course projects where applicable.',25.00,NULL),(19,11,'Program Coordination','Coordinate BI modules, scheduling, and academic operations.',40.00,NULL),(20,11,'Quality & Stakeholder Alignment','Align BI program with quality standards and stakeholder needs.',35.00,NULL),(21,11,'Improvement & Reporting','Track KPIs for the program and propose improvements.',25.00,NULL),(22,12,'Teaching Delivery','Teach BI modules (databases, analytics, IS design) with strong learning outcomes.',40.00,NULL),(23,12,'Assessment & Feedback','Create assessments and provide feedback on BI projects and exams.',35.00,NULL),(24,12,'Project Supervision','Supervise student projects and support practical application of BI tools.',25.00,NULL),(25,13,'Reporting & Dashboards','Build and maintain BI dashboards for academic reporting needs.',40.00,NULL),(26,13,'Data Quality & Integration','Ensure accurate datasets and support integration from systems.',35.00,NULL),(27,13,'Insights & Recommendations','Provide insights and recommendations based on analytics outputs.',25.00,NULL),(28,15,'Academic Leadership & Planning','Lead DS&AI planning, staffing, and academic quality initiatives.',40.00,NULL),(29,15,'Research Strategy','Develop research agenda and support publications/projects.',35.00,NULL),(30,15,'Lab & Innovation Development','Grow labs, tools, and innovation partnerships.',25.00,NULL),(31,14,'Teaching Delivery','Teach DS/AI modules with practical labs and applied learning.',40.00,NULL),(32,14,'Assessment & Feedback','Design assessments and provide feedback on DS/AI assignments.',35.00,NULL),(33,14,'Student Mentoring','Mentor students and supervise DS/AI projects.',25.00,NULL),(34,16,'Research Support','Support literature review, data preparation, and experiment execution.',40.00,NULL),(35,16,'Data Preparation','Prepare datasets, documentation, and reproducible pipelines.',35.00,NULL),(36,16,'Reporting & Documentation','Document results and support reporting to stakeholders.',25.00,NULL),(37,17,'Academic Leadership & Planning','Lead accounting/finance department planning and academic quality.',40.00,NULL),(38,17,'Curriculum & Quality Assurance','Oversee course alignment, assessments, and quality processes.',35.00,NULL),(39,17,'Industry Engagement','Support links with industry and professional bodies.',25.00,NULL),(40,18,'Teaching Delivery','Deliver accounting modules with clear learning outcomes.',40.00,NULL),(41,18,'Assessment & Feedback','Design assessments, grade fairly, and provide timely feedback.',35.00,NULL),(42,18,'Student Support','Support students through office hours and academic advising.',25.00,NULL),(43,21,'Academic Leadership & Planning','Lead operations department planning and module coordination.',40.00,NULL),(44,21,'Curriculum & Quality Assurance','Oversee operations curriculum and quality improvements.',35.00,NULL),(45,21,'Industry & Project Engagement','Support industry projects and practical partnerships.',25.00,NULL),(46,20,'Teaching Delivery','Deliver operations/SCM modules and practical coursework.',40.00,NULL),(47,20,'Assessment & Feedback','Create assessments and provide feedback on projects.',35.00,NULL),(48,20,'Student Support','Support students through advising and project supervision.',25.00,NULL),(49,23,'Teaching Delivery','Deliver math/stat modules supporting multiple programs.',40.00,NULL),(50,23,'Assessment & Feedback','Design assessments and provide clear feedback.',35.00,NULL),(51,23,'Academic Support','Support other departments with applied statistics needs.',25.00,NULL),(52,25,'Academic Leadership & Planning','Lead architecture department planning and studio oversight.',40.00,NULL),(53,25,'Studio Quality & Assessment','Ensure studio quality, assessment consistency, and project reviews.',35.00,NULL),(54,25,'Industry & Community Engagement','Maintain engagement with industry, exhibitions, and community projects.',25.00,NULL),(55,27,'Academic Leadership & Planning','Lead interior design department planning and studio oversight.',40.00,NULL),(56,27,'Studio Quality & Assessment','Maintain studio quality and consistent assessment practices.',35.00,NULL),(57,27,'Industry Engagement','Develop partnerships and opportunities for student exposure.',25.00,NULL),(58,33,'HR Operations Management','Manage recruitment, onboarding, policies, and employee relations.',40.00,NULL),(59,33,'Compliance & Records','Ensure HR compliance and accurate employee records management.',35.00,NULL),(60,33,'Workforce Planning & Reporting','Provide workforce analytics and planning support to leadership.',25.00,NULL),(61,34,'Recruitment Coordination','Coordinate vacancies, scheduling, and recruitment workflow.',40.00,NULL),(62,34,'Employee Records','Maintain employee files and update HR system data accurately.',35.00,NULL),(63,34,'HR Support Services','Support employees with HR requests and guidance.',25.00,NULL),(64,36,'Budgeting & Planning','Lead budgeting processes and financial planning.',40.00,NULL),(65,36,'Financial Controls','Ensure controls, approvals, and compliance with procedures.',35.00,NULL),(66,36,'Reporting & Analysis','Produce financial reports and support management decisions.',25.00,NULL),(67,39,'IT Service Delivery','Manage IT service operations, support, and service levels.',40.00,NULL),(68,39,'Infrastructure Reliability','Ensure uptime, backups, and secure infrastructure operations.',35.00,NULL),(69,39,'Security & Governance','Support security policies, access control, and governance needs.',25.00,NULL),(70,42,'Admissions Operations','Lead admissions cycle processes and team coordination.',40.00,NULL),(71,42,'Student Service Quality','Maintain service standards and process improvements.',35.00,NULL),(72,42,'Reporting & Coordination','Report admissions KPIs and coordinate with academic departments.',25.00,NULL),(73,43,'Application Processing','Process applications, verify documents, and update records.',40.00,NULL),(74,43,'Applicant Communication','Handle applicant inquiries and communication professionally.',35.00,NULL),(75,43,'Data Accuracy & Reporting','Maintain accurate data and support admissions reporting.',25.00,NULL);
/*!40000 ALTER TABLE `job_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objective_kpi`
--

DROP TABLE IF EXISTS `objective_kpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objective_kpi` (
  `KPI_ID` int NOT NULL AUTO_INCREMENT,
  `Objective_ID` int DEFAULT NULL,
  `KPI_Name` varchar(200) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Measurement_Unit` varchar(50) DEFAULT NULL,
  `Target_Value` decimal(12,2) DEFAULT NULL,
  `Weight` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`KPI_ID`),
  KEY `fk_kpi_objective` (`Objective_ID`),
  CONSTRAINT `fk_kpi_objective` FOREIGN KEY (`Objective_ID`) REFERENCES `job_objective` (`Objective_ID`) ON DELETE SET NULL,
  CONSTRAINT `objective_kpi_chk_1` CHECK ((`Weight` between 0 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objective_kpi`
--

LOCK TABLES `objective_kpi` WRITE;
/*!40000 ALTER TABLE `objective_kpi` DISABLE KEYS */;
INSERT INTO `objective_kpi` VALUES (1,1,'Department Plan Completion','Primary metric aligned to the objective.','%',90.00,50.00),(2,2,'Curriculum Review Completion','Primary metric aligned to the objective.','%',100.00,50.00),(3,3,'Research Outputs','Primary metric aligned to the objective.','Count',2.00,50.00),(4,4,'Lecture Delivery Completion Rate','Primary metric aligned to the objective.','%',95.00,50.00),(5,5,'Grading Turnaround Time','Primary metric aligned to the objective.','%',14.00,50.00),(6,6,'Student Support Response Time','Primary metric aligned to the objective.','%',3.00,50.00),(7,7,'Department Plan Completion','Primary metric aligned to the objective.','%',90.00,50.00),(8,8,'Curriculum Review Completion','Primary metric aligned to the objective.','%',100.00,50.00),(9,9,'Research Outputs','Primary metric aligned to the objective.','Count',2.00,50.00),(10,10,'Lecture Delivery Completion Rate','Primary metric aligned to the objective.','%',95.00,50.00),(11,11,'Grading Turnaround Time','Primary metric aligned to the objective.','%',14.00,50.00),(12,12,'Student Support Response Time','Primary metric aligned to the objective.','%',3.00,50.00),(13,13,'Department Plan Completion','Primary metric aligned to the objective.','%',90.00,50.00),(14,14,'Curriculum Review Completion','Primary metric aligned to the objective.','%',100.00,50.00),(15,15,'Research Outputs','Primary metric aligned to the objective.','Count',2.00,50.00),(16,16,'Lecture Delivery Completion Rate','Primary metric aligned to the objective.','%',95.00,50.00),(17,17,'Grading Turnaround Time','Primary metric aligned to the objective.','%',14.00,50.00),(18,18,'Student Support Response Time','Primary metric aligned to the objective.','%',3.00,50.00),(19,19,'Objective Completion Rate','Primary metric aligned to the objective.','%',90.00,50.00),(20,20,'System Uptime','Primary metric aligned to the objective.','%',99.50,50.00),(21,21,'Dashboard Delivery Timeliness','Primary metric aligned to the objective.','%',7.00,50.00),(22,22,'Lecture Delivery Completion Rate','Primary metric aligned to the objective.','%',95.00,50.00),(23,23,'Grading Turnaround Time','Primary metric aligned to the objective.','%',14.00,50.00),(24,24,'Objective Completion Rate','Primary metric aligned to the objective.','%',90.00,50.00),(25,25,'Dashboard Delivery Timeliness','Primary metric aligned to the objective.','%',7.00,50.00),(26,26,'Data Quality Error Rate','Primary metric aligned to the objective.','%',2.00,50.00),(27,27,'Objective Completion Rate','Primary metric aligned to the objective.','%',90.00,50.00),(28,28,'Department Plan Completion','Primary metric aligned to the objective.','%',90.00,50.00),(29,29,'Research Outputs','Primary metric aligned to the objective.','Count',2.00,50.00),(30,30,'Objective Completion Rate','Primary metric aligned to the objective.','%',90.00,50.00),(31,31,'Lecture Delivery Completion Rate','Primary metric aligned to the objective.','%',95.00,50.00),(32,32,'Grading Turnaround Time','Primary metric aligned to the objective.','%',14.00,50.00),(33,33,'Student Support Response Time','Primary metric aligned to the objective.','%',3.00,50.00),(34,34,'Research Outputs','Primary metric aligned to the objective.','Count',2.00,50.00),(35,35,'Data Quality Error Rate','Primary metric aligned to the objective.','%',2.00,50.00),(36,36,'Dashboard Delivery Timeliness','Primary metric aligned to the objective.','%',7.00,50.00),(37,37,'Department Plan Completion','Primary metric aligned to the objective.','%',90.00,50.00),(38,38,'Curriculum Review Completion','Primary metric aligned to the objective.','%',100.00,50.00),(39,39,'Objective Completion Rate','Primary metric aligned to the objective.','%',90.00,50.00),(40,40,'Lecture Delivery Completion Rate','Primary metric aligned to the objective.','%',95.00,50.00),(41,41,'Grading Turnaround Time','Primary metric aligned to the objective.','%',14.00,50.00),(42,42,'Student Support Response Time','Primary metric aligned to the objective.','%',3.00,50.00),(43,43,'Department Plan Completion','Primary metric aligned to the objective.','%',90.00,50.00),(44,44,'Curriculum Review Completion','Primary metric aligned to the objective.','%',100.00,50.00),(45,45,'Objective Completion Rate','Primary metric aligned to the objective.','%',90.00,50.00),(46,46,'Lecture Delivery Completion Rate','Primary metric aligned to the objective.','%',95.00,50.00),(47,47,'Grading Turnaround Time','Primary metric aligned to the objective.','%',14.00,50.00),(48,48,'Student Support Response Time','Primary metric aligned to the objective.','%',3.00,50.00),(49,49,'Lecture Delivery Completion Rate','Primary metric aligned to the objective.','%',95.00,50.00),(50,50,'Grading Turnaround Time','Primary metric aligned to the objective.','%',14.00,50.00),(51,51,'Objective Completion Rate','Primary metric aligned to the objective.','%',90.00,50.00),(52,52,'Department Plan Completion','Primary metric aligned to the objective.','%',90.00,50.00),(53,53,'Grading Turnaround Time','Primary metric aligned to the objective.','%',14.00,50.00),(54,54,'System Uptime','Primary metric aligned to the objective.','%',99.50,50.00),(55,55,'Department Plan Completion','Primary metric aligned to the objective.','%',90.00,50.00),(56,56,'Grading Turnaround Time','Primary metric aligned to the objective.','%',14.00,50.00),(57,57,'Objective Completion Rate','Primary metric aligned to the objective.','%',90.00,50.00),(58,58,'Objective Completion Rate','Primary metric aligned to the objective.','%',90.00,50.00),(59,59,'Policy Compliance Rate','Primary metric aligned to the objective.','%',95.00,50.00),(60,60,'Dashboard Delivery Timeliness','Primary metric aligned to the objective.','%',7.00,50.00),(61,61,'System Uptime','Primary metric aligned to the objective.','%',99.50,50.00),(62,62,'Objective Completion Rate','Primary metric aligned to the objective.','%',90.00,50.00),(63,63,'Objective Completion Rate','Primary metric aligned to the objective.','%',90.00,50.00),(64,64,'Budget Variance','Primary metric aligned to the objective.','%',5.00,50.00),(65,65,'Budget Variance','Primary metric aligned to the objective.','%',5.00,50.00),(66,66,'Dashboard Delivery Timeliness','Primary metric aligned to the objective.','%',7.00,50.00),(67,67,'System Uptime','Primary metric aligned to the objective.','%',99.50,50.00),(68,68,'System Uptime','Primary metric aligned to the objective.','%',99.50,50.00),(69,69,'System Uptime','Primary metric aligned to the objective.','%',99.50,50.00),(70,70,'Application Processing Time','Primary metric aligned to the objective.','%',5.00,50.00),(71,71,'Student Support Response Time','Primary metric aligned to the objective.','%',3.00,50.00),(72,72,'Dashboard Delivery Timeliness','Primary metric aligned to the objective.','%',7.00,50.00),(73,73,'Application Processing Time','Primary metric aligned to the objective.','%',5.00,50.00),(74,74,'Objective Completion Rate','Primary metric aligned to the objective.','%',90.00,50.00),(75,75,'Dashboard Delivery Timeliness','Primary metric aligned to the objective.','%',7.00,50.00),(76,1,'Stakeholder Satisfaction Index','Quality metric supporting the objective.','Score',4.10,30.00),(77,2,'Learning Outcomes Alignment Rate','Quality metric supporting the objective.','Score',90.00,30.00),(78,3,'Research Quality Review Score','Quality metric supporting the objective.','Score',4.00,30.00),(79,4,'Student Satisfaction Score','Quality metric supporting the objective.','Score',4.30,30.00),(80,5,'Assessment Quality Audit Score','Quality metric supporting the objective.','Score',4.00,30.00),(81,6,'Student Support Satisfaction Score','Quality metric supporting the objective.','Score',4.20,30.00),(82,7,'Stakeholder Satisfaction Index','Quality metric supporting the objective.','Score',4.10,30.00),(83,8,'Learning Outcomes Alignment Rate','Quality metric supporting the objective.','Score',90.00,30.00),(84,9,'Research Quality Review Score','Quality metric supporting the objective.','Score',4.00,30.00),(85,10,'Student Satisfaction Score','Quality metric supporting the objective.','Score',4.30,30.00),(86,11,'Assessment Quality Audit Score','Quality metric supporting the objective.','Score',4.00,30.00),(87,12,'Student Support Satisfaction Score','Quality metric supporting the objective.','Score',4.20,30.00),(88,13,'Stakeholder Satisfaction Index','Quality metric supporting the objective.','Score',4.10,30.00),(89,14,'Learning Outcomes Alignment Rate','Quality metric supporting the objective.','Score',90.00,30.00),(90,15,'Research Quality Review Score','Quality metric supporting the objective.','Score',4.00,30.00),(91,16,'Student Satisfaction Score','Quality metric supporting the objective.','Score',4.30,30.00),(92,17,'Assessment Quality Audit Score','Quality metric supporting the objective.','Score',4.00,30.00),(93,18,'Student Support Satisfaction Score','Quality metric supporting the objective.','Score',4.20,30.00),(94,19,'Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(95,20,'Service Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(96,21,'Data Accuracy Rate','Quality metric supporting the objective.','Score',98.00,30.00),(97,22,'Student Satisfaction Score','Quality metric supporting the objective.','Score',4.30,30.00),(98,23,'Assessment Quality Audit Score','Quality metric supporting the objective.','Score',4.00,30.00),(99,24,'Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(100,25,'Data Accuracy Rate','Quality metric supporting the objective.','Score',98.00,30.00),(101,26,'Data Accuracy Rate','Quality metric supporting the objective.','Score',98.00,30.00),(102,27,'Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(103,28,'Stakeholder Satisfaction Index','Quality metric supporting the objective.','Score',4.10,30.00),(104,29,'Research Quality Review Score','Quality metric supporting the objective.','Score',4.00,30.00),(105,30,'Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(106,31,'Student Satisfaction Score','Quality metric supporting the objective.','Score',4.30,30.00),(107,32,'Assessment Quality Audit Score','Quality metric supporting the objective.','Score',4.00,30.00),(108,33,'Student Support Satisfaction Score','Quality metric supporting the objective.','Score',4.20,30.00),(109,34,'Research Quality Review Score','Quality metric supporting the objective.','Score',4.00,30.00),(110,35,'Data Accuracy Rate','Quality metric supporting the objective.','Score',98.00,30.00),(111,36,'Data Accuracy Rate','Quality metric supporting the objective.','Score',98.00,30.00),(112,37,'Stakeholder Satisfaction Index','Quality metric supporting the objective.','Score',4.10,30.00),(113,38,'Learning Outcomes Alignment Rate','Quality metric supporting the objective.','Score',90.00,30.00),(114,39,'Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(115,40,'Student Satisfaction Score','Quality metric supporting the objective.','Score',4.30,30.00),(116,41,'Assessment Quality Audit Score','Quality metric supporting the objective.','Score',4.00,30.00),(117,42,'Student Support Satisfaction Score','Quality metric supporting the objective.','Score',4.20,30.00),(118,43,'Stakeholder Satisfaction Index','Quality metric supporting the objective.','Score',4.10,30.00),(119,44,'Learning Outcomes Alignment Rate','Quality metric supporting the objective.','Score',90.00,30.00),(120,45,'Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(121,46,'Student Satisfaction Score','Quality metric supporting the objective.','Score',4.30,30.00),(122,47,'Assessment Quality Audit Score','Quality metric supporting the objective.','Score',4.00,30.00),(123,48,'Student Support Satisfaction Score','Quality metric supporting the objective.','Score',4.20,30.00),(124,49,'Student Satisfaction Score','Quality metric supporting the objective.','Score',4.30,30.00),(125,50,'Assessment Quality Audit Score','Quality metric supporting the objective.','Score',4.00,30.00),(126,51,'Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(127,52,'Stakeholder Satisfaction Index','Quality metric supporting the objective.','Score',4.10,30.00),(128,53,'Assessment Quality Audit Score','Quality metric supporting the objective.','Score',4.00,30.00),(129,54,'Service Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(130,55,'Stakeholder Satisfaction Index','Quality metric supporting the objective.','Score',4.10,30.00),(131,56,'Assessment Quality Audit Score','Quality metric supporting the objective.','Score',4.00,30.00),(132,57,'Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(133,58,'Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(134,59,'Compliance Audit Score','Quality metric supporting the objective.','Score',4.00,30.00),(135,60,'Data Accuracy Rate','Quality metric supporting the objective.','Score',98.00,30.00),(136,61,'Service Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(137,62,'Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(138,63,'Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(139,64,'Financial Reporting Accuracy Rate','Quality metric supporting the objective.','Score',98.00,30.00),(140,65,'Financial Reporting Accuracy Rate','Quality metric supporting the objective.','Score',98.00,30.00),(141,66,'Data Accuracy Rate','Quality metric supporting the objective.','Score',98.00,30.00),(142,67,'Service Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(143,68,'Service Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(144,69,'Service Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(145,70,'Applicant Satisfaction Score','Quality metric supporting the objective.','Score',4.10,30.00),(146,71,'Student Support Satisfaction Score','Quality metric supporting the objective.','Score',4.20,30.00),(147,72,'Data Accuracy Rate','Quality metric supporting the objective.','Score',98.00,30.00),(148,73,'Applicant Satisfaction Score','Quality metric supporting the objective.','Score',4.00,30.00),(149,74,'Quality Score','Quality metric supporting the objective.','Score',4.00,30.00),(150,75,'Data Accuracy Rate','Quality metric supporting the objective.','%',98.00,30.00),(151,1,'Action Items Closure Rate','Timeliness or improvement metric supporting the objective.','Days',85.00,20.00),(152,2,'Quality Findings Resolved Rate','Timeliness or improvement metric supporting the objective.','Days',80.00,20.00),(153,3,'Industry Engagement Activities','Timeliness or improvement metric supporting the objective.','Count',3.00,20.00),(154,4,'Assessment Feedback Timeliness','Timeliness or improvement metric supporting the objective.','Days',10.00,20.00),(155,5,'Rubric Compliance Rate','Timeliness or improvement metric supporting the objective.','Days',95.00,20.00),(156,6,'Issue Resolution Time','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(157,7,'Action Items Closure Rate','Timeliness or improvement metric supporting the objective.','Days',85.00,20.00),(158,8,'Quality Findings Resolved Rate','Timeliness or improvement metric supporting the objective.','Days',80.00,20.00),(159,9,'Industry Engagement Activities','Timeliness or improvement metric supporting the objective.','Count',3.00,20.00),(160,10,'Assessment Feedback Timeliness','Timeliness or improvement metric supporting the objective.','Days',10.00,20.00),(161,11,'Rubric Compliance Rate','Timeliness or improvement metric supporting the objective.','Days',95.00,20.00),(162,12,'Issue Resolution Time','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(163,13,'Action Items Closure Rate','Timeliness or improvement metric supporting the objective.','Days',85.00,20.00),(164,14,'Quality Findings Resolved Rate','Timeliness or improvement metric supporting the objective.','Days',80.00,20.00),(165,15,'Industry Engagement Activities','Timeliness or improvement metric supporting the objective.','Count',3.00,20.00),(166,16,'Assessment Feedback Timeliness','Timeliness or improvement metric supporting the objective.','Days',10.00,20.00),(167,17,'Rubric Compliance Rate','Timeliness or improvement metric supporting the objective.','Days',95.00,20.00),(168,18,'Issue Resolution Time','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(169,19,'Timeliness / Improvement Metric','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(170,20,'Ticket Resolution Time','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(171,21,'Report Submission Timeliness','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(172,22,'Assessment Feedback Timeliness','Timeliness or improvement metric supporting the objective.','Days',10.00,20.00),(173,23,'Rubric Compliance Rate','Timeliness or improvement metric supporting the objective.','Days',95.00,20.00),(174,24,'Timeliness / Improvement Metric','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(175,25,'Report Submission Timeliness','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(176,26,'Data Issue Resolution Time','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(177,27,'Timeliness / Improvement Metric','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(178,28,'Action Items Closure Rate','Timeliness or improvement metric supporting the objective.','Days',85.00,20.00),(179,29,'Industry Engagement Activities','Timeliness or improvement metric supporting the objective.','Count',3.00,20.00),(180,30,'Timeliness / Improvement Metric','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(181,31,'Assessment Feedback Timeliness','Timeliness or improvement metric supporting the objective.','Days',10.00,20.00),(182,32,'Rubric Compliance Rate','Timeliness or improvement metric supporting the objective.','Days',95.00,20.00),(183,33,'Issue Resolution Time','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(184,34,'Industry Engagement Activities','Timeliness or improvement metric supporting the objective.','Count',3.00,20.00),(185,35,'Data Issue Resolution Time','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(186,36,'Report Submission Timeliness','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(187,37,'Action Items Closure Rate','Timeliness or improvement metric supporting the objective.','Days',85.00,20.00),(188,38,'Quality Findings Resolved Rate','Timeliness or improvement metric supporting the objective.','Days',80.00,20.00),(189,39,'Timeliness / Improvement Metric','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(190,40,'Assessment Feedback Timeliness','Timeliness or improvement metric supporting the objective.','Days',10.00,20.00),(191,41,'Rubric Compliance Rate','Timeliness or improvement metric supporting the objective.','Days',95.00,20.00),(192,42,'Issue Resolution Time','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(193,43,'Action Items Closure Rate','Timeliness or improvement metric supporting the objective.','Days',85.00,20.00),(194,44,'Quality Findings Resolved Rate','Timeliness or improvement metric supporting the objective.','Days',80.00,20.00),(195,45,'Timeliness / Improvement Metric','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(196,46,'Assessment Feedback Timeliness','Timeliness or improvement metric supporting the objective.','Days',10.00,20.00),(197,47,'Rubric Compliance Rate','Timeliness or improvement metric supporting the objective.','Days',95.00,20.00),(198,48,'Issue Resolution Time','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(199,49,'Assessment Feedback Timeliness','Timeliness or improvement metric supporting the objective.','Days',10.00,20.00),(200,50,'Rubric Compliance Rate','Timeliness or improvement metric supporting the objective.','Days',95.00,20.00),(201,51,'Timeliness / Improvement Metric','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(202,52,'Action Items Closure Rate','Timeliness or improvement metric supporting the objective.','Days',85.00,20.00),(203,53,'Rubric Compliance Rate','Timeliness or improvement metric supporting the objective.','Days',95.00,20.00),(204,54,'Ticket Resolution Time','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(205,55,'Action Items Closure Rate','Timeliness or improvement metric supporting the objective.','Days',85.00,20.00),(206,56,'Rubric Compliance Rate','Timeliness or improvement metric supporting the objective.','Days',95.00,20.00),(207,57,'Timeliness / Improvement Metric','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(208,58,'Timeliness / Improvement Metric','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(209,59,'Policy Exception Rate','Timeliness or improvement metric supporting the objective.','%',3.00,20.00),(210,60,'Report Submission Timeliness','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(211,61,'Ticket Resolution Time','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(212,62,'Timeliness / Improvement Metric','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(213,63,'Timeliness / Improvement Metric','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(214,64,'Monthly Close Timeliness','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(215,65,'Monthly Close Timeliness','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(216,66,'Report Submission Timeliness','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(217,67,'Ticket Resolution Time','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(218,68,'Ticket Resolution Time','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(219,69,'Ticket Resolution Time','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(220,70,'Inquiry Response Time','Timeliness or improvement metric supporting the objective.','Days',2.00,20.00),(221,71,'Issue Resolution Time','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(222,72,'Report Submission Timeliness','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00),(223,73,'Inquiry Response Time','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(224,74,'Timeliness / Improvement Metric','Timeliness or improvement metric supporting the objective.','Days',7.00,20.00),(225,75,'Report Submission Timeliness','Timeliness or improvement metric supporting the objective.','Days',5.00,20.00);
/*!40000 ALTER TABLE `objective_kpi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_cycle`
--

DROP TABLE IF EXISTS `performance_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_cycle` (
  `Cycle_ID` int NOT NULL AUTO_INCREMENT,
  `Cycle_Name` varchar(200) DEFAULT NULL,
  `Cycle_Type` varchar(50) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Submission_Deadline` date DEFAULT NULL,
  PRIMARY KEY (`Cycle_ID`),
  CONSTRAINT `chk_cycle_dates` CHECK (((`Start_Date` is null) or (`End_Date` is null) or (`Start_Date` <= `End_Date`)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_cycle`
--

LOCK TABLES `performance_cycle` WRITE;
/*!40000 ALTER TABLE `performance_cycle` DISABLE KEYS */;
INSERT INTO `performance_cycle` VALUES (1,'2024 Annual Review','Annual','2024-01-01','2024-12-31','2025-01-15'),(2,'2025 Mid-Year Review','Mid-Year','2025-01-01','2025-06-30','2025-07-15'),(3,'2025 Annual Review','Annual','2025-07-01','2025-12-31','2026-01-15');
/*!40000 ALTER TABLE `performance_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professional_certificate`
--

DROP TABLE IF EXISTS `professional_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professional_certificate` (
  `Certificate_ID` int NOT NULL AUTO_INCREMENT,
  `Employee_ID` int DEFAULT NULL,
  `Certification_Name` varchar(200) DEFAULT NULL,
  `Issuing_Organization` varchar(200) DEFAULT NULL,
  `Issue_Date` date DEFAULT NULL,
  `Expiry_Date` date DEFAULT NULL,
  `Credential_ID` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Certificate_ID`),
  KEY `fk_prof_cert_employee` (`Employee_ID`),
  CONSTRAINT `fk_prof_cert_employee` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE SET NULL,
  CONSTRAINT `chk_cert_dates` CHECK (((`Issue_Date` is null) or (`Expiry_Date` is null) or (`Issue_Date` <= `Expiry_Date`)))
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional_certificate`
--

LOCK TABLES `professional_certificate` WRITE;
/*!40000 ALTER TABLE `professional_certificate` DISABLE KEYS */;
INSERT INTO `professional_certificate` VALUES (1,2,'AWS Certified Cloud Practitioner','Amazon Web Services (AWS)','2019-02-22','2022-02-22','CRED-0002-02'),(2,4,'Project Management Professional (PMP)','Project Management Institute (PMI)','2019-04-01','2022-04-01','CRED-0004-04'),(3,6,'ACCA DipIFR (Diploma in IFRS)','ACCA','2019-05-09',NULL,'CRED-0006-06'),(4,8,'PL-300: Microsoft Power BI Data Analyst','Microsoft','2019-06-16','2022-06-16','CRED-0008-08'),(5,10,'AWS Certified Cloud Practitioner','Amazon Web Services (AWS)','2019-07-24','2022-07-24','CRED-0010-10'),(6,12,'Project Management Professional (PMP)','Project Management Institute (PMI)','2019-08-31','2022-08-31','CRED-0012-12'),(7,14,'ACCA DipIFR (Diploma in IFRS)','ACCA','2019-10-08',NULL,'CRED-0014-14'),(8,16,'PL-300: Microsoft Power BI Data Analyst','Microsoft','2019-11-15','2022-11-15','CRED-0016-16'),(9,18,'AWS Certified Cloud Practitioner','Amazon Web Services (AWS)','2019-12-23','2022-12-23','CRED-0018-18'),(10,20,'Project Management Professional (PMP)','Project Management Institute (PMI)','2020-01-30','2023-01-30','CRED-0020-20'),(11,22,'ACCA DipIFR (Diploma in IFRS)','ACCA','2020-03-08',NULL,'CRED-0022-22'),(12,24,'PL-300: Microsoft Power BI Data Analyst','Microsoft','2020-04-15','2023-04-15','CRED-0024-24'),(13,26,'AWS Certified Cloud Practitioner','Amazon Web Services (AWS)','2020-05-23','2023-05-23','CRED-0026-26'),(14,28,'Project Management Professional (PMP)','Project Management Institute (PMI)','2020-06-30','2023-06-30','CRED-0028-28'),(15,30,'ACCA DipIFR (Diploma in IFRS)','ACCA','2020-08-07',NULL,'CRED-0030-30'),(16,32,'PL-300: Microsoft Power BI Data Analyst','Microsoft','2020-09-14','2023-09-14','CRED-0032-32'),(17,34,'AWS Certified Cloud Practitioner','Amazon Web Services (AWS)','2020-10-22','2023-10-22','CRED-0034-34'),(18,36,'Project Management Professional (PMP)','Project Management Institute (PMI)','2020-11-29','2023-11-29','CRED-0036-36'),(19,38,'ACCA DipIFR (Diploma in IFRS)','ACCA','2021-01-06',NULL,'CRED-0038-38'),(20,40,'PL-300: Microsoft Power BI Data Analyst','Microsoft','2021-02-13','2024-02-13','CRED-0040-40'),(21,42,'AWS Certified Cloud Practitioner','Amazon Web Services (AWS)','2021-03-23','2024-03-23','CRED-0042-42'),(22,44,'Project Management Professional (PMP)','Project Management Institute (PMI)','2021-04-30','2024-04-30','CRED-0044-44'),(23,46,'ACCA DipIFR (Diploma in IFRS)','ACCA','2021-06-07',NULL,'CRED-0046-46'),(24,48,'PL-300: Microsoft Power BI Data Analyst','Microsoft','2021-07-15','2024-07-15','CRED-0048-48'),(25,50,'AWS Certified Cloud Practitioner','Amazon Web Services (AWS)','2021-08-22','2024-08-22','CRED-0050-50'),(26,52,'Project Management Professional (PMP)','Project Management Institute (PMI)','2021-09-29','2024-09-29','CRED-0052-52'),(27,54,'ACCA DipIFR (Diploma in IFRS)','ACCA','2021-11-06',NULL,'CRED-0054-54'),(28,56,'PL-300: Microsoft Power BI Data Analyst','Microsoft','2021-12-14','2024-12-14','CRED-0056-56'),(29,58,'AWS Certified Cloud Practitioner','Amazon Web Services (AWS)','2022-01-21','2025-01-21','CRED-0058-58'),(30,60,'Project Management Professional (PMP)','Project Management Institute (PMI)','2022-02-28','2025-02-28','CRED-0060-60'),(31,62,'ACCA DipIFR (Diploma in IFRS)','ACCA','2022-04-07',NULL,'CRED-0062-62'),(32,64,'PL-300: Microsoft Power BI Data Analyst','Microsoft','2022-05-15','2025-05-15','CRED-0064-64'),(33,66,'AWS Certified Cloud Practitioner','Amazon Web Services (AWS)','2022-06-22','2025-06-22','CRED-0066-66'),(34,68,'Project Management Professional (PMP)','Project Management Institute (PMI)','2022-07-30','2025-07-30','CRED-0068-68'),(35,70,'ACCA DipIFR (Diploma in IFRS)','ACCA','2022-09-06',NULL,'CRED-0070-70'),(36,72,'PL-300: Microsoft Power BI Data Analyst','Microsoft','2022-10-14','2025-10-14','CRED-0072-72'),(37,74,'AWS Certified Cloud Practitioner','Amazon Web Services (AWS)','2022-11-21','2025-11-21','CRED-0074-74'),(38,76,'Project Management Professional (PMP)','Project Management Institute (PMI)','2022-12-29','2025-12-29','CRED-0076-76'),(39,78,'ACCA DipIFR (Diploma in IFRS)','ACCA','2023-02-05',NULL,'CRED-0078-78'),(40,80,'PL-300: Microsoft Power BI Data Analyst','Microsoft','2023-03-15','2026-03-15','CRED-0080-80');
/*!40000 ALTER TABLE `professional_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_insurance`
--

DROP TABLE IF EXISTS `social_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_insurance` (
  `Insurance_ID` int NOT NULL AUTO_INCREMENT,
  `Employee_ID` int DEFAULT NULL,
  `Insurance_Number` varchar(100) NOT NULL,
  `Coverage_Details` varchar(500) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Insurance_ID`),
  KEY `fk_social_insurance_employee` (`Employee_ID`),
  CONSTRAINT `fk_social_insurance_employee` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`) ON DELETE SET NULL,
  CONSTRAINT `chk_social_insurance_dates` CHECK (((`Start_Date` is null) or (`End_Date` is null) or (`Start_Date` <= `End_Date`)))
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_insurance`
--

LOCK TABLES `social_insurance` WRITE;
/*!40000 ALTER TABLE `social_insurance` DISABLE KEYS */;
INSERT INTO `social_insurance` VALUES (1,1,'GIU-SI-0001','Standard GIU social insurance coverage','2017-01-26',NULL,'Active'),(2,2,'GIU-SI-0002','Standard GIU social insurance coverage','2017-02-20',NULL,'Active'),(3,3,'GIU-SI-0003','Standard GIU social insurance coverage','2017-03-17',NULL,'Active'),(4,4,'GIU-SI-0004','Standard GIU social insurance coverage','2017-04-11',NULL,'Active'),(5,5,'GIU-SI-0005','Standard GIU social insurance coverage','2017-05-06',NULL,'Active'),(6,6,'GIU-SI-0006','Standard GIU social insurance coverage','2017-05-31',NULL,'Active'),(7,7,'GIU-SI-0007','Standard GIU social insurance coverage','2017-06-25',NULL,'Active'),(8,8,'GIU-SI-0008','Standard GIU social insurance coverage','2017-07-20',NULL,'Active'),(9,9,'GIU-SI-0009','Standard GIU social insurance coverage','2017-08-14',NULL,'Active'),(10,10,'GIU-SI-0010','Standard GIU social insurance coverage','2017-09-08',NULL,'Active'),(11,11,'GIU-SI-0011','Standard GIU social insurance coverage','2017-10-03',NULL,'Active'),(12,12,'GIU-SI-0012','Standard GIU social insurance coverage','2017-10-28',NULL,'Active'),(13,13,'GIU-SI-0013','Standard GIU social insurance coverage','2017-11-22',NULL,'Active'),(14,14,'GIU-SI-0014','Standard GIU social insurance coverage','2017-12-17',NULL,'Active'),(15,15,'GIU-SI-0015','Standard GIU social insurance coverage','2018-01-11',NULL,'Active'),(16,16,'GIU-SI-0016','Standard GIU social insurance coverage','2018-02-05',NULL,'Active'),(17,17,'GIU-SI-0017','Standard GIU social insurance coverage','2018-03-02',NULL,'Active'),(18,18,'GIU-SI-0018','Standard GIU social insurance coverage','2018-03-27',NULL,'Active'),(19,19,'GIU-SI-0019','Standard GIU social insurance coverage','2018-04-21',NULL,'Active'),(20,20,'GIU-SI-0020','Standard GIU social insurance coverage','2018-05-16',NULL,'Active'),(21,21,'GIU-SI-0021','Standard GIU social insurance coverage','2018-06-10',NULL,'Active'),(22,22,'GIU-SI-0022','Standard GIU social insurance coverage','2018-07-05',NULL,'Active'),(23,23,'GIU-SI-0023','Standard GIU social insurance coverage','2018-07-30',NULL,'Active'),(24,24,'GIU-SI-0024','Standard GIU social insurance coverage','2018-08-24',NULL,'Active'),(25,25,'GIU-SI-0025','Standard GIU social insurance coverage','2018-09-18',NULL,'Active'),(26,26,'GIU-SI-0026','Standard GIU social insurance coverage','2018-10-13',NULL,'Active'),(27,27,'GIU-SI-0027','Standard GIU social insurance coverage','2018-11-07',NULL,'Active'),(28,28,'GIU-SI-0028','Standard GIU social insurance coverage','2018-12-02',NULL,'Active'),(29,29,'GIU-SI-0029','Standard GIU social insurance coverage','2018-12-27',NULL,'Active'),(30,30,'GIU-SI-0030','Standard GIU social insurance coverage','2019-01-21',NULL,'Active'),(31,31,'GIU-SI-0031','Standard GIU social insurance coverage','2019-02-15',NULL,'Active'),(32,32,'GIU-SI-0032','Standard GIU social insurance coverage','2019-03-12',NULL,'Active'),(33,33,'GIU-SI-0033','Standard GIU social insurance coverage','2019-04-06',NULL,'Active'),(34,34,'GIU-SI-0034','Standard GIU social insurance coverage','2019-05-01',NULL,'Active'),(35,35,'GIU-SI-0035','Standard GIU social insurance coverage','2019-05-26',NULL,'Active'),(36,36,'GIU-SI-0036','Standard GIU social insurance coverage','2019-06-20',NULL,'Active'),(37,37,'GIU-SI-0037','Standard GIU social insurance coverage','2019-07-15',NULL,'Active'),(38,38,'GIU-SI-0038','Standard GIU social insurance coverage','2019-08-09',NULL,'Active'),(39,39,'GIU-SI-0039','Standard GIU social insurance coverage','2019-09-03',NULL,'Active'),(40,40,'GIU-SI-0040','Standard GIU social insurance coverage','2019-09-28',NULL,'Active'),(41,41,'GIU-SI-0041','Standard GIU social insurance coverage','2019-10-23',NULL,'Active'),(42,42,'GIU-SI-0042','Standard GIU social insurance coverage','2019-11-17',NULL,'Active'),(43,43,'GIU-SI-0043','Standard GIU social insurance coverage','2019-12-12',NULL,'Active'),(44,44,'GIU-SI-0044','Standard GIU social insurance coverage','2020-01-06',NULL,'Active'),(45,45,'GIU-SI-0045','Standard GIU social insurance coverage','2020-01-31',NULL,'Active'),(46,46,'GIU-SI-0046','Standard GIU social insurance coverage','2020-02-25',NULL,'Active'),(47,47,'GIU-SI-0047','Standard GIU social insurance coverage','2020-03-21',NULL,'Active'),(48,48,'GIU-SI-0048','Standard GIU social insurance coverage','2020-04-15',NULL,'Active'),(49,49,'GIU-SI-0049','Standard GIU social insurance coverage','2020-05-10',NULL,'Active'),(50,50,'GIU-SI-0050','Standard GIU social insurance coverage','2020-06-04',NULL,'Active'),(51,51,'GIU-SI-0051','Standard GIU social insurance coverage','2020-06-29',NULL,'Active'),(52,52,'GIU-SI-0052','Standard GIU social insurance coverage','2020-07-24',NULL,'Active'),(53,53,'GIU-SI-0053','Standard GIU social insurance coverage','2020-08-18',NULL,'Active'),(54,54,'GIU-SI-0054','Standard GIU social insurance coverage','2020-09-12',NULL,'Active'),(55,55,'GIU-SI-0055','Standard GIU social insurance coverage','2020-10-07',NULL,'Active'),(56,56,'GIU-SI-0056','Standard GIU social insurance coverage','2020-11-01',NULL,'Active'),(57,57,'GIU-SI-0057','Standard GIU social insurance coverage','2020-11-26',NULL,'Active'),(58,58,'GIU-SI-0058','Standard GIU social insurance coverage','2020-12-21',NULL,'Active'),(59,59,'GIU-SI-0059','Standard GIU social insurance coverage','2021-01-15',NULL,'Active'),(60,60,'GIU-SI-0060','Standard GIU social insurance coverage','2021-02-09',NULL,'Active'),(61,61,'GIU-SI-0061','Standard GIU social insurance coverage','2021-03-06',NULL,'Pending'),(62,62,'GIU-SI-0062','Standard GIU social insurance coverage','2021-03-31',NULL,'Pending'),(63,63,'GIU-SI-0063','Standard GIU social insurance coverage','2021-04-25',NULL,'Pending'),(64,64,'GIU-SI-0064','Standard GIU social insurance coverage','2021-05-20',NULL,'Pending'),(65,65,'GIU-SI-0065','Standard GIU social insurance coverage','2021-06-14',NULL,'Pending'),(66,66,'GIU-SI-0066','Standard GIU social insurance coverage','2021-07-09',NULL,'Pending'),(67,67,'GIU-SI-0067','Standard GIU social insurance coverage','2021-08-03','2023-08-03','Expired'),(68,68,'GIU-SI-0068','Standard GIU social insurance coverage','2021-08-28','2023-08-28','Expired'),(69,69,'GIU-SI-0069','Standard GIU social insurance coverage','2021-09-22','2023-09-22','Expired'),(70,70,'GIU-SI-0070','Standard GIU social insurance coverage','2021-10-17','2023-10-17','Expired');
/*!40000 ALTER TABLE `social_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_certificate`
--

DROP TABLE IF EXISTS `training_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_certificate` (
  `Certificate_ID` int NOT NULL AUTO_INCREMENT,
  `ET_ID` int DEFAULT NULL,
  `Issue_Date` date DEFAULT NULL,
  `certificate_file_path` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`Certificate_ID`),
  KEY `fk_training_certificate_et` (`ET_ID`),
  CONSTRAINT `fk_training_certificate_et` FOREIGN KEY (`ET_ID`) REFERENCES `employee_training` (`ET_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_certificate`
--

LOCK TABLES `training_certificate` WRITE;
/*!40000 ALTER TABLE `training_certificate` DISABLE KEYS */;
INSERT INTO `training_certificate` VALUES (1,1,'2025-01-11','certificates/TR-004/ET_000001.pdf'),(2,2,'2025-01-12','certificates/TR-004/ET_000002.pdf'),(3,5,'2025-01-15','certificates/TR-004/ET_000005.pdf'),(4,11,'2025-01-21','certificates/TR-004/ET_000011.pdf'),(5,13,'2025-01-23','certificates/TR-004/ET_000013.pdf'),(6,16,'2025-01-26','certificates/TR-004/ET_000016.pdf'),(7,17,'2025-01-27','certificates/TR-004/ET_000017.pdf'),(8,19,'2025-01-29','certificates/TR-004/ET_000019.pdf'),(9,22,'2025-02-01','certificates/TR-004/ET_000022.pdf'),(10,23,'2025-02-02','certificates/TR-004/ET_000023.pdf'),(11,25,'2025-02-04','certificates/TR-004/ET_000025.pdf'),(12,26,'2025-02-05','certificates/TR-004/ET_000026.pdf'),(13,29,'2025-02-08','certificates/TR-004/ET_000029.pdf'),(14,31,'2025-02-10','certificates/TR-004/ET_000031.pdf'),(15,32,'2025-02-11','certificates/TR-004/ET_000032.pdf'),(16,34,'2025-02-13','certificates/TR-004/ET_000034.pdf'),(17,37,'2025-02-16','certificates/TR-004/ET_000037.pdf'),(18,38,'2025-02-17','certificates/TR-004/ET_000038.pdf'),(19,41,'2025-02-20','certificates/TR-004/ET_000041.pdf'),(20,43,'2025-02-22','certificates/TR-004/ET_000043.pdf'),(21,44,'2025-02-23','certificates/TR-004/ET_000044.pdf'),(22,46,'2025-02-25','certificates/TR-004/ET_000046.pdf'),(23,47,'2025-02-26','certificates/TR-004/ET_000047.pdf'),(24,50,'2025-03-01','certificates/TR-004/ET_000050.pdf'),(25,52,'2025-03-03','certificates/TR-004/ET_000052.pdf'),(26,53,'2025-03-04','certificates/TR-004/ET_000053.pdf'),(27,55,'2025-03-06','certificates/TR-004/ET_000055.pdf'),(28,58,'2025-03-09','certificates/TR-004/ET_000058.pdf'),(29,61,'2025-03-12','certificates/TR-004/ET_000061.pdf'),(30,62,'2025-03-13','certificates/TR-004/ET_000062.pdf'),(31,64,'2025-03-15','certificates/TR-004/ET_000064.pdf'),(32,65,'2025-03-16','certificates/TR-004/ET_000065.pdf'),(33,67,'2025-03-18','certificates/TR-004/ET_000067.pdf'),(34,68,'2025-03-19','certificates/TR-004/ET_000068.pdf'),(35,71,'2025-03-22','certificates/TR-004/ET_000071.pdf'),(36,73,'2025-03-24','certificates/TR-004/ET_000073.pdf'),(37,74,'2025-03-25','certificates/TR-004/ET_000074.pdf'),(38,76,'2025-03-27','certificates/TR-004/ET_000076.pdf'),(39,80,'2025-03-31','certificates/TR-004/ET_000080.pdf'),(40,128,'2025-05-18','certificates/TR-002/ET_000128.pdf'),(41,130,'2025-05-20','certificates/TR-007/ET_000130.pdf'),(42,131,'2025-05-21','certificates/TR-009/ET_000131.pdf'),(43,134,'2025-05-24','certificates/TR-002/ET_000134.pdf'),(44,136,'2025-05-26','certificates/TR-007/ET_000136.pdf'),(45,137,'2025-05-27','certificates/TR-009/ET_000137.pdf'),(46,140,'2025-05-30','certificates/TR-002/ET_000140.pdf'),(47,142,'2025-06-01','certificates/TR-007/ET_000142.pdf'),(48,146,'2025-06-05','certificates/TR-002/ET_000146.pdf'),(49,148,'2025-06-07','certificates/TR-007/ET_000148.pdf'),(50,149,'2025-06-08','certificates/TR-009/ET_000149.pdf'),(51,152,'2025-06-11','certificates/TR-002/ET_000152.pdf'),(52,154,'2025-06-13','certificates/TR-007/ET_000154.pdf'),(53,155,'2025-06-14','certificates/TR-009/ET_000155.pdf'),(54,158,'2025-06-17','certificates/TR-002/ET_000158.pdf'),(55,160,'2025-06-19','certificates/TR-007/ET_000160.pdf'),(56,161,'2025-06-20','certificates/TR-009/ET_000161.pdf'),(57,164,'2025-06-23','certificates/TR-002/ET_000164.pdf'),(58,166,'2025-06-25','certificates/TR-007/ET_000166.pdf');
/*!40000 ALTER TABLE `training_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_program`
--

DROP TABLE IF EXISTS `training_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_program` (
  `Program_ID` int NOT NULL AUTO_INCREMENT,
  `Program_Code` varchar(50) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Objectives` varchar(500) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Subtype` varchar(100) DEFAULT NULL,
  `Delivery_Method` varchar(50) DEFAULT NULL,
  `Approval_Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Program_ID`),
  UNIQUE KEY `Program_Code` (`Program_Code`),
  CONSTRAINT `training_program_chk_1` CHECK ((`Approval_Status` in (_utf8mb4'Pending',_utf8mb4'Approved',_utf8mb4'Rejected')))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_program`
--

LOCK TABLES `training_program` WRITE;
/*!40000 ALTER TABLE `training_program` DISABLE KEYS */;
INSERT INTO `training_program` VALUES (1,'TR-001','Power BI for HR Dashboards','Build interactive HR dashboards; connect to MySQL; design KPIs and visuals.','Technical','Business Intelligence','Online','Approved'),(2,'TR-002','SQL for HR Analytics','Write SQL queries for HR reporting; joins, views, and data validation.','Technical','Database','Online','Approved'),(3,'TR-003','Data Visualization Best Practices','Choose correct charts; avoid misleading visuals; design executive-ready dashboards.','Technical','Analytics','Online','Approved'),(4,'TR-004','Cybersecurity Awareness','Reduce phishing risk; password hygiene; basic security policies.','Technical','Security','Online','Approved'),(5,'TR-005','Cloud Fundamentals (Azure/AWS Overview)','Understand cloud basics; shared responsibility; cloud service models.','Technical','Cloud','Online','Pending'),(6,'TR-006','IT Service Management Basics (ITIL Concepts)','Understand incident/problem/change basics; improve service delivery.','Technical','IT Operations','Hybrid','Approved'),(7,'TR-007','Teaching & Assessment Skills','Improve teaching delivery; assessment design; feedback strategies.','Academic','Teaching Development','On-site','Approved'),(8,'TR-008','Research Methods for Academic Staff','Research design basics; data collection; reporting and ethics.','Academic','Research','Hybrid','Approved'),(9,'TR-009','HR Policies & Labor Compliance','HR policy compliance; documentation standards; workplace conduct.','Compliance','HR Compliance','On-site','Approved'),(10,'TR-010','Finance Controls & Documentation','Improve documentation; approvals; audit readiness; reconciliation habits.','Compliance','Finance','On-site','Pending'),(11,'TR-011','Professional Communication','Email etiquette; conflict handling; stakeholder communication.','Soft Skills','Communication','Online','Approved'),(12,'TR-012','Leadership Essentials for Team Leads','Goal setting; delegation; coaching; performance conversations.','Soft Skills','Leadership','Hybrid','Rejected');
/*!40000 ALTER TABLE `training_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university` (
  `University_ID` int NOT NULL AUTO_INCREMENT,
  `University_Name` varchar(200) NOT NULL,
  `Acronym` varchar(20) DEFAULT NULL,
  `Established_Year` int DEFAULT NULL,
  `Accreditation_Body` varchar(200) DEFAULT NULL,
  `Address` varchar(300) DEFAULT NULL,
  `Contact_Email` varchar(100) DEFAULT NULL,
  `Website_URL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`University_ID`),
  CONSTRAINT `university_chk_1` CHECK ((`Established_Year` between 1800 and 2100))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES (1,'German International University','GIU',2002,'Ministry of Higher Education','New Administrative Capital, Cairo, Egypt','contact@giu.edu.eg','https://www.giu.edu.eg');
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_active_job_assignments`
--

DROP TABLE IF EXISTS `v_active_job_assignments`;
/*!50001 DROP VIEW IF EXISTS `v_active_job_assignments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_active_job_assignments` AS SELECT 
 1 AS `Assignment_ID`,
 1 AS `Employee_ID`,
 1 AS `Employee_Name`,
 1 AS `Employment_Status`,
 1 AS `Gender`,
 1 AS `Department_Name`,
 1 AS `Job_Title`,
 1 AS `Job_Level`,
 1 AS `Job_Category`,
 1 AS `Start_Date`,
 1 AS `End_Date`,
 1 AS `Status`,
 1 AS `Assigned_Salary`,
 1 AS `Contract_Name`,
 1 AS `Work_Modality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_employee_current_job`
--

DROP TABLE IF EXISTS `v_employee_current_job`;
/*!50001 DROP VIEW IF EXISTS `v_employee_current_job`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_employee_current_job` AS SELECT 
 1 AS `Employee_ID`,
 1 AS `Employee_Name`,
 1 AS `Gender`,
 1 AS `Nationality`,
 1 AS `Employment_Status`,
 1 AS `DOB`,
 1 AS `Age`,
 1 AS `First_Join_Date`,
 1 AS `Service_Years`,
 1 AS `Assignment_ID`,
 1 AS `Current_Job_Start_Date`,
 1 AS `Current_Job_End_Date`,
 1 AS `Assignment_Status`,
 1 AS `Assigned_Salary`,
 1 AS `Job_ID`,
 1 AS `Job_Code`,
 1 AS `Job_Title`,
 1 AS `Job_Level`,
 1 AS `Job_Category`,
 1 AS `Job_Grade`,
 1 AS `Job_Status`,
 1 AS `Department_ID`,
 1 AS `Department_Name`,
 1 AS `Department_Type`,
 1 AS `Department_Location`,
 1 AS `Contract_ID`,
 1 AS `Contract_Name`,
 1 AS `Contract_Type`,
 1 AS `Work_Modality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_employees_by_department`
--

DROP TABLE IF EXISTS `v_employees_by_department`;
/*!50001 DROP VIEW IF EXISTS `v_employees_by_department`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_employees_by_department` AS SELECT 
 1 AS `Department_ID`,
 1 AS `Department_Name`,
 1 AS `Employee_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_employment_status_breakdown`
--

DROP TABLE IF EXISTS `v_employment_status_breakdown`;
/*!50001 DROP VIEW IF EXISTS `v_employment_status_breakdown`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_employment_status_breakdown` AS SELECT 
 1 AS `Employment_Status`,
 1 AS `Employee_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_gender_breakdown`
--

DROP TABLE IF EXISTS `v_gender_breakdown`;
/*!50001 DROP VIEW IF EXISTS `v_gender_breakdown`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_gender_breakdown` AS SELECT 
 1 AS `Gender`,
 1 AS `Employee_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_job_dim`
--

DROP TABLE IF EXISTS `v_job_dim`;
/*!50001 DROP VIEW IF EXISTS `v_job_dim`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_job_dim` AS SELECT 
 1 AS `Job_ID`,
 1 AS `Job_Code`,
 1 AS `Job_Title`,
 1 AS `Job_Level`,
 1 AS `Job_Category`,
 1 AS `Job_Grade`,
 1 AS `Min_Salary`,
 1 AS `Max_Salary`,
 1 AS `Status_Raw`,
 1 AS `Status_Dashboard`,
 1 AS `Department_ID`,
 1 AS `Department_Name`,
 1 AS `Department_Type`,
 1 AS `Reports_To`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_jobs_by_level`
--

DROP TABLE IF EXISTS `v_jobs_by_level`;
/*!50001 DROP VIEW IF EXISTS `v_jobs_by_level`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_jobs_by_level` AS SELECT 
 1 AS `Job_Level`,
 1 AS `Jobs_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_kpi_score_summary`
--

DROP TABLE IF EXISTS `v_kpi_score_summary`;
/*!50001 DROP VIEW IF EXISTS `v_kpi_score_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_kpi_score_summary` AS SELECT 
 1 AS `Cycle_ID`,
 1 AS `Cycle_Name`,
 1 AS `Department_Name`,
 1 AS `KPI_Name`,
 1 AS `Avg_Employee_Score`,
 1 AS `Total_Weighted_Score`,
 1 AS `Submitted_Scores`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_performance_cycles_status`
--

DROP TABLE IF EXISTS `v_performance_cycles_status`;
/*!50001 DROP VIEW IF EXISTS `v_performance_cycles_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_performance_cycles_status` AS SELECT 
 1 AS `Cycle_ID`,
 1 AS `Cycle_Name`,
 1 AS `Cycle_Type`,
 1 AS `Start_Date`,
 1 AS `End_Date`,
 1 AS `Submission_Deadline`,
 1 AS `Is_Open`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_salary_stats_by_category`
--

DROP TABLE IF EXISTS `v_salary_stats_by_category`;
/*!50001 DROP VIEW IF EXISTS `v_salary_stats_by_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_salary_stats_by_category` AS SELECT 
 1 AS `Job_Category`,
 1 AS `Min_Salary`,
 1 AS `Max_Salary`,
 1 AS `Avg_Assigned_Salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_training_fact`
--

DROP TABLE IF EXISTS `v_training_fact`;
/*!50001 DROP VIEW IF EXISTS `v_training_fact`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_training_fact` AS SELECT 
 1 AS `ET_ID`,
 1 AS `Employee_ID`,
 1 AS `Employee_Name`,
 1 AS `Program_ID`,
 1 AS `Program_Code`,
 1 AS `Program_Title`,
 1 AS `Program_Type`,
 1 AS `Program_Subtype`,
 1 AS `Delivery_Method`,
 1 AS `Approval_Status`,
 1 AS `Department_Name`,
 1 AS `Completion_Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_workforce_cards`
--

DROP TABLE IF EXISTS `v_workforce_cards`;
/*!50001 DROP VIEW IF EXISTS `v_workforce_cards`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_workforce_cards` AS SELECT 
 1 AS `Total_Employees`,
 1 AS `Active_Employees`,
 1 AS `Average_Employee_Age`,
 1 AS `Average_Service_Years`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_active_job_assignments`
--

DROP TABLE IF EXISTS `vw_active_job_assignments`;
/*!50001 DROP VIEW IF EXISTS `vw_active_job_assignments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_active_job_assignments` AS SELECT 
 1 AS `Assignment_ID`,
 1 AS `Employee_ID`,
 1 AS `Employee_Name`,
 1 AS `Employment_Status`,
 1 AS `Gender`,
 1 AS `Department_Name`,
 1 AS `Job_Title`,
 1 AS `Job_Level`,
 1 AS `Job_Category`,
 1 AS `Start_Date`,
 1 AS `End_Date`,
 1 AS `Status`,
 1 AS `Assigned_Salary`,
 1 AS `Contract_Name`,
 1 AS `Work_Modality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_appraisal_score_by_cycle`
--

DROP TABLE IF EXISTS `vw_appraisal_score_by_cycle`;
/*!50001 DROP VIEW IF EXISTS `vw_appraisal_score_by_cycle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_appraisal_score_by_cycle` AS SELECT 
 1 AS `Cycle_ID`,
 1 AS `Cycle_Name`,
 1 AS `Avg_Appraisal_Score`,
 1 AS `Appraisals_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_appraisal_scores_per_cycle`
--

DROP TABLE IF EXISTS `vw_appraisal_scores_per_cycle`;
/*!50001 DROP VIEW IF EXISTS `vw_appraisal_scores_per_cycle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_appraisal_scores_per_cycle` AS SELECT 
 1 AS `Cycle_ID`,
 1 AS `Cycle_Name`,
 1 AS `Avg_Appraisal_Score`,
 1 AS `Appraisals_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_appraisal_summary_detail`
--

DROP TABLE IF EXISTS `vw_appraisal_summary_detail`;
/*!50001 DROP VIEW IF EXISTS `vw_appraisal_summary_detail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_appraisal_summary_detail` AS SELECT 
 1 AS `Appraisal_ID`,
 1 AS `Employee_ID`,
 1 AS `Employee_Name`,
 1 AS `Department_Name`,
 1 AS `Job_Title`,
 1 AS `Cycle_Name`,
 1 AS `Appraisal_Date`,
 1 AS `Overall_Score`,
 1 AS `Manager_Comments`,
 1 AS `HR_Comments`,
 1 AS `Employee_Comments`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_certificates_issued_by_program`
--

DROP TABLE IF EXISTS `vw_certificates_issued_by_program`;
/*!50001 DROP VIEW IF EXISTS `vw_certificates_issued_by_program`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_certificates_issued_by_program` AS SELECT 
 1 AS `Program_ID`,
 1 AS `Program_Code`,
 1 AS `Program_Title`,
 1 AS `Certificates_Issued`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_current_assignment`
--

DROP TABLE IF EXISTS `vw_current_assignment`;
/*!50001 DROP VIEW IF EXISTS `vw_current_assignment`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_current_assignment` AS SELECT 
 1 AS `Assignment_ID`,
 1 AS `Employee_ID`,
 1 AS `Job_ID`,
 1 AS `Contract_ID`,
 1 AS `Start_Date`,
 1 AS `End_Date`,
 1 AS `Status`,
 1 AS `Assigned_Salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_department_structure`
--

DROP TABLE IF EXISTS `vw_department_structure`;
/*!50001 DROP VIEW IF EXISTS `vw_department_structure`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_department_structure` AS SELECT 
 1 AS `University_Name`,
 1 AS `Faculty_Name`,
 1 AS `Department_ID`,
 1 AS `Department_Name`,
 1 AS `Department_Type`,
 1 AS `Employee_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_employee_current_job`
--

DROP TABLE IF EXISTS `vw_employee_current_job`;
/*!50001 DROP VIEW IF EXISTS `vw_employee_current_job`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employee_current_job` AS SELECT 
 1 AS `Employee_ID`,
 1 AS `Employee_Name`,
 1 AS `Gender`,
 1 AS `Nationality`,
 1 AS `Employment_Status`,
 1 AS `DOB`,
 1 AS `Age`,
 1 AS `First_Join_Date`,
 1 AS `Service_Years`,
 1 AS `Assignment_ID`,
 1 AS `Current_Job_Start_Date`,
 1 AS `Current_Job_End_Date`,
 1 AS `Assignment_Status`,
 1 AS `Assigned_Salary`,
 1 AS `Job_ID`,
 1 AS `Job_Code`,
 1 AS `Job_Title`,
 1 AS `Job_Level`,
 1 AS `Job_Category`,
 1 AS `Job_Grade`,
 1 AS `Job_Status`,
 1 AS `Department_ID`,
 1 AS `Department_Name`,
 1 AS `Department_Type`,
 1 AS `Department_Location`,
 1 AS `Contract_ID`,
 1 AS `Contract_Name`,
 1 AS `Contract_Type`,
 1 AS `Work_Modality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_employee_service_years`
--

DROP TABLE IF EXISTS `vw_employee_service_years`;
/*!50001 DROP VIEW IF EXISTS `vw_employee_service_years`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employee_service_years` AS SELECT 
 1 AS `Employee_ID`,
 1 AS `First_Join_Date`,
 1 AS `Service_End_Date`,
 1 AS `Service_Years`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_employees_by_department`
--

DROP TABLE IF EXISTS `vw_employees_by_department`;
/*!50001 DROP VIEW IF EXISTS `vw_employees_by_department`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employees_by_department` AS SELECT 
 1 AS `Department_ID`,
 1 AS `Department_Name`,
 1 AS `Employee_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_employment_status_distribution`
--

DROP TABLE IF EXISTS `vw_employment_status_distribution`;
/*!50001 DROP VIEW IF EXISTS `vw_employment_status_distribution`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employment_status_distribution` AS SELECT 
 1 AS `Employment_Status`,
 1 AS `Employee_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_full_appraisal_summary`
--

DROP TABLE IF EXISTS `vw_full_appraisal_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_full_appraisal_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_full_appraisal_summary` AS SELECT 
 1 AS `Appraisal_ID`,
 1 AS `Employee_ID`,
 1 AS `Employee_Name`,
 1 AS `Department_Name`,
 1 AS `Job_Title`,
 1 AS `Cycle_Name`,
 1 AS `Appraisal_Date`,
 1 AS `Overall_Score`,
 1 AS `Manager_Comments`,
 1 AS `HR_Comments`,
 1 AS `Employee_Comments`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_gender_distribution`
--

DROP TABLE IF EXISTS `vw_gender_distribution`;
/*!50001 DROP VIEW IF EXISTS `vw_gender_distribution`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_gender_distribution` AS SELECT 
 1 AS `Gender`,
 1 AS `Employee_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_job_cards`
--

DROP TABLE IF EXISTS `vw_job_cards`;
/*!50001 DROP VIEW IF EXISTS `vw_job_cards`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_job_cards` AS SELECT 
 1 AS `Total_Jobs`,
 1 AS `Active_Jobs`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_job_dim`
--

DROP TABLE IF EXISTS `vw_job_dim`;
/*!50001 DROP VIEW IF EXISTS `vw_job_dim`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_job_dim` AS SELECT 
 1 AS `Job_ID`,
 1 AS `Job_Code`,
 1 AS `Job_Title`,
 1 AS `Job_Level`,
 1 AS `Job_Category`,
 1 AS `Job_Grade`,
 1 AS `Min_Salary`,
 1 AS `Max_Salary`,
 1 AS `Status_Raw`,
 1 AS `Status_Dashboard`,
 1 AS `Department_ID`,
 1 AS `Department_Name`,
 1 AS `Department_Type`,
 1 AS `Reports_To`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_job_structure_overview`
--

DROP TABLE IF EXISTS `vw_job_structure_overview`;
/*!50001 DROP VIEW IF EXISTS `vw_job_structure_overview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_job_structure_overview` AS SELECT 
 1 AS `Department_Name`,
 1 AS `Department_Type`,
 1 AS `Job_Level`,
 1 AS `Job_Category`,
 1 AS `Job_Code`,
 1 AS `Job_Title`,
 1 AS `Job_Grade`,
 1 AS `Min_Salary`,
 1 AS `Max_Salary`,
 1 AS `Job_Status`,
 1 AS `Reports_To_Job_Title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_jobs_by_level`
--

DROP TABLE IF EXISTS `vw_jobs_by_level`;
/*!50001 DROP VIEW IF EXISTS `vw_jobs_by_level`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_jobs_by_level` AS SELECT 
 1 AS `Job_Level`,
 1 AS `Jobs_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_kpi_completion_rate_by_cycle`
--

DROP TABLE IF EXISTS `vw_kpi_completion_rate_by_cycle`;
/*!50001 DROP VIEW IF EXISTS `vw_kpi_completion_rate_by_cycle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_kpi_completion_rate_by_cycle` AS SELECT 
 1 AS `Cycle_ID`,
 1 AS `Cycle_Name`,
 1 AS `Actual_Scores`,
 1 AS `Expected_Scores`,
 1 AS `Completion_Rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_kpi_completion_rate_by_cycle_fixed`
--

DROP TABLE IF EXISTS `vw_kpi_completion_rate_by_cycle_fixed`;
/*!50001 DROP VIEW IF EXISTS `vw_kpi_completion_rate_by_cycle_fixed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_kpi_completion_rate_by_cycle_fixed` AS SELECT 
 1 AS `Cycle_ID`,
 1 AS `Cycle_Name`,
 1 AS `Actual_Scores`,
 1 AS `Expected_Scores`,
 1 AS `Completion_Rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_kpi_completion_rate_overall`
--

DROP TABLE IF EXISTS `vw_kpi_completion_rate_overall`;
/*!50001 DROP VIEW IF EXISTS `vw_kpi_completion_rate_overall`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_kpi_completion_rate_overall` AS SELECT 
 1 AS `Total_KPI_Score_Records`,
 1 AS `Submitted_KPI_Score_Records`,
 1 AS `KPI_Completion_Rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_kpi_completion_rate_overall_fixed`
--

DROP TABLE IF EXISTS `vw_kpi_completion_rate_overall_fixed`;
/*!50001 DROP VIEW IF EXISTS `vw_kpi_completion_rate_overall_fixed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_kpi_completion_rate_overall_fixed` AS SELECT 
 1 AS `Total_KPI_Score_Records`,
 1 AS `Submitted_KPI_Score_Records`,
 1 AS `KPI_Completion_Rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_kpi_fact_dept`
--

DROP TABLE IF EXISTS `vw_kpi_fact_dept`;
/*!50001 DROP VIEW IF EXISTS `vw_kpi_fact_dept`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_kpi_fact_dept` AS SELECT 
 1 AS `Department_Name`,
 1 AS `Cycle_Name`,
 1 AS `KPI_Name`,
 1 AS `Employee_Score`,
 1 AS `Weighted_Score`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_kpi_score_summary`
--

DROP TABLE IF EXISTS `vw_kpi_score_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_kpi_score_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_kpi_score_summary` AS SELECT 
 1 AS `Cycle_ID`,
 1 AS `Cycle_Name`,
 1 AS `Department_Name`,
 1 AS `KPI_Name`,
 1 AS `Avg_Employee_Score`,
 1 AS `Total_Weighted_Score`,
 1 AS `Submitted_Scores`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_page_perf_training`
--

DROP TABLE IF EXISTS `vw_page_perf_training`;
/*!50001 DROP VIEW IF EXISTS `vw_page_perf_training`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_page_perf_training` AS SELECT 
 1 AS `Record_Type`,
 1 AS `Department_ID`,
 1 AS `Department_Name`,
 1 AS `Cycle_ID`,
 1 AS `Cycle_Name`,
 1 AS `Program_Title`,
 1 AS `KPI_Name`,
 1 AS `KPI_Score`,
 1 AS `KPI_Weighted_Score`,
 1 AS `Appraisal_Score`,
 1 AS `Completion_Status`,
 1 AS `Is_Completed`,
 1 AS `Has_Certificate`,
 1 AS `Employee_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_performance_cards`
--

DROP TABLE IF EXISTS `vw_performance_cards`;
/*!50001 DROP VIEW IF EXISTS `vw_performance_cards`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_performance_cards` AS SELECT 
 1 AS `Active_Performance_Cycles`,
 1 AS `Average_Appraisal_Score`,
 1 AS `KPI_Completion_Rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_performance_cycles_status`
--

DROP TABLE IF EXISTS `vw_performance_cycles_status`;
/*!50001 DROP VIEW IF EXISTS `vw_performance_cycles_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_performance_cycles_status` AS SELECT 
 1 AS `Cycle_ID`,
 1 AS `Cycle_Name`,
 1 AS `Cycle_Type`,
 1 AS `Start_Date`,
 1 AS `End_Date`,
 1 AS `Submission_Deadline`,
 1 AS `Is_Open`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_salary_stats_by_job_category`
--

DROP TABLE IF EXISTS `vw_salary_stats_by_job_category`;
/*!50001 DROP VIEW IF EXISTS `vw_salary_stats_by_job_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_salary_stats_by_job_category` AS SELECT 
 1 AS `Job_Category`,
 1 AS `Avg_Min_Salary`,
 1 AS `Avg_Max_Salary`,
 1 AS `Avg_Assigned_Salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_training_cards`
--

DROP TABLE IF EXISTS `vw_training_cards`;
/*!50001 DROP VIEW IF EXISTS `vw_training_cards`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_training_cards` AS SELECT 
 1 AS `Total_Training_Programs`,
 1 AS `Total_Certificates_Issued`,
 1 AS `Training_Completion_Rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_training_completion_per_program`
--

DROP TABLE IF EXISTS `vw_training_completion_per_program`;
/*!50001 DROP VIEW IF EXISTS `vw_training_completion_per_program`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_training_completion_per_program` AS SELECT 
 1 AS `Program_ID`,
 1 AS `Program_Code`,
 1 AS `Program_Title`,
 1 AS `Completed_Count`,
 1 AS `Total_Assignments`,
 1 AS `Completion_Rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_training_completion_rate_overall`
--

DROP TABLE IF EXISTS `vw_training_completion_rate_overall`;
/*!50001 DROP VIEW IF EXISTS `vw_training_completion_rate_overall`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_training_completion_rate_overall` AS SELECT 
 1 AS `Total_Training_Enrollments`,
 1 AS `Completed_Enrollments`,
 1 AS `Training_Completion_Rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_training_fact`
--

DROP TABLE IF EXISTS `vw_training_fact`;
/*!50001 DROP VIEW IF EXISTS `vw_training_fact`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_training_fact` AS SELECT 
 1 AS `ET_ID`,
 1 AS `Employee_ID`,
 1 AS `Employee_Name`,
 1 AS `Program_ID`,
 1 AS `Program_Code`,
 1 AS `Program_Title`,
 1 AS `Program_Type`,
 1 AS `Program_Subtype`,
 1 AS `Delivery_Method`,
 1 AS `Approval_Status`,
 1 AS `Department_Name`,
 1 AS `Completion_Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_training_fact_dept`
--

DROP TABLE IF EXISTS `vw_training_fact_dept`;
/*!50001 DROP VIEW IF EXISTS `vw_training_fact_dept`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_training_fact_dept` AS SELECT 
 1 AS `Department_Name`,
 1 AS `Program_Title`,
 1 AS `Employee_ID`,
 1 AS `Completion_Status`,
 1 AS `Has_Certificate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_training_participation`
--

DROP TABLE IF EXISTS `vw_training_participation`;
/*!50001 DROP VIEW IF EXISTS `vw_training_participation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_training_participation` AS SELECT 
 1 AS `Program_ID`,
 1 AS `Program_Code`,
 1 AS `Program_Title`,
 1 AS `Participants_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_workforce_cards`
--

DROP TABLE IF EXISTS `vw_workforce_cards`;
/*!50001 DROP VIEW IF EXISTS `vw_workforce_cards`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_workforce_cards` AS SELECT 
 1 AS `Total_Employees`,
 1 AS `Active_Employees`,
 1 AS `Average_Employee_Age`,
 1 AS `Average_Service_Years`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `dim_department`
--

/*!50001 DROP VIEW IF EXISTS `dim_department`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dim_department` AS select `department`.`Department_ID` AS `Department_ID`,`department`.`Department_Name` AS `Department_Name`,`department`.`Department_Type` AS `Department_Type` from `department` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fact_appraisal`
--

/*!50001 DROP VIEW IF EXISTS `fact_appraisal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fact_appraisal` AS select `d`.`Department_ID` AS `Department_ID`,`d`.`Department_Name` AS `Department_Name`,`pc`.`Cycle_ID` AS `Cycle_ID`,`pc`.`Cycle_Name` AS `Cycle_Name`,`a`.`Appraisal_ID` AS `Appraisal_ID`,`a`.`Appraisal_Date` AS `Appraisal_Date`,`a`.`Overall_Score` AS `Overall_Score` from ((((`appraisal` `a` join `performance_cycle` `pc` on((`pc`.`Cycle_ID` = `a`.`Cycle_ID`))) join `job_assignment` `ja` on((`ja`.`Assignment_ID` = `a`.`Assignment_ID`))) join `job` `j` on((`j`.`Job_ID` = `ja`.`Job_ID`))) join `department` `d` on((`d`.`Department_ID` = `j`.`Department_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fact_kpi`
--

/*!50001 DROP VIEW IF EXISTS `fact_kpi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fact_kpi` AS select `d`.`Department_ID` AS `Department_ID`,`d`.`Department_Name` AS `Department_Name`,`pc`.`Cycle_ID` AS `Cycle_ID`,`pc`.`Cycle_Name` AS `Cycle_Name`,`ok`.`KPI_ID` AS `KPI_ID`,`ok`.`KPI_Name` AS `KPI_Name`,`eks`.`Employee_Score` AS `Employee_Score`,`eks`.`Weighted_Score` AS `Weighted_Score` from (((((`employee_kpi_score` `eks` join `performance_cycle` `pc` on((`pc`.`Cycle_ID` = `eks`.`Performance_Cycle_ID`))) join `objective_kpi` `ok` on((`ok`.`KPI_ID` = `eks`.`KPI_ID`))) join `job_assignment` `ja` on((`ja`.`Assignment_ID` = `eks`.`Assignment_ID`))) join `job` `j` on((`j`.`Job_ID` = `ja`.`Job_ID`))) join `department` `d` on((`d`.`Department_ID` = `j`.`Department_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fact_training`
--

/*!50001 DROP VIEW IF EXISTS `fact_training`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fact_training` AS select `ecj`.`Department_ID` AS `Department_ID`,`ecj`.`Department_Name` AS `Department_Name`,`tp`.`Program_ID` AS `Program_ID`,`tp`.`Title` AS `Program_Title`,`et`.`Employee_ID` AS `Employee_ID`,`et`.`Completion_Status` AS `Completion_Status`,(case when (`tc`.`Certificate_ID` is not null) then 1 else 0 end) AS `Has_Certificate` from (((`employee_training` `et` join `training_program` `tp` on((`tp`.`Program_ID` = `et`.`Program_ID`))) join `vw_employee_current_job` `ecj` on((`ecj`.`Employee_ID` = `et`.`Employee_ID`))) left join `training_certificate` `tc` on((`tc`.`ET_ID` = `et`.`ET_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_active_job_assignments`
--

/*!50001 DROP VIEW IF EXISTS `v_active_job_assignments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_active_job_assignments` AS select `vw_active_job_assignments`.`Assignment_ID` AS `Assignment_ID`,`vw_active_job_assignments`.`Employee_ID` AS `Employee_ID`,`vw_active_job_assignments`.`Employee_Name` AS `Employee_Name`,`vw_active_job_assignments`.`Employment_Status` AS `Employment_Status`,`vw_active_job_assignments`.`Gender` AS `Gender`,`vw_active_job_assignments`.`Department_Name` AS `Department_Name`,`vw_active_job_assignments`.`Job_Title` AS `Job_Title`,`vw_active_job_assignments`.`Job_Level` AS `Job_Level`,`vw_active_job_assignments`.`Job_Category` AS `Job_Category`,`vw_active_job_assignments`.`Start_Date` AS `Start_Date`,`vw_active_job_assignments`.`End_Date` AS `End_Date`,`vw_active_job_assignments`.`Status` AS `Status`,`vw_active_job_assignments`.`Assigned_Salary` AS `Assigned_Salary`,`vw_active_job_assignments`.`Contract_Name` AS `Contract_Name`,`vw_active_job_assignments`.`Work_Modality` AS `Work_Modality` from `vw_active_job_assignments` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_employee_current_job`
--

/*!50001 DROP VIEW IF EXISTS `v_employee_current_job`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_employee_current_job` AS select `vw_employee_current_job`.`Employee_ID` AS `Employee_ID`,`vw_employee_current_job`.`Employee_Name` AS `Employee_Name`,`vw_employee_current_job`.`Gender` AS `Gender`,`vw_employee_current_job`.`Nationality` AS `Nationality`,`vw_employee_current_job`.`Employment_Status` AS `Employment_Status`,`vw_employee_current_job`.`DOB` AS `DOB`,`vw_employee_current_job`.`Age` AS `Age`,`vw_employee_current_job`.`First_Join_Date` AS `First_Join_Date`,`vw_employee_current_job`.`Service_Years` AS `Service_Years`,`vw_employee_current_job`.`Assignment_ID` AS `Assignment_ID`,`vw_employee_current_job`.`Current_Job_Start_Date` AS `Current_Job_Start_Date`,`vw_employee_current_job`.`Current_Job_End_Date` AS `Current_Job_End_Date`,`vw_employee_current_job`.`Assignment_Status` AS `Assignment_Status`,`vw_employee_current_job`.`Assigned_Salary` AS `Assigned_Salary`,`vw_employee_current_job`.`Job_ID` AS `Job_ID`,`vw_employee_current_job`.`Job_Code` AS `Job_Code`,`vw_employee_current_job`.`Job_Title` AS `Job_Title`,`vw_employee_current_job`.`Job_Level` AS `Job_Level`,`vw_employee_current_job`.`Job_Category` AS `Job_Category`,`vw_employee_current_job`.`Job_Grade` AS `Job_Grade`,`vw_employee_current_job`.`Job_Status` AS `Job_Status`,`vw_employee_current_job`.`Department_ID` AS `Department_ID`,`vw_employee_current_job`.`Department_Name` AS `Department_Name`,`vw_employee_current_job`.`Department_Type` AS `Department_Type`,`vw_employee_current_job`.`Department_Location` AS `Department_Location`,`vw_employee_current_job`.`Contract_ID` AS `Contract_ID`,`vw_employee_current_job`.`Contract_Name` AS `Contract_Name`,`vw_employee_current_job`.`Contract_Type` AS `Contract_Type`,`vw_employee_current_job`.`Work_Modality` AS `Work_Modality` from `vw_employee_current_job` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_employees_by_department`
--

/*!50001 DROP VIEW IF EXISTS `v_employees_by_department`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_employees_by_department` AS select `vw_employees_by_department`.`Department_ID` AS `Department_ID`,`vw_employees_by_department`.`Department_Name` AS `Department_Name`,`vw_employees_by_department`.`Employee_Count` AS `Employee_Count` from `vw_employees_by_department` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_employment_status_breakdown`
--

/*!50001 DROP VIEW IF EXISTS `v_employment_status_breakdown`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_employment_status_breakdown` AS select `vw_employment_status_distribution`.`Employment_Status` AS `Employment_Status`,`vw_employment_status_distribution`.`Employee_Count` AS `Employee_Count` from `vw_employment_status_distribution` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_gender_breakdown`
--

/*!50001 DROP VIEW IF EXISTS `v_gender_breakdown`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_gender_breakdown` AS select `vw_gender_distribution`.`Gender` AS `Gender`,`vw_gender_distribution`.`Employee_Count` AS `Employee_Count` from `vw_gender_distribution` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_job_dim`
--

/*!50001 DROP VIEW IF EXISTS `v_job_dim`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_job_dim` AS select `vw_job_dim`.`Job_ID` AS `Job_ID`,`vw_job_dim`.`Job_Code` AS `Job_Code`,`vw_job_dim`.`Job_Title` AS `Job_Title`,`vw_job_dim`.`Job_Level` AS `Job_Level`,`vw_job_dim`.`Job_Category` AS `Job_Category`,`vw_job_dim`.`Job_Grade` AS `Job_Grade`,`vw_job_dim`.`Min_Salary` AS `Min_Salary`,`vw_job_dim`.`Max_Salary` AS `Max_Salary`,`vw_job_dim`.`Status_Raw` AS `Status_Raw`,`vw_job_dim`.`Status_Dashboard` AS `Status_Dashboard`,`vw_job_dim`.`Department_ID` AS `Department_ID`,`vw_job_dim`.`Department_Name` AS `Department_Name`,`vw_job_dim`.`Department_Type` AS `Department_Type`,`vw_job_dim`.`Reports_To` AS `Reports_To` from `vw_job_dim` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_jobs_by_level`
--

/*!50001 DROP VIEW IF EXISTS `v_jobs_by_level`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_jobs_by_level` AS select `vw_jobs_by_level`.`Job_Level` AS `Job_Level`,`vw_jobs_by_level`.`Jobs_Count` AS `Jobs_Count` from `vw_jobs_by_level` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_kpi_score_summary`
--

/*!50001 DROP VIEW IF EXISTS `v_kpi_score_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_kpi_score_summary` AS select `vw_kpi_score_summary`.`Cycle_ID` AS `Cycle_ID`,`vw_kpi_score_summary`.`Cycle_Name` AS `Cycle_Name`,`vw_kpi_score_summary`.`Department_Name` AS `Department_Name`,`vw_kpi_score_summary`.`KPI_Name` AS `KPI_Name`,`vw_kpi_score_summary`.`Avg_Employee_Score` AS `Avg_Employee_Score`,`vw_kpi_score_summary`.`Total_Weighted_Score` AS `Total_Weighted_Score`,`vw_kpi_score_summary`.`Submitted_Scores` AS `Submitted_Scores` from `vw_kpi_score_summary` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_performance_cycles_status`
--

/*!50001 DROP VIEW IF EXISTS `v_performance_cycles_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_performance_cycles_status` AS select `vw_performance_cycles_status`.`Cycle_ID` AS `Cycle_ID`,`vw_performance_cycles_status`.`Cycle_Name` AS `Cycle_Name`,`vw_performance_cycles_status`.`Cycle_Type` AS `Cycle_Type`,`vw_performance_cycles_status`.`Start_Date` AS `Start_Date`,`vw_performance_cycles_status`.`End_Date` AS `End_Date`,`vw_performance_cycles_status`.`Submission_Deadline` AS `Submission_Deadline`,`vw_performance_cycles_status`.`Is_Open` AS `Is_Open` from `vw_performance_cycles_status` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_salary_stats_by_category`
--

/*!50001 DROP VIEW IF EXISTS `v_salary_stats_by_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_salary_stats_by_category` AS select `vw_salary_stats_by_job_category`.`Job_Category` AS `Job_Category`,`vw_salary_stats_by_job_category`.`Avg_Min_Salary` AS `Min_Salary`,`vw_salary_stats_by_job_category`.`Avg_Max_Salary` AS `Max_Salary`,`vw_salary_stats_by_job_category`.`Avg_Assigned_Salary` AS `Avg_Assigned_Salary` from `vw_salary_stats_by_job_category` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_training_fact`
--

/*!50001 DROP VIEW IF EXISTS `v_training_fact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_training_fact` AS select `vw_training_fact`.`ET_ID` AS `ET_ID`,`vw_training_fact`.`Employee_ID` AS `Employee_ID`,`vw_training_fact`.`Employee_Name` AS `Employee_Name`,`vw_training_fact`.`Program_ID` AS `Program_ID`,`vw_training_fact`.`Program_Code` AS `Program_Code`,`vw_training_fact`.`Program_Title` AS `Program_Title`,`vw_training_fact`.`Program_Type` AS `Program_Type`,`vw_training_fact`.`Program_Subtype` AS `Program_Subtype`,`vw_training_fact`.`Delivery_Method` AS `Delivery_Method`,`vw_training_fact`.`Approval_Status` AS `Approval_Status`,`vw_training_fact`.`Department_Name` AS `Department_Name`,`vw_training_fact`.`Completion_Status` AS `Completion_Status` from `vw_training_fact` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_workforce_cards`
--

/*!50001 DROP VIEW IF EXISTS `v_workforce_cards`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_workforce_cards` AS select `vw_workforce_cards`.`Total_Employees` AS `Total_Employees`,`vw_workforce_cards`.`Active_Employees` AS `Active_Employees`,`vw_workforce_cards`.`Average_Employee_Age` AS `Average_Employee_Age`,`vw_workforce_cards`.`Average_Service_Years` AS `Average_Service_Years` from `vw_workforce_cards` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_active_job_assignments`
--

/*!50001 DROP VIEW IF EXISTS `vw_active_job_assignments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_active_job_assignments` AS select `ca`.`Assignment_ID` AS `Assignment_ID`,`ecj`.`Employee_ID` AS `Employee_ID`,`ecj`.`Employee_Name` AS `Employee_Name`,`ecj`.`Employment_Status` AS `Employment_Status`,`ecj`.`Gender` AS `Gender`,`ecj`.`Department_Name` AS `Department_Name`,`ecj`.`Job_Title` AS `Job_Title`,`ecj`.`Job_Level` AS `Job_Level`,`ecj`.`Job_Category` AS `Job_Category`,`ca`.`Start_Date` AS `Start_Date`,`ca`.`End_Date` AS `End_Date`,`ca`.`Status` AS `Status`,`ca`.`Assigned_Salary` AS `Assigned_Salary`,`ecj`.`Contract_Name` AS `Contract_Name`,`ecj`.`Work_Modality` AS `Work_Modality` from (`vw_current_assignment` `ca` join `vw_employee_current_job` `ecj` on((`ecj`.`Assignment_ID` = `ca`.`Assignment_ID`))) where ((`ca`.`Status` = 'Active') or (`ca`.`Status` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_appraisal_score_by_cycle`
--

/*!50001 DROP VIEW IF EXISTS `vw_appraisal_score_by_cycle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_appraisal_score_by_cycle` AS select `pc`.`Cycle_ID` AS `Cycle_ID`,`pc`.`Cycle_Name` AS `Cycle_Name`,round(avg(`a`.`Overall_Score`),2) AS `Avg_Appraisal_Score`,count(0) AS `Appraisals_Count` from (`appraisal` `a` left join `performance_cycle` `pc` on((`pc`.`Cycle_ID` = `a`.`Cycle_ID`))) group by `pc`.`Cycle_ID`,`pc`.`Cycle_Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_appraisal_scores_per_cycle`
--

/*!50001 DROP VIEW IF EXISTS `vw_appraisal_scores_per_cycle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_appraisal_scores_per_cycle` AS select `vw_appraisal_score_by_cycle`.`Cycle_ID` AS `Cycle_ID`,`vw_appraisal_score_by_cycle`.`Cycle_Name` AS `Cycle_Name`,`vw_appraisal_score_by_cycle`.`Avg_Appraisal_Score` AS `Avg_Appraisal_Score`,`vw_appraisal_score_by_cycle`.`Appraisals_Count` AS `Appraisals_Count` from `vw_appraisal_score_by_cycle` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_appraisal_summary_detail`
--

/*!50001 DROP VIEW IF EXISTS `vw_appraisal_summary_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_appraisal_summary_detail` AS select `a`.`Appraisal_ID` AS `Appraisal_ID`,`e`.`Employee_ID` AS `Employee_ID`,concat_ws(' ',`e`.`First_Name`,`e`.`Middle_Name`,`e`.`Last_Name`) AS `Employee_Name`,`d`.`Department_Name` AS `Department_Name`,`j`.`Job_Title` AS `Job_Title`,`pc`.`Cycle_Name` AS `Cycle_Name`,`a`.`Appraisal_Date` AS `Appraisal_Date`,`a`.`Overall_Score` AS `Overall_Score`,`a`.`Manager_Comments` AS `Manager_Comments`,`a`.`HR_Comments` AS `HR_Comments`,`a`.`Employee_Comments` AS `Employee_Comments` from (((((`appraisal` `a` left join `job_assignment` `ja` on((`ja`.`Assignment_ID` = `a`.`Assignment_ID`))) left join `employee` `e` on((`e`.`Employee_ID` = `ja`.`Employee_ID`))) left join `job` `j` on((`j`.`Job_ID` = `ja`.`Job_ID`))) left join `department` `d` on((`d`.`Department_ID` = `j`.`Department_ID`))) left join `performance_cycle` `pc` on((`pc`.`Cycle_ID` = `a`.`Cycle_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_certificates_issued_by_program`
--

/*!50001 DROP VIEW IF EXISTS `vw_certificates_issued_by_program`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_certificates_issued_by_program` AS select `tp`.`Program_ID` AS `Program_ID`,`tp`.`Program_Code` AS `Program_Code`,`tp`.`Title` AS `Program_Title`,count(`tc`.`Certificate_ID`) AS `Certificates_Issued` from ((`training_certificate` `tc` join `employee_training` `et` on((`et`.`ET_ID` = `tc`.`ET_ID`))) join `training_program` `tp` on((`tp`.`Program_ID` = `et`.`Program_ID`))) group by `tp`.`Program_ID`,`tp`.`Program_Code`,`tp`.`Title` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_current_assignment`
--

/*!50001 DROP VIEW IF EXISTS `vw_current_assignment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_current_assignment` AS select `ja`.`Assignment_ID` AS `Assignment_ID`,`ja`.`Employee_ID` AS `Employee_ID`,`ja`.`Job_ID` AS `Job_ID`,`ja`.`Contract_ID` AS `Contract_ID`,`ja`.`Start_Date` AS `Start_Date`,`ja`.`End_Date` AS `End_Date`,`ja`.`Status` AS `Status`,`ja`.`Assigned_Salary` AS `Assigned_Salary` from (`job_assignment` `ja` join (select `job_assignment`.`Employee_ID` AS `Employee_ID`,max(`job_assignment`.`Start_Date`) AS `Max_Start_Date` from `job_assignment` where ((`job_assignment`.`End_Date` is null) or (`job_assignment`.`End_Date` >= curdate())) group by `job_assignment`.`Employee_ID`) `x` on(((`x`.`Employee_ID` = `ja`.`Employee_ID`) and (`ja`.`Start_Date` = `x`.`Max_Start_Date`)))) where ((`ja`.`End_Date` is null) or (`ja`.`End_Date` >= curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_department_structure`
--

/*!50001 DROP VIEW IF EXISTS `vw_department_structure`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_department_structure` AS select `u`.`University_Name` AS `University_Name`,`f`.`Faculty_Name` AS `Faculty_Name`,`d`.`Department_ID` AS `Department_ID`,`d`.`Department_Name` AS `Department_Name`,`d`.`Department_Type` AS `Department_Type`,coalesce(`ed`.`Employee_Count`,0) AS `Employee_Count` from ((((`academic_department` `ad` join `faculty` `f` on((`f`.`Faculty_ID` = `ad`.`Faculty_ID`))) join `university` `u` on((`u`.`University_ID` = `f`.`University_ID`))) join `department` `d` on((`d`.`Department_ID` = `ad`.`Department_ID`))) left join `vw_employees_by_department` `ed` on((`ed`.`Department_ID` = `d`.`Department_ID`))) union all select `u`.`University_Name` AS `University_Name`,NULL AS `Faculty_Name`,`d`.`Department_ID` AS `Department_ID`,`d`.`Department_Name` AS `Department_Name`,`d`.`Department_Type` AS `Department_Type`,coalesce(`ed`.`Employee_Count`,0) AS `Employee_Count` from (((`administrative_department` `adm` join `university` `u` on((`u`.`University_ID` = `adm`.`University_ID`))) join `department` `d` on((`d`.`Department_ID` = `adm`.`Department_ID`))) left join `vw_employees_by_department` `ed` on((`ed`.`Department_ID` = `d`.`Department_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employee_current_job`
--

/*!50001 DROP VIEW IF EXISTS `vw_employee_current_job`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employee_current_job` AS select `e`.`Employee_ID` AS `Employee_ID`,concat_ws(' ',`e`.`First_Name`,`e`.`Middle_Name`,`e`.`Last_Name`) AS `Employee_Name`,`e`.`Gender` AS `Gender`,`e`.`Nationality` AS `Nationality`,`e`.`Employment_Status` AS `Employment_Status`,`e`.`DOB` AS `DOB`,timestampdiff(YEAR,`e`.`DOB`,curdate()) AS `Age`,`sy`.`First_Join_Date` AS `First_Join_Date`,`sy`.`Service_Years` AS `Service_Years`,`ca`.`Assignment_ID` AS `Assignment_ID`,`ca`.`Start_Date` AS `Current_Job_Start_Date`,`ca`.`End_Date` AS `Current_Job_End_Date`,`ca`.`Status` AS `Assignment_Status`,`ca`.`Assigned_Salary` AS `Assigned_Salary`,`j`.`Job_ID` AS `Job_ID`,`j`.`Job_Code` AS `Job_Code`,`j`.`Job_Title` AS `Job_Title`,`j`.`Job_Level` AS `Job_Level`,`j`.`Job_Category` AS `Job_Category`,`j`.`Job_Grade` AS `Job_Grade`,`j`.`Status` AS `Job_Status`,`d`.`Department_ID` AS `Department_ID`,`d`.`Department_Name` AS `Department_Name`,`d`.`Department_Type` AS `Department_Type`,`d`.`Location` AS `Department_Location`,`c`.`Contract_ID` AS `Contract_ID`,`c`.`Contract_Name` AS `Contract_Name`,`c`.`Type` AS `Contract_Type`,`c`.`Work_Modality` AS `Work_Modality` from (((((`employee` `e` left join `vw_employee_service_years` `sy` on((`sy`.`Employee_ID` = `e`.`Employee_ID`))) left join `vw_current_assignment` `ca` on((`ca`.`Employee_ID` = `e`.`Employee_ID`))) left join `job` `j` on((`j`.`Job_ID` = `ca`.`Job_ID`))) left join `department` `d` on((`d`.`Department_ID` = `j`.`Department_ID`))) left join `contract` `c` on((`c`.`Contract_ID` = `ca`.`Contract_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employee_service_years`
--

/*!50001 DROP VIEW IF EXISTS `vw_employee_service_years`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employee_service_years` AS select `ja`.`Employee_ID` AS `Employee_ID`,min(`ja`.`Start_Date`) AS `First_Join_Date`,max(coalesce(`ja`.`End_Date`,curdate())) AS `Service_End_Date`,round((timestampdiff(DAY,min(`ja`.`Start_Date`),max(coalesce(`ja`.`End_Date`,curdate()))) / 365.25),2) AS `Service_Years` from `job_assignment` `ja` where (`ja`.`Start_Date` is not null) group by `ja`.`Employee_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employees_by_department`
--

/*!50001 DROP VIEW IF EXISTS `vw_employees_by_department`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employees_by_department` AS select `vw_employee_current_job`.`Department_ID` AS `Department_ID`,`vw_employee_current_job`.`Department_Name` AS `Department_Name`,count(distinct `vw_employee_current_job`.`Employee_ID`) AS `Employee_Count` from `vw_employee_current_job` group by `vw_employee_current_job`.`Department_ID`,`vw_employee_current_job`.`Department_Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employment_status_distribution`
--

/*!50001 DROP VIEW IF EXISTS `vw_employment_status_distribution`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employment_status_distribution` AS select `employee`.`Employment_Status` AS `Employment_Status`,count(0) AS `Employee_Count` from `employee` group by `employee`.`Employment_Status` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_full_appraisal_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_full_appraisal_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_full_appraisal_summary` AS select `vw_appraisal_summary_detail`.`Appraisal_ID` AS `Appraisal_ID`,`vw_appraisal_summary_detail`.`Employee_ID` AS `Employee_ID`,`vw_appraisal_summary_detail`.`Employee_Name` AS `Employee_Name`,`vw_appraisal_summary_detail`.`Department_Name` AS `Department_Name`,`vw_appraisal_summary_detail`.`Job_Title` AS `Job_Title`,`vw_appraisal_summary_detail`.`Cycle_Name` AS `Cycle_Name`,`vw_appraisal_summary_detail`.`Appraisal_Date` AS `Appraisal_Date`,`vw_appraisal_summary_detail`.`Overall_Score` AS `Overall_Score`,`vw_appraisal_summary_detail`.`Manager_Comments` AS `Manager_Comments`,`vw_appraisal_summary_detail`.`HR_Comments` AS `HR_Comments`,`vw_appraisal_summary_detail`.`Employee_Comments` AS `Employee_Comments` from `vw_appraisal_summary_detail` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_gender_distribution`
--

/*!50001 DROP VIEW IF EXISTS `vw_gender_distribution`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_gender_distribution` AS select `employee`.`Gender` AS `Gender`,count(0) AS `Employee_Count` from `employee` group by `employee`.`Gender` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_job_cards`
--

/*!50001 DROP VIEW IF EXISTS `vw_job_cards`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_job_cards` AS select count(0) AS `Total_Jobs`,sum((case when (`job`.`Status` = 'Open') then 1 else 0 end)) AS `Active_Jobs` from `job` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_job_dim`
--

/*!50001 DROP VIEW IF EXISTS `vw_job_dim`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_job_dim` AS select `j`.`Job_ID` AS `Job_ID`,`j`.`Job_Code` AS `Job_Code`,`j`.`Job_Title` AS `Job_Title`,`j`.`Job_Level` AS `Job_Level`,`j`.`Job_Category` AS `Job_Category`,`j`.`Job_Grade` AS `Job_Grade`,`j`.`Min_Salary` AS `Min_Salary`,`j`.`Max_Salary` AS `Max_Salary`,`j`.`Status` AS `Status_Raw`,(case when (`j`.`Status` = 'Open') then 'Active' else 'Inactive' end) AS `Status_Dashboard`,`j`.`Department_ID` AS `Department_ID`,`d`.`Department_Name` AS `Department_Name`,`d`.`Department_Type` AS `Department_Type`,`j`.`Reports_To` AS `Reports_To` from (`job` `j` left join `department` `d` on((`d`.`Department_ID` = `j`.`Department_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_job_structure_overview`
--

/*!50001 DROP VIEW IF EXISTS `vw_job_structure_overview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_job_structure_overview` AS select `d`.`Department_Name` AS `Department_Name`,`d`.`Department_Type` AS `Department_Type`,`j`.`Job_Level` AS `Job_Level`,`j`.`Job_Category` AS `Job_Category`,`j`.`Job_Code` AS `Job_Code`,`j`.`Job_Title` AS `Job_Title`,`j`.`Job_Grade` AS `Job_Grade`,`j`.`Min_Salary` AS `Min_Salary`,`j`.`Max_Salary` AS `Max_Salary`,`j`.`Status` AS `Job_Status`,`p`.`Job_Title` AS `Reports_To_Job_Title` from ((`job` `j` left join `department` `d` on((`d`.`Department_ID` = `j`.`Department_ID`))) left join `job` `p` on((`p`.`Job_ID` = `j`.`Reports_To`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_jobs_by_level`
--

/*!50001 DROP VIEW IF EXISTS `vw_jobs_by_level`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_jobs_by_level` AS select `job`.`Job_Level` AS `Job_Level`,count(0) AS `Jobs_Count` from `job` group by `job`.`Job_Level` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_kpi_completion_rate_by_cycle`
--

/*!50001 DROP VIEW IF EXISTS `vw_kpi_completion_rate_by_cycle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_kpi_completion_rate_by_cycle` AS select `pc`.`Cycle_ID` AS `Cycle_ID`,`pc`.`Cycle_Name` AS `Cycle_Name`,sum(coalesce(`a`.`Actual_Scores`,0)) AS `Actual_Scores`,sum(coalesce(`kc`.`KPIs_Per_Job`,0)) AS `Expected_Scores`,round((sum(coalesce(`a`.`Actual_Scores`,0)) / nullif(sum(coalesce(`kc`.`KPIs_Per_Job`,0)),0)),4) AS `Completion_Rate` from (((`performance_cycle` `pc` join `job_assignment` `ja` on(((`ja`.`Start_Date` <= coalesce(`pc`.`End_Date`,`pc`.`Submission_Deadline`,curdate())) and ((`ja`.`End_Date` is null) or (`ja`.`End_Date` >= coalesce(`pc`.`Start_Date`,'1900-01-01')))))) left join (select `employee_kpi_score`.`Performance_Cycle_ID` AS `Performance_Cycle_ID`,`employee_kpi_score`.`Assignment_ID` AS `Assignment_ID`,count(distinct `employee_kpi_score`.`KPI_ID`) AS `Actual_Scores` from `employee_kpi_score` where (`employee_kpi_score`.`Employee_Score` is not null) group by `employee_kpi_score`.`Performance_Cycle_ID`,`employee_kpi_score`.`Assignment_ID`) `a` on(((`a`.`Performance_Cycle_ID` = `pc`.`Cycle_ID`) and (`a`.`Assignment_ID` = `ja`.`Assignment_ID`)))) left join (select `jo`.`Job_ID` AS `Job_ID`,count(`ok`.`KPI_ID`) AS `KPIs_Per_Job` from (`job_objective` `jo` join `objective_kpi` `ok` on((`ok`.`Objective_ID` = `jo`.`Objective_ID`))) group by `jo`.`Job_ID`) `kc` on((`kc`.`Job_ID` = `ja`.`Job_ID`))) group by `pc`.`Cycle_ID`,`pc`.`Cycle_Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_kpi_completion_rate_by_cycle_fixed`
--

/*!50001 DROP VIEW IF EXISTS `vw_kpi_completion_rate_by_cycle_fixed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_kpi_completion_rate_by_cycle_fixed` AS select `vw_kpi_completion_rate_by_cycle`.`Cycle_ID` AS `Cycle_ID`,`vw_kpi_completion_rate_by_cycle`.`Cycle_Name` AS `Cycle_Name`,`vw_kpi_completion_rate_by_cycle`.`Actual_Scores` AS `Actual_Scores`,`vw_kpi_completion_rate_by_cycle`.`Expected_Scores` AS `Expected_Scores`,`vw_kpi_completion_rate_by_cycle`.`Completion_Rate` AS `Completion_Rate` from `vw_kpi_completion_rate_by_cycle` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_kpi_completion_rate_overall`
--

/*!50001 DROP VIEW IF EXISTS `vw_kpi_completion_rate_overall`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_kpi_completion_rate_overall` AS select count(0) AS `Total_KPI_Score_Records`,sum((`employee_kpi_score`.`Employee_Score` is not null)) AS `Submitted_KPI_Score_Records`,round((sum((`employee_kpi_score`.`Employee_Score` is not null)) / nullif(count(0),0)),4) AS `KPI_Completion_Rate` from `employee_kpi_score` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_kpi_completion_rate_overall_fixed`
--

/*!50001 DROP VIEW IF EXISTS `vw_kpi_completion_rate_overall_fixed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_kpi_completion_rate_overall_fixed` AS select `vw_kpi_completion_rate_overall`.`Total_KPI_Score_Records` AS `Total_KPI_Score_Records`,`vw_kpi_completion_rate_overall`.`Submitted_KPI_Score_Records` AS `Submitted_KPI_Score_Records`,`vw_kpi_completion_rate_overall`.`KPI_Completion_Rate` AS `KPI_Completion_Rate` from `vw_kpi_completion_rate_overall` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_kpi_fact_dept`
--

/*!50001 DROP VIEW IF EXISTS `vw_kpi_fact_dept`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_kpi_fact_dept` AS select `d`.`Department_Name` AS `Department_Name`,`pc`.`Cycle_Name` AS `Cycle_Name`,`ok`.`KPI_Name` AS `KPI_Name`,`eks`.`Employee_Score` AS `Employee_Score`,`eks`.`Weighted_Score` AS `Weighted_Score` from (((((`employee_kpi_score` `eks` join `performance_cycle` `pc` on((`pc`.`Cycle_ID` = `eks`.`Performance_Cycle_ID`))) join `objective_kpi` `ok` on((`ok`.`KPI_ID` = `eks`.`KPI_ID`))) join `job_assignment` `ja` on((`ja`.`Assignment_ID` = `eks`.`Assignment_ID`))) join `job` `j` on((`j`.`Job_ID` = `ja`.`Job_ID`))) join `department` `d` on((`d`.`Department_ID` = `j`.`Department_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_kpi_score_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_kpi_score_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_kpi_score_summary` AS select `s`.`Performance_Cycle_ID` AS `Cycle_ID`,`pc`.`Cycle_Name` AS `Cycle_Name`,`d`.`Department_Name` AS `Department_Name`,`ok`.`KPI_Name` AS `KPI_Name`,round(avg(`s`.`Employee_Score`),2) AS `Avg_Employee_Score`,round(sum(`s`.`Weighted_Score`),2) AS `Total_Weighted_Score`,count(0) AS `Submitted_Scores` from (((((`employee_kpi_score` `s` left join `performance_cycle` `pc` on((`pc`.`Cycle_ID` = `s`.`Performance_Cycle_ID`))) left join `job_assignment` `ja` on((`ja`.`Assignment_ID` = `s`.`Assignment_ID`))) left join `job` `j` on((`j`.`Job_ID` = `ja`.`Job_ID`))) left join `department` `d` on((`d`.`Department_ID` = `j`.`Department_ID`))) left join `objective_kpi` `ok` on((`ok`.`KPI_ID` = `s`.`KPI_ID`))) group by `s`.`Performance_Cycle_ID`,`pc`.`Cycle_Name`,`d`.`Department_Name`,`ok`.`KPI_Name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_page_perf_training`
--

/*!50001 DROP VIEW IF EXISTS `vw_page_perf_training`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_page_perf_training` AS select 'KPI' AS `Record_Type`,cast(`d`.`Department_ID` as signed) AS `Department_ID`,`d`.`Department_Name` AS `Department_Name`,cast(`pc`.`Cycle_ID` as signed) AS `Cycle_ID`,`pc`.`Cycle_Name` AS `Cycle_Name`,NULL AS `Program_Title`,`ok`.`KPI_Name` AS `KPI_Name`,cast(`eks`.`Employee_Score` as decimal(10,2)) AS `KPI_Score`,cast(`eks`.`Weighted_Score` as decimal(10,2)) AS `KPI_Weighted_Score`,NULL AS `Appraisal_Score`,NULL AS `Completion_Status`,NULL AS `Is_Completed`,NULL AS `Has_Certificate`,cast(`ja`.`Employee_ID` as signed) AS `Employee_ID` from (((((`employee_kpi_score` `eks` join `performance_cycle` `pc` on((`pc`.`Cycle_ID` = `eks`.`Performance_Cycle_ID`))) join `objective_kpi` `ok` on((`ok`.`KPI_ID` = `eks`.`KPI_ID`))) join `job_assignment` `ja` on((`ja`.`Assignment_ID` = `eks`.`Assignment_ID`))) join `job` `j` on((`j`.`Job_ID` = `ja`.`Job_ID`))) join `department` `d` on((`d`.`Department_ID` = `j`.`Department_ID`))) union all select 'APPRAISAL' AS `Record_Type`,cast(`d`.`Department_ID` as signed) AS `Department_ID`,`d`.`Department_Name` AS `Department_Name`,cast(`pc`.`Cycle_ID` as signed) AS `Cycle_ID`,`pc`.`Cycle_Name` AS `Cycle_Name`,NULL AS `Program_Title`,NULL AS `KPI_Name`,NULL AS `KPI_Score`,NULL AS `KPI_Weighted_Score`,cast(`a`.`Overall_Score` as decimal(10,2)) AS `Appraisal_Score`,NULL AS `Completion_Status`,NULL AS `Is_Completed`,NULL AS `Has_Certificate`,cast(`ja`.`Employee_ID` as signed) AS `Employee_ID` from ((((`appraisal` `a` join `performance_cycle` `pc` on((`pc`.`Cycle_ID` = `a`.`Cycle_ID`))) join `job_assignment` `ja` on((`ja`.`Assignment_ID` = `a`.`Assignment_ID`))) join `job` `j` on((`j`.`Job_ID` = `ja`.`Job_ID`))) join `department` `d` on((`d`.`Department_ID` = `j`.`Department_ID`))) union all select 'TRAINING' AS `Record_Type`,cast(`ecj`.`Department_ID` as signed) AS `Department_ID`,`ecj`.`Department_Name` AS `Department_Name`,NULL AS `Cycle_ID`,NULL AS `Cycle_Name`,`tp`.`Title` AS `Program_Title`,NULL AS `KPI_Name`,NULL AS `KPI_Score`,NULL AS `KPI_Weighted_Score`,NULL AS `Appraisal_Score`,`et`.`Completion_Status` AS `Completion_Status`,cast((`et`.`Completion_Status` = 'Completed') as signed) AS `Is_Completed`,cast((`tc`.`Certificate_ID` is not null) as signed) AS `Has_Certificate`,cast(`et`.`Employee_ID` as signed) AS `Employee_ID` from (((`employee_training` `et` join `training_program` `tp` on((`tp`.`Program_ID` = `et`.`Program_ID`))) join `vw_employee_current_job` `ecj` on((`ecj`.`Employee_ID` = `et`.`Employee_ID`))) left join `training_certificate` `tc` on((`tc`.`ET_ID` = `et`.`ET_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_performance_cards`
--

/*!50001 DROP VIEW IF EXISTS `vw_performance_cards`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_performance_cards` AS select cast((select count(0) from `performance_cycle` `pc` where ((coalesce(`pc`.`Submission_Deadline`,`pc`.`End_Date`) is null) or (coalesce(`pc`.`Submission_Deadline`,`pc`.`End_Date`) >= curdate()))) as signed) AS `Active_Performance_Cycles`,cast((select round(avg(`a`.`Overall_Score`),2) from `appraisal` `a`) as decimal(10,2)) AS `Average_Appraisal_Score`,cast((select round((sum((`eks`.`Employee_Score` is not null)) / nullif(count(0),0)),4) from `employee_kpi_score` `eks`) as decimal(10,4)) AS `KPI_Completion_Rate` from (select 1 AS `1`) `dummy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_performance_cycles_status`
--

/*!50001 DROP VIEW IF EXISTS `vw_performance_cycles_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_performance_cycles_status` AS select `performance_cycle`.`Cycle_ID` AS `Cycle_ID`,`performance_cycle`.`Cycle_Name` AS `Cycle_Name`,`performance_cycle`.`Cycle_Type` AS `Cycle_Type`,`performance_cycle`.`Start_Date` AS `Start_Date`,`performance_cycle`.`End_Date` AS `End_Date`,`performance_cycle`.`Submission_Deadline` AS `Submission_Deadline`,(case when (coalesce(`performance_cycle`.`Submission_Deadline`,`performance_cycle`.`End_Date`) is null) then 1 when (coalesce(`performance_cycle`.`Submission_Deadline`,`performance_cycle`.`End_Date`) >= curdate()) then 1 else 0 end) AS `Is_Open` from `performance_cycle` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_salary_stats_by_job_category`
--

/*!50001 DROP VIEW IF EXISTS `vw_salary_stats_by_job_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_salary_stats_by_job_category` AS select `j`.`Job_Category` AS `Job_Category`,round(avg(`j`.`Min_Salary`),2) AS `Avg_Min_Salary`,round(avg(`j`.`Max_Salary`),2) AS `Avg_Max_Salary`,round(avg(`ca`.`Assigned_Salary`),2) AS `Avg_Assigned_Salary` from (`job` `j` left join `vw_current_assignment` `ca` on((`ca`.`Job_ID` = `j`.`Job_ID`))) group by `j`.`Job_Category` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_training_cards`
--

/*!50001 DROP VIEW IF EXISTS `vw_training_cards`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_training_cards` AS select cast((select count(0) from `training_program`) as signed) AS `Total_Training_Programs`,cast((select count(0) from `training_certificate`) as signed) AS `Total_Certificates_Issued`,cast((select round((sum((`et`.`Completion_Status` = 'Completed')) / nullif(count(0),0)),4) from `employee_training` `et`) as decimal(10,4)) AS `Training_Completion_Rate` from (select 1 AS `1`) `dummy` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_training_completion_per_program`
--

/*!50001 DROP VIEW IF EXISTS `vw_training_completion_per_program`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_training_completion_per_program` AS select `vw_training_fact`.`Program_ID` AS `Program_ID`,`vw_training_fact`.`Program_Code` AS `Program_Code`,`vw_training_fact`.`Program_Title` AS `Program_Title`,sum((case when (`vw_training_fact`.`Completion_Status` = 'Completed') then 1 else 0 end)) AS `Completed_Count`,count(0) AS `Total_Assignments`,round((sum((case when (`vw_training_fact`.`Completion_Status` = 'Completed') then 1 else 0 end)) / nullif(count(0),0)),4) AS `Completion_Rate` from `vw_training_fact` group by `vw_training_fact`.`Program_ID`,`vw_training_fact`.`Program_Code`,`vw_training_fact`.`Program_Title` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_training_completion_rate_overall`
--

/*!50001 DROP VIEW IF EXISTS `vw_training_completion_rate_overall`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_training_completion_rate_overall` AS select count(0) AS `Total_Training_Enrollments`,sum((`employee_training`.`Completion_Status` = 'Completed')) AS `Completed_Enrollments`,round((sum((`employee_training`.`Completion_Status` = 'Completed')) / nullif(count(0),0)),4) AS `Training_Completion_Rate` from `employee_training` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_training_fact`
--

/*!50001 DROP VIEW IF EXISTS `vw_training_fact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_training_fact` AS select `et`.`ET_ID` AS `ET_ID`,`et`.`Employee_ID` AS `Employee_ID`,concat_ws(' ',`e`.`First_Name`,`e`.`Middle_Name`,`e`.`Last_Name`) AS `Employee_Name`,`tp`.`Program_ID` AS `Program_ID`,`tp`.`Program_Code` AS `Program_Code`,`tp`.`Title` AS `Program_Title`,`tp`.`Type` AS `Program_Type`,`tp`.`Subtype` AS `Program_Subtype`,`tp`.`Delivery_Method` AS `Delivery_Method`,`tp`.`Approval_Status` AS `Approval_Status`,coalesce(`ecj`.`Department_Name`,'Unassigned') AS `Department_Name`,`et`.`Completion_Status` AS `Completion_Status` from (((`employee_training` `et` join `employee` `e` on((`e`.`Employee_ID` = `et`.`Employee_ID`))) join `training_program` `tp` on((`tp`.`Program_ID` = `et`.`Program_ID`))) left join `vw_employee_current_job` `ecj` on((`ecj`.`Employee_ID` = `e`.`Employee_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_training_fact_dept`
--

/*!50001 DROP VIEW IF EXISTS `vw_training_fact_dept`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_training_fact_dept` AS select `ecj`.`Department_Name` AS `Department_Name`,`tp`.`Title` AS `Program_Title`,`et`.`Employee_ID` AS `Employee_ID`,`et`.`Completion_Status` AS `Completion_Status`,(case when (`tc`.`Certificate_ID` is not null) then 1 else 0 end) AS `Has_Certificate` from (((`employee_training` `et` join `training_program` `tp` on((`tp`.`Program_ID` = `et`.`Program_ID`))) join `vw_employee_current_job` `ecj` on((`ecj`.`Employee_ID` = `et`.`Employee_ID`))) left join `training_certificate` `tc` on((`tc`.`ET_ID` = `et`.`ET_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_training_participation`
--

/*!50001 DROP VIEW IF EXISTS `vw_training_participation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_training_participation` AS select `vw_training_fact`.`Program_ID` AS `Program_ID`,`vw_training_fact`.`Program_Code` AS `Program_Code`,`vw_training_fact`.`Program_Title` AS `Program_Title`,count(distinct `vw_training_fact`.`Employee_ID`) AS `Participants_Count` from `vw_training_fact` group by `vw_training_fact`.`Program_ID`,`vw_training_fact`.`Program_Code`,`vw_training_fact`.`Program_Title` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_workforce_cards`
--

/*!50001 DROP VIEW IF EXISTS `vw_workforce_cards`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_workforce_cards` AS select (select count(0) from `employee`) AS `Total_Employees`,(select count(0) from `employee` where (`employee`.`Employment_Status` = 'Active')) AS `Active_Employees`,(select round(avg(timestampdiff(YEAR,`employee`.`DOB`,curdate())),2) from `employee` where (`employee`.`DOB` is not null)) AS `Average_Employee_Age`,(select round(avg(`vw_employee_service_years`.`Service_Years`),2) from `vw_employee_service_years`) AS `Average_Service_Years` */;
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

-- Dump completed on 2025-12-18 21:35:11
