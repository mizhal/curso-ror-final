-- MySQL dump 10.13  Distrib 5.1.63, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: Proyecto_development
-- ------------------------------------------------------
-- Server version	5.1.63-0+squeeze1

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
-- Table structure for table `accommodations`
--

DROP TABLE IF EXISTS `accommodations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accommodations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brief_description` text COLLATE utf8_unicode_ci,
  `rooms_description` text COLLATE utf8_unicode_ci,
  `slogan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `province_id` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` int(11) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `landlord_id` int(11) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `gmaps` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_accommodations_on_slug` (`slug`),
  KEY `index_accommodations_on_landlord_id` (`landlord_id`),
  KEY `index_accommodations_on_province_id` (`province_id`),
  KEY `index_accommodations_on_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=419850328 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodations`
--

LOCK TABLES `accommodations` WRITE;
/*!40000 ALTER TABLE `accommodations` DISABLE KEYS */;
INSERT INTO `accommodations` VALUES (10854051,'Casa Martin','Como en su propia casa',' Sed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ','Como en su propia casa','Doña luisa es conocida en todo el valle...',242504429,'Segovia','Av Padre Claret, 9',33400,1,1,660144537,353329212,'985 21 02 01','casamartin@gmail.com','https://nextbox.groups.com/profile?u=234232&qq=ixo','2013-02-20 08:14:27','2013-02-20 11:58:29','casa-martin',40.9457,-4.11148,NULL),(419850324,'Casa Luisa','Como en su propia casa...','Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis.\r\n\r\nSed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n\r\nDuis mattis hendrerit nunc, non dignissim purus sodales ultrices. Sed dolor lectus, congue sed tempus eu, tristique eu velit. Morbi consequat sagittis sapien eget placerat. Ut vulputate dui ut ante varius suscipit. Sed interdum sapien ut purus vulputate mattis. Sed non neque enim, ac dignissim tellus. Nulla sollicitudin ultricies metus nec tincidunt. Phasellus eget purus massa, sit amet eleifend sapien.\r\n\r\nQuisque dignissim vestibulum velit, vitae lobortis quam congue eget. Mauris sem tortor, varius ut luctus quis, sodales in orci. Nulla lobortis nibh lacus, a eleifend turpis.','Como en su propia casa','Doña luisa es conocida en todo el valle...',918058826,'Arriondas','Av de Europa, 1',33400,1,1,361256246,353329212,'985 21 02 01','casaluisa@gmail.com','https://nextbox.groups.com/profile?u=234232&qq=ixo','2013-02-20 08:14:27','2013-02-20 11:45:47','casa-luisa',43.3898,-5.18374,NULL),(419850325,'La Torre','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam gravida porttitor mi ac rhoncus. Suspendisse potenti. Maecenas id tortor turpis, id sagittis ante. Nam rhoncus leo sit amet erat cursus lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum adipiscing odio et justo congue vel fermentum eros vestibulum. Nullam vel elit augue, a posuere purus. Etiam risus dolor, ornare vitae mollis imperdiet, lacinia et diam. Aliquam fermentum hendrerit nulla egestas varius. Morbi a purus massa. Mauris commodo porttitor adipiscing. Mauris at metus velit, sed ornare nisi. ','\r\n\r\nQuisque dignissim vestibulum velit, vitae lobortis quam congue eget. Mauris sem tortor, varius ut luctus quis, sodales in orci. Nulla lobortis nibh lacus, a eleifend turpis. Suspendisse posuere mattis felis, sed fringilla nunc faucibus non. Curabitur porttitor tristique tempus. Fusce sit amet tellus eros, vel facilisis nisl. Donec vel ante diam, nec feugiat felis. Sed in quam dolor. Sed tristique pretium dolor et elementum. ','Mas alta que ninguna',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis.\r\n\r\nSed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n\r\nDuis mattis hendrerit nunc, non dignissim purus sodales ultrices. Sed dolor lectus, congue sed tempus eu, tristique eu velit. Morbi consequat sagittis sapien eget placerat. Ut vulputate dui ut ante varius suscipit. Sed interdum sapien ut purus vulputate mattis. Sed non neque enim, ac dignissim tellus. Nulla sollicitudin ultricies metus nec tincidunt. Phasellus eget purus massa, sit amet eleifend sapien.\r\n\r\nQuisque dignissim vestibulum velit, vitae lobortis quam congue eget. Mauris sem tortor, varius ut luctus quis, sodales in orci. Nulla lobortis nibh lacus, a eleifend turpis. Suspendisse posuere mattis felis, sed fringilla nunc faucibus non. Curabitur porttitor tristique tempus. Fusce sit amet tellus eros, vel facilisis nisl. Donec vel ante diam, nec feugiat felis. Sed in quam dolor. Sed tristique pretium dolor et elementum. ',941501934,'laredo','c mayor, 1',32443,1,1,842922454,1069403510,'98540020101','m@m.es','https://dsfsdfds.es/net?user=mary','2013-02-20 11:30:27','2013-02-20 11:30:27','la-torre',43.4104,-3.41694,NULL),(419850326,'Casa de María','			<% unless index + 1 == accommodation.offers.length  %> ',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis.\r\n\r\nSed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ','La mia',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis.\r\n\r\nSed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ',941501934,'santoña','Calle de la verde, 2',32344,1,1,660144537,1000456412,'98540020101','m@m.es','https://dsfsdfds.es/net?user=mary','2013-02-20 12:02:25','2013-02-20 12:08:49','casa-de-maria',43.4458,-3.45796,NULL),(419850327,'Castillo la Vega',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ','Bien defendido',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ',941501934,'torrelavega','posada herrera, 8 ',32232,1,1,430413171,1069403510,'98540020101','m@m.es','https://dsfsdfds.es/net?user=mary','2013-02-20 12:11:11','2013-02-20 12:11:11','castillo-la-vega',43.3494,-4.05307,NULL);
/*!40000 ALTER TABLE `accommodations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_categories_on_slug` (`slug`),
  KEY `index_categories_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=867378708 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (44409450,'Albergue',NULL,'2013-02-20 08:14:27','2013-02-20 08:14:27',NULL,NULL,NULL,NULL,NULL),(55795417,'Hotel',NULL,'2013-02-20 08:14:27','2013-02-20 08:14:27',NULL,NULL,NULL,NULL,NULL),(283115851,'Casa Rural',NULL,'2013-02-20 08:14:27','2013-02-20 08:14:27',NULL,NULL,NULL,NULL,NULL),(342244668,'1 Estrella',55795417,'2013-02-20 08:14:27','2013-02-20 08:14:27',NULL,NULL,NULL,NULL,NULL),(361256246,'1 Tenedor',283115851,'2013-02-20 08:14:27','2013-02-20 08:14:27',NULL,NULL,NULL,NULL,NULL),(430413171,'1 Mochila',44409450,'2013-02-20 08:14:27','2013-02-20 08:14:27',NULL,NULL,NULL,NULL,NULL),(651681372,'2 Tenedores',283115851,'2013-02-20 08:14:27','2013-02-20 08:14:27',NULL,NULL,NULL,NULL,NULL),(660144537,'3 Tenedores',283115851,'2013-02-20 08:14:27','2013-02-20 11:46:31','3-tenedores','3tenedores01.gif','image/gif',2269,'2013-02-20 11:46:30'),(842922454,'3 Estrellas',55795417,'2013-02-20 08:14:27','2013-02-20 08:14:27',NULL,NULL,NULL,NULL,NULL),(867378707,'2 Estrellas',55795417,'2013-02-20 08:14:27','2013-02-20 08:14:27',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_values`
--

DROP TABLE IF EXISTS `config_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=980190964 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_values`
--

LOCK TABLES `config_values` WRITE;
/*!40000 ALTER TABLE `config_values` DISABLE KEYS */;
INSERT INTO `config_values` VALUES (298486374,'default_image.accommodations','MyString',NULL,'2013-02-20 08:14:27','2013-02-20 08:18:50'),(980190962,'default_image.room_types','MyString',NULL,'2013-02-20 08:14:27','2013-02-20 08:19:13'),(980190963,'default_image.offers','',NULL,'2013-02-20 08:24:09','2013-02-20 08:24:09');
/*!40000 ALTER TABLE `config_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=891143842 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (397370033,'Portugal'),(891143841,'España');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `price` float DEFAULT NULL,
  `accommodation_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_offers_on_slug` (`slug`),
  KEY `index_offers_on_accommodation_id` (`accommodation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=858104789 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (858104782,'Descuento especial semana negra','Descuento del 3% durante la semana del tal al tal','con motivo de...',200.332,419850324,'2013-02-20 08:14:26','2013-02-20 08:14:26',NULL),(858104785,'Grandes fiestas patronales','Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. \r\n','\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam gravida porttitor mi ac rhoncus. Suspendisse potenti. Maecenas id tortor turpis, id sagittis ante. Nam rhoncus leo sit amet erat cursus lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum adipiscing odio et justo congue vel fermentum eros vestibulum. Nullam vel elit augue, a posuere purus. Etiam risus dolor, ornare vitae mollis imperdiet, lacinia et diam. Aliquam fermentum hendrerit nulla egestas varius. Morbi a purus massa. Mauris commodo porttitor adipiscing. Mauris at metus velit, sed ornare nisi.\r\n\r\nDonec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis.\r\n\r\nSed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n\r\nDuis mattis hendrerit nunc, non dignissim purus sodales ultrices. Sed dolor lectus, congue sed tempus eu, tristique eu velit. Morbi consequat sagittis sapien eget placerat. Ut vulputate dui ut ante varius suscipit. Sed interdum sapien ut purus vulputate mattis. Sed non neque enim, ac dignissim tellus. Nulla sollicitudin ultricies metus nec tincidunt. Phasellus eget purus massa, sit amet eleifend sapien.\r\n\r\nQuisque dignissim vestibulum velit, vitae lobortis quam congue eget. Mauris sem tortor, varius ut luctus quis, sodales in orci. Nulla lobortis nibh lacus, a eleifend turpis. Suspendisse posuere mattis felis, sed fringilla nunc faucibus non. Curabitur porttitor tristique tempus. Fusce sit amet tellus eros, vel facilisis nisl. Donec vel ante diam, nec feugiat felis. Sed in quam dolor. Sed tristique pretium dolor et elementum. ',1234,419850325,'2013-02-20 11:37:23','2013-02-20 11:38:22','grandes-fiestas-patronales--2'),(858104786,'Invernada','Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ','Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis.\r\n\r\nSed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n\r\nDuis mattis hendrerit nunc, non dignissim purus sodales ultrices. Sed dolor lectus, congue sed tempus eu, tristique eu velit. Morbi consequat sagittis sapien eget placerat. Ut vulputate dui ut ante varius suscipit. Sed interdum sapien ut purus vulputate mattis. Sed non neque enim, ac dignissim tellus. Nulla sollicitudin ultricies metus nec tincidunt. Phasellus eget purus massa, sit amet eleifend sapien.\r\n\r\nQuisque dignissim vestibulum velit, vitae lobortis quam congue eget. Mauris sem tortor, varius ut luctus quis, sodales in orci. Nulla lobortis nibh lacus, a eleifend turpis.',32.1,419850325,'2013-02-20 11:39:21','2013-02-20 11:39:21','invernada'),(858104787,'Aniversario del acueducto','  <%= link_to(t(\'.upload_photos\'),\r\n              new_photo_path(:image_owner_id => accommodation.id),\r\n              :class => \"btn btn-mini btn-block\"\r\n      ) if can? :edit, accommodation %>',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ',230.1,10854051,'2013-02-20 11:53:22','2013-02-20 11:53:22','aniversario-del-acueducto'),(858104788,'Festival de la anchoa','[Offer, RoomType]','\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam gravida porttitor mi ac rhoncus. Suspendisse potenti. Maecenas id tortor turpis, id sagittis ante. Nam rhoncus leo sit amet erat cursus lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum adipiscing odio et justo congue vel fermentum eros vestibulum. Nullam vel elit augue, a posuere purus. Etiam risus dolor, ornare vitae mollis imperdiet, lacinia et diam. Aliquam fermentum hendrerit nulla egestas varius. Morbi a purus massa. Mauris commodo porttitor adipiscing. Mauris at metus velit, sed ornare nisi.\r\n\r\nDonec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis.\r\n\r\nSed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n\r\nDuis mattis hendrerit nunc, non dignissim purus sodales ultrices. Sed dolor lectus, congue sed tempus eu, tristique eu velit. Morbi consequat sagittis sapien eget placerat. Ut vulputate dui ut ante varius suscipit. Sed interdum sapien ut purus vulputate mattis. Sed non neque enim, ac dignissim tellus. Nulla sollicitudin ultricies metus nec tincidunt. Phasellus eget purus massa, sit amet eleifend sapien.\r\n\r\nQuisque dignissim vestibulum velit, vitae lobortis quam congue eget. Mauris sem tortor, varius ut luctus quis, sodales in orci. Nulla lobortis nibh lacus, a eleifend turpis. Suspendisse posuere mattis felis, sed fringilla nunc faucibus non. Curabitur porttitor tristique tempus. Fusce sit amet tellus eros, vel facilisis nisl. Donec vel ante diam, nec feugiat felis. Sed in quam dolor. Sed tristique pretium dolor et elementum. ',122.1,419850326,'2013-02-20 12:04:32','2013-02-20 12:04:32','festival-de-la-anchoa');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_owner_id` int(11) DEFAULT NULL,
  `image_owner_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_photos_on_image_owner_id_and_image_owner_type` (`image_owner_id`,`image_owner_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,NULL,NULL,298486374,'ConfigValue','2013-02-20 08:18:50','2013-02-20 08:18:50','146casa_de_aldea_la_pedrerina.jpg','image/jpeg',70277,'2013-02-20 08:18:49'),(2,NULL,NULL,980190962,'ConfigValue','2013-02-20 08:19:13','2013-02-20 08:19:13','casa_de_aldea_hospederia_cordobelas_casas_rurales_93197_3.jpg','image/jpeg',137594,'2013-02-20 08:19:12'),(3,NULL,NULL,980190963,'ConfigValue','2013-02-20 08:24:09','2013-02-20 08:24:09','casa_de_aldea_el_pozu_casas_rurales_92763_9.jpg','image/jpeg',56153,'2013-02-20 08:24:08'),(4,'','',858104786,'Offer','2013-02-20 11:39:59','2013-02-20 11:39:59','3tenedores01.gif','image/gif',2269,'2013-02-20 11:39:59'),(5,'','',419850324,'Accommodation','2013-02-20 11:45:47','2013-02-20 11:45:47','146casa_de_aldea_la_pedrerina.jpg','image/jpeg',70277,'2013-02-20 11:45:46'),(6,'','',10854051,'Accommodation','2013-02-20 11:49:48','2013-02-20 11:49:48','casa_de_aldea_hospederia_cordobelas_casas_rurales_93197_3.jpg','image/jpeg',137594,'2013-02-20 11:49:47'),(7,'','',10854051,'Accommodation','2013-02-20 11:51:34','2013-02-20 11:51:34','146casa_de_aldea_la_pedrerina.jpg','image/jpeg',70277,'2013-02-20 11:51:32'),(8,'','',10854051,'Accommodation','2013-02-20 11:51:34','2013-02-20 11:51:34','casa_de_aldea_el_pozu_casas_rurales_92763_9.jpg','image/jpeg',56153,'2013-02-20 11:51:33'),(9,'','',10854051,'Accommodation','2013-02-20 11:52:06','2013-02-20 11:52:06','casa_de_aldea_hospederia_cordobelas_casas_rurales_93197_3.jpg','image/jpeg',137594,'2013-02-20 11:52:05'),(10,'','',10854051,'Accommodation','2013-02-20 11:52:07','2013-02-20 11:52:07','146casa_de_aldea_la_pedrerina.jpg','image/jpeg',70277,'2013-02-20 11:52:06'),(11,'','',858104787,'Offer','2013-02-20 11:53:22','2013-02-20 11:53:22','url.jpeg','image/jpeg',484323,'2013-02-20 11:53:20'),(12,'','',419850326,'Accommodation','2013-02-20 12:02:25','2013-02-20 12:02:25','url.jpeg','image/jpeg',484323,'2013-02-20 12:02:22'),(13,'','',419850327,'Accommodation','2013-02-20 12:11:11','2013-02-20 12:11:11','url.jpeg','image/jpeg',484323,'2013-02-20 12:11:09');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_provinces_on_country_id` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1013057398 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES (216706806,'Asturias',891143841),(242504429,'Segovia',891143841),(496929924,'Porto',397370033),(819490952,'Asturias',397370033),(918058826,'Asturias',891143841),(941501934,'Cantabria',891143841),(1013057397,'Alenteixo',397370033);
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=877062396 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (135138680,'admin','2013-02-20 08:14:26','2013-02-20 08:14:26'),(877062395,'landlord','2013-02-20 08:14:26','2013-02-20 08:14:26');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_types`
--

DROP TABLE IF EXISTS `room_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brief_description` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `characteristics` text COLLATE utf8_unicode_ci,
  `accommodation_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_room_types_on_slug` (`slug`),
  KEY `index_room_types_on_accommodation_id` (`accommodation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=981182281 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_types`
--

LOCK TABLES `room_types` WRITE;
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;
INSERT INTO `room_types` VALUES (407969824,'Pareja con desayuno','Pareja con desayuno continental','Habitación para parejas con desayuno incluido',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ',419850324,'2013-02-20 08:14:27','2013-02-20 11:45:47','pareja-con-desayuno'),(981182275,'Desayuno con pastas','Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ',' Sed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n\r\nDuis mattis hendrerit nunc, non dignissim purus sodales ultrices. Sed dolor lectus, congue sed tempus eu, tristique eu velit. Morbi consequat sagittis sapien eget placerat. Ut vulputate dui ut ante varius suscipit. Sed interdum sapien ut purus vulputate mattis. Sed non neque enim, ac dignissim tellus. Nulla sollicitudin ultricies metus nec tincidunt. Phasellus eget purus massa, sit amet eleifend sapien.\r\n\r\nQuisque dignissim vestibulum velit, vitae lobortis quam congue eget. Mauris sem tortor, varius ut luctus quis, sodales in orci. Nulla lobortis nibh lacus, a eleifend turpis. Suspendisse posuere mattis felis, sed fringilla nunc faucibus non. Curabitur porttitor tristique tempus. Fusce sit amet tellus eros, vel facilisis nisl. Donec vel ante diam, nec feugiat felis. Sed in quam dolor. Sed tristique pretium dolor et elementum. ','Duis mattis hendrerit nunc, non dignissim purus sodales ultrices. Sed dolor lectus, congue sed tempus eu, tristique eu velit. Morbi consequat sagittis sapien eget placerat. Ut vulputate dui ut ante varius suscipit. Sed interdum sapien ut purus vulputate mattis. Sed non neque enim, ac dignissim tellus. Nulla sollicitudin ultricies metus nec tincidunt. Phasellus eget purus massa, sit amet eleifend sapien. ',419850325,'2013-02-20 11:30:27','2013-02-20 11:30:27','desayuno-con-pastas'),(981182276,'La segunda a la derecha',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam gravida porttitor mi ac rhoncus. Suspendisse potenti. Maecenas id tortor turpis, id sagittis ante. Nam rhoncus leo sit amet erat cursus lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum adipiscing odio et justo congue vel fermentum eros vestibulum. Nullam vel elit augue, a posuere purus. Etiam risus dolor, ornare vitae mollis imperdiet, lacinia et diam. Aliquam fermentum hendrerit nulla egestas varius. Morbi a purus massa. Mauris commodo porttitor adipiscing. Mauris at metus velit, sed ornare nisi.\r\n\r\nDonec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis.\r\n\r\nSed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ',' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam gravida porttitor mi ac rhoncus. Suspendisse potenti. Maecenas id tortor turpis, id sagittis ante. Nam rhoncus leo sit amet erat cursus lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum adipiscing odio et justo congue vel fermentum eros vestibulum. Nullam vel elit augue, a posuere purus. Etiam risus dolor, ornare vitae mollis imperdiet, lacinia et diam. Aliquam fermentum hendrerit nulla egestas varius. Morbi a purus massa. Mauris commodo porttitor adipiscing. Mauris at metus velit, sed ornare nisi.\r\n\r\nDonec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis.\r\n\r\nSed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ',419850325,'2013-02-20 11:31:50','2013-02-20 11:31:50','la-segunda-a-la-derecha'),(981182277,'Suite presidencial',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ',' Sed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ',' Sed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ',10854051,'2013-02-20 11:49:48','2013-02-20 11:49:48','suite-presidencial'),(981182278,'La que da pa la mediana',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis.\r\n\r\nSed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; ','\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam gravida porttitor mi ac rhoncus. Suspendisse potenti. Maecenas id tortor turpis, id sagittis ante. Nam rhoncus leo sit amet erat cursus lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum adipiscing odio et justo congue vel fermentum eros vestibulum. Nullam vel elit augue, a posuere purus. Etiam risus dolor, ornare vitae mollis imperdiet, lacinia et diam. Aliquam fermentum hendrerit nulla egestas varius. Morbi a purus massa. Mauris commodo porttitor adipiscing. Mauris at metus velit, sed ornare nisi.\r\n\r\nDonec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis.\r\n\r\nSed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n\r\nDuis mattis hendrerit nunc, non dignissim purus sodales ultrices. Sed dolor lectus, congue sed tempus eu, tristique eu velit. Morbi consequat sagittis sapien eget placerat. Ut vulputate dui ut ante varius suscipit. Sed interdum sapien ut purus vulputate mattis. Sed non neque enim, ac dignissim tellus. Nulla sollicitudin ultricies metus nec tincidunt. Phasellus eget purus massa, sit amet eleifend sapien.\r\n\r\nQuisque dignissim vestibulum velit, vitae lobortis quam congue eget. Mauris sem tortor, varius ut luctus quis, sodales in orci. Nulla lobortis nibh lacus, a eleifend turpis. Suspendisse posuere mattis felis, sed fringilla nunc faucibus non. Curabitur porttitor tristique tempus. Fusce sit amet tellus eros, vel facilisis nisl. Donec vel ante diam, nec feugiat felis. Sed in quam dolor. Sed tristique pretium dolor et elementum. ','\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam gravida porttitor mi ac rhoncus. Suspendisse potenti. Maecenas id tortor turpis, id sagittis ante. Nam rhoncus leo sit amet erat cursus lobortis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum adipiscing odio et justo congue vel fermentum eros vestibulum. Nullam vel elit augue, a posuere purus. Etiam risus dolor, ornare vitae mollis imperdiet, lacinia et diam. Aliquam fermentum hendrerit nulla egestas varius. Morbi a purus massa. Mauris commodo porttitor adipiscing. Mauris at metus velit, sed ornare nisi.\r\n\r\nDonec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis.\r\n\r\nSed vel ante enim, quis condimentum enim. Vivamus iaculis, sem eu adipiscing viverra, risus neque porta diam, nec venenatis turpis felis vitae dui. Duis eu metus quis ligula sagittis facilisis id at est. Pellentesque pulvinar risus eu ante porta commodo. Ut laoreet ligula ante. Vivamus erat turpis, fermentum et ullamcorper adipiscing, accumsan sed orci. In enim ipsum, sollicitudin in ullamcorper molestie, consequat facilisis leo. Maecenas auctor magna vel purus bibendum posuere. Sed quis arcu elit, in vehicula quam. Curabitur accumsan nisl et ante pharetra mattis. In sed ante augue. Donec nibh augue, dignissim a consequat ac, lobortis quis sem. Curabitur placerat, tortor eget facilisis ornare, lectus orci consectetur ante, et convallis eros sapien eu elit. Proin sapien leo, luctus et scelerisque at, porttitor ut dui. Duis in tempor libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n\r\nDuis mattis hendrerit nunc, non dignissim purus sodales ultrices. Sed dolor lectus, congue sed tempus eu, tristique eu velit. Morbi consequat sagittis sapien eget placerat. Ut vulputate dui ut ante varius suscipit. Sed interdum sapien ut purus vulputate mattis. Sed non neque enim, ac dignissim tellus. Nulla sollicitudin ultricies metus nec tincidunt. Phasellus eget purus massa, sit amet eleifend sapien.\r\n\r\nQuisque dignissim vestibulum velit, vitae lobortis quam congue eget. Mauris sem tortor, varius ut luctus quis, sodales in orci. Nulla lobortis nibh lacus, a eleifend turpis. Suspendisse posuere mattis felis, sed fringilla nunc faucibus non. Curabitur porttitor tristique tempus. Fusce sit amet tellus eros, vel facilisis nisl. Donec vel ante diam, nec feugiat felis. Sed in quam dolor. Sed tristique pretium dolor et elementum. ',419850326,'2013-02-20 12:02:25','2013-02-20 12:02:25','la-que-da-pa-la-mediana'),(981182279,'La del sótano','Con buenas vistas',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ',419850326,'2013-02-20 12:05:14','2013-02-20 12:05:14','la-del-sotano'),(981182280,'Vistas a la calle',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ',' Donec nisi metus, adipiscing quis dapibus in, euismod vitae nulla. Nullam vel sapien nibh. Aliquam tincidunt molestie nisl, ac interdum orci blandit ac. Aliquam erat volutpat. Pellentesque laoreet ullamcorper felis, eget sodales leo scelerisque sit amet. Nullam sollicitudin egestas vulputate. Sed condimentum ligula tellus. Cras porttitor, mauris id imperdiet facilisis, mauris justo ullamcorper dui, ut tincidunt ligula sem in tortor. Nulla in feugiat lectus. Nunc ultrices enim a nulla elementum blandit. Maecenas varius mattis vehicula. Nullam pulvinar tincidunt purus sit amet venenatis. ',419850327,'2013-02-20 12:11:11','2013-02-20 12:11:11','vistas-a-la-calle');
/*!40000 ALTER TABLE `room_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130206124823'),('20130206124849'),('20130206124906'),('20130206124921'),('20130206124942'),('20130206125109'),('20130206125145'),('20130206125718'),('20130206125834'),('20130207082253'),('20130207092121'),('20130207121521'),('20130208084715'),('20130208093258'),('20130210210630'),('20130210220706'),('20130210220939'),('20130213081656'),('20130214082155'),('20130214083827'),('20130220002255');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'6471be4981c7f68d2c6c4e3c1b8e6361','BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjFkSlJOQmFPZjB6cGZGdTROY2Js\nSHNoRFVDbGVORTZtVVZiczZaZ2xuOGNNPQY7AEZJIgl1c2VyBjsARnsHOgdp\nZGkEd829PzoJbmFtZUkiDEFsZnJlZG8GOwBU\n','2013-02-20 08:17:17','2013-02-20 12:30:42');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_slug` (`slug`),
  KEY `index_users_on_role_id` (`role_id`),
  KEY `index_users_on_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1069403512 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (135138680,'admin','Pérez','mpb.desarrollo@gmail.com','$2a$10$BfYXWYyg9CYTwFit8i2YIOfYiBzZsl7lLq1qDYu08nke4vK5hMSsa',135138680,'2013-02-20 08:14:27','2013-02-20 09:35:30','mpb-desarrollo-gmail-com'),(353329212,'Gonzalo','García','gg@gmail.com','$2a$10$sWDarIWbMzcBlUzSVD4CIeg7IheIljda2KJTg/4O6gd.RYN2P60ma',877062395,'2013-02-20 08:14:27','2013-02-20 08:14:27',NULL),(1000456412,'María','López','maria@gmail.com','$2a$10$IitLMmbnoB21tCad.xmQou7JiwgYF15Ylq8/SjEkc9B0fKNvDw20u',877062395,'2013-02-20 08:14:27','2013-02-20 11:59:50','maria-gmail-com'),(1069403510,'Martin','Rodriguez','martin@gmail.com','$2a$10$FhO6GXwaZHO5fKWtaNM/9.glEfeZjMntMNryw0UyaqYbTwCAjB82G',877062395,'2013-02-20 11:21:16','2013-02-20 11:21:16','martin-gmail-com'),(1069403511,'Alfredo','lopez','alfredo@gmail.com','$2a$10$qyXd5gB3fOoc6.2O3BGzqu92DPXEMCaKisHuBanoAJT7rFPCUAS/e',877062395,'2013-02-20 12:27:05','2013-02-20 12:27:05','alfredo-gmail-com');
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

-- Dump completed on 2013-02-20 13:32:15
