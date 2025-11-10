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
-- Table structure for table `birimbilgileri`
--

DROP TABLE IF EXISTS `birimbilgileri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `birimbilgileri` (
  `BirimID` int NOT NULL,
  `KurumID` int DEFAULT NULL,
  `BirimAdi` varchar(150) COLLATE utf8mb3_turkish_ci NOT NULL,
  `OlusturmaZamani` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BirimID`),
  KEY `BirimBilgileriKurumID` (`KurumID`),
  CONSTRAINT `BirimBilgileriKurumID` FOREIGN KEY (`KurumID`) REFERENCES `kurumbilgileri` (`KurumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `birimbilgileri`
--

LOCK TABLES `birimbilgileri` WRITE;
/*!40000 ALTER TABLE `birimbilgileri` DISABLE KEYS */;
/*!40000 ALTER TABLE `birimbilgileri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egitimbilgileri`
--

DROP TABLE IF EXISTS `egitimbilgileri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `egitimbilgileri` (
  `EgitimID` int NOT NULL AUTO_INCREMENT,
  `PersonelID` int DEFAULT NULL,
  `TahsilTuru` enum('Lise','Ön Lisans','Lisans','Yüksek Lisans','Doktora') COLLATE utf8mb3_turkish_ci DEFAULT 'Lisans',
  `LiseAdi` varchar(200) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `UniversiteAdi` varchar(200) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `FakulteAdi` varchar(150) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `BolumAdi` varchar(150) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `DiplomaNo` varchar(50) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `MezuniyetTarihi` date DEFAULT NULL,
  `OlusturmaZamani` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EgitimID`),
  KEY `EgitimPersonelID` (`PersonelID`),
  CONSTRAINT `EgitimPersonelID` FOREIGN KEY (`PersonelID`) REFERENCES `personelbilgileri` (`PersonelID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egitimbilgileri`
--

LOCK TABLES `egitimbilgileri` WRITE;
/*!40000 ALTER TABLE `egitimbilgileri` DISABLE KEYS */;
/*!40000 ALTER TABLE `egitimbilgileri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gorevbilgileri`
--

DROP TABLE IF EXISTS `gorevbilgileri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gorevbilgileri` (
  `GorevID` int NOT NULL AUTO_INCREMENT,
  `KurumID` int DEFAULT NULL,
  `Birim` varchar(100) COLLATE utf8mb3_turkish_ci NOT NULL,
  `OlusturmaZamani` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `BaslangicTarihi` date DEFAULT NULL,
  `BitisTarihi` date NOT NULL,
  `AyrilisTarihi` date NOT NULL,
  PRIMARY KEY (`GorevID`),
  KEY `GorevKurumID` (`KurumID`),
  CONSTRAINT `GorevKurumID` FOREIGN KEY (`KurumID`) REFERENCES `birimbilgileri` (`KurumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gorevbilgileri`
--

LOCK TABLES `gorevbilgileri` WRITE;
/*!40000 ALTER TABLE `gorevbilgileri` DISABLE KEYS */;
/*!40000 ALTER TABLE `gorevbilgileri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gorevyeri`
--

DROP TABLE IF EXISTS `gorevyeri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gorevyeri` (
  `GorevYeriID` int NOT NULL AUTO_INCREMENT,
  `KurumID` int DEFAULT NULL,
  `OlusturmaZamani` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`GorevYeriID`),
  KEY `GorevYeriKurumID` (`KurumID`),
  CONSTRAINT `GorevYeriKurumID` FOREIGN KEY (`KurumID`) REFERENCES `kurumbilgileri` (`KurumID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gorevyeri`
--

LOCK TABLES `gorevyeri` WRITE;
/*!40000 ALTER TABLE `gorevyeri` DISABLE KEYS */;
/*!40000 ALTER TABLE `gorevyeri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanici` (
  `KullaniciID` int NOT NULL AUTO_INCREMENT,
  `PersonelID` int DEFAULT NULL,
  `KullaniciAdi` varchar(100) COLLATE utf8mb3_turkish_ci NOT NULL,
  `SifreHash` varchar(255) COLLATE utf8mb3_turkish_ci NOT NULL,
  `kullanicicol` varchar(45) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `Aktif` tinyint NOT NULL DEFAULT '1',
  `OlusturmaZamani` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`KullaniciID`),
  UNIQUE KEY `KullaniciAdi_UNIQUE` (`KullaniciAdi`),
  KEY `KullaniciPersonelID` (`PersonelID`),
  CONSTRAINT `KullaniciPersonelID` FOREIGN KEY (`PersonelID`) REFERENCES `personelbilgileri` (`PersonelID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanici`
--

LOCK TABLES `kullanici` WRITE;
/*!40000 ALTER TABLE `kullanici` DISABLE KEYS */;
/*!40000 ALTER TABLE `kullanici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanicirol`
--

DROP TABLE IF EXISTS `kullanicirol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanicirol` (
  `KullaniciRolID` int NOT NULL AUTO_INCREMENT,
  `KullaniciID` int NOT NULL,
  `RolID` int NOT NULL,
  `VerilisTarihi` date DEFAULT NULL,
  PRIMARY KEY (`KullaniciRolID`),
  KEY `KullaniciRolKullaniciID` (`KullaniciID`),
  KEY `KullaniciRolRolID` (`RolID`),
  CONSTRAINT `KullaniciRolKullaniciID` FOREIGN KEY (`KullaniciID`) REFERENCES `kullanici` (`KullaniciID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `KullaniciRolRolID` FOREIGN KEY (`RolID`) REFERENCES `rol` (`RolID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanicirol`
--

LOCK TABLES `kullanicirol` WRITE;
/*!40000 ALTER TABLE `kullanicirol` DISABLE KEYS */;
/*!40000 ALTER TABLE `kullanicirol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kurumbilgileri`
--

DROP TABLE IF EXISTS `kurumbilgileri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kurumbilgileri` (
  `KurumID` int NOT NULL AUTO_INCREMENT,
  `KurumAdi` varchar(150) COLLATE utf8mb3_turkish_ci NOT NULL,
  `Adres` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `Telefon` varchar(30) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `EPosta` varchar(50) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `KepAdresi` varchar(100) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `OlusturmaZamani` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`KurumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kurumbilgileri`
--

LOCK TABLES `kurumbilgileri` WRITE;
/*!40000 ALTER TABLE `kurumbilgileri` DISABLE KEYS */;
/*!40000 ALTER TABLE `kurumbilgileri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personelbilgileri`
--

DROP TABLE IF EXISTS `personelbilgileri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personelbilgileri` (
  `PersonelID` int NOT NULL AUTO_INCREMENT,
  `Ad` varchar(100) COLLATE utf8mb3_turkish_ci NOT NULL,
  `Soyad` varchar(100) COLLATE utf8mb3_turkish_ci NOT NULL,
  `TCKimlikNumarası` varbinary(255) DEFAULT NULL,
  `SicilNumarası` varchar(45) COLLATE utf8mb3_turkish_ci NOT NULL,
  `DogumTarihi` date DEFAULT NULL,
  `Unvan` varchar(45) COLLATE utf8mb3_turkish_ci NOT NULL,
  `Brans` varchar(45) COLLATE utf8mb3_turkish_ci NOT NULL,
  `IseGirisTarihi` date DEFAULT NULL,
  `AdaylıkDurumu` varchar(45) COLLATE utf8mb3_turkish_ci NOT NULL,
  `PersonelDurumu` enum('Aktif','İzinli','Ayrıldı') COLLATE utf8mb3_turkish_ci DEFAULT 'Aktif',
  `Adres` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `Telefon` varchar(30) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `EPosta` varchar(100) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `İstihdamSekli` varchar(150) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `OlusturmaZamani` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PersonelID`),
  UNIQUE KEY `TCKimlikNumarası_UNIQUE` (`TCKimlikNumarası`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personelbilgileri`
--

LOCK TABLES `personelbilgileri` WRITE;
/*!40000 ALTER TABLE `personelbilgileri` DISABLE KEYS */;
/*!40000 ALTER TABLE `personelbilgileri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personelgorevyeri`
--

DROP TABLE IF EXISTS `personelgorevyeri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personelgorevyeri` (
  `personelgorevyeriID` int NOT NULL AUTO_INCREMENT,
  `PersonelID` int NOT NULL,
  `GorevYeriID` int DEFAULT NULL,
  `BaslangicTarihi` date NOT NULL,
  `BitisTarihi` date NOT NULL,
  `OlusturmaZamani` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`personelgorevyeriID`),
  KEY `personelgorevyeriPersonelID` (`PersonelID`),
  KEY `personelgorevyeriGorevYeriID` (`GorevYeriID`),
  CONSTRAINT `personelgorevyeriGorevYeriID` FOREIGN KEY (`GorevYeriID`) REFERENCES `gorevyeri` (`GorevYeriID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `personelgorevyeriPersonelID` FOREIGN KEY (`PersonelID`) REFERENCES `personelbilgileri` (`PersonelID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personelgorevyeri`
--

LOCK TABLES `personelgorevyeri` WRITE;
/*!40000 ALTER TABLE `personelgorevyeri` DISABLE KEYS */;
/*!40000 ALTER TABLE `personelgorevyeri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `RolID` int NOT NULL AUTO_INCREMENT,
  `RolAdi` varchar(100) COLLATE utf8mb3_turkish_ci NOT NULL,
  `Aciklama` varchar(255) COLLATE utf8mb3_turkish_ci DEFAULT NULL,
  `OlusturmaZamani` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RolID`),
  UNIQUE KEY `RolAdi_UNIQUE` (`RolAdi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-10 22:45:14
