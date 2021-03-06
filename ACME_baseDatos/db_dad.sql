-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: DAD_ACME
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dispositivo`
--

DROP TABLE IF EXISTS `dispositivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dispositivo` (
  `idDispositivo` int(11) NOT NULL AUTO_INCREMENT,
  `aliasDisp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDispositivo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivo`
--

LOCK TABLES `dispositivo` WRITE;
/*!40000 ALTER TABLE `dispositivo` DISABLE KEYS */;
INSERT INTO `dispositivo` VALUES (1,'disp_01');
/*!40000 ALTER TABLE `dispositivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enchufe`
--

DROP TABLE IF EXISTS `enchufe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `enchufe` (
  `idEnchufe` int(11) NOT NULL AUTO_INCREMENT,
  `idDispositivo` int(11) NOT NULL,
  `aliasEnchufe` varchar(45) NOT NULL,
  PRIMARY KEY (`idEnchufe`),
  UNIQUE KEY `aliasEnchufe_UNIQUE` (`aliasEnchufe`) /*!80000 INVISIBLE */,
  KEY `fk_dispositivo_enchufe_idx` (`idDispositivo`),
  CONSTRAINT `fk_dispositivo_enchufe` FOREIGN KEY (`idDispositivo`) REFERENCES `dispositivo` (`idDispositivo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enchufe`
--

LOCK TABLES `enchufe` WRITE;
/*!40000 ALTER TABLE `enchufe` DISABLE KEYS */;
INSERT INTO `enchufe` VALUES (1,1,'ench_01'),(2,1,'ench_02'),(3,1,'ench_03'),(4,1,'ench_04');
/*!40000 ALTER TABLE `enchufe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `idEnchufe` int(11) NOT NULL,
  `estado_enchufe` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fecha` float NOT NULL COMMENT 'Formato UNIX',
  PRIMARY KEY (`idEstado`),
  KEY `fk_enchufe_estado_idx` (`idEnchufe`),
  CONSTRAINT `fk_enchufe_estado` FOREIGN KEY (`idEnchufe`) REFERENCES `enchufe` (`idEnchufe`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,1,'1',1235460000),(2,2,'0',123457000000),(3,3,'0',147852000000000),(4,4,'1',7.41853e17);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `historico` (
  `idhistorico` int(11) NOT NULL AUTO_INCREMENT,
  `idEnchufe` int(11) NOT NULL,
  `consumo` varchar(45) NOT NULL,
  `fecha` float NOT NULL COMMENT 'Formato UNIX',
  PRIMARY KEY (`idhistorico`),
  KEY `fk_enchufe_historico_idx` (`idEnchufe`),
  CONSTRAINT `fk_enchufe_historico` FOREIGN KEY (`idEnchufe`) REFERENCES `enchufe` (`idEnchufe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (1,1,'25',1.23457e16),(2,2,'0',7.41257e18),(3,3,'0',7.41257e15),(4,4,'7',1.45787e15);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacionuserdisp`
--

DROP TABLE IF EXISTS `relacionuserdisp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `relacionuserdisp` (
  `idDispositivo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idRelacion` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idRelacion`),
  UNIQUE KEY `idRelacion_UNIQUE` (`idRelacion`),
  UNIQUE KEY `unique` (`idUsuario`,`idDispositivo`),
  KEY `fk_dispositivo_tabla_idx` (`idDispositivo`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_dispositivo_tabla` FOREIGN KEY (`idDispositivo`) REFERENCES `dispositivo` (`idDispositivo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_tabla` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla relacional entre Usuario y Dispositivo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacionuserdisp`
--

LOCK TABLES `relacionuserdisp` WRITE;
/*!40000 ALTER TABLE `relacionuserdisp` DISABLE KEYS */;
INSERT INTO `relacionuserdisp` VALUES (1,1,15),(1,2,16),(1,3,17);
/*!40000 ALTER TABLE `relacionuserdisp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `aliasUsuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'victor'),(2,'jose'),(3,'ale'),(4,'pedro'),(5,'pedro');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-22 18:48:32
