CREATE DATABASE  IF NOT EXISTS `cine_tpjava` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cine_tpjava`;
-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: cine_tpjava
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.22.04.2

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
  `image` blob,
  `releaseDate` date NOT NULL,
  `cast` varchar(150) NOT NULL,
  `director` varchar(45) NOT NULL,
  `duration` int NOT NULL,
  `idRestriction` int NOT NULL,
  `idGenre` int NOT NULL,
  PRIMARY KEY (`idMovie`),
  KEY `fk_Movie_Restriction_idx` (`idRestriction`),
  KEY `fk_Movie_Genre_idx` (`idGenre`),
  CONSTRAINT `fk_Movie_Genre` FOREIGN KEY (`idGenre`) REFERENCES `genre` (`idGenre`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_Movie_Restriction` FOREIGN KEY (`idRestriction`) REFERENCES `restriction` (`idRestriction`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Relatos Salvajes',NULL,'2014-08-21','Ricardo DarÃ­n, Oscar MartÃ­nez, Leonardo Sbaraglia, Ã‰rica Rivas, Rita Cortese, Julieta Zylberberg, DarÃ­o Grandinetti','DamiÃ¡n Szifron',122,4,1),(2,'The pianist',NULL,'2003-03-06','Adrien Brody, Thomas Kretschmann, Frank Finlay, Maureen Lipman, Emilia Fox, Ed Stoppard, Julia Rayner, Jessica Kate Meyer','RomÃ¡n Polanski',151,4,1),(3,'Inglourious Basterds',NULL,'2009-08-31','Brad Pitt, Christoph Waltz, MÃ©lanie Laurent, Eli Roth, Diane Kruger, Daniel BrÃ¼hl, Til Schweiger, Michael Fassbender','Quentin Tarantino',153,3,2),(4,'Thor: Love and thunder',NULL,'2022-07-07','Chris Hemsworth, Christian Bale, Tessa Thompson, Jaimie Alexander, Taika Waititi, Russell Crowe,Natalie Portman','Taika Waititi',119,1,3),(5,'The godfather',NULL,'1972-08-10','Marlon Brando, Al Pacino, Robert Duvall, James Caan, Richard Castellano, Diane Keaton','Francis Ford Coppola',177,5,1),(6,'Deadpool',NULL,'2016-02-11','Ryan Reynolds, Morena Baccarin, Ed Skrein, T. J. Miller, Gina Carano, Leslie Uggams, Brianna Hildebrand, Stefan KapiÄ�iÄ‡','Tim Miller',109,4,2),(7,'The Hangover',NULL,'2009-06-05','Bradley Cooper, Ed Helms, Zach Galifianakis, Heather Graham, Mike Epps, Justin Bartha, Jeffrey Tambor','Todd Philips',100,4,3),(8,'Shrek 2',NULL,'2004-06-17','Mike Myers, Cameron Diaz, Eddie Murphy, Antonio Banderas, Julie Andrews, John Cleese, Rupert Everett, Jennifer Saunders, Larry King','Andrew Adamson',93,1,4),(9,'Transformers: Revenge of the Fallen',NULL,'2009-06-25','Shia LaBeouf, Megan Fox, Josh Duhamel, Tyrese Gibson, John Turturro','Michael Bay',150,3,2),(10,'8 mile',NULL,'2002-01-23','Eminem, Kim Basinger, Brittany Murphy, Mekhi Phifer, Evan Jones, Omar Benson Miller, Eugene Byrd, De\'Angelo Wilson, Anthony Mackie, Michael Shannon','Curtis Hanson',106,5,1);
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
  `capacity` int NOT NULL,
  PRIMARY KEY (`roomNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movieroom`
--

LOCK TABLES `movieroom` WRITE;
/*!40000 ALTER TABLE `movieroom` DISABLE KEYS */;
INSERT INTO `movieroom` VALUES (1,9),(2,9),(3,9),(4,9),(5,9);
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
  `idRole` int NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `idTicket` int NOT NULL AUTO_INCREMENT,
  `idUser` int DEFAULT NULL,
  `idMovie` int NOT NULL,
  `roomNumber` int NOT NULL,
  `operationCode` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `totalAmmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idTicket`),
  KEY `fk_Ticket_Movie_idx` (`idMovie`),
  KEY `fk_ticket_Room_idx` (`roomNumber`),
  KEY `fk_Ticket_User_idx` (`idUser`),
  CONSTRAINT `fk_Ticket_Movie` FOREIGN KEY (`idMovie`) REFERENCES `movie` (`idMovie`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_ticket_room` FOREIGN KEY (`roomNumber`) REFERENCES `movieroom` (`roomNumber`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_ticket_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,48271,7,1,'123456','2022-07-18','00:22:30',NULL),(2,48272,6,1,'123457','2022-07-17','00:21:33',NULL),(3,48273,5,2,'123458','2022-07-18','00:08:17',NULL),(4,48274,4,2,'123459','2022-07-16','00:09:47',NULL),(5,48274,3,3,'123460','2022-07-18','00:20:40',NULL),(6,48273,9,4,'123461','2022-07-16','00:16:53',NULL),(7,48272,8,5,'123462','2022-07-18','00:18:55',NULL),(8,48271,8,5,'123463','2022-07-17','00:19:32',NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubication`
--

DROP TABLE IF EXISTS `ubication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubication` (
  `roomNumber` int NOT NULL,
  `row` char(1) NOT NULL,
  `col` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`roomNumber`,`row`,`col`),
  CONSTRAINT `fk_Ubication_Room` FOREIGN KEY (`roomNumber`) REFERENCES `movieroom` (`roomNumber`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubication`
--

LOCK TABLES `ubication` WRITE;
/*!40000 ALTER TABLE `ubication` DISABLE KEYS */;
INSERT INTO `ubication` VALUES (1,'A',1,0),(1,'A',2,0),(1,'A',3,0),(1,'B',1,0),(1,'B',2,0),(1,'B',3,0),(1,'C',1,0),(1,'C',2,0),(1,'C',3,0),(2,'A',1,0),(2,'A',2,0),(2,'A',3,0),(2,'B',1,0),(2,'B',2,0),(2,'B',3,0),(2,'C',1,0),(2,'C',2,0),(2,'C',3,0),(3,'A',1,0),(3,'A',2,0),(3,'A',3,0),(3,'B',1,0),(3,'B',2,0),(3,'B',3,0),(3,'C',1,0),(3,'C',2,0),(3,'C',3,0),(4,'A',1,0),(4,'A',2,0),(4,'A',3,0),(4,'B',1,0),(4,'B',2,0),(4,'B',3,0),(4,'C',1,0),(4,'C',2,0),(4,'C',3,0),(5,'A',1,0),(5,'A',2,0),(5,'A',3,0),(5,'B',1,0),(5,'B',2,0),(5,'B',3,0),(5,'C',1,0),(5,'C',2,0),(5,'C',3,0);
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
  `idRole` int NOT NULL,
  `surname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `birthDate` date NOT NULL,
  `adress` varchar(45) NOT NULL,
  `phoneNumber` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  PRIMARY KEY (`idUser`),
  KEY `fk_User_Rol_idx` (`idRole`),
  CONSTRAINT `fk_User_Rol` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (48271,3,'Buschittari','Nahuel','Nahu123','2000-10-03','Balcarce 1201, ChabÃ¡s, Santa FÃ©','690571','nahu_buschittari@hotmail.com'),(48272,1,'Messi','Lionel AndrÃ©s','7balones','1987-06-24','Mitre 1235, Rosario, Santa FÃ©','123456','liomessi123@hotmail.com'),(48273,2,'Perez','Juan Cruz','taq456','2004-10-10','Batlle y OrdoÃ±es 300, Rosario, Santa FÃ©','534786','perezJC10@gmail.com'),(48274,1,'Biglia','Lucas Rodrigo','pesimo5','1986-01-30','Mendoza 3657, Rosario, Santa FÃ©','987654','Biglia5@outlook.com'),(48275,1,'Almendra','Agustin','5deBoca','2000-02-11','Bv SeguÃ­ 5327, Rosario, Santa FÃ©','453761','Pipahdp@gmail.com'),(48276,1,'Sosa','Santiago','5deAtlanta','1999-05-03','Av Presidente PerÃ³n 2758, Rosario, Santa FÃ©','198274','SSusa@gmail.com'),(48277,1,'Rossi','Agustin','penales123','1995-08-25','Rosas 755, Rosario, Santa FÃ©','321012','tukiLentes@outlook.com');
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

-- Dump completed on 2022-07-20 12:54:32
