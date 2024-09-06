-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: client_management
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Addresses`
--

DROP TABLE IF EXISTS `Addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Addresses` (
  `idAddress` int NOT NULL AUTO_INCREMENT,
  `idClient` int NOT NULL,
  `state` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `number` varchar(50) NOT NULL,
  `complement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idAddress`),
  KEY `Addresses_ibfk_1` (`idClient`),
  CONSTRAINT `Addresses_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `Clients` (`idClient`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Addresses`
--

LOCK TABLES `Addresses` WRITE;
/*!40000 ALTER TABLE `Addresses` DISABLE KEYS */;
INSERT INTO `Addresses` VALUES (1,1,'SP','Rua das Flores','São Paulo','123','Apto 12'),(2,1,'RJ','Av. Atlântica','Rio de Janeiro','456',NULL),(3,2,'MG','Rua da Harmonia','Belo Horizonte','789','Casa'),(4,3,'SP','Rua da Harmonia','Presidente Prudente','789','Casa');
/*!40000 ALTER TABLE `Addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `company_name` varchar(45) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `idClient_UNIQUE` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Client infos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES (1,'John Doe','Tech Fieds','2024-09-06 16:59:22','2024-09-06 16:59:22'),(2,'Amanda Rick','MoreTech','2024-09-06 16:59:50','2024-09-06 16:59:50'),(3,'Pedro Marcus','LTDA Font','2024-09-06 17:00:14','2024-09-06 17:00:14');
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhoneTypes`
--

DROP TABLE IF EXISTS `PhoneTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PhoneTypes` (
  `idPhoneType` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPhoneType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='PhoneTypes for client phone.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhoneTypes`
--

LOCK TABLES `PhoneTypes` WRITE;
/*!40000 ALTER TABLE `PhoneTypes` DISABLE KEYS */;
INSERT INTO `PhoneTypes` VALUES (1,'residencial','2024-09-06 17:00:53','2024-09-06 17:00:53'),(2,'comercial','2024-09-06 17:00:58','2024-09-06 17:00:58'),(3,'celular','2024-09-06 17:01:05','2024-09-06 17:01:05');
/*!40000 ALTER TABLE `PhoneTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Phones`
--

DROP TABLE IF EXISTS `Phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Phones` (
  `idPhone` int NOT NULL AUTO_INCREMENT,
  `number` varchar(14) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idClient` int NOT NULL,
  `idPhoneType` int NOT NULL,
  PRIMARY KEY (`idPhone`),
  UNIQUE KEY `idPhone_UNIQUE` (`idPhone`),
  UNIQUE KEY `number_UNIQUE` (`number`),
  KEY `fk_Phones_Clients_idx` (`idClient`),
  KEY `fk_Phones_PhoneTypes1_idx` (`idPhoneType`),
  CONSTRAINT `idClient` FOREIGN KEY (`idClient`) REFERENCES `Clients` (`idClient`),
  CONSTRAINT `idType` FOREIGN KEY (`idPhoneType`) REFERENCES `PhoneTypes` (`idPhoneType`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Phone clients table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Phones`
--

LOCK TABLES `Phones` WRITE;
/*!40000 ALTER TABLE `Phones` DISABLE KEYS */;
INSERT INTO `Phones` VALUES (1,'14998309564','2024-09-06 17:02:11','2024-09-06 17:02:11',1,1),(2,'14993827384','2024-09-06 17:32:29','2024-09-06 17:32:29',3,3);
/*!40000 ALTER TABLE `Phones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-06 17:43:44
