CREATE DATABASE  IF NOT EXISTS `veterinaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `veterinaria`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: veterinaria
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase` (
  `id_dominio` int NOT NULL,
  `id_reino` int NOT NULL,
  `id_filo` int NOT NULL,
  `id_clase` int NOT NULL,
  `clase` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dominio`,`id_reino`,`id_filo`,`id_clase`),
  CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`id_dominio`) REFERENCES `dominio` (`id_dominio`),
  CONSTRAINT `clase_ibfk_2` FOREIGN KEY (`id_dominio`, `id_reino`) REFERENCES `reino` (`id_dominio`, `id_reino`),
  CONSTRAINT `clase_ibfk_3` FOREIGN KEY (`id_dominio`, `id_reino`, `id_filo`) REFERENCES `filo` (`id_dominio`, `id_reino`, `id_filo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (1,1,1,1,'Mammalia');
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id_consulta` int NOT NULL AUTO_INCREMENT,
  `id_propietario` int NOT NULL,
  `id_mascota` int NOT NULL,
  `id_veterinario` int NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `id_propietario` (`id_propietario`),
  KEY `id_mascota` (`id_mascota`),
  KEY `id_veterinario` (`id_veterinario`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietario` (`id_propietario`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`),
  CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,1,1,1,'2025-09-01 10:00:00','Vacunación antirrábica'),(2,2,2,2,'2025-09-02 15:00:00','Control general');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta_insumo`
--

DROP TABLE IF EXISTS `consulta_insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta_insumo` (
  `id_consulta_insumo` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int NOT NULL,
  `id_insumo` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_consulta_insumo`),
  KEY `id_consulta` (`id_consulta`),
  KEY `id_insumo` (`id_insumo`),
  CONSTRAINT `consulta_insumo_ibfk_1` FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`),
  CONSTRAINT `consulta_insumo_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `insumo` (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta_insumo`
--

LOCK TABLES `consulta_insumo` WRITE;
/*!40000 ALTER TABLE `consulta_insumo` DISABLE KEYS */;
INSERT INTO `consulta_insumo` VALUES (1,1,1,1),(2,1,2,1),(3,2,2,1);
/*!40000 ALTER TABLE `consulta_insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dominio`
--

DROP TABLE IF EXISTS `dominio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dominio` (
  `id_dominio` int NOT NULL AUTO_INCREMENT,
  `dominio` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dominio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dominio`
--

LOCK TABLES `dominio` WRITE;
/*!40000 ALTER TABLE `dominio` DISABLE KEYS */;
INSERT INTO `dominio` VALUES (1,'Eukarya');
/*!40000 ALTER TABLE `dominio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especie`
--

DROP TABLE IF EXISTS `especie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especie` (
  `id_dominio` int NOT NULL,
  `id_reino` int NOT NULL,
  `id_filo` int NOT NULL,
  `id_clase` int NOT NULL,
  `id_orden` int NOT NULL,
  `id_familia` int NOT NULL,
  `id_genero` int NOT NULL,
  `id_especie` int NOT NULL,
  `especie` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dominio`,`id_reino`,`id_filo`,`id_clase`,`id_orden`,`id_familia`,`id_genero`,`id_especie`),
  CONSTRAINT `especie_ibfk_1` FOREIGN KEY (`id_dominio`, `id_reino`, `id_filo`, `id_clase`, `id_orden`, `id_familia`, `id_genero`) REFERENCES `genero` (`id_dominio`, `id_reino`, `id_filo`, `id_clase`, `id_orden`, `id_familia`, `id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especie`
--

LOCK TABLES `especie` WRITE;
/*!40000 ALTER TABLE `especie` DISABLE KEYS */;
INSERT INTO `especie` VALUES (1,1,1,1,1,1,1,1,'Canis lupus familiaris');
/*!40000 ALTER TABLE `especie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familia`
--

DROP TABLE IF EXISTS `familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familia` (
  `id_dominio` int NOT NULL,
  `id_reino` int NOT NULL,
  `id_filo` int NOT NULL,
  `id_clase` int NOT NULL,
  `id_orden` int NOT NULL,
  `id_familia` int NOT NULL,
  `familia` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dominio`,`id_reino`,`id_filo`,`id_clase`,`id_orden`,`id_familia`),
  CONSTRAINT `familia_ibfk_1` FOREIGN KEY (`id_dominio`, `id_reino`, `id_filo`, `id_clase`, `id_orden`) REFERENCES `orden` (`id_dominio`, `id_reino`, `id_filo`, `id_clase`, `id_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familia`
--

LOCK TABLES `familia` WRITE;
/*!40000 ALTER TABLE `familia` DISABLE KEYS */;
INSERT INTO `familia` VALUES (1,1,1,1,1,1,'Canidae');
/*!40000 ALTER TABLE `familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filo`
--

DROP TABLE IF EXISTS `filo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filo` (
  `id_dominio` int NOT NULL,
  `id_reino` int NOT NULL,
  `id_filo` int NOT NULL,
  `filo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dominio`,`id_reino`,`id_filo`),
  CONSTRAINT `filo_ibfk_1` FOREIGN KEY (`id_dominio`) REFERENCES `dominio` (`id_dominio`),
  CONSTRAINT `filo_ibfk_2` FOREIGN KEY (`id_dominio`, `id_reino`) REFERENCES `reino` (`id_dominio`, `id_reino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filo`
--

LOCK TABLES `filo` WRITE;
/*!40000 ALTER TABLE `filo` DISABLE KEYS */;
INSERT INTO `filo` VALUES (1,1,1,'Chordata');
/*!40000 ALTER TABLE `filo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_dominio` int NOT NULL,
  `id_reino` int NOT NULL,
  `id_filo` int NOT NULL,
  `id_clase` int NOT NULL,
  `id_orden` int NOT NULL,
  `id_familia` int NOT NULL,
  `id_genero` int NOT NULL,
  `genero` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dominio`,`id_reino`,`id_filo`,`id_clase`,`id_orden`,`id_familia`,`id_genero`),
  CONSTRAINT `genero_ibfk_1` FOREIGN KEY (`id_dominio`, `id_reino`, `id_filo`, `id_clase`, `id_orden`, `id_familia`) REFERENCES `familia` (`id_dominio`, `id_reino`, `id_filo`, `id_clase`, `id_orden`, `id_familia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,1,1,1,1,1,1,'Canis');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `id_insumo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `proveedor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,'Vacuna Rabia',50,'VetProveedores'),(2,'Jeringa',100,'VetProveedores');
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascota`
--

DROP TABLE IF EXISTS `mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascota` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `id_raza` int NOT NULL,
  `color` varchar(15) DEFAULT NULL,
  `fecha_nac` datetime DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `castrado` varchar(2) DEFAULT NULL,
  `id_ult_visita` int DEFAULT NULL,
  `id_propietario` int DEFAULT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `id_propietario` (`id_propietario`),
  KEY `id_raza` (`id_raza`),
  CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietario` (`id_propietario`),
  CONSTRAINT `mascota_ibfk_2` FOREIGN KEY (`id_raza`) REFERENCES `raza` (`id_raza`),
  CONSTRAINT `chk_castrado` CHECK ((`castrado` in (_utf8mb4'SI',_utf8mb4'NO'))),
  CONSTRAINT `chk_sexo` CHECK ((`sexo` in (_utf8mb4'Macho',_utf8mb4'Hembra',_utf8mb4'Otro')))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascota`
--

LOCK TABLES `mascota` WRITE;
/*!40000 ALTER TABLE `mascota` DISABLE KEYS */;
INSERT INTO `mascota` VALUES (1,'Firulais',1,'Marrón','2020-05-10 00:00:00','Macho','No',NULL,1),(2,'Luna',2,'Blanco','2021-07-20 00:00:00','Hembra','Sí',NULL,2);
/*!40000 ALTER TABLE `mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `id_dominio` int NOT NULL,
  `id_reino` int NOT NULL,
  `id_filo` int NOT NULL,
  `id_clase` int NOT NULL,
  `id_orden` int NOT NULL,
  `orden` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dominio`,`id_reino`,`id_filo`,`id_clase`,`id_orden`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`id_dominio`) REFERENCES `dominio` (`id_dominio`),
  CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`id_dominio`, `id_reino`) REFERENCES `reino` (`id_dominio`, `id_reino`),
  CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`id_dominio`, `id_reino`, `id_filo`) REFERENCES `filo` (`id_dominio`, `id_reino`, `id_filo`),
  CONSTRAINT `orden_ibfk_4` FOREIGN KEY (`id_dominio`, `id_reino`, `id_filo`, `id_clase`) REFERENCES `clase` (`id_dominio`, `id_reino`, `id_filo`, `id_clase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,1,1,1,1,'Carnivora');
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_turno` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `medio_pago` varchar(30) NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_turno` (`id_turno`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1,1500.00,'2025-09-01 11:00:00','Efectivo'),(2,2,2000.00,'2025-09-02 16:00:00','Tarjeta');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario` (
  `id_propietario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `dni` bigint DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_propietario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
INSERT INTO `propietario` VALUES (1,'Juan','Pérez',12345678,'Calle 1','111-111','juan@mail.com'),(2,'Ana','Gómez',23456789,'Calle 2','222-222','ana@mail.com');
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raza`
--

DROP TABLE IF EXISTS `raza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raza` (
  `id_raza` int NOT NULL AUTO_INCREMENT,
  `id_dominio` int NOT NULL,
  `id_reino` int NOT NULL,
  `id_filo` int NOT NULL,
  `id_clase` int NOT NULL,
  `id_orden` int NOT NULL,
  `id_familia` int NOT NULL,
  `id_genero` int NOT NULL,
  `id_especie` int NOT NULL,
  `raza` varchar(45) NOT NULL,
  PRIMARY KEY (`id_raza`),
  UNIQUE KEY `id_dominio_2` (`id_dominio`,`id_reino`,`id_filo`,`id_clase`,`id_orden`,`id_familia`,`id_genero`,`raza`),
  KEY `id_dominio` (`id_dominio`,`id_reino`,`id_filo`,`id_clase`,`id_orden`,`id_familia`,`id_genero`,`id_especie`),
  CONSTRAINT `raza_ibfk_1` FOREIGN KEY (`id_dominio`, `id_reino`, `id_filo`, `id_clase`, `id_orden`, `id_familia`, `id_genero`, `id_especie`) REFERENCES `especie` (`id_dominio`, `id_reino`, `id_filo`, `id_clase`, `id_orden`, `id_familia`, `id_genero`, `id_especie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raza`
--

LOCK TABLES `raza` WRITE;
/*!40000 ALTER TABLE `raza` DISABLE KEYS */;
INSERT INTO `raza` VALUES (1,1,1,1,1,1,1,1,1,'Labrador'),(2,1,1,1,1,1,1,1,1,'Bulldog');
/*!40000 ALTER TABLE `raza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reino`
--

DROP TABLE IF EXISTS `reino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reino` (
  `id_dominio` int NOT NULL,
  `id_reino` int NOT NULL,
  `reino` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dominio`,`id_reino`),
  CONSTRAINT `reino_ibfk_1` FOREIGN KEY (`id_dominio`) REFERENCES `dominio` (`id_dominio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reino`
--

LOCK TABLES `reino` WRITE;
/*!40000 ALTER TABLE `reino` DISABLE KEYS */;
INSERT INTO `reino` VALUES (1,1,'Animalia');
/*!40000 ALTER TABLE `reino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno` (
  `id_turno` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  `id_mascota` int DEFAULT NULL,
  `id_propietario` int DEFAULT NULL,
  `id_veterinario` int NOT NULL,
  `estado` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_turno`),
  KEY `id_propietario` (`id_propietario`),
  KEY `id_mascota` (`id_mascota`),
  KEY `id_veterinario` (`id_veterinario`),
  CONSTRAINT `turno_ibfk_1` FOREIGN KEY (`id_propietario`) REFERENCES `propietario` (`id_propietario`),
  CONSTRAINT `turno_ibfk_2` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`),
  CONSTRAINT `turno_ibfk_3` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` VALUES (1,'2025-09-01 00:00:00','10:00:00','Vacunación',1,1,1,'Atendido'),(2,'2025-09-02 00:00:00','15:00:00','Control',2,2,2,'Atendido');
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacunas`
--

DROP TABLE IF EXISTS `vacunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacunas` (
  `id_vacuna` int NOT NULL AUTO_INCREMENT,
  `id_mascota` int NOT NULL,
  `nombre_vacuna` varchar(100) NOT NULL,
  `fecha_aplicacion` date NOT NULL,
  `proxima_dosis` date DEFAULT NULL,
  PRIMARY KEY (`id_vacuna`),
  KEY `id_mascota` (`id_mascota`),
  CONSTRAINT `vacunas_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacunas`
--

LOCK TABLES `vacunas` WRITE;
/*!40000 ALTER TABLE `vacunas` DISABLE KEYS */;
INSERT INTO `vacunas` VALUES (1,1,'Rabia','2025-09-01','2026-09-01'),(2,2,'Moquillo','2025-09-02','2025-12-02');
/*!40000 ALTER TABLE `vacunas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinario` (
  `id_veterinario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `dni` bigint DEFAULT NULL,
  `especialidad` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `mtricula` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinario`
--

LOCK TABLES `veterinario` WRITE;
/*!40000 ALTER TABLE `veterinario` DISABLE KEYS */;
INSERT INTO `veterinario` VALUES (1,'Carlos','López',34567890,'Cirugía','Av Siempreviva','333-333','carlos@mail.com','MAT123'),(2,'Lucía','Martínez',45678901,'Clínica','Av Libertad','444-444','lucia@mail.com','MAT456');
/*!40000 ALTER TABLE `veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'veterinaria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-12 23:42:35
