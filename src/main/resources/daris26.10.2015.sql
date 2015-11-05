-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 26 Octobre 2015 à 09:25
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

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL,
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
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `firstName`, `lastName`, `city`, `address`, `ZIPCode`, `picture`) VALUES
(4, 'frank.dupont@gmail.com', 'e2ad69de782095a125667ef33d201eb4e8054149', 'aze@ze.a', 'aze@ze.a', NULL, NULL, NULL, NULL),
(9, 'feafa@afre.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'Alexandre', 'Annic', NULL, NULL, NULL, NULL),
(10, 'eeee@eee.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'aee', 'eeeee', NULL, NULL, NULL, NULL),
(11, 'ioio@ioio.fr', '993ca2a41505bd01a520a3af02783ec1bd687031', 'Alexandre', 'Annic', NULL, NULL, NULL, NULL),
(12, 'aaa@aaa.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'aaa@aaa.fr', 'aaa@aaa.fr', NULL, NULL, NULL, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `locality`
--
ALTER TABLE `locality`
  ADD PRIMARY KEY (`id`) COMMENT 'PK';

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `locality`
--
ALTER TABLE `locality`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
