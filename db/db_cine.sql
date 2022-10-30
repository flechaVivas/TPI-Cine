CREATE DATABASE  IF NOT EXISTS `cine_tpjava` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cine_tpjava`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: cine_tpjava
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `idGenre` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`idGenre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Drama'),(2,'Accion'),(3,'Comedia'),(4,'Aventura');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `idMovie` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `releaseDate` date NOT NULL,
  `cast` varchar(150) NOT NULL,
  `director` varchar(45) NOT NULL,
  `duration` int NOT NULL,
  `idRestriction` int NOT NULL,
  `idGenre` int NOT NULL,
  `retirementDate` date DEFAULT NULL,
  PRIMARY KEY (`idMovie`),
  KEY `fk_movie_restriction_idx` (`idRestriction`),
  KEY `fk_movie_genre_idx` (`idGenre`),
  CONSTRAINT `fk_movie_genre` FOREIGN KEY (`idGenre`) REFERENCES `genre` (`idGenre`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_restriction` FOREIGN KEY (`idRestriction`) REFERENCES `restriction` (`idRestriction`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Relatos Salvajes','/TPI-Cine/assets/img/relatos_salvajes_1280_720.png',NULL,'2014-08-21','Ricardo DarÃƒÂ­n, Oscar MartÃƒÂ­nez, Leonardo Sbaraglia, Ãƒâ€°rica Rivas, Rita Cortese, Julieta Zylberberg, DarÃƒÂ­o Grandinetti','DamiÃƒÂ¡n Szifron',122,4,1,NULL),(2,'The pianist','/TPI-Cine/assets/img/el_pianista.png',NULL,'2003-03-06','Adrien Brody, Thomas Kretschmann, Frank Finlay, Maureen Lipman, Emilia Fox, Ed Stoppard, Julia Rayner, Jessica Kate Meyer','RomÃƒÂ¡n Polanski',151,4,1,NULL),(3,'Inglourious Basterds','/TPI-Cine/assets/img/inglorious.png',NULL,'2009-08-31','Brad Pitt, Christoph Waltz, MÃƒÂ©lanie Laurent, Eli Roth, Diane Kruger, Daniel BrÃƒÂ¼hl, Til Schweiger, Michael Fassbender','Quentin Tarantino',153,3,2,NULL),(4,'Thor: Love and thunder','/TPI-Cine/assets/img/thor.png',NULL,'2022-07-07','Chris Hemsworth, Christian Bale, Tessa Thompson, Jaimie Alexander, Taika Waititi, Russell Crowe,Natalie Portman','Taika Waititi',119,1,3,NULL),(5,'The godfather','/TPI-Cine/assets/img/elpadrino.png',NULL,'1972-08-10','Marlon Brando, Al Pacino, Robert Duvall, James Caan, Richard Castellano, Diane Keaton','Francis Ford Coppola',177,5,1,NULL),(6,'Deadpool','/TPI-Cine/assets/img/deadpool.png',NULL,'2016-02-11','Ryan Reynolds, Morena Baccarin, Ed Skrein, T. J. Miller, Gina Carano, Leslie Uggams, Brianna Hildebrand, Stefan KapiÃ„ï¿½iÃ„â€¡','Tim Miller',109,4,2,NULL),(7,'The Hangover','/TPI-Cine/assets/img/thehangover.png',NULL,'2009-06-05','Bradley Cooper, Ed Helms, Zach Galifianakis, Heather Graham, Mike Epps, Justin Bartha, Jeffrey Tambor','Todd Philips',100,4,3,NULL),(8,'Shrek 2','/TPI-Cine/assets/img/shrek.png',NULL,'2004-06-17','Mike Myers, Cameron Diaz, Eddie Murphy, Antonio Banderas, Julie Andrews, John Cleese, Rupert Everett, Jennifer Saunders, Larry King','Andrew Adamson',93,1,4,NULL),(9,'Transformers: Revenge of the Fallen','/TPI-Cine/assets/img/transformers.png',NULL,'2009-06-25','Shia LaBeouf, Megan Fox, Josh Duhamel, Tyrese Gibson, John Turturro','Michael Bay',150,3,2,NULL),(10,'8 mile','/TPI-Cine/assets/img/8mile.png',NULL,'2002-01-23','Eminem, Kim Basinger, Brittany Murphy, Mekhi Phifer, Evan Jones, Omar Benson Miller, Eugene Byrd, De\'Angelo Wilson, Anthony Mackie, Michael Shannon','Curtis Hanson',106,5,1,NULL);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movieroom`
--

DROP TABLE IF EXISTS `movieroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movieroom` (
  `roomNumber` int NOT NULL,
  `idRoomType` int NOT NULL,
  PRIMARY KEY (`roomNumber`),
  KEY `fk_movieroom_roomType_idx` (`idRoomType`),
  CONSTRAINT `fk_movieroom_roomType` FOREIGN KEY (`idRoomType`) REFERENCES `room_type` (`idRoomType`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movieroom`
--

LOCK TABLES `movieroom` WRITE;
/*!40000 ALTER TABLE `movieroom` DISABLE KEYS */;
INSERT INTO `movieroom` VALUES (4,1),(1,2),(2,2),(3,2),(6,4),(5,5),(8,5),(7,8);
/*!40000 ALTER TABLE `movieroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restriction`
--

DROP TABLE IF EXISTS `restriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restriction` (
  `idRestriction` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`idRestriction`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restriction`
--

LOCK TABLES `restriction` WRITE;
/*!40000 ALTER TABLE `restriction` DISABLE KEYS */;
INSERT INTO `restriction` VALUES (1,'ATP'),(2,'+7'),(3,'+12'),(4,'+16'),(5,'+18');
/*!40000 ALTER TABLE `restriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `idRole` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'cliente'),(2,'taquillero'),(3,'admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `idRoomType` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `rowQuantity` int NOT NULL,
  `colQuantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idRoomType`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES (1,'IMAX Subtitulado',14,14,1600.00),(2,'3D Subtitulado',10,10,1200.00),(3,'2D Ingles',15,12,900.00),(4,'IMAX Ingles',10,10,1450.00),(5,'4D Subtitulado',14,14,1300.00),(6,'2D Subtitulado',15,15,800.00),(7,'2D Subtitulado',14,14,770.00),(8,'3D Ingles',15,15,1250.00),(9,'4D Ingles',14,14,1225.00),(13,'2D Aleman',9,9,670.00);
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show`
--

DROP TABLE IF EXISTS `show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show` (
  `idMovie` int NOT NULL,
  `roomNumber` int NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`idMovie`,`roomNumber`,`date_time`),
  KEY `fk_show_room_idx` (`roomNumber`),
  CONSTRAINT `fk_show_movie` FOREIGN KEY (`idMovie`) REFERENCES `movie` (`idMovie`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_show_room` FOREIGN KEY (`roomNumber`) REFERENCES `movieroom` (`roomNumber`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show`
--

LOCK TABLES `show` WRITE;
/*!40000 ALTER TABLE `show` DISABLE KEYS */;
INSERT INTO `show` VALUES (1,1,'2022-12-08 04:08:54'),(2,1,'2022-10-27 10:47:07'),(3,1,'2022-09-03 22:00:00'),(5,1,'2022-11-08 11:02:04'),(5,1,'2022-12-22 10:51:22'),(6,1,'2022-12-20 10:16:48'),(8,1,'2022-11-27 13:25:31'),(9,1,'2022-10-22 13:29:47'),(1,2,'2022-09-01 13:30:00'),(1,2,'2022-11-28 18:50:39'),(2,2,'2022-12-27 18:11:54'),(4,2,'2022-09-05 21:30:00'),(4,2,'2022-10-21 07:38:39'),(4,2,'2022-11-15 10:02:54'),(5,2,'2022-11-06 10:56:34'),(8,2,'2022-12-04 18:45:04'),(9,2,'2022-11-13 14:38:16'),(10,2,'2022-12-08 14:37:58'),(1,3,'2022-11-03 06:18:05'),(2,3,'2022-09-01 16:30:00'),(2,3,'2022-09-02 19:45:00'),(4,3,'2022-11-09 04:26:03'),(8,3,'2022-11-03 11:25:17'),(8,3,'2022-11-08 11:51:55'),(8,3,'2022-11-21 09:52:14'),(9,3,'2022-10-23 03:51:54'),(9,3,'2022-12-08 02:03:57'),(1,4,'2022-11-02 19:45:00'),(1,4,'2022-11-11 20:23:00'),(3,4,'2022-10-21 09:14:37'),(3,4,'2022-11-30 02:15:46'),(5,4,'2022-12-26 11:24:13'),(6,4,'2022-09-02 18:00:00'),(8,4,'2022-12-24 06:39:43'),(10,4,'2022-10-17 15:47:36'),(10,4,'2022-10-28 11:09:38'),(1,5,'2022-11-10 15:52:21'),(2,5,'2022-11-18 23:01:50'),(2,5,'2022-12-19 17:20:11'),(3,5,'2022-11-24 16:58:57'),(6,5,'2022-11-01 14:12:54'),(6,5,'2022-12-17 06:55:30'),(10,5,'2022-11-17 07:13:40'),(1,6,'2022-10-23 00:30:16'),(1,6,'2022-11-13 03:00:59'),(2,6,'2022-12-20 16:24:17'),(3,6,'2022-12-20 16:07:49'),(8,6,'2022-10-21 21:20:06'),(10,6,'2022-12-18 16:07:01'),(2,7,'2022-12-05 04:41:54'),(5,7,'2022-11-12 23:26:49'),(5,7,'2022-11-23 02:19:13'),(7,7,'2022-11-22 03:08:04'),(7,7,'2022-12-11 21:01:11'),(8,7,'2022-10-27 11:56:10'),(8,7,'2022-12-14 05:28:44'),(8,7,'2022-12-22 13:43:10');
/*!40000 ALTER TABLE `show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `idTicket` int NOT NULL AUTO_INCREMENT,
  `operationCode` varchar(45) NOT NULL,
  `dateTime` datetime NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `idUser` int DEFAULT NULL,
  `retirementDate` datetime DEFAULT NULL,
  PRIMARY KEY (`idTicket`),
  UNIQUE KEY `operationCode_UNIQUE` (`operationCode`),
  KEY `fk_ticket_user_idx` (`idUser`),
  CONSTRAINT `fk_ticket_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'123456','2022-07-18 22:30:00',900,48274,NULL),(2,'123457','2022-09-18 22:30:00',900,48271,NULL),(3,'123458','2022-09-12 00:00:00',1100,48275,NULL),(4,'123459','2022-09-10 00:00:00',1000,48277,NULL),(5,'123460','2022-09-03 22:30:00',900,48272,NULL),(6,'123461','2022-09-03 23:35:10',900,48274,NULL),(7,'123462','2022-09-04 02:35:16',900,48275,NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubication`
--

DROP TABLE IF EXISTS `ubication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubication` (
  `row` int NOT NULL,
  `col` int NOT NULL,
  `roomNumber` int NOT NULL,
  `idMovie` int NOT NULL,
  `show_date_time` datetime NOT NULL,
  `idTicket` int NOT NULL,
  PRIMARY KEY (`row`,`col`,`roomNumber`,`idMovie`,`show_date_time`),
  KEY `fk_ubication_show_idx` (`roomNumber`,`idMovie`,`show_date_time`),
  KEY `fk_ubication_ticket_idx` (`idTicket`),
  CONSTRAINT `fk_ubication_show` FOREIGN KEY (`roomNumber`, `idMovie`, `show_date_time`) REFERENCES `show` (`roomNumber`, `idMovie`, `date_time`),
  CONSTRAINT `fk_ubication_ticket` FOREIGN KEY (`idTicket`) REFERENCES `ticket` (`idTicket`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubication`
--

LOCK TABLES `ubication` WRITE;
/*!40000 ALTER TABLE `ubication` DISABLE KEYS */;
INSERT INTO `ubication` VALUES (1,4,1,3,'2022-09-03 22:00:00',1),(1,5,1,3,'2022-09-03 22:00:00',2),(5,3,1,3,'2022-09-03 22:00:00',2),(5,7,2,4,'2022-09-05 21:30:00',3),(3,9,1,3,'2022-09-03 22:00:00',4),(2,7,1,3,'2022-09-03 22:00:00',6);
/*!40000 ALTER TABLE `ubication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `idRole` int DEFAULT NULL,
  `surname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `birthDate` date NOT NULL,
  `adress` varchar(255) NOT NULL,
  `phoneNumber` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_role_idx` (`idRole`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (48271,3,'Buschittari','Nahuel','Nahu123','2000-10-03','Balcarce 1201, ChabÃƒÂ¡s, Santa FÃƒÂ©','690571','nahu_buschittari@hotmail.com'),(48272,1,'Messi','Lionel AndrÃƒÂ©s','7balones','1987-06-24','Mitre 1235, Rosario, Santa FÃƒÂ©','123456','liomessi123@hotmail.com'),(48273,2,'Perez','Juan Cruz','taq456','2004-10-10','Batlle y OrdoÃƒÂ±es 300, Rosario, Santa FÃƒÂ©','534786','perezJC10@gmail.com'),(48274,1,'Biglia','Lucas Rodrigo','pesimo5','1986-01-30','Mendoza 3657, Rosario, Santa FÃƒÂ©','987654','Biglia5@outlook.com'),(48275,1,'Almendra','Agustin','5deBoca','2000-02-11','Bv SeguÃƒÂ­ 5327, Rosario, Santa FÃƒÂ©','453761','Pipahdp@gmail.com'),(48276,1,'Sosa','Santiago','5deAtlanta','1999-05-03','Av Presidente PerÃƒÂ³n 2758, Rosario, Santa FÃƒÂ©','198274','SSusa@gmail.com'),(48277,1,'Rossi','Agustin','penales123','1995-08-25','Rosas 755, Rosario, Santa FÃƒÂ©','321012','tukiLentes@outlook.com'),(48280,1,'Vivas','Facundo Ignacio','flechita','2002-04-15','16 de Enero 8708','3416172059','fv@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-30 20:15:24
