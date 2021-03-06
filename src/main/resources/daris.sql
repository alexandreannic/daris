-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 12 Novembre 2015 à 23:09
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
  `date_from` varchar(10) DEFAULT NULL,
  `date_to` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `activity`
--

INSERT INTO `activity` (`id`, `locality_id`, `date_from`, `date_to`) VALUES
(25, 2, '2', ''),
(26, 1, '1', ''),
(27, 2, '2', ''),
(28, 4, '04:00', '17:30'),
(29, 2, '04:00', '23:30'),
(30, 7, '04:00', '17:45'),
(31, 4, '03:00', '17:45'),
(32, 1, '1', '');

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `day` date NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `max_user` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `event`
--

INSERT INTO `event` (`id`, `name`, `user_id`, `day`, `picture`, `description`, `max_user`) VALUES
(23, 'Un super événement !', 12, '2015-11-28', NULL, '', 0),
(24, 'Sortie romantique !', 12, '2015-11-10', NULL, '', 0),
(25, 'Promenade au clair de lune', 12, '2015-11-22', NULL, '', 0),
(26, 'Un bol d''air', 12, '2015-11-14', NULL, 'Prenons un bol !', 0),
(27, 'Un événement', 12, '2015-11-02', NULL, '', 0),
(28, 'Il faut se cultiver !', 12, '2015-12-18', NULL, '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `event_activities`
--

CREATE TABLE IF NOT EXISTS `event_activities` (
  `event_id` bigint(20) NOT NULL,
  `activities_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `event_activity`
--

CREATE TABLE IF NOT EXISTS `event_activity` (
  `event_id` bigint(20) NOT NULL,
  `activities_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `event_activity`
--

INSERT INTO `event_activity` (`event_id`, `activities_id`) VALUES
(23, 25),
(23, 26),
(24, 27),
(25, 28),
(25, 29),
(26, 30),
(27, 31),
(28, 32);

-- --------------------------------------------------------

--
-- Structure de la table `event_participant`
--

CREATE TABLE IF NOT EXISTS `event_participant` (
  `event_id` bigint(20) NOT NULL,
  `participants_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `event_participant`
--

INSERT INTO `event_participant` (`event_id`, `participants_id`) VALUES
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(21, 4),
(22, 9),
(23, 9),
(23, 12),
(23, 13),
(24, 4),
(24, 11),
(25, 9),
(25, 12),
(26, 4),
(26, 10),
(27, 11),
(28, 9);

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
  `price` varchar(255) NOT NULL,
  `note` int(5) NOT NULL,
  `latitude` float(9,7) DEFAULT NULL,
  `longetude` float(9,7) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `locality`
--

INSERT INTO `locality` (`id`, `name`, `address`, `ZIPCode`, `picture`, `type`, `description`, `price`, `note`, `latitude`, `longetude`) VALUES
(1, 'Musée du Louvre', 'rue du Louvre', '75001', 'louvre.jpg', 'Musée', '', '', 0, 48.8591995, 2.3417001),
(2, 'Arc-de-Triomphe', 'Place Charles de Gaulle', '75008', 'arc.jpg', 'Monument', '', '', 0, 48.8737564, 2.2949460),
(4, 'Tour Eiffel', '5 Avenue Anatole France', '75007', 'eiffel.jpg', 'Monument', 'a tour Eiffel est une tour de fer puddlé de 324 mètres de hauteur (avec antennes) située à Paris, à l''extrémité nord-ouest du parc du Champ-de-Mars.', '', 0, 48.8588448, 2.2943511),
(7, 'Sacré coeur', '35 Rue du Chevalier de la Barre', '75018', 'sacrecoeur.jpg', 'Musée', 'La basilique du Sacré-C?ur, dite du V?u national, située au sommet de la butte Montmartre, dans le 18&#7497; arrondissement de Paris, est un édifice religieux parisien majeur. Sa construction suit l''après-guerre de 1870.', '', 0, 48.8866310, 2.3429284);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `firstName`, `lastName`, `city`, `address`, `ZIPCode`, `picture`, `inscription`) VALUES
(4, 'frank.dupont@gmail.com', 'e2ad69de782095a125667ef33d201eb4e8054149', 'Mehdi', 'Sliem', NULL, NULL, NULL, 'p1.jpg', '2015-11-01'),
(9, 'feafa@afre.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'Karl', 'Marx', NULL, NULL, NULL, NULL, '2015-11-01'),
(10, 'eeee@eee.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'Trung', 'Nguyen', NULL, NULL, NULL, NULL, '2015-11-18'),
(11, 'ioio@ioio.fr', '993ca2a41505bd01a520a3af02783ec1bd687031', 'Brithney', 'Spears', NULL, NULL, NULL, NULL, '2015-11-23'),
(12, 'aaa@aaa.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'Alexandre', 'Annic', NULL, NULL, NULL, 'p1.jpg', '2015-11-10'),
(13, 'bbb@bbb.fr', 'e2ad69de782095a125667ef33d201eb4e8054149', 'aze', 'Annic', NULL, NULL, NULL, NULL, '2015-11-11');

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
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `event_participant`
--
ALTER TABLE `event_participant`
  ADD PRIMARY KEY (`event_id`,`participants_id`), ADD KEY `fk_event_user` (`event_id`), ADD KEY `fk_user_event` (`participants_id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `event`
--
ALTER TABLE `event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `locality`
--
ALTER TABLE `locality`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
