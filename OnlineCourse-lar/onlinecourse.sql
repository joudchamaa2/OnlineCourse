-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2026 at 01:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinecourse`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_02_09_153112_create_personal_access_tokens_table', 1),
(5, '2026_02_13_150516_add_role_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'auth_token', '4c8a4175bf73016f29b82d326953352618ea2e75229b5056701fff130d6107c7', '[\"*\"]', NULL, NULL, '2026-02-11 12:07:39', '2026-02-11 12:07:39'),
(2, 'App\\Models\\User', 4, 'auth_token', '5e232dee9ca339d746bc8db88adf3afc0b75f51f05d0758740dae8bc4f3e74dc', '[\"*\"]', NULL, NULL, '2026-02-11 13:44:23', '2026-02-11 13:44:23'),
(3, 'App\\Models\\User', 3, 'auth_token', 'b9a64e140b4e9e963d914ed811ed2e2ff66b4de0ddf5f590dff2dc6eb276d017', '[\"*\"]', NULL, NULL, '2026-02-11 14:42:41', '2026-02-11 14:42:41'),
(4, 'App\\Models\\User', 4, 'auth_token', '02a7d0677823e759d764e6f9567b50bad3357bc2f6d2ad5b0c543b76cb73b797', '[\"*\"]', '2026-02-11 16:57:13', NULL, '2026-02-11 15:36:47', '2026-02-11 16:57:13'),
(5, 'App\\Models\\User', 4, 'auth_token', 'b735a0cc2aa9e7fa83cb4e9e49cbde696ccb7795f379daa6e7ea6a14e5f4ab3b', '[\"*\"]', NULL, NULL, '2026-02-11 16:14:37', '2026-02-11 16:14:37'),
(6, 'App\\Models\\User', 4, 'auth_token', '7e9caf72944caef63a34b94d27d1a3855eae95f34fd6c31aabbcf8e906c221a7', '[\"*\"]', '2026-02-17 12:21:36', NULL, '2026-02-11 16:53:14', '2026-02-17 12:21:36'),
(7, 'App\\Models\\User', 4, 'auth_token', '131ea54d5b453ad560e1f2b15c6199372d13e5f1145198f402df0070d0c10a64', '[\"*\"]', '2026-02-11 16:59:17', NULL, '2026-02-11 16:57:33', '2026-02-11 16:59:17'),
(8, 'App\\Models\\User', 5, 'auth_token', 'a18fffbbb687ea0614cefe4d264e8c4220aa43a6f243f617e1d84b3383db9dab', '[\"*\"]', NULL, NULL, '2026-02-11 16:59:49', '2026-02-11 16:59:49'),
(9, 'App\\Models\\User', 5, 'auth_token', '30b1f25d316456bb47f185c36a99da0373ba7712425679632e08836bf0243d3b', '[\"*\"]', '2026-02-11 17:04:21', NULL, '2026-02-11 17:04:17', '2026-02-11 17:04:21'),
(10, 'App\\Models\\User', 6, 'auth_token', '97e631a62b255aa83355d7b1a8f54c1ca04f030092cd73a960835ae39d446ecb', '[\"*\"]', '2026-02-11 17:04:45', NULL, '2026-02-11 17:04:38', '2026-02-11 17:04:45'),
(11, 'App\\Models\\User', 6, 'auth_token', 'dfcdf9e526c5fb776bb4ac4d3833949a75ec64985f6af6b93331e35d91fc3d55', '[\"*\"]', '2026-02-11 17:05:03', NULL, '2026-02-11 17:04:59', '2026-02-11 17:05:03'),
(12, 'App\\Models\\User', 7, 'auth_token', '9e85c535a8104daa771682d6986959ff83c66f6943ec2575f250296e5dc6265f', '[\"*\"]', '2026-02-13 12:55:29', NULL, '2026-02-13 12:55:25', '2026-02-13 12:55:29'),
(13, 'App\\Models\\User', 7, 'auth_token', '5ccf572d5d9b048693bfef817616d22b4c399d1496b34729ca81026837b64752', '[\"*\"]', '2026-02-13 14:33:05', NULL, '2026-02-13 12:55:40', '2026-02-13 14:33:05'),
(14, 'App\\Models\\User', 7, 'auth_token', '2b81218c96691d9601ba2e02b08c9609e30a21284c454cb7211b980ab768a5be', '[\"*\"]', '2026-02-13 14:35:25', NULL, '2026-02-13 14:33:22', '2026-02-13 14:35:25'),
(15, 'App\\Models\\User', 7, 'auth_token', 'd305e14ff3a7beab924f2e74ef7a521f4b0066643af13913fec8445368759e19', '[\"*\"]', '2026-02-13 14:35:44', NULL, '2026-02-13 14:35:36', '2026-02-13 14:35:44'),
(16, 'App\\Models\\User', 3, 'auth_token', '6b5b3e3cb2158d44f5dacd9dbb414b1a17df5f4243940c600ccf0e28454c6e15', '[\"*\"]', '2026-02-13 14:36:23', NULL, '2026-02-13 14:35:54', '2026-02-13 14:36:23'),
(17, 'App\\Models\\User', 3, 'auth_token', '8a4c9acc759d33c136147f2b73ced782165ee4e0806401352728f9510821706d', '[\"*\"]', '2026-02-13 14:36:53', NULL, '2026-02-13 14:36:35', '2026-02-13 14:36:53'),
(18, 'App\\Models\\User', 3, 'auth_token', '00a5e4a09a03e84ddf079e2ccb83af2f6c6e6fa324fe49e3b3bef9056b7fc746', '[\"*\"]', '2026-02-13 14:41:46', NULL, '2026-02-13 14:37:22', '2026-02-13 14:41:46'),
(19, 'App\\Models\\User', 7, 'auth_token', '81fde2c490d07f394f61abc2a6abbc3b7a798ef4e25cfb859cff60d614169113', '[\"*\"]', '2026-02-13 15:11:48', NULL, '2026-02-13 14:41:57', '2026-02-13 15:11:48'),
(20, 'App\\Models\\User', 7, 'auth_token', 'f977a6d5f089106c2df68a5faf7a5f6bf66df607b8ee116ff11636fece771422', '[\"*\"]', '2026-02-13 16:03:40', NULL, '2026-02-13 15:12:01', '2026-02-13 16:03:40'),
(21, 'App\\Models\\User', 7, 'auth_token', 'ffb0f80a32247c43253b2ca8a75b68b20830c4e7481c42a9e85497d2cabe3d62', '[\"*\"]', '2026-02-13 16:45:43', NULL, '2026-02-13 15:18:05', '2026-02-13 16:45:43'),
(22, 'App\\Models\\User', 7, 'auth_token', '5565cb4e4b5f20f71182078e06222c5b43d9ed3447a344d0b27a9152ea088e5d', '[\"*\"]', '2026-02-13 16:31:37', NULL, '2026-02-13 16:03:50', '2026-02-13 16:31:37'),
(23, 'App\\Models\\User', 3, 'auth_token', '9f028243dd9762387c695f4240b408fa60d7069790b40b33741ae76c713ff868', '[\"*\"]', '2026-02-13 16:31:59', NULL, '2026-02-13 16:31:46', '2026-02-13 16:31:59'),
(24, 'App\\Models\\User', 7, 'auth_token', '8fc1b65100235e54198cbf354c3c27a562bf7d44d11832c7fb5689d336688d72', '[\"*\"]', '2026-02-13 17:05:18', NULL, '2026-02-13 16:32:12', '2026-02-13 17:05:18'),
(25, 'App\\Models\\User', 7, 'auth_token', 'bac58e3069d525bea6a5b5592110fcd4a93cfb58491759054cdd5c9c123a6e0f', '[\"*\"]', '2026-02-19 10:03:41', NULL, '2026-02-13 16:47:11', '2026-02-19 10:03:41'),
(26, 'App\\Models\\User', 7, 'auth_token', '636b3fcc79ff8733375eaf7b84fac56a40c3d4b541aec898fdd9a519c6ea18ec', '[\"*\"]', '2026-02-13 17:07:23', NULL, '2026-02-13 17:05:34', '2026-02-13 17:07:23'),
(27, 'App\\Models\\User', 8, 'auth_token', 'b3628cc404fc7a976fce3f978cb308c317c2ee77a882b5ceb92ebf7106bc6293', '[\"*\"]', '2026-02-13 17:08:16', NULL, '2026-02-13 17:07:47', '2026-02-13 17:08:16'),
(28, 'App\\Models\\User', 8, 'auth_token', 'dfc0c5f9722964bb17ca4badcb4b4877733ddfb1d7c979fb787877b2926a353d', '[\"*\"]', '2026-02-13 17:09:24', NULL, '2026-02-13 17:08:27', '2026-02-13 17:09:24'),
(29, 'App\\Models\\User', 9, 'auth_token', '82d1a5d27d01b358e387cc061ac6faae6e8a7e15fc56c3f4616f061e2f245e4d', '[\"*\"]', NULL, NULL, '2026-02-13 17:10:14', '2026-02-13 17:10:14'),
(30, 'App\\Models\\User', 9, 'auth_token', '8a243d4e086ae95c525342b24ab11f20dacecb69c1b0be3d8f6841f42f3901eb', '[\"*\"]', '2026-02-13 17:10:51', NULL, '2026-02-13 17:10:42', '2026-02-13 17:10:51'),
(31, 'App\\Models\\User', 7, 'auth_token', 'd450e686f1653f8c6c7226ce55a74c2ba6c0dbec95abafd27b7f074655303f8f', '[\"*\"]', '2026-02-13 17:11:06', NULL, '2026-02-13 17:11:05', '2026-02-13 17:11:06'),
(32, 'App\\Models\\User', 7, 'auth_token', '71b0d9cca5ba908366828ea28645bfceb679041813c4713a011d0b0d6d02810b', '[\"*\"]', '2026-02-17 11:12:26', NULL, '2026-02-17 11:10:18', '2026-02-17 11:12:26'),
(33, 'App\\Models\\User', 7, 'auth_token', 'c0a9748194c913a5cf9d8505ec30e9e77e80db06963e358ffcf472c5b49bd55c', '[\"*\"]', '2026-02-17 11:12:38', NULL, '2026-02-17 11:12:35', '2026-02-17 11:12:38'),
(34, 'App\\Models\\User', 7, 'auth_token', '2cdcd8e8dc44e2915bb11794803816d4657f95bcd93d29eedd291cef923c2122', '[\"*\"]', '2026-02-17 13:45:59', NULL, '2026-02-17 11:12:36', '2026-02-17 13:45:59'),
(35, 'App\\Models\\User', 3, 'auth_token', '26d75a9ab53ea67964af23796d8039a52ba630b4b4561e8d8e3832a8b9468372', '[\"*\"]', '2026-02-17 13:25:21', NULL, '2026-02-17 13:17:51', '2026-02-17 13:25:21'),
(36, 'App\\Models\\User', 10, 'auth_token', 'afc6636fe1cefc1010572be959024e6c75354b588736c6ebe5e33a03928ea054', '[\"*\"]', NULL, NULL, '2026-02-17 13:46:25', '2026-02-17 13:46:25'),
(37, 'App\\Models\\User', 10, 'auth_token', 'd7df2a72ec534097bc00270cd50d86100a4a03be544f676a69c20591254db3ae', '[\"*\"]', '2026-02-17 13:46:41', NULL, '2026-02-17 13:46:38', '2026-02-17 13:46:41'),
(38, 'App\\Models\\User', 7, 'auth_token', 'f8be55b956245c6f030798779c5805b1bd4f9d17fa26621005eab6de4eb96a36', '[\"*\"]', '2026-02-17 13:52:05', NULL, '2026-02-17 13:46:53', '2026-02-17 13:52:05'),
(39, 'App\\Models\\User', 11, 'auth_token', 'a17c7399fc2183d972a60d3a4eeb5402094dad7b39353ab719aad2f24b3946a6', '[\"*\"]', NULL, NULL, '2026-02-17 13:52:31', '2026-02-17 13:52:31'),
(40, 'App\\Models\\User', 11, 'auth_token', '34401de643a3a1a9799ce2cb335d42ec7d540690d7126e665a8b6de370483af4', '[\"*\"]', '2026-02-17 13:52:59', NULL, '2026-02-17 13:52:56', '2026-02-17 13:52:59'),
(41, 'App\\Models\\User', 7, 'auth_token', '4c877c6b0644ed2bd7c16dc0023399f0cf692ac9d35aaef6ab2d433dc97b85fa', '[\"*\"]', '2026-02-17 13:53:44', NULL, '2026-02-17 13:53:24', '2026-02-17 13:53:44'),
(42, 'App\\Models\\User', 7, 'auth_token', 'bc16285b36c96235548de404a210df6a7322ea5e9d31bae4887af757fbc2a21b', '[\"*\"]', '2026-02-19 09:09:18', NULL, '2026-02-19 08:55:58', '2026-02-19 09:09:18'),
(43, 'App\\Models\\User', 12, 'auth_token', '60241dca38c972fe58d312b348dcaa42e6b0c0b2eae4b3931fca39789ce905b0', '[\"*\"]', NULL, NULL, '2026-02-19 09:11:25', '2026-02-19 09:11:25'),
(44, 'App\\Models\\User', 7, 'auth_token', '0ae4dd587d97bf27110a3398099f633217174fd9fb1d4f3f1397deaf5eb55524', '[\"*\"]', '2026-02-19 09:30:57', NULL, '2026-02-19 09:11:35', '2026-02-19 09:30:57'),
(45, 'App\\Models\\User', 7, 'auth_token', '044c2b8ae3c3f491231583b147ecad0b276ed29ab8f44b72b6a8dcc394a31c40', '[\"*\"]', '2026-02-19 10:21:31', NULL, '2026-02-19 09:38:59', '2026-02-19 10:21:31'),
(46, 'App\\Models\\User', 7, 'auth_token', '9c1de784ba128f97cc8db79cc6a1bf6e539bddcd9f86a93d499e0712216ad29b', '[\"*\"]', '2026-02-19 10:05:53', NULL, '2026-02-19 10:04:51', '2026-02-19 10:05:53'),
(47, 'App\\Models\\User', 7, 'auth_token', 'a6cd5808c3542604537beeb6ea9bb775b5a6560570a3fbd2645c243b8eac1cdc', '[\"*\"]', '2026-02-21 10:21:30', NULL, '2026-02-21 10:08:49', '2026-02-21 10:21:30'),
(48, 'App\\Models\\User', 7, 'auth_token', 'fe5b009201c8d156b76c105e25a5e40b33aa6bf30ab3ed7a0910c618417cf5c1', '[\"*\"]', '2026-02-21 10:10:49', NULL, '2026-02-21 10:10:27', '2026-02-21 10:10:49'),
(49, 'App\\Models\\User', 13, 'auth_token', 'fd4d28b7fef1f2fb82106d1e739affbb9e049d4a23e0dcced9f20f9b1ccfd2f6', '[\"*\"]', NULL, NULL, '2026-02-21 10:21:47', '2026-02-21 10:21:47'),
(50, 'App\\Models\\User', 7, 'auth_token', '3b6bffee368edf020dfccfb923470e56a528f01d76746d516409cbfcc771d457', '[\"*\"]', '2026-02-21 11:06:29', NULL, '2026-02-21 10:22:01', '2026-02-21 11:06:29');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('user','indtructor','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(7, 'joud', 'joud@gmail.com', NULL, '$2y$12$A6vduukpKbT661TUoE/DseliBIfwNPPlLPiOw48b0F.aVfYPx28/a', NULL, '2026-02-13 12:55:24', '2026-02-13 12:55:24', 'admin'),
(12, 'lousi', 'lousi@gmail.com', NULL, '$2y$12$D0L9oZU78awfZgF/mTpiu.vlgUI1X.qAsbRFzM4B2fsiT55JMeP5W', NULL, '2026-02-19 09:11:25', '2026-02-21 10:10:49', 'admin'),
(13, 'wewe', 'wewe@gmail.com', NULL, '$2y$12$8qOdKyGyyb0nZpZkvw6Wxu1ceE4c5UIBUO/WiPJPldREM0lu6LjI2', NULL, '2026-02-21 10:21:47', '2026-02-21 11:06:29', 'indtructor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
