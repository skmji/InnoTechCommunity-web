-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: techblog
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `techblog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `techblog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `techblog`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) NOT NULL,
  `cdescription` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'java Programming','java is the popular language developed by James Gosling'),(2,'php programming','php is a simple programming language for server-side scripting'),(3,'spring boot','Spring Boot is a very popular framework for Java programming'),(4,'python','python is lightwait programming language'),(5,'javaScript','javaScript is client side programming language');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(250) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `comments_ibfk_1` (`pid`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `post` (`pid`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (149,'aa gyle line pe',45,4,'2024-09-23 00:30:54'),(150,'wow',49,1,'2024-09-23 00:39:28'),(151,'this is wonderfull',52,4,'2024-09-24 12:25:25'),(152,'wow',52,4,'2024-09-24 12:39:19'),(153,'wow!',54,4,'2024-09-24 22:55:04'),(154,'wow!',53,4,'2024-09-25 00:07:25'),(155,'super',54,4,'2024-09-25 00:13:20'),(156,'wow2',54,4,'2024-09-25 00:14:39'),(157,'wow3',54,4,'2024-09-25 00:15:21'),(158,'wow5',54,4,'2024-09-25 00:16:38'),(159,'sw',54,4,'2024-09-25 00:17:02'),(160,'s',54,4,'2024-09-25 00:17:48'),(161,'ji',54,4,'2024-09-25 00:21:11'),(162,'ji',54,4,'2024-09-25 00:21:33'),(163,'sf',54,4,'2024-09-25 00:22:09'),(164,'ds',54,4,'2024-09-25 00:22:35'),(165,'sdfd',54,4,'2024-09-25 00:22:46'),(166,'sdfd',54,4,'2024-09-25 00:25:06'),(167,'jdj',54,4,'2024-09-25 00:25:31'),(168,'dfd',54,4,'2024-09-25 00:25:35'),(169,'Really informative article on python. Covered the essentials really well. I am learning it at the moment. Looking forward to the next article.',54,5,'2024-09-25 10:42:51'),(170,'wow!',55,4,'2024-09-25 10:57:24'),(171,'thanks for sharing this information',53,3,'2024-09-25 10:59:04'),(172,'this information useful for me. 😊',55,1,'2024-09-25 11:01:54'),(173,'test',45,1,'2024-09-25 11:18:58'),(174,'test1',45,1,'2024-09-25 11:21:44'),(176,'amazing',52,1,'2024-09-25 13:00:22'),(177,'Good',51,1,'2024-09-25 13:51:50'),(192,'wow',68,1,'2024-10-25 13:51:33');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `ptitle` varchar(250) NOT NULL,
  `pcontent` longtext DEFAULT NULL,
  `pcode` longtext DEFAULT NULL,
  `pPics` varchar(200) DEFAULT NULL,
  `pdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `cid` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (45,'Java Annotations.','People Using Spring Framework in Java know how cool the annotations are, even I got surprised when I used the annotation for the first time. I\'m not saying that only spring has annotations, Java itself has a lot of Annotation and that work so good and reduce a lot of codes.\r\n\r\nWhen I was started to determine writing at least one annotation I thought the annotation will be capable of doing a lot of things without using any additional Methods, in fact, I was wrong.\r\n\r\nIf you want to write an annotation you need one Annotation and at least one method to facilitate the annotation,\r\n\r\nThe following example will show how easily you can create an annotation to Map fields from your Models to DTOs easily without having Setters or Constructors.\r\n\r\nhttps://github.com/saifali40/mapper','import java.lang.annotation.*;\r\n\r\n@Documented\r\n@Retention(RetentionPolicy.RUNTIME)\r\n@Target(ElementType.FIELD)\r\npublic @interface FieldMapper {\r\n    public String field();\r\n}','Premium Photo _ Business analytics concept with digital data diagrams and chart financial dashboard of company.jpeg','2024-09-22 19:00:23',1,4),(46,'Java 8: Functional interfaces, Lambdas, and Method References','Java SE 8 was a major release, it brought so many features and enhancements to the java language (e.g. Functional interfaces, Lambdas, Method references, Stream API, ...etc). in this article we will mainly focus on Functional interfaces, lambdas, and method references.\r\nbut before jumping to these features, let\'s first see why we need them in the first place by taking an example:\r\nImagine we have a Product class.\r\n\r\nand we want to implement an API to filter products based on their price (e.g. filter products whose price is greater than a specific price), a naive solution would be:\r\n','import java.util.ArrayList;\r\n\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    ArrayList<Integer> numbers = new ArrayList<Integer>();\r\n    numbers.add(5);\r\n    numbers.add(9);\r\n    numbers.add(8);\r\n    numbers.add(1);\r\n    numbers.forEach( (n) -> { System.out.println(n); } );\r\n  }\r\n}','java.jpeg','2024-09-22 19:01:20',1,4),(49,'Java recursion. Binary search and reversing arrays','Introduction\r\nThis series is going to be dedicated to learning and understanding data structures and algorithms in Java. All the information I am using is coming from the book, Data Structures and Algorithms in Java by Michael T. Goodrich and Roberto Tamassia and the California State Polytechnic University course, which is free and can be found HERE, shout out professor Tang. Please do not buy the book it is expensive and can be found online for MUCH cheaper.\r\n','public boolean binarySearch(int[] data, int target, int low, int high){\r\n        if(low > high){\r\n            return false;\r\n        }\r\n        else{\r\n            int mid = (low + high) / 2;\r\n            if(data[mid] == target){\r\n                return true;\r\n            }\r\n            else if(target < data[mid]){\r\n                return binarySearch(data,target,low,mid -1);\r\n\r\n            }\r\n            else{\r\n                return binarySearch(data,target,mid +1,high);\r\n            }\r\n        }\r\n    }\r\n\r\n','Coding and Programming.jpeg','2024-09-22 19:08:45',1,1),(50,'PHP 8: Constructor Property Promotion','Introduction\r\nIf you have been a software engineer for a while, you know that software engineers love using scary names to describe simple things. The term constructor property promotion should not scare you because you might be using it in your codebase already without realizing it has a fancy name.\r\n\r\nHere are the things you will achieve after reading this article.\r\n\r\nYou will be able to refactor a PHP class to use constructor property promotion instead of using the default syntax used when setting class properties in the constructor function.\r\nYou will know the different ways of accessing class properties after setting them using the constructor property promotion syntax.\r\nYou will know the common mistakes that lead to errors when using the constructor property promotion syntax in your PHP class and how to avoid them.\r\n','<?php\r\n\r\nclass Employee\r\n{\r\n\r\n  protected $firstName, $lastName;\r\n\r\n  public function __construct(string $firstName, string $lastName)\r\n  {\r\n    $this->firstName = $firstName;\r\n    $this->lastName = $lastName;\r\n  }\r\n}\r\n\r\n\r\n$employee = new Employee(\'Ibrahim\', \'Alausa\');','img11(1).jpeg','2024-09-22 19:22:38',2,1),(51,'How to Build Your Online Presence as a Developer','When entering a career, you have to find something that makes you competitiveâsomething that makes someone say, \"Hey, I want to hire this person so we can work together on this product or project.\"\r\n\r\nThere are many ways to achieve this. You can be skilled, you can have a good network, you can have rich parents, and you can also have an online presenceâhey, any unfair advantage is welcome.\r\n\r\nAnd this proves that itâs not always the most qualified person who gets the job or opportunity. I can tell you right now, many developers might not be as skilled as you but have secured opportunities simply because they have an unfair advantage.\r\n\r\nI\'m going to share what you can do as a developer to have a noticeable presence online. I\'ll also discuss how you can do it the hard way or the lazy way. I understand that some people aren\'t talkative or don\'t have time to be on every social media platform, but that\'s okay.\r\n\r\nI can provide the best ways you can be present on the internet, and you can choose what works for you. So, follow me along on this journey.\r\n\r\nIf you are interested in more content covering topics like this, subscribe to my newsletter for regular updates on software programming, architecture, technical writing, and tech-related insights.\r\n\r\n','',NULL,'2024-09-23 04:48:26',1,4),(52,'What is Java?','Java is a popular programming language, created in 1995.\r\n\r\nIt is owned by Oracle, and more than 3 billion devices run Java.\r\n\r\nIt is used for:\r\n\r\nMobile applications (specially Android apps)\r\nDesktop applications\r\nWeb applications\r\nWeb servers and application servers\r\nGames\r\nDatabase connection\r\nAnd much, much more!','','AI and Business.jpeg','2024-09-24 06:54:34',1,4),(53,'why learn spring','Spring Boot helps you to create stand-alone, production-grade Spring-based applications that you can run. We take an opinionated view of the Spring platform and third-party libraries, so that you can get started with minimum fuss. Most Spring Boot applications need very little Spring configuration.\r\n\r\nYou can use Spring Boot to create Java applications that can be started by using java -jar or more traditional war deployments.\r\n\r\nOur primary goals are:\r\n\r\nProvide a radically faster and widely accessible getting-started experience for all Spring development.\r\n\r\nBe opinionated out of the box but get out of the way quickly as requirements start to diverge from the defaults.\r\n\r\nProvide a range of non-functional features that are common to large classes of projects (such as embedded servers, security, metrics, health checks, and externalized configuration).\r\n\r\nAbsolutely no code generation (when not targeting native image) and no requirement for XML configuration.','','Spring Tutorial - 4 - Constructor Injection with Annotations.jpeg','2024-09-24 08:14:58',3,3),(54,'this java program','fjkkdkldkjlkds','','Java Course in Noida.jpeg','2024-09-24 09:18:21',1,4),(55,'JAVASCRIPT SPREAD OPERATOR','Hi everyone, I am here again with tips on how to write easy simple and clean code.\r\n\r\nGoing forward I will state an example on how to practice the use of Spread Operator\r\n\r\nLook at the code snippet below (using objects & arrays to shallow and copy).\r\nYou can easily re-write that code in a much more simple way. Life will be much more easier for anyone reading your code.\r\nThanks for reading and happy coding.\r\nJHON','const newObject = {};\r\nObject.keys(oldObject).forEach((key) => {\r\n    newObject[key] = oldObject[key];\r\n});\r\n\r\n\r\nconst newArray =[];\r\noldArray.forEach((element) => {\r\n   newArray.push(element);\r\n});\r\n\r\nconst newObject = { ...oldOject };\r\nconst newArray =[ ...oldArray ];','39 of the best JavaScript libraries and frameworks to try in 2021 - Layout _ Creative content for designers, developers, & marketers.jpeg','2024-09-25 05:07:38',5,5),(56,'Python: The Future','PYTHON IN WEB DEVELOPMENT\r\nHow does Python fit into web development? Python can be used to build server-side web applications. While a web framework isn\'t most often required to build web apps, it\'s rare that developers would not use existing open source libraries to speed up their progress in getting their application working.\r\nPython is not used in a web browser. The language executed in browsers such as Chrome, Firefox, and Internet Explorer is JavaScript. Projects such as pyjs can compile from Python to JavaScript. However, most Python developers write their web applications using a combination of Python and JavaScript. Python is executed on the server side, while JavaScript is downloaded to the client and run by the web browser. Python is said to be the âdo it all programming languageâ.\r\n\r\nPython also has web frameworks for web development, which makes the development process less cumbersome and gives the approach of web development a more structured outlook.\r\nThere\'s a good number of python web frameworks which are listed below:\r\n\r\nDjango\r\nCherryPy\r\nPyramid\r\nGrok\r\nTurboGears\r\nWeb2Py\r\nFlask\r\nThe very common ones are Django and Flask, which provide a great environment for web development.\r\n\r\nPYTHON IN DATA SCIENCE\r\nWhat exactly is data science?\r\nYou must have heard of data science, but what do you understand by this term? Who can be a data scientist?\r\n\r\nData science is a collection of various tools, data interfaces and algorithms with machine learning principles to discover hidden patterns from raw data. The raw data is stored in enterprise data warehouses and used in creative ways to generate business value from it.\r\nThere are various programming languages that can be used for data science (e.g., SQL, Java, Matlab, SAS, R and many more), but Python is the most preferred choice by data scientists among all the other programming languages in this list.\r\n\r\nPython has some extraordinary preferable features, including:\r\n\r\nâ Python is very strong and simple so that it is easy to learn the language. You donât need to worry about its syntax if you are a beginner.\r\n\r\nâ Python supports many platforms like Windows, Mac, Linux etc.\r\n\r\nâ Python is a high level programming language, so you write the program in simple near-English and this will be internally converted in low level code.\r\n\r\nâ Python is an interpreted language that means to it runs code one instruction at a time.\r\n\r\nâ Python can perform data visualization, data analysis, and data manipulation; NumPy and Pandas are some libraries used for manipulation.\r\n\r\nâ Python serves various powerful libraries for machine learning and scientific computations. Various complex scientific calculations and machine learning algorithms can be performed using this language easily in a relatively simple syntax.\r\n\r\nTHE FUTURE\r\nThere is more to python as a programming language, going as far as Artificial Intelligence, game development, Finance, Language development, data analytics, data visualization and so much more. The very important aspect I would like to explain is pythons power in Blockchain Development\r\nWhat exactly is a Blockchain\r\nBlockchain is a powerful technology with applications in fields such as cryptocurrency, healthcare, insurance, government, music, identification, supply chain, data management, and many more. By understanding the fundamental mechanisms that power blockchain, you can join the conversation and discover use cases for blockchain in your own life and work.\r\n\r\nWhat is a Python Blockchain\r\nA Python blockchain is simply a list of records (i.e., blocks) that are linked to one another in a transactional chain that is immutable, persistent, and distributed.\r\n\r\nThis article would be continued in my next post\r\n\r\nThe added advantage of understanding Python in the Web3 space and even the Web2 space can not be overlooked and in the long run, would benefit the Tech Community.','','cfd1a9e0-89d6-47f0-a81a-17cc258f5184.jpeg','2024-09-25 05:10:43',4,5),(60,'Java Data. Creating an entity with JPA and Hibernate','','',NULL,'2024-09-25 08:25:25',1,6),(68,'what is java programing','Java is a programming language and computing platform that powers many applications, operating systems, and other programs: ','public static int add(int a, int b) {\r\n    return a + b;\r\n}','Coding and Programming.jpeg','2024-10-22 14:35:18',1,1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `userId` (`userId`),
  CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `post` (`pid`),
  CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=479 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
INSERT INTO `post_likes` VALUES (407,49,1),(410,49,4),(420,45,4),(431,46,4),(442,52,4),(443,53,4),(446,54,5),(447,52,5),(448,56,5),(449,55,5),(450,53,5),(451,51,5),(452,55,4),(453,51,3),(459,55,1),(461,52,1),(464,60,6),(469,53,1),(472,51,1),(475,60,1),(478,68,1);
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `about` varchar(1000) DEFAULT 'hey I am using InoTech',
  `tdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile` varchar(500) DEFAULT 'default.png',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'sanjay maury','skm@gmail.com','pass','male','I \'m senior dev','2024-08-11 17:31:19','boys.jpeg'),(2,'sanjay maury','sanjay@gmail.com','pass','male','I senior devloper','2024-08-17 10:39:50','default.png'),(3,'sanjay kumar','abc@gmail.com','pass','male','I\'m java Devloper','2024-09-16 17:29:28','_ (1).jpeg'),(4,'musers','muser@gmail.com','pass','male','nothing is imposible','2024-09-17 13:14:11','ANIME NOY 4K DP AND WALLPAPER.jpeg'),(5,'jhon','jhon@gmail.com','pass','male','I\'m devloper','2024-09-25 05:03:41','Profile Picture Vector Illustration 12, Profile, Picture, Photo PNG and Vector with Transparent Backgrosdfdf Download.jpeg'),(6,'shivamdh','dhingrashivam51@gmail.com','Sd.123','male','Helloooo','2024-09-25 08:23:12','facebook 3D illustration.jpeg'),(7,'sanjay maury','skm2@gmail.com','pass','male','nothing is imposible','2024-09-25 09:18:15','default.png'),(8,'sanjay maury','sanjay@gmail.com','pass','male','I\'m java Devloper','2024-10-22 14:31:27','default.png');
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

-- Dump completed on 2024-11-24 11:34:42
