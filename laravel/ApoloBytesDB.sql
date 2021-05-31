-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: apolobytes
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `bebida`
--

DROP TABLE IF EXISTS `bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bebida` (
  `idbebida` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `estado` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `preco` int NOT NULL,
  `ementa_idemente` int NOT NULL,
  PRIMARY KEY (`idbebida`),
  KEY `fk_bebida_ementa1_idx` (`ementa_idemente`),
  CONSTRAINT `fk_bebida_ementa1` FOREIGN KEY (`ementa_idemente`) REFERENCES `ementa` (`idemente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebida`
--

LOCK TABLES `bebida` WRITE;
/*!40000 ALTER TABLE `bebida` DISABLE KEYS */;
/*!40000 ALTER TABLE `bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartoes`
--

DROP TABLE IF EXISTS `cartoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartoes` (
  `idcartoes` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `validade` varchar(4) NOT NULL,
  `cliente_idcliente` int NOT NULL,
  PRIMARY KEY (`idcartoes`),
  UNIQUE KEY `numero_UNIQUE` (`numero`),
  KEY `fk_cartoes_cliente1_idx` (`cliente_idcliente`),
  CONSTRAINT `fk_cartoes_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartoes`
--

LOCK TABLES `cartoes` WRITE;
/*!40000 ALTER TABLE `cartoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nomeCompleto` varchar(50) NOT NULL,
  `correioEletronico` varchar(45) NOT NULL,
  `palavraPasse` varchar(45) NOT NULL,
  `favoritos_idfavoritos` int NOT NULL,
  `pedido_idpedido` int NOT NULL,
  PRIMARY KEY (`idcliente`,`pedido_idpedido`),
  UNIQUE KEY `palavraPasse_UNIQUE` (`palavraPasse`),
  KEY `fk_cliente_favoritos1_idx` (`favoritos_idfavoritos`),
  KEY `fk_cliente_pedido1_idx` (`pedido_idpedido`),
  CONSTRAINT `fk_cliente_favoritos1` FOREIGN KEY (`favoritos_idfavoritos`) REFERENCES `favoritos` (`idfavoritos`),
  CONSTRAINT `fk_cliente_pedido1` FOREIGN KEY (`pedido_idpedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complemento`
--

DROP TABLE IF EXISTS `complemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complemento` (
  `idcomplemento` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `estado` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `preco` float NOT NULL,
  `ementa_idemente` int NOT NULL,
  PRIMARY KEY (`idcomplemento`),
  KEY `fk_complemento_ementa1_idx` (`ementa_idemente`),
  CONSTRAINT `fk_complemento_ementa1` FOREIGN KEY (`ementa_idemente`) REFERENCES `ementa` (`idemente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complemento`
--

LOCK TABLES `complemento` WRITE;
/*!40000 ALTER TABLE `complemento` DISABLE KEYS */;
/*!40000 ALTER TABLE `complemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ementa`
--

DROP TABLE IF EXISTS `ementa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ementa` (
  `idemente` int NOT NULL,
  PRIMARY KEY (`idemente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ementa`
--

LOCK TABLES `ementa` WRITE;
/*!40000 ALTER TABLE `ementa` DISABLE KEYS */;
/*!40000 ALTER TABLE `ementa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encomenda`
--

DROP TABLE IF EXISTS `encomenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encomenda` (
  `idencomenda` int NOT NULL AUTO_INCREMENT,
  `estadoEncomenda` varchar(10) DEFAULT NULL,
  `morada_idmorada` int NOT NULL,
  `morada_cliente_idcliente` int NOT NULL,
  `pedido_idpedido` int NOT NULL,
  PRIMARY KEY (`idencomenda`,`pedido_idpedido`),
  KEY `fk_encomenda_morada1_idx` (`morada_idmorada`,`morada_cliente_idcliente`),
  KEY `fk_encomenda_pedido1_idx` (`pedido_idpedido`),
  CONSTRAINT `fk_encomenda_morada1` FOREIGN KEY (`morada_idmorada`, `morada_cliente_idcliente`) REFERENCES `morada` (`idmorada`, `cliente_idcliente`),
  CONSTRAINT `fk_encomenda_pedido1` FOREIGN KEY (`pedido_idpedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encomenda`
--

LOCK TABLES `encomenda` WRITE;
/*!40000 ALTER TABLE `encomenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `encomenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estafetas`
--

DROP TABLE IF EXISTS `estafetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estafetas` (
  `idestafetas` int NOT NULL AUTO_INCREMENT,
  `nomeEstafeta` varchar(45) NOT NULL,
  `contacto` int NOT NULL,
  `disponibilidadeEstafeta` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cartaoCidadao` varchar(250) NOT NULL,
  `fotografia` varchar(250) NOT NULL,
  `cartaConducao` varchar(250) NOT NULL,
  `seguro` varchar(250) NOT NULL,
  `encomenda_idencomenda` int NOT NULL,
  PRIMARY KEY (`idestafetas`),
  KEY `fk_estafetas_encomenda1_idx` (`encomenda_idencomenda`),
  CONSTRAINT `fk_estafetas_encomenda1` FOREIGN KEY (`encomenda_idencomenda`) REFERENCES `encomenda` (`idencomenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estafetas`
--

LOCK TABLES `estafetas` WRITE;
/*!40000 ALTER TABLE `estafetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `estafetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `idfavoritos` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idfavoritos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos_bebida`
--

DROP TABLE IF EXISTS `favoritos_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos_bebida` (
  `favoritos_idfavoritos` int NOT NULL,
  `bebida_idbebida` int NOT NULL,
  PRIMARY KEY (`favoritos_idfavoritos`,`bebida_idbebida`),
  KEY `fk_favoritos_has_bebida_bebida1_idx` (`bebida_idbebida`),
  KEY `fk_favoritos_has_bebida_favoritos1_idx` (`favoritos_idfavoritos`),
  CONSTRAINT `fk_favoritos_has_bebida_bebida1` FOREIGN KEY (`bebida_idbebida`) REFERENCES `bebida` (`idbebida`),
  CONSTRAINT `fk_favoritos_has_bebida_favoritos1` FOREIGN KEY (`favoritos_idfavoritos`) REFERENCES `favoritos` (`idfavoritos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos_bebida`
--

LOCK TABLES `favoritos_bebida` WRITE;
/*!40000 ALTER TABLE `favoritos_bebida` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos_complemento`
--

DROP TABLE IF EXISTS `favoritos_complemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos_complemento` (
  `favoritos_idfavoritos` int NOT NULL,
  `complemento_idcomplemento` int NOT NULL,
  PRIMARY KEY (`favoritos_idfavoritos`,`complemento_idcomplemento`),
  KEY `fk_favoritos_has_complemento_complemento1_idx` (`complemento_idcomplemento`),
  KEY `fk_favoritos_has_complemento_favoritos1_idx` (`favoritos_idfavoritos`),
  CONSTRAINT `fk_favoritos_has_complemento_complemento1` FOREIGN KEY (`complemento_idcomplemento`) REFERENCES `complemento` (`idcomplemento`),
  CONSTRAINT `fk_favoritos_has_complemento_favoritos1` FOREIGN KEY (`favoritos_idfavoritos`) REFERENCES `favoritos` (`idfavoritos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos_complemento`
--

LOCK TABLES `favoritos_complemento` WRITE;
/*!40000 ALTER TABLE `favoritos_complemento` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos_complemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos_refeicoes`
--

DROP TABLE IF EXISTS `favoritos_refeicoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos_refeicoes` (
  `favoritos_idfavoritos` int NOT NULL,
  `refeicoes_idrefeicoes` int NOT NULL,
  PRIMARY KEY (`favoritos_idfavoritos`,`refeicoes_idrefeicoes`),
  KEY `fk_favoritos_has_refeicoes_refeicoes1_idx` (`refeicoes_idrefeicoes`),
  KEY `fk_favoritos_has_refeicoes_favoritos1_idx` (`favoritos_idfavoritos`),
  CONSTRAINT `fk_favoritos_has_refeicoes_favoritos1` FOREIGN KEY (`favoritos_idfavoritos`) REFERENCES `favoritos` (`idfavoritos`),
  CONSTRAINT `fk_favoritos_has_refeicoes_refeicoes1` FOREIGN KEY (`refeicoes_idrefeicoes`) REFERENCES `refeicoesog` (`idrefeicoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos_refeicoes`
--

LOCK TABLES `favoritos_refeicoes` WRITE;
/*!40000 ALTER TABLE `favoritos_refeicoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos_refeicoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos_sobremesas`
--

DROP TABLE IF EXISTS `favoritos_sobremesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos_sobremesas` (
  `favoritos_idfavoritos` int NOT NULL,
  `sobremesas_idsobremesas` int NOT NULL,
  PRIMARY KEY (`favoritos_idfavoritos`,`sobremesas_idsobremesas`),
  KEY `fk_favoritos_has_sobremesas_sobremesas1_idx` (`sobremesas_idsobremesas`),
  KEY `fk_favoritos_has_sobremesas_favoritos1_idx` (`favoritos_idfavoritos`),
  CONSTRAINT `fk_favoritos_has_sobremesas_favoritos1` FOREIGN KEY (`favoritos_idfavoritos`) REFERENCES `favoritos` (`idfavoritos`),
  CONSTRAINT `fk_favoritos_has_sobremesas_sobremesas1` FOREIGN KEY (`sobremesas_idsobremesas`) REFERENCES `sobremesas` (`idsobremesas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos_sobremesas`
--

LOCK TABLES `favoritos_sobremesas` WRITE;
/*!40000 ALTER TABLE `favoritos_sobremesas` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos_sobremesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `personalizavel` int NOT NULL,
  `preco` int NOT NULL,
  `quantidade` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (1,'teste',1,1,'3',NULL,NULL,NULL),(2,'teste 2',0,2,'1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientesog`
--

DROP TABLE IF EXISTS `ingredientesog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientesog` (
  `idingredientes` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `personalizavel` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `preco` float NOT NULL,
  `estado` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `quantidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idingredientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientesog`
--

LOCK TABLES `ingredientesog` WRITE;
/*!40000 ALTER TABLE `ingredientesog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredientesog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_05_22_160040_create_posts_table',2),(5,'2021_05_22_170203_create_refeicoes_table',3),(6,'2021_05_26_151353_create_restaurantes_table',4),(7,'2021_05_26_152412_create_restaurantes_table',5),(8,'2021_05_28_144825_create_ingredientes_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `morada`
--

DROP TABLE IF EXISTS `morada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `morada` (
  `idmorada` int NOT NULL AUTO_INCREMENT,
  `enderecoRua` varchar(45) NOT NULL,
  `codigoPostal` varchar(7) NOT NULL,
  `localidade` varchar(45) NOT NULL,
  `andar` varchar(45) DEFAULT NULL,
  `porta` varchar(45) NOT NULL,
  `cliente_idcliente` int NOT NULL,
  PRIMARY KEY (`idmorada`,`cliente_idcliente`),
  KEY `fk_morada_cliente1_idx` (`cliente_idcliente`),
  CONSTRAINT `fk_morada_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `morada`
--

LOCK TABLES `morada` WRITE;
/*!40000 ALTER TABLE `morada` DISABLE KEYS */;
/*!40000 ALTER TABLE `morada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idpedido` int NOT NULL AUTO_INCREMENT,
  `precoPedido` float NOT NULL,
  `restaurantes_idrestaurantes` int NOT NULL,
  `restaurantes_ementa_idemente` int NOT NULL,
  PRIMARY KEY (`idpedido`,`restaurantes_idrestaurantes`,`restaurantes_ementa_idemente`),
  KEY `fk_pedido_restaurantes1_idx` (`restaurantes_idrestaurantes`,`restaurantes_ementa_idemente`),
  CONSTRAINT `fk_pedido_restaurantes1` FOREIGN KEY (`restaurantes_idrestaurantes`, `restaurantes_ementa_idemente`) REFERENCES `restaurantesog` (`idrestaurantes`, `ementa_idemente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_has_bebida`
--

DROP TABLE IF EXISTS `pedido_has_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_has_bebida` (
  `pedido_idpedido` int NOT NULL,
  `bebida_idbebida` int NOT NULL,
  PRIMARY KEY (`pedido_idpedido`,`bebida_idbebida`),
  KEY `fk_pedido_has_bebida_bebida1_idx` (`bebida_idbebida`),
  KEY `fk_pedido_has_bebida_pedido1_idx` (`pedido_idpedido`),
  CONSTRAINT `fk_pedido_has_bebida_bebida1` FOREIGN KEY (`bebida_idbebida`) REFERENCES `bebida` (`idbebida`),
  CONSTRAINT `fk_pedido_has_bebida_pedido1` FOREIGN KEY (`pedido_idpedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_has_bebida`
--

LOCK TABLES `pedido_has_bebida` WRITE;
/*!40000 ALTER TABLE `pedido_has_bebida` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_has_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_has_complemento`
--

DROP TABLE IF EXISTS `pedido_has_complemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_has_complemento` (
  `pedido_idpedido` int NOT NULL,
  `complemento_idcomplemento` int NOT NULL,
  PRIMARY KEY (`pedido_idpedido`,`complemento_idcomplemento`),
  KEY `fk_pedido_has_complemento_complemento1_idx` (`complemento_idcomplemento`),
  KEY `fk_pedido_has_complemento_pedido1_idx` (`pedido_idpedido`),
  CONSTRAINT `fk_pedido_has_complemento_complemento1` FOREIGN KEY (`complemento_idcomplemento`) REFERENCES `complemento` (`idcomplemento`),
  CONSTRAINT `fk_pedido_has_complemento_pedido1` FOREIGN KEY (`pedido_idpedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_has_complemento`
--

LOCK TABLES `pedido_has_complemento` WRITE;
/*!40000 ALTER TABLE `pedido_has_complemento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_has_complemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_has_sobremesas`
--

DROP TABLE IF EXISTS `pedido_has_sobremesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_has_sobremesas` (
  `pedido_idpedido` int NOT NULL,
  `sobremesas_idsobremesas` int NOT NULL,
  PRIMARY KEY (`pedido_idpedido`,`sobremesas_idsobremesas`),
  KEY `fk_pedido_has_sobremesas_sobremesas1_idx` (`sobremesas_idsobremesas`),
  KEY `fk_pedido_has_sobremesas_pedido1_idx` (`pedido_idpedido`),
  CONSTRAINT `fk_pedido_has_sobremesas_pedido1` FOREIGN KEY (`pedido_idpedido`) REFERENCES `pedido` (`idpedido`),
  CONSTRAINT `fk_pedido_has_sobremesas_sobremesas1` FOREIGN KEY (`sobremesas_idsobremesas`) REFERENCES `sobremesas` (`idsobremesas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_has_sobremesas`
--

LOCK TABLES `pedido_has_sobremesas` WRITE;
/*!40000 ALTER TABLE `pedido_has_sobremesas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_has_sobremesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'teste','public/images/yrp8dhDsmfa8BjdEn0Thh1Co6jGesohU9Rd1MzNl.jpg','teste 1','2021-05-22 15:22:59','2021-05-22 15:22:59');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refeicoes`
--

DROP TABLE IF EXISTS `refeicoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refeicoes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `preco` int NOT NULL,
  `tempoConfecao` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refeicoes`
--

LOCK TABLES `refeicoes` WRITE;
/*!40000 ALTER TABLE `refeicoes` DISABLE KEYS */;
INSERT INTO `refeicoes` VALUES (1,'Pão com chouriço','public/images/GHkikoP53pPsZ0R5MpfU0fHWm5vRtAyx4d9nnfC2.jpg',1,'10 min','top','2021-05-22 17:06:53','2021-05-22 17:06:53'),(5,'Bifana','public/images/xlGzwbKzlKQU187hoTi3xHIXZYWsq5BcezpaQnIW.jpg',5,'5 min','O Jó é o maior!','2021-05-25 21:54:47','2021-05-30 10:24:11');
/*!40000 ALTER TABLE `refeicoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refeicoes_has_pedido`
--

DROP TABLE IF EXISTS `refeicoes_has_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refeicoes_has_pedido` (
  `refeicoes_idrefeicoes` int NOT NULL,
  `pedido_idpedido` int NOT NULL,
  `pedido_restaurantes_idrestaurantes` int NOT NULL,
  `pedido_restaurantes_ementa_idemente` int NOT NULL,
  PRIMARY KEY (`refeicoes_idrefeicoes`,`pedido_idpedido`,`pedido_restaurantes_idrestaurantes`,`pedido_restaurantes_ementa_idemente`),
  KEY `fk_refeicoes_has_pedido_pedido1_idx` (`pedido_idpedido`,`pedido_restaurantes_idrestaurantes`,`pedido_restaurantes_ementa_idemente`),
  KEY `fk_refeicoes_has_pedido_refeicoes1_idx` (`refeicoes_idrefeicoes`),
  CONSTRAINT `fk_refeicoes_has_pedido_pedido1` FOREIGN KEY (`pedido_idpedido`, `pedido_restaurantes_idrestaurantes`, `pedido_restaurantes_ementa_idemente`) REFERENCES `pedido` (`idpedido`, `restaurantes_idrestaurantes`, `restaurantes_ementa_idemente`),
  CONSTRAINT `fk_refeicoes_has_pedido_refeicoes1` FOREIGN KEY (`refeicoes_idrefeicoes`) REFERENCES `refeicoesog` (`idrefeicoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refeicoes_has_pedido`
--

LOCK TABLES `refeicoes_has_pedido` WRITE;
/*!40000 ALTER TABLE `refeicoes_has_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `refeicoes_has_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refeicoes_ingredientes`
--

DROP TABLE IF EXISTS `refeicoes_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refeicoes_ingredientes` (
  `refeicoes_idrefeicoes` int NOT NULL,
  `ingredientes_idingredientes` int NOT NULL,
  PRIMARY KEY (`refeicoes_idrefeicoes`,`ingredientes_idingredientes`),
  KEY `fk_refeicoes_has_ingredientes_ingredientes1_idx` (`ingredientes_idingredientes`),
  KEY `fk_refeicoes_has_ingredientes_refeicoes1_idx` (`refeicoes_idrefeicoes`),
  CONSTRAINT `fk_refeicoes_has_ingredientes_ingredientes1` FOREIGN KEY (`ingredientes_idingredientes`) REFERENCES `ingredientesog` (`idingredientes`),
  CONSTRAINT `fk_refeicoes_has_ingredientes_refeicoes1` FOREIGN KEY (`refeicoes_idrefeicoes`) REFERENCES `refeicoesog` (`idrefeicoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refeicoes_ingredientes`
--

LOCK TABLES `refeicoes_ingredientes` WRITE;
/*!40000 ALTER TABLE `refeicoes_ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `refeicoes_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refeicoesog`
--

DROP TABLE IF EXISTS `refeicoesog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refeicoesog` (
  `idrefeicoes` int NOT NULL AUTO_INCREMENT,
  `preco` int NOT NULL,
  `tempoConfecao` int NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `imagem` varchar(245) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `avaliacao` int DEFAULT NULL,
  `personalizavel` int DEFAULT NULL,
  `ementa_idemente` int NOT NULL,
  PRIMARY KEY (`idrefeicoes`),
  KEY `fk_refeicoes_ementa1_idx` (`ementa_idemente`),
  CONSTRAINT `fk_refeicoes_ementa1` FOREIGN KEY (`ementa_idemente`) REFERENCES `ementa` (`idemente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refeicoesog`
--

LOCK TABLES `refeicoesog` WRITE;
/*!40000 ALTER TABLE `refeicoesog` DISABLE KEYS */;
/*!40000 ALTER TABLE `refeicoesog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantes`
--

DROP TABLE IF EXISTS `restaurantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `localizacao` varchar(255) NOT NULL,
  `horario` varchar(100) NOT NULL,
  `sumario` text NOT NULL,
  `tempoEntrega` int NOT NULL,
  `contacto` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantes`
--

LOCK TABLES `restaurantes` WRITE;
/*!40000 ALTER TABLE `restaurantes` DISABLE KEYS */;
INSERT INTO `restaurantes` VALUES (1,'teste 2','teste','10:00 - 20:00','teste 1',5,12456789,NULL,'2021-05-30 21:47:35');
/*!40000 ALTER TABLE `restaurantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantesog`
--

DROP TABLE IF EXISTS `restaurantesog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantesog` (
  `idrestaurantes` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `localizacao` varchar(45) NOT NULL,
  `horarios` time NOT NULL,
  `imagem` varchar(245) NOT NULL,
  `sumario` text,
  `tempoEntrega` int DEFAULT NULL,
  `contacto` int DEFAULT NULL,
  `ementa_idemente` int NOT NULL,
  PRIMARY KEY (`idrestaurantes`,`ementa_idemente`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  UNIQUE KEY `idrestaurantes_UNIQUE` (`idrestaurantes`),
  UNIQUE KEY `localizacao_UNIQUE` (`localizacao`),
  UNIQUE KEY `contacto_UNIQUE` (`contacto`),
  KEY `fk_restaurantes_ementa1_idx` (`ementa_idemente`),
  CONSTRAINT `fk_restaurantes_ementa1` FOREIGN KEY (`ementa_idemente`) REFERENCES `ementa` (`idemente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantesog`
--

LOCK TABLES `restaurantesog` WRITE;
/*!40000 ALTER TABLE `restaurantesog` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurantesog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sobremesas`
--

DROP TABLE IF EXISTS `sobremesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sobremesas` (
  `idsobremesas` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `estado` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `preco` float NOT NULL,
  `ementa_idemente` int NOT NULL,
  PRIMARY KEY (`idsobremesas`),
  KEY `fk_sobremesas_ementa1_idx` (`ementa_idemente`),
  CONSTRAINT `fk_sobremesas_ementa1` FOREIGN KEY (`ementa_idemente`) REFERENCES `ementa` (`idemente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sobremesas`
--

LOCK TABLES `sobremesas` WRITE;
/*!40000 ALTER TABLE `sobremesas` DISABLE KEYS */;
/*!40000 ALTER TABLE `sobremesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'André Jesus','andre22.vj10@gmail.com',NULL,'$2y$10$r5o/Qe8.DQY5lmSntdbH6eAur7P/f5KhpcoZ4boL/ajkct/O3TjKm',NULL,'2021-05-09 11:04:42','2021-05-09 11:04:42'),(2,'Restaurante Aderente','restaurante@gmail.com',NULL,'$2y$10$UrBmIEHC2NJ69qHpTfMkB.NYmCbz5eg0fzrupTj8lLltdDtnj7XaK',NULL,'2021-05-09 17:17:12','2021-05-09 17:17:12'),(4,'teste','teste@teste.pt',NULL,'$2y$10$FA3n4kSLru3ex50sEiRCRe5OZRh6j5T7EHi3h0bLu8opvQqJNgepq',NULL,'2021-05-09 20:18:35','2021-05-09 20:18:35'),(5,'esculcas house','esculcas@esculcas.com',NULL,'$2y$10$Mkmt0jvZqnHfM0tVLit8OeUB/dxNVQqMG7JiV21JfYbBWc7mLEQFC',NULL,'2021-05-13 13:30:06','2021-05-13 13:30:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-31  0:29:31
