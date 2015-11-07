-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 08 Novembre 2015 à 00:30
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
-- Structure de la table `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `id` bigint(20) NOT NULL,
  `locality_id` bigint(20) NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `event_id` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `activity`
--

INSERT INTO `activity` (`id`, `locality_id`, `from`, `to`, `event_id`) VALUES
(1, 1, '2015-11-05', '2015-11-19', 1),
(2, 1, '2015-11-25', '2015-11-28', 1);

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `event`
--

INSERT INTO `event` (`id`, `name`, `user_id`, `picture`, `description`) VALUES
(1, 'super sortie', 4, 'louvre.jpg', '');

-- --------------------------------------------------------

--
-- Structure de la table `event_participant`
--

CREATE TABLE IF NOT EXISTS `event_participant` (
  `event_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `note` int(5) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `latitude` int(255) DEFAULT NULL,
  `longetude` int(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `locality`
--

INSERT INTO `locality` (`id`, `name`, `address`, `ZIPCode`, `picture`, `type`, `description`, `note`, `price`, `latitude`, `longetude`) VALUES
(1, 'Louvre', '12 rue du Louvre', '75010', 'louvre.jpg', 'Musée', 'Le musée du Louvre est un musée d''art et d''antiquités situé au centre de Paris dans le palais du Louvre', 4, '15 euros', 300, 300),
(13, 'centre21', '18 rue chamberlin', '91600', '', 'Musée', '', NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` bigint(20) NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `text` text NOT NULL,
  `dateSent` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`id`, `from_id`, `text`, `dateSent`) VALUES
(18, 12, 'Il fait beau temps !&nbsp;<a class="tag">@Mehdi Sliem</a><span>&nbsp;</span><a class="tag">@Trung Nguyen</a><span>&nbsp;</span><a contenteditable="false" class="tag" href="/daris/event/view/1">#super sortie</a><span>&nbsp;</span><a class="tag">@Alexandre Annic</a><span>&nbsp;</span>', '2015-11-07'),
(19, 12, 'Je me parle&nbsp;<a class="tag">@Alexandre Annic</a><span>&nbsp;</span>', '2015-11-07'),
(20, 12, '<a class="tag" href="/daris/user/view/9">@Karl Marx</a><span>&nbsp;Coucou Karl ! On va au&nbsp;</span><a contenteditable="false" class="tag" href="/daris/event/view/1">#super sortie</a><span>&nbsp;?</span>', '2015-11-07'),
(21, 12, '<a class="tag" href="/daris/user/view/9">@Karl Marx</a><span>&nbsp;Coucou Karl ! On va au&nbsp;</span><a contenteditable="false" class="tag" href="/daris/event/view/1">#super sortie</a><span>&nbsp;?</span>', '2015-11-07'),
(22, 12, '\n 		<a contenteditable="false" class="tag" href="/daris/user/view/12">@Alexandre Annic</a><span>&nbsp;que se vayan todos !&nbsp;</span><a contenteditable="false" class="tag" href="/daris/event/view/1">#super sortie</a><span>&nbsp;</span>', '2015-11-07');

-- --------------------------------------------------------

--
-- Structure de la table `message_events`
--

CREATE TABLE IF NOT EXISTS `message_events` (
  `message_id` bigint(20) NOT NULL,
  `event_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `message_events`
--

INSERT INTO `message_events` (`message_id`, `event_id`) VALUES
(18, 1),
(20, 1),
(21, 1),
(22, 1);

-- --------------------------------------------------------

--
-- Structure de la table `message_receivers`
--

CREATE TABLE IF NOT EXISTS `message_receivers` (
  `to_id` bigint(20) NOT NULL,
  `message_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `message_receivers`
--

INSERT INTO `message_receivers` (`to_id`, `message_id`) VALUES
(4, 18),
(10, 18),
(9, 18),
(12, 19),
(9, 20),
(9, 20),
(9, 21),
(9, 21),
(12, 22);

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
  `picture` varchar(255) DEFAULT NULL,
  `inscription` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `firstName`, `lastName`, `city`, `address`, `ZIPCode`, `picture`, `inscription`) VALUES
(4, 'frank.dupont@gmail.com', 'e2ad69de782095a125667ef33d201eb4e8054149', 'Mehdi', 'Sliem', NULL, NULL, NULL, 'p1.jpg', '2015-11-01'),
(9, 'feafa@afre.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'Karl', 'Marx', NULL, NULL, NULL, NULL, '2015-11-01'),
(10, 'eeee@eee.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'Trung', 'Nguyen', NULL, NULL, NULL, NULL, '2015-11-18'),
(11, 'ioio@ioio.fr', '993ca2a41505bd01a520a3af02783ec1bd687031', 'Brithney', 'Spears', NULL, NULL, NULL, NULL, '2015-11-23'),
(12, 'aaa@aaa.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'Alexandre', 'Annic', NULL, NULL, NULL, 'p1.jpg', '2015-11-10');

-- --------------------------------------------------------

--
-- Structure de la table `user_relation`
--

CREATE TABLE IF NOT EXISTS `user_relation` (
  `user_id` bigint(20) NOT NULL,
  `followed_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_relation`
--

INSERT INTO `user_relation` (`user_id`, `followed_id`) VALUES
(12, 4),
(12, 9);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`), ADD KEY `fk_event` (`event_id`);

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `event_participant`
--
ALTER TABLE `event_participant`
  ADD PRIMARY KEY (`event_id`,`user_id`), ADD KEY `fk_event_user` (`event_id`), ADD KEY `fk_user_event` (`user_id`);

--
-- Index pour la table `locality`
--
ALTER TABLE `locality`
  ADD PRIMARY KEY (`id`) COMMENT 'PK';

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `event`
--
ALTER TABLE `event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `locality`
--
ALTER TABLE `locality`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `activity`
--
ALTER TABLE `activity`
ADD CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `event_participant`
--
ALTER TABLE `event_participant`
ADD CONSTRAINT `fk_event_user` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_user_event` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
