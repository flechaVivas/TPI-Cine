CREATE DATABASE  IF NOT EXISTS `cine_tpjava` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cine_tpjava`;
-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: cine_tpjava
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.23.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Drama'),(2,'Accion'),(3,'Comedia'),(4,'Aventura'),(5,'Terror');
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
  `synopsis` varchar(500) NOT NULL,
  `releaseDate` date NOT NULL,
  `cast` varchar(255) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Relatos Salvajes','/TPI-Cine/assets/img/relatos_salvajes_1280_720.png','Un viaje en avion, el encuentro con alguien del pasado, un pinchazo en una carretera, una multa, un atropello o una bodan: la violencia sin control ni causa aparente, que impulsa a perder el control. En seis episodios diferentes los personajes se empujados a situaciones al borde del abismo, perdiendo el control de sus vidas.','2014-08-21','Ricardo Darin, Grandinetti','Damian Szifron',123,4,1,NULL),(2,'The pianist','/TPI-Cine/assets/img/el_pianista.png','Wladyslaw Szpilman, un brillante pianista polaco de origen judÂ­o, vive con su familia en el ghetto de Varsovia. Cuando, en 1939, los alemanes invaden Polonia, consigue evitar la deportaciÃÂ³n gracias a la ayuda de algunos amigos. Pero tendrÃÂ¡ que vivir escondido y completamente aislado durante mucho tiempo, y para sobrevivir tendrÃ que afrontar constantes peligros.','2003-03-06','Adrien Brody, Thomas Kretschmann, Frank Finlay, Maureen Lipman, Emilia Fox, Ed Stoppard, Julia Rayner, Jessica Kate Meyer','Roman Polanski',151,4,1,NULL),(3,'Inglourious Basterds','/TPI-Cine/assets/img/inglorious.png','II Guerra Mundial, Francia, Shosanna presencia la ejecución de su familia por orden del coronel nazi Hans Landa. Huye a Paris y adopta una nueva identidad como propietaria de un cine. Mientras el teniente Aldo Raine adiestra a un grupo de soldados judíos. Los hombres de Raine y una actriz alemana que agente doble, deben llevar a cabo una misión que hará caer a los jefes del Tercer Reich. El destino quiere que todos se encuentren bajo la marquesina de un cine donde Shosanna espera para vengarse.','2009-08-31','Brad Pitt, Christoph Waltz, MÃƒÂ©lanie Laurent, Eli Roth, Diane Kruger, Daniel BrÃƒÂ¼hl, Til Schweiger, Michael Fassbender','Quentin Tarantino',153,3,2,NULL),(4,'Thor: Love and thunder','/TPI-Cine/assets/img/thor.png','Secuela de \"Thor: Ragnarok\" en la que el Dios del Trueno contará con Lady Thor como acompañante.','2022-07-07','Chris Hemsworth, Christian Bale, Tessa Thompson, Jaimie Alexander, Taika Waititi, Russell Crowe,Natalie Portman','Taika Waititi',119,1,3,NULL),(5,'The godfather','/TPI-Cine/assets/img/elpadrino.png','Don Vito Corleone es el respetado y temido jefe de una de las cinco familias de la mafia de Nueva York en los años 40. El hombre tiene cuatro hijos: Connie, Sonny, Fredo y Michael, que no quiere saber nada de los negocios sucios de su padre. Cuando otro capo, Sollozzo, intenta asesinar a Corleone, empieza una cruenta lucha entre los distintos clanes.','1972-08-10','Marlon Brando, Al Pacino, Robert Duvall, James Caan, Richard Castellano, Diane Keaton','Francis Ford Coppola',177,5,1,NULL),(6,'Deadpool','/TPI-Cine/assets/img/deadpool.png','Wade Wilson, tras ser sometido a un cruel experimento científico, adquiere poderes especiales que le convierten en Deadpool. Armado con sus nuevas habilidades y un retorcido sentido del humor tratará de dar caza al hombre que casi destruye su vida.','2016-02-11','Ryan Reynolds, Morena Baccarin, Ed Skrein, T. J. Miller, Gina Carano, Leslie Uggams, Brianna Hildebrand, Stefan KapiÃ„ï¿½iÃ„â€¡','Tim Miller',109,4,2,NULL),(7,'The Hangover','/TPI-Cine/assets/img/thehangover.png','Cuatro amigos celebran la despedida de soltero de uno de ellos en Las Vegas. Pero, cuando a la maÃ±ana siguiente no pueden encontrar al novio y no recuerdan nada, deberÃ¡n intentar volver sobre sus pasos, antes de que llegue la hora de la boda.','2009-06-05','Bradley Cooper, Ed Helms, Zach Galifianakis, Heather Graham, Mike Epps, Justin Bartha, Jeffrey Tambor','Todd Philips',100,5,3,NULL),(8,'Shrek 2','/TPI-Cine/assets/img/shrek.png','Shrek, nuestro ogro favorito, debe enfrentarse al mayor de los problemas que se podía imaginar: conocer a sus suegros.','2004-06-17','Mike Myers, Cameron Diaz, Eddie Murphy, Antonio Banderas, Julie Andrews, John Cleese, Rupert Everett, Jennifer Saunders, Larry King','Andrew Adamson',93,1,4,NULL),(9,'Transformers: Revenge of the Fallen','/TPI-Cine/assets/img/transformers.png','Han pasado dos años desde que los Transformers irrumpieran en la vida de Sam Witwicky. Ahora, el objetivo de Sam es ingresar en la Universidad y llevar una vida tranquila. Pero se ve otra vez involucrado en la guerra entre Autobots y Decepticons.','2009-06-25','Shia LaBeouf, Megan Fox, Josh Duhamel, Tyrese Gibson, John Turturro','Michael Bay',150,3,2,NULL),(10,'8 mile','/TPI-Cine/assets/img/8mile.png','Jimmy Smith, \'Rabbit\', vive en un barrio pobre de Detroit donde predomina la población negra. Él es un chico blanco apasionado por el hip-hop. Tiene problemas con su novia, pasa apuros económicos y sus relaciones con su madre no son muy armoniosas.','2002-01-23','Eminem, Kim Basinger, Brittany Murphy, Mekhi Phifer, Evan Jones, Omar Benson Miller, Eugene Byrd, De\'Angelo Wilson, Anthony Mackie, Michael Shannon','Curtis Hanson',106,5,1,NULL),(28,'La Monja II','https://i.imgur.com/PEZryj0.jpg','Una monja se suicida en una abadía rumana y el Vaticano envía a un sacerdote y una novicia a investigar lo sucedido. Lo que ambos encuentran allí es un secreto perverso que los enfrentará cara a cara con el mal en su esencia más pura.','2023-09-08','Taissa Farmiga como la Hermana Irene, Jonas Bloquet como Frenchie/Maurice, Bonnie Aarons como Valak / La monja','Michael Chaves',110,4,5,NULL),(29,'One Piece: The Movie (2000)','https://i.imgur.com/m2HOqip.jpg','Había una vez un pirata conocido como “El Gran Pirata de Oro” Woonan, que obtuvo casi un tercio de oro del mundo. En el transcurso de pocos años, la existencia de los piratas se desvaneció, y una leyenda creció, se decía que Woonan había ido a una remota isla a esconder su oro, hoy en día muchos piratas continúan buscándolo.','2000-03-04','Mayumi Tanaka, Kazuya Nakai, Akemi Okamura, 	Kappei Yamaguchi','Junji Shimizu',51,1,4,NULL);
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
INSERT INTO `room_type` VALUES (1,'IMAX Doblado',14,14,1600.00),(2,'3D Doblado',10,10,1200.00),(3,'2D Doblado',15,12,900.00),(4,'IMAX Ingles Subtitulado',10,10,1450.00),(5,'4D Doblado',14,14,1300.00),(6,'2D Inglés Subtitulado',15,15,800.00),(7,'2D Doblado',14,14,770.00),(8,'3D Ingles Subtitulado',15,15,1250.00),(9,'4D Ingles Subtitulado',14,14,1225.00);
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
INSERT INTO `show` VALUES (1,1,'2022-12-08 04:08:54'),(2,1,'2022-10-27 10:47:07'),(3,1,'2022-09-03 22:00:00'),(5,1,'2022-11-08 11:02:04'),(5,1,'2022-12-22 10:51:22'),(6,1,'2022-12-20 10:16:48'),(8,1,'2022-11-27 13:25:31'),(9,1,'2022-10-22 13:29:47'),(10,1,'2023-11-26 22:35:00'),(1,2,'2022-11-28 18:50:39'),(2,2,'2022-12-27 18:11:54'),(3,2,'2023-12-23 20:40:00'),(4,2,'2022-09-05 21:30:00'),(4,2,'2022-10-21 07:38:39'),(4,2,'2022-11-15 10:02:54'),(5,2,'2022-11-06 10:56:34'),(6,2,'2022-11-12 23:59:00'),(8,2,'2022-12-04 18:45:04'),(9,2,'2022-09-01 13:30:00'),(9,2,'2022-11-13 14:38:16'),(10,2,'2022-12-08 14:37:58'),(10,2,'2023-11-21 10:35:00'),(1,3,'2022-11-03 06:18:05'),(2,3,'2022-09-01 16:30:00'),(2,3,'2022-09-02 19:45:00'),(4,3,'2022-11-09 04:26:03'),(5,3,'2023-12-20 16:40:00'),(8,3,'2022-11-03 11:25:17'),(8,3,'2022-11-08 11:51:55'),(8,3,'2022-11-21 09:52:14'),(9,3,'2022-10-23 03:51:54'),(9,3,'2022-12-08 02:03:57'),(10,3,'2022-10-17 15:47:36'),(10,3,'2022-11-13 16:49:00'),(10,3,'2023-06-08 20:40:00'),(1,4,'2022-11-02 19:45:00'),(1,4,'2022-11-11 20:23:00'),(3,4,'2022-10-21 09:14:37'),(3,4,'2022-11-30 02:15:46'),(5,4,'2022-12-26 11:24:13'),(6,4,'2022-09-02 18:00:00'),(8,4,'2022-12-24 06:39:43'),(10,4,'2022-10-28 11:09:38'),(10,4,'2022-11-19 16:50:00'),(28,4,'2023-11-18 20:13:00'),(1,5,'2022-11-10 15:52:21'),(2,5,'2022-11-18 23:01:50'),(3,5,'2022-11-24 16:58:57'),(6,5,'2022-11-01 14:12:54'),(6,5,'2022-12-17 06:55:30'),(10,5,'2022-11-17 07:13:40'),(1,6,'2022-10-23 00:30:16'),(1,6,'2022-11-13 03:00:59'),(2,6,'2022-12-20 16:24:17'),(3,6,'2022-12-20 16:07:49'),(8,6,'2022-10-21 21:20:06'),(10,6,'2022-11-13 16:49:00'),(10,6,'2022-12-18 16:07:01'),(29,6,'2023-12-29 22:20:00'),(2,7,'2022-12-05 04:41:54'),(5,7,'2022-11-12 23:26:49'),(5,7,'2022-11-23 02:19:13'),(7,7,'2022-11-22 03:08:04'),(7,7,'2022-12-11 21:01:11'),(8,7,'2022-10-27 11:56:10'),(8,7,'2022-12-14 05:28:44'),(8,7,'2022-12-22 13:43:10'),(10,8,'2023-11-22 10:35:00'),(28,8,'2023-12-29 22:45:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'222222','2022-07-18 22:30:00',900,48274,'2022-11-02 23:00:00'),(2,'123457','2022-09-18 22:30:00',900,48271,NULL),(3,'123458','2022-09-12 00:00:00',1100,48275,NULL),(4,'123459','2022-09-10 00:00:00',1000,48277,NULL),(5,'123460','2022-09-03 22:30:00',900,48272,NULL),(6,'123461','2022-09-03 23:35:10',900,48274,NULL),(7,'123462','2022-09-04 02:35:16',900,48275,NULL),(8,'123463','2022-11-09 16:51:43',1200,48271,'2022-11-09 16:51:50'),(9,'123464','2022-11-09 16:52:22',1200,48271,'2022-11-09 16:52:31'),(10,'123465','2022-11-10 10:22:41',1200,48280,'2022-11-10 10:23:01'),(11,'123466','2022-11-10 10:22:41',1200,48280,'2022-11-10 10:23:02'),(12,'123467','2022-11-10 10:22:41',1200,48280,'2022-11-10 10:23:04'),(13,'123468','2022-11-10 10:23:34',1200,48280,NULL),(14,'123469','2022-11-10 10:25:32',1200,48280,NULL),(15,'123470','2022-11-10 10:43:54',1200,48280,'2022-11-10 10:44:11'),(16,'123471','2022-11-10 10:43:54',1200,48280,'2022-11-10 10:45:12'),(17,'123472','2022-11-10 10:45:39',1200,48280,NULL),(18,'123473','2022-11-10 11:00:59',1200,48280,NULL),(66,'123474','2022-11-12 11:49:03',1450,48292,NULL),(68,'123475','2022-11-13 10:55:38',1450,48292,NULL),(69,'123476','2022-11-13 16:35:31',1200,48292,NULL),(70,'123477','2023-04-08 20:40:29',1200,48292,NULL),(71,'123478','2023-11-17 20:14:20',1600,48292,NULL),(72,'123479','2023-11-20 10:37:43',1200,48274,NULL),(73,'123480','2023-11-20 10:38:22',1200,48274,NULL),(74,'123481','2023-11-20 10:38:22',1200,48274,NULL),(75,'123482','2023-11-20 10:38:22',1200,48274,NULL),(76,'123483','2023-11-20 10:39:53',1200,48274,NULL),(77,'123484','2023-11-20 10:47:59',1200,48292,'2023-11-21 10:37:38'),(78,'123485','2023-11-20 10:47:59',1200,48292,NULL),(79,'123486','2023-11-21 11:14:23',1450,48292,NULL),(80,'123487','2023-11-22 11:09:12',1450,48292,NULL),(81,'123488','2023-11-22 11:09:12',1450,48292,NULL),(82,'123489','2023-11-22 11:09:12',1450,48292,NULL),(83,'123490','2023-11-22 11:09:12',1450,48292,NULL),(84,'123491','2023-11-22 11:09:12',1450,48292,NULL),(85,'123492','2023-11-22 11:09:13',1450,48292,NULL),(86,'123493','2023-11-22 11:09:13',1450,48292,NULL),(87,'123494','2023-11-22 11:09:13',1450,48292,NULL),(88,'123495','2023-11-22 11:09:13',1450,48292,NULL),(89,'123496','2023-11-22 11:09:13',1450,48292,NULL),(90,'123497','2023-11-22 11:10:32',1450,48292,NULL),(91,'123498','2023-11-22 11:10:32',1450,48292,NULL),(92,'123499','2023-11-22 11:10:33',1450,48292,NULL),(93,'123500','2023-11-22 11:10:33',1450,48292,NULL),(94,'123501','2023-11-22 11:10:34',1450,48292,NULL),(95,'123502','2023-11-22 11:10:34',1450,48292,NULL),(96,'123503','2023-11-22 11:10:34',1450,48292,NULL),(97,'123504','2023-11-22 11:10:34',1450,48292,NULL),(98,'123505','2023-11-22 11:10:34',1450,48292,NULL),(99,'123506','2023-11-22 11:10:34',1450,48292,NULL),(100,'123507','2023-11-22 11:11:11',1450,48292,NULL),(101,'123508','2023-11-22 11:11:11',1450,48292,NULL),(102,'123509','2023-11-22 11:11:11',1450,48292,NULL),(103,'123510','2023-11-22 11:11:11',1450,48292,NULL),(104,'123511','2023-11-22 11:11:11',1450,48292,NULL),(105,'123512','2023-11-22 11:11:11',1450,48292,NULL),(106,'123513','2023-11-22 11:11:12',1450,48292,NULL),(107,'123514','2023-11-22 11:11:12',1450,48292,NULL),(108,'123515','2023-11-22 11:11:12',1450,48292,NULL),(109,'123516','2023-11-22 11:11:12',1450,48292,NULL),(110,'123517','2023-11-22 12:07:49',1450,48292,NULL),(111,'123518','2023-11-22 21:13:07',1450,48292,NULL),(112,'123519','2023-11-22 21:13:07',1450,48292,NULL),(113,'123520','2023-11-22 21:13:07',1450,48292,NULL),(114,'123521','2023-11-22 21:13:07',1450,48292,NULL),(115,'123522','2023-11-23 10:40:30',1300,48273,NULL),(116,'123523','2023-11-23 10:40:30',1300,48273,NULL),(117,'123524','2023-11-23 10:40:31',1300,48273,NULL),(118,'123525','2023-11-23 10:40:31',1300,48273,NULL);
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
INSERT INTO `ubication` VALUES (1,4,1,3,'2022-09-03 22:00:00',1),(1,5,1,3,'2022-09-03 22:00:00',2),(5,3,1,3,'2022-09-03 22:00:00',2),(5,7,2,4,'2022-09-05 21:30:00',3),(3,9,1,3,'2022-09-03 22:00:00',4),(2,7,1,3,'2022-09-03 22:00:00',6),(4,6,2,4,'2022-11-15 10:02:54',8),(1,1,2,4,'2022-11-15 10:02:54',9),(8,6,6,1,'2022-11-13 03:00:59',66),(5,7,6,10,'2022-12-18 16:07:01',68),(5,6,3,9,'2022-12-08 02:03:57',69),(4,7,3,10,'2023-06-08 20:40:00',70),(7,8,4,28,'2023-11-18 20:13:00',71),(6,6,1,10,'2023-11-26 22:35:00',72),(9,2,1,10,'2023-11-26 22:35:00',73),(9,3,1,10,'2023-11-26 22:35:00',74),(9,4,1,10,'2023-11-26 22:35:00',75),(7,8,1,10,'2023-11-26 22:35:00',76),(10,7,1,10,'2023-11-26 22:35:00',78),(1,3,6,29,'2023-12-29 22:20:00',79),(10,1,6,29,'2023-12-29 22:20:00',80),(10,2,6,29,'2023-12-29 22:20:00',81),(10,3,6,29,'2023-12-29 22:20:00',82),(10,4,6,29,'2023-12-29 22:20:00',83),(10,5,6,29,'2023-12-29 22:20:00',84),(10,6,6,29,'2023-12-29 22:20:00',85),(10,7,6,29,'2023-12-29 22:20:00',86),(10,8,6,29,'2023-12-29 22:20:00',87),(10,9,6,29,'2023-12-29 22:20:00',88),(10,10,6,29,'2023-12-29 22:20:00',89),(4,7,6,29,'2023-12-29 22:20:00',90),(5,7,6,29,'2023-12-29 22:20:00',91),(6,7,6,29,'2023-12-29 22:20:00',92),(6,6,6,29,'2023-12-29 22:20:00',93),(5,6,6,29,'2023-12-29 22:20:00',94),(4,6,6,29,'2023-12-29 22:20:00',95),(7,5,6,29,'2023-12-29 22:20:00',96),(7,4,6,29,'2023-12-29 22:20:00',97),(7,3,6,29,'2023-12-29 22:20:00',98),(7,2,6,29,'2023-12-29 22:20:00',99),(7,10,6,29,'2023-12-29 22:20:00',100),(8,10,6,29,'2023-12-29 22:20:00',101),(7,6,6,29,'2023-12-29 22:20:00',102),(7,7,6,29,'2023-12-29 22:20:00',103),(7,8,6,29,'2023-12-29 22:20:00',104),(7,9,6,29,'2023-12-29 22:20:00',105),(4,1,6,29,'2023-12-29 22:20:00',106),(3,1,6,29,'2023-12-29 22:20:00',107),(9,6,6,29,'2023-12-29 22:20:00',108),(9,7,6,29,'2023-12-29 22:20:00',109),(4,3,6,29,'2023-12-29 22:20:00',110),(2,5,6,29,'2023-12-29 22:20:00',111),(2,6,6,29,'2023-12-29 22:20:00',112),(2,7,6,29,'2023-12-29 22:20:00',113),(2,8,6,29,'2023-12-29 22:20:00',114),(11,8,8,28,'2023-12-29 22:45:00',115),(11,9,8,28,'2023-12-29 22:45:00',116),(11,10,8,28,'2023-12-29 22:45:00',117),(11,11,8,28,'2023-12-29 22:45:00',118);
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
) ENGINE=InnoDB AUTO_INCREMENT=48294 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (48271,3,'Buschittari','Nahuel','nahu123','2000-10-03','Mitre 1256','3417863422','nahu_buschittari@hotmail.com'),(48272,1,'Messi','Lionel Andres','7balones','1987-06-24','Mitre 1235, Rosario, Santa Fe','123456','liomessi123@hotmail.com'),(48273,2,'Perez','Juan Cruz','taq456','2004-10-10','Batlle y Ordoñes 300, Rosario, Santa Fe','534786','perezJC10@gmail.com'),(48274,1,'Biglia','Lucas Rodrigo','pesimo5','1986-01-30','Mendoza 3657, Rosario, Santa Fe','987654','Biglia5@outlook.com'),(48275,1,'Almendra','Agustin','5deBoca','2000-02-11','Bv Seguí­ 5327, Rosario, Santa Fe','453761','Pipahdp@gmail.com'),(48277,1,'Rossi','Agustin','penales123','1995-08-25','Rosas 755, Rosario, Santa Fe','321012','tukiLentes@outlook.com'),(48280,1,'Del Moro','Santiago','granhermano','1985-10-11','Casa GH','12345678','santidelmoro@gmail.com'),(48292,3,'Vivas','Facundo','flechita','2002-04-15','Calle Anonima 2','10203040','facundovivas15@gmail.com'),(48293,3,'Mr.','admin','admin','2022-10-11','no-address','00000000','admin@cinesOrfeo.com');
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

-- Dump completed on 2023-11-23 11:41:17
