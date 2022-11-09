-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 09 nov. 2022 à 22:00
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données :  `elibrary`
--

-- --------------------------------------------------------

--
-- Structure de la table `bibliotheque`
--

DROP TABLE IF EXISTS `bibliotheque`;
CREATE TABLE IF NOT EXISTS `bibliotheque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `Livre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Livre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `bibliotheque_membre`
--

DROP TABLE IF EXISTS `bibliotheque_membre`;
CREATE TABLE IF NOT EXISTS `bibliotheque_membre` (
  `Bibliotheque_id` int(11) NOT NULL,
  `Bibliotheque_Livre_id` int(11) NOT NULL,
  `Membre_id` int(11) NOT NULL,
  PRIMARY KEY (`Bibliotheque_id`,`Bibliotheque_Livre_id`,`Membre_id`),
  KEY `fk_Bibliotheque_Membre_Membre1_idx` (`Membre_id`),
  KEY `fk_Bibliotheque_Membre_Bibliotheque1_idx` (`Bibliotheque_id`,`Bibliotheque_Livre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_permanent` varchar(45) NOT NULL,
  `Membre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Membre_id`),
  UNIQUE KEY `Membre_id_UNIQUE` (`Membre_id`),
  KEY `fk_Etudiant_Membre1_idx` (`Membre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `libraire`
--

DROP TABLE IF EXISTS `libraire`;
CREATE TABLE IF NOT EXISTS `libraire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Bibliotheque_id` int(11) NOT NULL,
  `Membre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Bibliotheque_id`,`Membre_id`),
  UNIQUE KEY `Bibliotheque_id_UNIQUE` (`Bibliotheque_id`),
  UNIQUE KEY `Membre_id_UNIQUE` (`Membre_id`),
  KEY `fk_Libraire_Bibliotheque1_idx` (`Bibliotheque_id`),
  KEY `fk_Libraire_Membre1_idx` (`Membre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

DROP TABLE IF EXISTS `livre`;
CREATE TABLE IF NOT EXISTS `livre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(45) NOT NULL,
  `auteur` varchar(45) NOT NULL,
  `maison_edition` varchar(45) NOT NULL,
  `prix` varchar(15) DEFAULT NULL,
  `Membre_id` int(11) DEFAULT NULL,
  `Libraire_id` int(11) DEFAULT NULL,
  `Libraire_Bibliotheque_id` int(11) NOT NULL,
  `Libraire_Membre_id` int(11) NOT NULL,
  `Bibliotheque_id` int(11) NOT NULL,
  `Bibliotheque_Livre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Libraire_Bibliotheque_id`,`Libraire_Membre_id`,`Bibliotheque_id`,`Bibliotheque_Livre_id`),
  KEY `fk_Livre_Membre1_idx` (`Membre_id`),
  KEY `fk_Livre_Libraire1_idx` (`Libraire_id`,`Libraire_Bibliotheque_id`,`Libraire_Membre_id`),
  KEY `fk_Livre_Bibliotheque1_idx` (`Bibliotheque_id`,`Bibliotheque_Livre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `telephone` varchar(25) NOT NULL,
  `courriel` varchar(50) NOT NULL,
  `num_livre_loue` int(11) NOT NULL,
  `type_membre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id`, `nom`, `prenom`, `adresse`, `code_postal`, `telephone`, `courriel`, `num_livre_loue`, `type_membre`) VALUES
(1, 'Trudel', 'Céline', '3546 rue Laurier', 'H7I 2V9', '514-987-6744', 'celtrudel@gmail.com', 1, 'Or'),
(2, 'Savard', 'Julie', '657 rue Piché', 'H8J 3M9', '514-6574', 'julsavard@gmail.com', 3, 'Argent'),
(3, 'Côté', 'Diane', '673 rue Tremble', 'G6T 2B9', '514-876-4657', 'diacote@gmail.com', 2, 'Argent'),
(4, 'Noreau', 'Nicolas', '56 rue Saint-Urbain', 'N47 4B7', '514-776-8967', 'nicnoreau@gmail.com', 2, 'Bronze'),
(5, 'Bédard', 'Sébastien', '678 avenue du Parc', 'H7T 9J9', '514-989-9977', 'sebbedard@gmail.com', 4, 'Or'),
(6, 'Moisan', 'Richard', '2368 rue André', 'B8U 2V9', '514-877-1122', 'ricmoisan@gmail.com', 1, 'Or');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bibliotheque_membre`
--
ALTER TABLE `bibliotheque_membre`
  ADD CONSTRAINT `fk_Bibliotheque_Membre_Bibliotheque1` FOREIGN KEY (`Bibliotheque_id`,`Bibliotheque_Livre_id`) REFERENCES `bibliotheque` (`id`, `Livre_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Bibliotheque_Membre_Membre1` FOREIGN KEY (`Membre_id`) REFERENCES `membre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fk_Etudiant_Membre1` FOREIGN KEY (`Membre_id`) REFERENCES `membre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `libraire`
--
ALTER TABLE `libraire`
  ADD CONSTRAINT `fk_Libraire_Bibliotheque1` FOREIGN KEY (`Bibliotheque_id`) REFERENCES `bibliotheque` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Libraire_Membre1` FOREIGN KEY (`Membre_id`) REFERENCES `membre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `fk_Livre_Bibliotheque1` FOREIGN KEY (`Bibliotheque_id`,`Bibliotheque_Livre_id`) REFERENCES `bibliotheque` (`id`, `Livre_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Livre_Libraire1` FOREIGN KEY (`Libraire_id`,`Libraire_Bibliotheque_id`,`Libraire_Membre_id`) REFERENCES `libraire` (`id`, `Bibliotheque_id`, `Membre_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Livre_Membre1` FOREIGN KEY (`Membre_id`) REFERENCES `membre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
