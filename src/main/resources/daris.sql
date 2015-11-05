-- phpMyAdmin SQL Dump

-- version 4.5.0.2

-- http://www.phpmyadmin.net

--
-- Client :  127.0.0.1

-- Généré le :  Jeu 05 Novembre 2015 à 17:50

-- Version du serveur :  10.0.17-MariaDB

-- Version de PHP :  5.6.14



SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET time_zone = "+00:00";


/*!40101 

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `daris`
--
-- ************************************************************************

--
-- Structure de la table `locality`
--

CREATE TABLE IF NOT EXISTS `locality` (
  `localityId` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `ZIPCode` varchar(255) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `description` text,
  `note` int(5) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `latitude` int(255) DEFAULT NULL,
  `longetude` int(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Index pour la table `locality`
--

ALTER TABLE `locality` ADD PRIMARY KEY (`localityId`) COMMENT 'PK';

--
-- AUTO_INCREMENT pour la table `locality`
--

ALTER TABLE `locality` MODIFY `localityId` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;

--
-- Contenu de la table `locality`
--

INSERT INTO `locality` (`localityId`, `name`, `address`, `ZIPCode`, `picture`, `type`, `description`, `note`, `price`, `latitude`, `longetude`) VALUES
(1, 'Louvre', '12 rue du Louvre', '75010', 'louvre.jpg', 'Museum', 'Le musée du Louvre est un musée d''art et d''antiquités situé au centre de Paris dans le palais du Louvre', 4, '15 euros', 300, 300);

-- ************************************************************************

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userId` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `ZIPCode` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Index pour la table `user`
--

ALTER TABLE `user` ADD PRIMARY KEY (`userId`), ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour la table `user`
--

ALTER TABLE `user` MODIFY `userId` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`userId`, `email`, `password`, `firstName`, `lastName`, `city`, `address`, `ZIPCode`, `picture`) VALUES
(4, 'frank.dupont@gmail.com', 'e2ad69de782095a125667ef33d201eb4e8054149', 'aze@ze.a', 'aze@ze.a', NULL, NULL, NULL, NULL),
(9, 'feafa@afre.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'Alexandre', 'Annic', NULL, NULL, NULL, NULL),
(10, 'eeee@eee.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'aee', 'eeeee', NULL, NULL, NULL, NULL),
(11, 'ioio@ioio.fr', '993ca2a41505bd01a520a3af02783ec1bd687031', 'Alexandre', 'Annic', NULL, NULL, NULL, NULL),
(12, 'aaa@aaa.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'aaa@aaa.fr', 'aaa@aaa.fr', NULL, NULL, NULL, NULL);

-- ************************************************************************

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `adminId` bigint(20) NOT NULL,
  `idf` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Index pour la table `admin`
--

ALTER TABLE `admin` ADD PRIMARY KEY (`adminId`);

--
-- AUTO_INCREMENT pour la table `admin`
--

ALTER TABLE `admin` MODIFY `adminId` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`adminId`, `idf`, `password`, `firstName`, `lastName`) VALUES
(1, 'admin', 'admin', 'Mehdi', 'Alexendre');

-- ************************************************************************

--
-- Structure de la table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `eventId` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Index pour la table `event`
--

ALTER TABLE `event` ADD PRIMARY KEY (`eventId`);

--
-- AUTO_INCREMENT pour la table `event`
--

ALTER TABLE `event` MODIFY `eventId` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;  

--
-- Contenu de la table `event`
--

INSERT INTO `event` (`eventId`, `name`, `userId`, `picture`) VALUES
(1, 'super sortie', 1, 'louvre.jpg');
  
-- ************************************************************************

--
-- Structure de la table `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `activityId` bigint(20) NOT NULL,
  `locality` varchar(255) NOT NULL,
  `from` DATE NOT NULL,
  `to` DATE NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `relatedEvent` bigint NOT NULL,
   INDEX `fk_event` (`relatedEvent` ASC) ,
   FOREIGN KEY (`relatedEvent`)
     REFERENCES `event` (`eventId`)
     ON DELETE NO ACTION
     ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Index pour la table `activity`
--

ALTER TABLE `activity` ADD PRIMARY KEY (`activityId`);
  
--
-- AUTO_INCREMENT pour la table `activity`
--

ALTER TABLE `activity` MODIFY `activityId` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;

-- ************************************************************************

--
-- Structure de la table `event_participant`
--

CREATE TABLE IF NOT EXISTS `event_participant` (
  `eventId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  INDEX `fk_event_user` (`eventId` ASC) ,
  PRIMARY KEY (`eventId`, `userId`),
  CONSTRAINT `fk_event_user`
   FOREIGN KEY (`eventId`)
     REFERENCES `event` (`eventId`)
     ON DELETE NO ACTION
     ON UPDATE NO ACTION,
  INDEX `fk_user_event` (`userId` ASC) ,
  CONSTRAINT `fk_user_event`
   FOREIGN KEY (`userId`)
     REFERENCES `user` (`userId`)
     ON DELETE NO ACTION
     ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ************************************************************************
  
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
