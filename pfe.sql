-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 04 juin 2023 à 17:44
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pfe`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `CodeCl` int(250) NOT NULL,
  `NomCl` varchar(250) NOT NULL,
  `PrenomCl` varchar(250) NOT NULL,
  `TelCl` varchar(50) NOT NULL,
  `AdressePostal` int(50) NOT NULL,
  `AdresseLivraison` varchar(250) NOT NULL,
  `NbrCommandeHistorique` int(250) NOT NULL,
  `QteCommandee` int(250) NOT NULL,
  `CodeC` int(250) NOT NULL,
  `Paiement` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`CodeCl`, `NomCl`, `PrenomCl`, `TelCl`, `AdressePostal`, `AdresseLivraison`, `NbrCommandeHistorique`, `QteCommandee`, `CodeC`, `Paiement`) VALUES
(1, 'benhadi', 'Anissa', '0688932433', 20370, 'Maarif Casablanca', 20, 20, 4, 'chèque'),
(2, 'amlal', 'alia', '0645336288', 20270, 'AL MOUSTAKBAL casablanca', 40, 40, 4, 'espèce'),
(3, 'benmoussa', 'Ali', '0624890544', 20180, 'Ain diab casablanca', 100, 20, 4, 'espèce'),
(4, 'sani', 'hamza', '0674352266', 20040, 'BOURGOGNE CASABLANCA', 20, 20, 2, 'chèque'),
(5, 'benani', 'Ziad', '0643556486', 20150, 'california Casablanca', 20, 5, 5, 'chèque'),
(6, 'dalal', 'sanaa', '0634629745', 20490, 'Deux Mars Casablanca', 100, 5, 2, 'espèce'),
(7, 'janat', 'amal', '0634547899', 20180, 'Ain diab casablanca', 20, 20, 2, 'chèque'),
(8, 'Mohammed', 'Usman', '0653564836', 20220, 'Oulfa Casablanca', 20, 5, 2, 'chèque'),
(9, 'jalal', 'youssef', '0784563453', 20040, 'Ain diab casablanca', 20, 5, 6, 'chèque');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `CodeCM` int(250) NOT NULL,
  `QuantiteCM` int(250) NOT NULL,
  `DateCommande` date NOT NULL,
  `Total` float NOT NULL,
  `CodeCl` int(250) NOT NULL,
  `CodeA` int(250) NOT NULL,
  `CodeC` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`CodeCM`, `QuantiteCM`, `DateCommande`, `Total`, `CodeCl`, `CodeA`, `CodeC`) VALUES
(1, 10, '2023-06-05', 2000, 7, 1, 2),
(2, 5, '2023-06-15', 300, 9, 7, 6);

-- --------------------------------------------------------

--
-- Structure de la table `commercial`
--

CREATE TABLE `commercial` (
  `CodeC` int(250) NOT NULL,
  `NomC` varchar(250) NOT NULL,
  `PrenomC` varchar(250) NOT NULL,
  `EmailC` varchar(250) NOT NULL,
  `PasswordC` varchar(250) NOT NULL,
  `TelC` varchar(250) NOT NULL,
  `CodeM` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commercial`
--

INSERT INTO `commercial` (`CodeC`, `NomC`, `PrenomC`, `EmailC`, `PasswordC`, `TelC`, `CodeM`) VALUES
(1, 'kamal', 'ahmad', 'ahmad@gmail.com', 'ahmad123', '0789546322', 1),
(2, 'hamoudi', 'salim', 'salim@gmail.com', '$2y$10$Xp03xl352IC6KxqR3IuSr.a8R7L4sCiWEIox6unIbKkcvDATtSigK', '0624890544', 1),
(3, 'akhayani', 'sami', 'sami@gmail.com', '$2y$10$774cHkFw9OTUTvrpqVizzuw8fC2iOHjq3G7WQiwfSD2m6CTNxckq2', '0628453722', 2),
(4, 'Abdelhadi', 'Aymen', 'aymen@gmail.com', '$2y$10$Z.PWupgFjILBN7NhpfPz0.01xqa351rLOcXkYYFa260t6A6QSigpa', '0766432290', 2),
(5, 'zaid', 'kamal', 'zaid@gmail.com', '$2y$10$qh1IkR15tpyuu9rfGVFioO.aJwjEx/cPAgm8e7dtvDVD9fyxCygBW', '0754638211', 1),
(6, 'Halimi', 'Wissal', 'wissal@gmail.com', '$2y$10$Vrk3kyfCyzmfkSQGxicDHem8qfEOgDzfbdFUeuXGNgF9PgHyUy8Pe', '0645324776', 6);

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `manager`
--

CREATE TABLE `manager` (
  `CodeM` int(250) NOT NULL,
  `NomM` varchar(250) NOT NULL,
  `PrenomM` varchar(250) NOT NULL,
  `EmailM` varchar(250) NOT NULL,
  `PasswordM` varchar(250) NOT NULL,
  `TelM` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `manager`
--

INSERT INTO `manager` (`CodeM`, `NomM`, `PrenomM`, `EmailM`, `PasswordM`, `TelM`) VALUES
(1, 'halimi', 'Abderahim', 'halimi@gmail.com', '$2y$10$9HeMWQeANWFDMHxK0/lT9uj2KwCI1EAS0YE7Z1KEookwSBMBDgJrq', '0666666666'),
(2, 'Mouwafak', 'Jad', 'jad@gmail.com', '$2y$10$4sqMmjtrQJ1VjPBe87wpfOk7YyYUhm8Y6jBXkLPi39Sz/qyIVZHdK', '0766806756'),
(3, 'Ali', 'Karim', 'ali@gmail.com', '$2y$10$Elkix37FOYtczZAKS1Prmugt270EdastS0vkxeQmqSola38uDFg.K', '0766806756'),
(4, 'alami', 'dalila', 'dalila@gmail.com', '$2y$10$Mwz6t1Ir9Vi0SClb9E3at.VsxlGjI8KWSy8kOQrkzQ7n9RLHffHlO', '0698445633'),
(5, 'berrada', 'alia', 'alia@gmail.com', '$2y$10$CgArrbhYYWYLUgMMExjx1.7J3YeihbZm6O3j4.TTfkh6KLC1oVWY2', '0756332254'),
(6, 'Alaoui', 'khadija', 'khadija@gmail.com', '$2y$10$D9/c1zFRpCw6o7WhTfxqtORwM.fLO3BBUsNcduwzXHi60Ox4Zp6jy', '0745371645');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Manager', 1, 'myapptoken', '32dea4b66b7614a3ad6c2c6230cb032922aec21c95e4b68e605d84f2edaaf67a', '[\"*\"]', NULL, NULL, '2023-06-03 10:28:42', '2023-06-03 10:28:42'),
(2, 'App\\Models\\Manager', 1, 'myapptoken', '463418b1c9bfa63cfb349ff0b4ff014eaa82a37e2637c47785b7021f0ba554ab', '[\"*\"]', NULL, NULL, '2023-06-03 10:55:22', '2023-06-03 10:55:22'),
(3, 'App\\Models\\Manager', 4, 'myapptoken', '5353ec2338ae2bf65f2c490504eed2676a2f147918031d46f8c3b3ba7cdeb19a', '[\"*\"]', NULL, NULL, '2023-06-03 10:56:01', '2023-06-03 10:56:01'),
(4, 'App\\Models\\Manager', 1, 'myapptoken', '8ba5f48f78862e76a09c6acbc1f1941c61faa27d6bcd5482a5762e36acddb111', '[\"*\"]', NULL, NULL, '2023-06-03 10:56:10', '2023-06-03 10:56:10'),
(5, 'App\\Models\\Manager', 1, 'myapptoken', '9e3a118c68c86815d497bcaab52cde071891a2283f9cc56ba99e66116faf9684', '[\"*\"]', NULL, NULL, '2023-06-03 11:02:40', '2023-06-03 11:02:40'),
(6, 'App\\Models\\Commercial', 4, 'myapptoken', '231b0dd59e5392d3c1c07b48ba4b4a970b9d0043950ee9a7e8c4f1e75d666220', '[\"*\"]', NULL, NULL, '2023-06-03 18:53:19', '2023-06-03 18:53:19'),
(7, 'App\\Models\\Manager', 1, 'myapptoken', '955886028dd1b4094a9f3ee339e3d430fbcd75e309aec4b210c22283d0fe89cb', '[\"*\"]', NULL, NULL, '2023-06-03 19:18:54', '2023-06-03 19:18:54'),
(8, 'App\\Models\\Commercial', 2, 'myapptoken', '0a3e87a82057aa1b0e60e7c73e6f6c15b0fcb041f615e9661888a266ff967bf2', '[\"*\"]', NULL, NULL, '2023-06-03 19:52:23', '2023-06-03 19:52:23'),
(9, 'App\\Models\\Commercial', 2, 'myapptoken', 'c093c24eb14c09354d1649d7e4c77b047f6dbf095e44140b97d6738589801f0d', '[\"*\"]', NULL, NULL, '2023-06-03 21:49:40', '2023-06-03 21:49:40'),
(10, 'App\\Models\\Manager', 1, 'myapptoken', '64bc3659ea01a69d0f854a4fccb73ee12927b2bfb612fc5206690b35ece67e73', '[\"*\"]', NULL, NULL, '2023-06-03 22:25:27', '2023-06-03 22:25:27'),
(11, 'App\\Models\\Manager', 1, 'myapptoken', '7ce8353b158f7dea748e5bb0539abd1164254d8ed3fac00f3a40476cad185472', '[\"*\"]', NULL, NULL, '2023-06-03 22:53:29', '2023-06-03 22:53:29'),
(12, 'App\\Models\\Manager', 1, 'myapptoken', 'f96ae03221fc173bbf11588897c1ba8fd5a969a43e31a0033b801bf102059dbd', '[\"*\"]', NULL, NULL, '2023-06-03 23:12:04', '2023-06-03 23:12:04'),
(13, 'App\\Models\\Manager', 1, 'myapptoken', '34a362d8ba9dd504f9d8071b3f6e3ad39ebec2ca6f8ebd08ed44a6b5539941a1', '[\"*\"]', NULL, NULL, '2023-06-03 23:53:48', '2023-06-03 23:53:48'),
(14, 'App\\Models\\Manager', 6, 'auth_token', 'eb010638efb5714ea37759b7e9a6b9a49031eebc602f838748e51c90bbd9a208', '[\"*\"]', NULL, NULL, '2023-06-04 01:22:58', '2023-06-04 01:22:58'),
(15, 'App\\Models\\Manager', 6, 'myapptoken', 'fb08b364eadf2ea731d7120abaf45c037459ab43a6f74aff19645b654ca7e86b', '[\"*\"]', NULL, NULL, '2023-06-04 01:23:19', '2023-06-04 01:23:19'),
(16, 'App\\Models\\Commercial', 6, 'myapptoken', 'f42c5e4c7ddcb4d8db4b72aca32a1bab85cd21c510a861eae8fea53da5c6b2c5', '[\"*\"]', NULL, NULL, '2023-06-04 01:27:44', '2023-06-04 01:27:44'),
(17, 'App\\Models\\Manager', 6, 'myapptoken', 'c3d56a3e88fb48c0026fa9afbfc508b7ead0facecc1cc146767a95e403d1b17a', '[\"*\"]', NULL, NULL, '2023-06-04 01:28:14', '2023-06-04 01:28:14'),
(18, 'App\\Models\\Commercial', 4, 'myapptoken', 'cde4e889602d4bc7cbb3575d3c3ecceabd24e7eddcf8c163e3272ab0180101bd', '[\"*\"]', NULL, NULL, '2023-06-04 10:17:26', '2023-06-04 10:17:26'),
(19, 'App\\Models\\Manager', 1, 'myapptoken', '447add2d861183d6e59baefc81347084528166027e3771dbab086eda3c29ba73', '[\"*\"]', NULL, NULL, '2023-06-04 11:27:17', '2023-06-04 11:27:17'),
(20, 'App\\Models\\Commercial', 4, 'myapptoken', 'd1602ce45c18a2b307e71aec1eef76fe8e350ea6e3ef63260db8fc492d82ced2', '[\"*\"]', NULL, NULL, '2023-06-04 11:32:00', '2023-06-04 11:32:00'),
(21, 'App\\Models\\Manager', 1, 'myapptoken', 'ed33b56bc4b88786294d18969792f6321e15177d862e2bb063f0bf968890758f', '[\"*\"]', NULL, NULL, '2023-06-04 11:45:11', '2023-06-04 11:45:11'),
(22, 'App\\Models\\Commercial', 4, 'myapptoken', '089a5ee1a2d4497c81b2e41996379cb7c175fbab00cf3503c37466d8f733a65a', '[\"*\"]', NULL, NULL, '2023-06-04 12:00:35', '2023-06-04 12:00:35'),
(23, 'App\\Models\\Commercial', 2, 'myapptoken', '81963d79ec6d64af08abf5b48b31a0d4ed071f40784697ab4120e22f1b497c8e', '[\"*\"]', NULL, NULL, '2023-06-04 14:29:50', '2023-06-04 14:29:50'),
(24, 'App\\Models\\Manager', 6, 'myapptoken', 'e926c0b5301322fda678f54a1fe1f3703efd533e209e5fd0dd7305ee3eed5bb2', '[\"*\"]', NULL, NULL, '2023-06-04 14:30:12', '2023-06-04 14:30:12'),
(25, 'App\\Models\\Commercial', 6, 'myapptoken', '5ae3fc2d9d5df456590d7a804b57d9489574f23cf643e7ab59c15fd6e80315fe', '[\"*\"]', NULL, NULL, '2023-06-04 14:31:06', '2023-06-04 14:31:06'),
(26, 'App\\Models\\Manager', 6, 'myapptoken', 'c1375ff80a9a89bc6a3b6d6bcd3bcdd58e4f9cdc145da192ec3af79dda5994f1', '[\"*\"]', NULL, NULL, '2023-06-04 14:34:05', '2023-06-04 14:34:05');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `CodeA` int(250) NOT NULL,
  `NomA` varchar(250) NOT NULL,
  `Prix` float NOT NULL,
  `Condionnement_NbrUnite` int(250) NOT NULL,
  `Stock` int(250) NOT NULL,
  `DatePeremption` date NOT NULL,
  `image` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`CodeA`, `NomA`, `Prix`, `Condionnement_NbrUnite`, `Stock`, `DatePeremption`, `image`) VALUES
(1, 'Carton beurre President 250g', 300, 5, 50, '2024-06-05', 'nATH03nWvJSHTNYU2kdc54hZVX4je2TuFtuC0wUO.jpg'),
(3, 'fromage', 20, 4, 30, '2023-06-24', 'C8umgfqvAF1sk52jWWeRtnBI1uLYKKD8.jfif'),
(6, 'Lait de chèvre 900ML', 20, 1, 50, '2023-06-30', 'produit_image/AXFjJl0v1sgejkgJvTYA0cH681UqGqdcKrSGTIig.jpg'),
(7, 'Confiture Framboise Aicha 37 cl', 20, 2, 40, '2023-07-08', 'produit_image/LZPZKxhNCi4uaDxX1YAcBIVjqwtRSyW3tboPLD0p.jpg'),
(8, 'AL ITKANE Farine fleur de blé tendre 1kg', 100, 3, 100, '2023-09-02', 'produit_image/KO5y7nq1HNxMCGPfNpHV5V5rrSKg9o5IhzB3R1G4.jpg'),
(9, 'Al-Boustane MANGUE Nectar Peche 1L', 30, 2, 100, '2023-09-17', 'produit_image/MRDbz3EdSG9OJoDsOZipPV4gNpblWQkHv98F8OwI.jpg'),
(10, 'huile lesieur 2l', 49, 1, 500, '2024-01-01', 'produit_image/BLZ6RaboLqAEhVx1eEXAgfN1vY3OSuTKHrl4acAI.png');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`CodeCl`),
  ADD KEY `CodeC` (`CodeC`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`CodeCM`),
  ADD KEY `CodeA` (`CodeA`),
  ADD KEY `CodeCl` (`CodeCl`),
  ADD KEY `CodeC` (`CodeC`);

--
-- Index pour la table `commercial`
--
ALTER TABLE `commercial`
  ADD PRIMARY KEY (`CodeC`),
  ADD KEY `CodeM` (`CodeM`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`CodeM`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`CodeA`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `CodeCl` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `CodeCM` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commercial`
--
ALTER TABLE `commercial`
  MODIFY `CodeC` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `manager`
--
ALTER TABLE `manager`
  MODIFY `CodeM` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `CodeA` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`CodeC`) REFERENCES `commercial` (`CodeC`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`CodeA`) REFERENCES `produit` (`CodeA`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`CodeCl`) REFERENCES `client` (`CodeCl`),
  ADD CONSTRAINT `commande_ibfk_3` FOREIGN KEY (`CodeC`) REFERENCES `commercial` (`CodeC`);

--
-- Contraintes pour la table `commercial`
--
ALTER TABLE `commercial`
  ADD CONSTRAINT `commercial_ibfk_1` FOREIGN KEY (`CodeM`) REFERENCES `manager` (`CodeM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
