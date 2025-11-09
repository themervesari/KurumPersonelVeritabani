CREATE DATABASE  IF NOT EXISTS `kurumpersonel` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kurumpersonel`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: kurumpersonel
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
-- Table structure for table `personelbilgileri`
--

DROP TABLE IF EXISTS `personelbilgileri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personelbilgileri` (
  `PersonelID` int NOT NULL AUTO_INCREMENT,
  `KurumID` int NOT NULL,
  `GorevID` int NOT NULL,
  `Ad` varchar(100) COLLATE utf8mb3_turkish_ci NOT NULL,
  `Soyad` varchar(100) COLLATE utf8mb3_turkish_ci NOT NULL,
  `TCKimlikNumarası` char(11) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `SicilNumarası` varchar(45) COLLATE utf8mb3_turkish_ci NOT NULL,
  `DogumTarihi` date DEFAULT NULL,
  `Unvan` varchar(45) COLLATE utf8mb3_turkish_ci NOT NULL,
  `Branş` varchar(45) COLLATE utf8mb3_turkish_ci NOT NULL,
  `IseGirisTarihi` date DEFAULT NULL,
  `AdaylıkDurumu` varchar(45) COLLATE utf8mb3_turkish_ci NOT NULL,
  `PersonelDurumu` enum('Aktif','İzinli','Ayrıldı') COLLATE utf8mb3_turkish_ci DEFAULT 'Aktif',
  `Adres` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `Telefon` varchar(30) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `EPosta` varchar(100) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `İstihdamSekli` varchar(150) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `OlusturmaZamani` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PersonelID`),
  UNIQUE KEY `TCKimlikNumarası_UNIQUE` (`TCKimlikNumarası`),
  KEY `PersonelKurumID` (`KurumID`),
  KEY `PersonelGorevID` (`GorevID`),
  CONSTRAINT `PersonelGorevID` FOREIGN KEY (`GorevID`) REFERENCES `gorevbilgileri` (`GorevID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `PersonelKurumID` FOREIGN KEY (`KurumID`) REFERENCES `kurumbilgileri` (`KurumID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personelbilgileri`
--

LOCK TABLES `personelbilgileri` WRITE;
/*!40000 ALTER TABLE `personelbilgileri` DISABLE KEYS */;
/*!40000 ALTER TABLE `personelbilgileri` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-09 21:02:19
