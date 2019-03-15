-- MySQL dump 10.13  Distrib 5.6.38, for osx10.9 (x86_64)
--
-- Host: localhost    Database: movies_db2
-- ------------------------------------------------------
-- Server version	5.6.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `movies_db2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `movies_db2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `movies_db2`;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors` (
  `actors_id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_firstname` varchar(45) NOT NULL,
  `actor_lastname` varchar(45) NOT NULL,
  `actor_gender` varchar(6) NOT NULL,
  `actor_birthyear` int(11) NOT NULL,
  PRIMARY KEY (`actors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directors` (
  `directors_id` int(11) NOT NULL AUTO_INCREMENT,
  `director_firstname` varchar(45) NOT NULL,
  `director_lastname` varchar(45) NOT NULL,
  PRIMARY KEY (`directors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genres_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_type` varchar(45) NOT NULL,
  PRIMARY KEY (`genres_id`),
  UNIQUE KEY `genre_type_UNIQUE` (`genre_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Action'),(2,'Comedy');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_cast`
--

DROP TABLE IF EXISTS `movie_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_cast` (
  `movies_movies_id` int(11) NOT NULL,
  `actors_actors_id` int(11) NOT NULL,
  PRIMARY KEY (`movies_movies_id`,`actors_actors_id`),
  KEY `fk_movie_cast_movies1_idx` (`movies_movies_id`),
  KEY `fk_movie_cast_actors1_idx` (`actors_actors_id`),
  CONSTRAINT `fk_movie_cast_actors1` FOREIGN KEY (`actors_actors_id`) REFERENCES `actors` (`actors_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_cast_movies1` FOREIGN KEY (`movies_movies_id`) REFERENCES `movies` (`movies_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_cast`
--

LOCK TABLES `movie_cast` WRITE;
/*!40000 ALTER TABLE `movie_cast` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_direction`
--

DROP TABLE IF EXISTS `movie_direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_direction` (
  `movies_movies_id` int(11) NOT NULL,
  `directors_directors_id` int(11) NOT NULL,
  PRIMARY KEY (`movies_movies_id`,`directors_directors_id`),
  KEY `fk_movie_direction_movies1_idx` (`movies_movies_id`),
  KEY `fk_movie_direction_directors1_idx` (`directors_directors_id`),
  CONSTRAINT `fk_movie_direction_directors1` FOREIGN KEY (`directors_directors_id`) REFERENCES `directors` (`directors_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_direction_movies1` FOREIGN KEY (`movies_movies_id`) REFERENCES `movies` (`movies_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_direction`
--

LOCK TABLES `movie_direction` WRITE;
/*!40000 ALTER TABLE `movie_direction` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genres`
--

DROP TABLE IF EXISTS `movie_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_genres` (
  `movies_movies_id` int(11) NOT NULL,
  `genres_genres_id` int(11) NOT NULL,
  PRIMARY KEY (`movies_movies_id`,`genres_genres_id`),
  KEY `fk_movie_genres_movies1_idx` (`movies_movies_id`),
  KEY `fk_movie_genres_genres1_idx` (`genres_genres_id`),
  CONSTRAINT `fk_movie_genres_genres1` FOREIGN KEY (`genres_genres_id`) REFERENCES `genres` (`genres_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_genres_movies1` FOREIGN KEY (`movies_movies_id`) REFERENCES `movies` (`movies_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genres`
--

LOCK TABLES `movie_genres` WRITE;
/*!40000 ALTER TABLE `movie_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `movies_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_title` varchar(255) NOT NULL,
  `movie_runtime` int(11) NOT NULL,
  `movie_release_date` int(11) NOT NULL,
  `movie_description` varchar(255) NOT NULL,
  `movie_rating` enum('G','PG','PG-13','R') NOT NULL,
  `movie_image` varchar(255) NOT NULL,
  `movie_director` varchar(255) NOT NULL,
  PRIMARY KEY (`movies_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'new',111,0,'sd','G','','sss'),(2,'Kill Bill: Vol. 1',111,2003,'The Bride, was a member of the Deadly Viper Assassination Squad','G','','Quentin Tarantino '),(3,'Kill Bill: Vol. 1',111,2003,'The lead character, called \'The Bride,\' was a member of the Deadly Viper Assassination Squad, led by her lover \'Bill.\' Upon realizing she was pregnant with Bill\'s child, \'The Bride\' decided to escape her life as a killer. She fled to Texas, met a young ma','G','','Quentin Tarantino '),(4,'Harold and Kumar Go to White Castle',88,2004,'','R','handk.jpg','Danny Leiner'),(5,'Harold and Kumar Go to White Castle',88,2004,'Harold Lee and Kumar Patel are best friends and roommates who share a common love for marijuana. Harold works for an investment bank while Kumar is being pressured by his father to go into medical school. On a Friday night after smoking marijuana, the duo','R','handk.jpg','Danny Leiner'),(6,'Captain Marvel',100,2019,'Carol Danvers becomes one of the universe\'s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.','G','cmarvel.jpg','Anna Boden');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-04 13:57:10
