CREATE DATABASE  IF NOT EXISTS `gestiunea_vanzarilor` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestiunea_vanzarilor`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: gestiunea_vanzarilor
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
-- Table structure for table `bonuri_receptie`
--

DROP TABLE IF EXISTS `bonuri_receptie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonuri_receptie` (
  `nr_bon` int NOT NULL AUTO_INCREMENT,
  `data_bon` date NOT NULL,
  `cod_gestiune` int NOT NULL,
  PRIMARY KEY (`nr_bon`),
  KEY `FK_bonuri_receptie_1` (`cod_gestiune`),
  CONSTRAINT `FK_bonuri_receptie_1` FOREIGN KEY (`cod_gestiune`) REFERENCES `gestiuni` (`cod_gest`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonuri_receptie`
--

LOCK TABLES `bonuri_receptie` WRITE;
/*!40000 ALTER TABLE `bonuri_receptie` DISABLE KEYS */;
INSERT INTO `bonuri_receptie` VALUES (1,'2020-09-14',1),(2,'2014-12-24',2),(3,'2011-02-01',3);
/*!40000 ALTER TABLE `bonuri_receptie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `cod_client` int NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) NOT NULL,
  `adresa` varchar(45) NOT NULL,
  `telefon` varchar(17) NOT NULL,
  PRIMARY KEY (`cod_client`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'Yazgul Charyyeva','Vasile Goldis 15','213321'),(2,'Bobu Vlad','Vasile Goldis 3','1345132'),(3,'Coibu Ion','Petru Rares 13','524612');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalii_bon`
--

DROP TABLE IF EXISTS `detalii_bon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalii_bon` (
  `nr_bon` int NOT NULL,
  `cantitate` int NOT NULL,
  `cod_produs` int NOT NULL,
  KEY `FK_detalii_bon_1` (`nr_bon`),
  KEY `FK_detalii_bon_2` (`cod_produs`),
  CONSTRAINT `FK_detalii_bon_1` FOREIGN KEY (`nr_bon`) REFERENCES `bonuri_receptie` (`nr_bon`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_detalii_bon_2` FOREIGN KEY (`cod_produs`) REFERENCES `produse` (`cod_produs`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalii_bon`
--

LOCK TABLES `detalii_bon` WRITE;
/*!40000 ALTER TABLE `detalii_bon` DISABLE KEYS */;
INSERT INTO `detalii_bon` VALUES (1,10,1),(2,5,2),(3,15,3);
/*!40000 ALTER TABLE `detalii_bon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalii_fact`
--

DROP TABLE IF EXISTS `detalii_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalii_fact` (
  `nr_fact` int NOT NULL,
  `cod_prod` int NOT NULL,
  `cantitatea` int NOT NULL,
  `pret_fact` double NOT NULL,
  `cota_tva` int NOT NULL,
  `serie_fact` double NOT NULL,
  KEY `FK_detalii_fact_1` (`nr_fact`),
  KEY `FK_detalii_fact_2` (`cod_prod`),
  CONSTRAINT `FK_detalii_fact_1` FOREIGN KEY (`nr_fact`) REFERENCES `facturi` (`nr_fact`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_detalii_fact_2` FOREIGN KEY (`cod_prod`) REFERENCES `produse` (`cod_produs`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalii_fact`
--

LOCK TABLES `detalii_fact` WRITE;
/*!40000 ALTER TABLE `detalii_fact` DISABLE KEYS */;
INSERT INTO `detalii_fact` VALUES (1,2,10,25.5,10,12),(2,1,1,12,11,10),(3,3,20,256.2,5,11);
/*!40000 ALTER TABLE `detalii_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturi`
--

DROP TABLE IF EXISTS `facturi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturi` (
  `nr_fact` int NOT NULL AUTO_INCREMENT,
  `seria_fact` int NOT NULL,
  `data_fact` date NOT NULL,
  `cod_client` int NOT NULL,
  `cod_gest` int NOT NULL,
  `nr_fact_stornata` int NOT NULL,
  `seria_fact_stornata` int NOT NULL,
  PRIMARY KEY (`nr_fact`,`seria_fact`),
  KEY `FK_facturi_1` (`cod_client`),
  KEY `FK_facturi_2` (`cod_gest`),
  CONSTRAINT `FK_facturi_1` FOREIGN KEY (`cod_client`) REFERENCES `clienti` (`cod_client`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_facturi_2` FOREIGN KEY (`cod_gest`) REFERENCES `gestiuni` (`cod_gest`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturi`
--

LOCK TABLES `facturi` WRITE;
/*!40000 ALTER TABLE `facturi` DISABLE KEYS */;
INSERT INTO `facturi` VALUES (1,1,'2020-10-09',1,1,1,2),(2,2,'2009-12-26',2,2,4,5),(3,3,'2011-02-19',3,3,3,2);
/*!40000 ALTER TABLE `facturi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestiuni`
--

DROP TABLE IF EXISTS `gestiuni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestiuni` (
  `cod_gest` int NOT NULL AUTO_INCREMENT,
  `nume_gest` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_gest`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestiuni`
--

LOCK TABLES `gestiuni` WRITE;
/*!40000 ALTER TABLE `gestiuni` DISABLE KEYS */;
INSERT INTO `gestiuni` VALUES (1,'Imprumut'),(2,'Vanzare'),(3,'Cumparare');
/*!40000 ALTER TABLE `gestiuni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produse`
--

DROP TABLE IF EXISTS `produse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produse` (
  `cod_produs` int NOT NULL AUTO_INCREMENT,
  `denumire_prod` varchar(45) NOT NULL,
  `unitate_de_masura` varchar(45) NOT NULL,
  `stoc_initial` int NOT NULL,
  PRIMARY KEY (`cod_produs`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produse`
--

LOCK TABLES `produse` WRITE;
/*!40000 ALTER TABLE `produse` DISABLE KEYS */;
INSERT INTO `produse` VALUES (1,'Pixuri','10 buc.',8),(2,'Paine','50 buc.',10),(3,'Lapte','litri',20);
/*!40000 ALTER TABLE `produse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gestiunea_vanzarilor'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-13 16:26:12
