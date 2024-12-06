-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `BookTitle` varchar(150) NOT NULL,
  `Author` varchar(150) NOT NULL,
  `PublicationDate` date NOT NULL,
  `Category` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'To Kill a Mockingbird','Harper Lee','1960-07-11','History'),(2,'1984','George Orwell','1949-06-15','History'),(3,'Pride and Prejudice','Jane Austen','1813-03-23','History'),(4,'The Great Gatsby','F. Scott Fitzgerald','1925-05-10','History'),(5,'Moby-Dick','Herman Melville','1851-11-15','Adventure'),(6,'The Night Circus','Erin Morgenstern','2011-09-18','Adventure'),(7,'The Goldfinch','Donna Tartt','2013-10-23','Drama'),(8,'Where the Crawdads Sing','Delia Owens','2018-08-05','Drama'),(9,'Normal People','Sally Rooney','2018-04-12','Drama'),(10,'The Midnight Library','Matt Haig','2020-02-25','Fantasy'),(11,'The Catcher in the Rye','J.D. Salinger','1951-07-16','Drama'),(12,'The Handmaids Tale','Margaret Atwood','1985-05-18','Fiction'),(13,'Little Women','Louisa May Alcott','1868-10-06','History'),(14,'The Hunger Games','Suzanne Collins','2008-09-14','Action'),(15,'The Road','Cormac McCarthy','2006-06-22','Adventure'),(16,'The Fault in Our Stars','John Green','2012-01-29','Drama'),(17,'A Game of Thrones','George R.R. Martin','1996-08-06','Adventure'),(18,'The Girl on the Train','Paula Hawkins','2015-07-09','Thriller'),(19,'The Alchemist','Paulo Coelho','1988-04-13','Adventure'),(20,'The Shining','Stephen King','1977-11-08','Horror'),(21,'The Secret History','Donna Tartt','1992-02-14','Fiction'),(22,'The Kite Runner','Khaled Hosseini','2003-12-14','History');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-06 19:15:38
