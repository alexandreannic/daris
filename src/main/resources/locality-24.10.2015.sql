-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 24 Octobre 2015 à 19:03
-- Version du serveur :  5.6.24
-- Version de PHP :  5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `daris`
--

-- --------------------------------------------------------

--
-- Structure de la table `locality`
--

CREATE TABLE IF NOT EXISTS `locality` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `ZIPCode` varchar(255) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `description` text,
  `note` int(5) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `locality`
--

INSERT INTO `locality` (`id`, `name`, `address`, `ZIPCode`, `picture`, `type`, `description`, `note`) VALUES
(1, 'Louvre', '12 rue du Louvre', '75010', 'louvre.jpg', 'Musée', 'Le musée du Louvre est un musée d''art et d''antiquités situé au centre de Paris dans le palais du Louvre', 4);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `locality`
--
ALTER TABLE `locality`
  ADD PRIMARY KEY (`id`) COMMENT 'PK';

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `locality`
--
ALTER TABLE `locality`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
