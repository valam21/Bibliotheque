-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 29 fév. 2024 à 22:52
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionbiblio`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnee`
--

CREATE TABLE `abonnee` (
  `idabonnee` int(10) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `telephone` int(8) NOT NULL,
  `email` varchar(50) NOT NULL,
  `statut` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `abonnee`
--

INSERT INTO `abonnee` (`idabonnee`, `nom`, `prenom`, `adresse`, `telephone`, `email`, `statut`) VALUES
(2, 'manha', 'luiton', 'berline', 5636333, 'berlin@gmail.com', 'Non Abonné'),
(3, 'Tom', 'Sauyer', 'Ouidah', 63254141, 'tom@gmail.com', 'Abonné'),
(4, 'jonhy', 'Benz', 'bermlin', 12525236, 'ben@gmail.com', 'Non Abonné'),
(6, 'henry', 'souza', 'Pahou', 44526392, 'henry009@gmail.com', 'Abonné'),
(7, 'ALLOGNON', 'Ruthus', 'pahou centre', 60309613, 'ruthusallognon@gmail.com', 'Abonné');

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `idauteur` int(10) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `prenom` varchar(60) NOT NULL,
  `contact` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`idauteur`, `nom`, `prenom`, `contact`) VALUES
(1, 'AGBAZIN', 'Bernadin', 95632541),
(4, 'DEGLE', 'Alphonse', 50128596),
(5, 'ADJAH', 'Will', 99632541);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idcategorie` int(10) NOT NULL,
  `nomcategorie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idcategorie`, `nomcategorie`) VALUES
(1, 'Documentaire'),
(2, 'Roman'),
(3, 'Documentaire'),
(5, 'Thréatre'),
(6, 'Poésie'),
(7, 'Biographie'),
(8, 'Bande déssiné'),
(9, 'Essai'),
(10, 'Manuel');

-- --------------------------------------------------------

--
-- Structure de la table `ecrire`
--

CREATE TABLE `ecrire` (
  `idecrire` int(11) NOT NULL,
  `idlivre` int(11) NOT NULL,
  `idauteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `emplacement`
--

CREATE TABLE `emplacement` (
  `idemplacement` int(10) NOT NULL,
  `etagere` varchar(100) NOT NULL,
  `rayon` varchar(100) NOT NULL,
  `position` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `emplacement`
--

INSERT INTO `emplacement` (`idemplacement`, `etagere`, `rayon`, `position`) VALUES
(1, '1', 'H221', 'Verticale'),
(2, '3', 'E425', 'Horizontale'),
(4, '2', 'R785', 'Incliné'),
(5, '4', 'D362', 'Horizontale'),
(6, '6', 'T521', 'Verticale');

-- --------------------------------------------------------

--
-- Structure de la table `emprunter`
--

CREATE TABLE `emprunter` (
  `idemprunter` int(10) NOT NULL,
  `dateemprunte` date NOT NULL,
  `dateretour` date NOT NULL,
  `idlivre` int(10) NOT NULL,
  `idabonnee` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `emprunter`
--

INSERT INTO `emprunter` (`idemprunter`, `dateemprunte`, `dateretour`, `idlivre`, `idabonnee`) VALUES
(5, '2020-10-06', '2020-10-25', 6, 2),
(7, '2022-05-05', '2022-05-25', 6, 3);

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `idlivre` int(10) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `isbn` int(30) NOT NULL,
  `auteur` varchar(50) NOT NULL,
  `langue` varchar(50) NOT NULL,
  `anneepublication` int(4) NOT NULL,
  `idmaisonedition` int(10) NOT NULL,
  `idcategorie` int(10) NOT NULL,
  `idemplacement` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`idlivre`, `titre`, `isbn`, `auteur`, `langue`, `anneepublication`, `idmaisonedition`, `idcategorie`, `idemplacement`) VALUES
(4, 'le roi', 125632, 'Bio Sané', 'Francais', 2022, 1, 1, 1),
(6, 'La Chasse', 265421, 'Rio Janer', 'Anglais', 2016, 2, 2, 1),
(9, 'L\'ancienne Civilisation', 125632, 'Rio Janer', 'Francais', 2016, 1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `maisonedition`
--

CREATE TABLE `maisonedition` (
  `idmaisonedition` int(10) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `contact` int(18) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `maisonedition`
--

INSERT INTO `maisonedition` (`idmaisonedition`, `nom`, `contact`, `email`) VALUES
(1, 'gallimard', 1256352, 'galli@gmailcom'),
(2, 'scholastic', 96325541, 'scholastic@gmailcom'),
(4, 'Plume Edition', 52445622, 'plume@gmailcom');

-- --------------------------------------------------------

--
-- Structure de la table `stocker`
--

CREATE TABLE `stocker` (
  `idstocker` int(10) NOT NULL,
  `qtestock` int(30) NOT NULL,
  `datestock` date NOT NULL,
  `idlivre` int(10) NOT NULL,
  `idemplacement` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `stocker`
--

INSERT INTO `stocker` (`idstocker`, `qtestock`, `datestock`, `idlivre`, `idemplacement`) VALUES
(3, 15, '2023-06-08', 6, 1),
(4, 10, '2022-04-15', 4, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnee`
--
ALTER TABLE `abonnee`
  ADD PRIMARY KEY (`idabonnee`);

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`idauteur`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idcategorie`);

--
-- Index pour la table `ecrire`
--
ALTER TABLE `ecrire`
  ADD KEY `idauteur` (`idauteur`),
  ADD KEY `idlivre` (`idlivre`);

--
-- Index pour la table `emplacement`
--
ALTER TABLE `emplacement`
  ADD PRIMARY KEY (`idemplacement`);

--
-- Index pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD PRIMARY KEY (`idemprunter`),
  ADD KEY `idlivre` (`idlivre`),
  ADD KEY `idabonnee` (`idabonnee`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`idlivre`),
  ADD KEY `idcategorie` (`idcategorie`),
  ADD KEY `idemplacement` (`idemplacement`),
  ADD KEY `idmaisonedition` (`idmaisonedition`);

--
-- Index pour la table `maisonedition`
--
ALTER TABLE `maisonedition`
  ADD PRIMARY KEY (`idmaisonedition`);

--
-- Index pour la table `stocker`
--
ALTER TABLE `stocker`
  ADD PRIMARY KEY (`idstocker`),
  ADD KEY `idlivre` (`idlivre`),
  ADD KEY `idemplacement` (`idemplacement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonnee`
--
ALTER TABLE `abonnee`
  MODIFY `idabonnee` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `idauteur` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idcategorie` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `emplacement`
--
ALTER TABLE `emplacement`
  MODIFY `idemplacement` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `emprunter`
--
ALTER TABLE `emprunter`
  MODIFY `idemprunter` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `idlivre` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `maisonedition`
--
ALTER TABLE `maisonedition`
  MODIFY `idmaisonedition` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `stocker`
--
ALTER TABLE `stocker`
  MODIFY `idstocker` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ecrire`
--
ALTER TABLE `ecrire`
  ADD CONSTRAINT `ecrire_ibfk_1` FOREIGN KEY (`idauteur`) REFERENCES `auteur` (`idauteur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ecrire_ibfk_2` FOREIGN KEY (`idlivre`) REFERENCES `livres` (`idlivre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD CONSTRAINT `emprunter_ibfk_1` FOREIGN KEY (`idlivre`) REFERENCES `livres` (`idlivre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emprunter_ibfk_2` FOREIGN KEY (`idabonnee`) REFERENCES `abonnee` (`idabonnee`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `livres_ibfk_1` FOREIGN KEY (`idcategorie`) REFERENCES `categorie` (`idcategorie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livres_ibfk_2` FOREIGN KEY (`idemplacement`) REFERENCES `emplacement` (`idemplacement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livres_ibfk_3` FOREIGN KEY (`idmaisonedition`) REFERENCES `maisonedition` (`idmaisonedition`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stocker`
--
ALTER TABLE `stocker`
  ADD CONSTRAINT `stocker_ibfk_1` FOREIGN KEY (`idlivre`) REFERENCES `livres` (`idlivre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stocker_ibfk_2` FOREIGN KEY (`idemplacement`) REFERENCES `emplacement` (`idemplacement`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
