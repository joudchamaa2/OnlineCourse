-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2026 at 05:26 PM
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
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `user_id`, `title`, `description`, `image`, `category`, `price`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Web developmet', 'this course is full stack web development \r\nhtml,css, javascript,angular,php,laravel,mysql,database , git , github', '1773497522.jpg', 'Programing', 650, NULL, '2026-03-14 12:12:02', '2026-03-14 12:12:02');

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
-- Table structure for table `home_images`
--

CREATE TABLE `home_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_images`
--

INSERT INTO `home_images` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, '1773497627.webp', '2026-03-14 12:13:47', '2026-03-14 12:13:47');

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
(5, '2026_02_13_150516_add_role_to_users_table', 1),
(6, '2026_02_24_133852_create_courses_table', 1),
(7, '2026_02_24_135245_create_video_courses_table', 1),
(8, '2026_02_24_143020_add_image_to_courses_table', 1),
(9, '2026_02_24_143803_add_price_to_courses_table', 1),
(10, '2026_03_03_132607_create_home_images_table', 1),
(11, '2026_03_08_130158_create_videos_table', 1),
(12, '2026_03_16_105932_add_column_subscribe_to_users_table', 2),
(13, '2026_03_16_120533_add_subscription_type_to_users_table', 3);

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
(1, 'App\\Models\\User', 1, 'auth_token', '56312941752daa814edacac796c0af487bd60f2ae2fc7810b538e78b116d7461', '[\"*\"]', NULL, NULL, '2026-03-14 12:08:33', '2026-03-14 12:08:33'),
(2, 'App\\Models\\User', 1, 'auth_token', 'aaf8b98a20f657c218e5f78519a184121ee02995ff73d244683f498e883eeb94', '[\"*\"]', '2026-03-14 12:09:16', NULL, '2026-03-14 12:09:12', '2026-03-14 12:09:16'),
(3, 'App\\Models\\User', 1, 'auth_token', '0ae721894f9b6930814a7ecec17c6f6820083123b5a830ace0b216d7f35f4b0d', '[\"*\"]', '2026-03-14 12:56:59', NULL, '2026-03-14 12:09:37', '2026-03-14 12:56:59'),
(4, 'App\\Models\\User', 1, 'auth_token', '9cb658d463b446e2f6d6e7f60a53cc88bcfba42914e5f964674bf148f1357798', '[\"*\"]', '2026-03-16 09:04:37', NULL, '2026-03-16 08:41:39', '2026-03-16 09:04:37'),
(5, 'App\\Models\\User', 3, 'auth_token', '3e56240a8945768a2bec6450676f07fb2a5bf50b06975b37ba07b7553a8c89eb', '[\"*\"]', NULL, NULL, '2026-03-16 09:04:58', '2026-03-16 09:04:58'),
(6, 'App\\Models\\User', 3, 'auth_token', 'a176764e92b05b989d3919f1d2d29090d04996895298d9fdcbb895f9d601eab8', '[\"*\"]', '2026-03-16 09:05:14', NULL, '2026-03-16 09:05:10', '2026-03-16 09:05:14'),
(7, 'App\\Models\\User', 1, 'auth_token', 'b3dc304ab561fa43ca2f54448ede5b39757effc8a1574fb259fee561e51b8d52', '[\"*\"]', '2026-03-16 11:32:52', NULL, '2026-03-16 09:07:20', '2026-03-16 11:32:52'),
(8, 'App\\Models\\User', 1, 'auth_token', '5c2858df83759d451ee26dd00c84ea280468a969abeb8f0ef0d8446a9f8682d9', '[\"*\"]', '2026-03-16 11:05:57', NULL, '2026-03-16 11:03:05', '2026-03-16 11:05:57'),
(9, 'App\\Models\\User', 1, 'auth_token', '5fe48f57644ebde154d294f3a3289e05f88050f7fab6e03411f4cb00189ef09e', '[\"*\"]', '2026-03-16 12:01:01', NULL, '2026-03-16 11:33:05', '2026-03-16 12:01:01'),
(10, 'App\\Models\\User', 3, 'auth_token', '1414c79d1f0ca19252cedd1a6f7eddc95c4883656ed29570a998571aa47a4802', '[\"*\"]', '2026-03-16 12:14:10', NULL, '2026-03-16 12:01:14', '2026-03-16 12:14:10'),
(11, 'App\\Models\\User', 1, 'auth_token', '1fc99eee36f50771f3fe3367a405099d87ae659930784f0c8078e1ecdbd507bc', '[\"*\"]', '2026-03-16 12:18:23', NULL, '2026-03-16 12:14:21', '2026-03-16 12:18:23'),
(12, 'App\\Models\\User', 4, 'auth_token', 'f8f0757f27f95288c46f4793cc42e7c91ed1e03cca1712c18e98ef1801c7797c', '[\"*\"]', NULL, NULL, '2026-03-16 12:18:45', '2026-03-16 12:18:45'),
(13, 'App\\Models\\User', 4, 'auth_token', '6ee680a18d9758aaa30684b3fe3f91c248297d3be07f2b8d50dd8a40d6c6ea51', '[\"*\"]', '2026-03-16 12:19:46', NULL, '2026-03-16 12:18:57', '2026-03-16 12:19:46'),
(14, 'App\\Models\\User', 1, 'auth_token', '90748c0ab49977c9e6af47eca3b99bc9d651b99434d47f422f45a445563e8f1c', '[\"*\"]', '2026-03-16 12:21:30', NULL, '2026-03-16 12:19:57', '2026-03-16 12:21:30'),
(15, 'App\\Models\\User', 3, 'auth_token', '23b546fb583d246e73db568ec42facfd329184da4c7ee9823ef0667c6a1cb48c', '[\"*\"]', '2026-03-16 12:22:22', NULL, '2026-03-16 12:21:47', '2026-03-16 12:22:22'),
(16, 'App\\Models\\User', 3, 'auth_token', '4f6a103873c15d23bea30824e1a0075ec89136d8054a9c1262db8b6f5cd123c1', '[\"*\"]', '2026-03-16 12:26:06', NULL, '2026-03-16 12:22:35', '2026-03-16 12:26:06'),
(17, 'App\\Models\\User', 1, 'auth_token', '0299341f0219a84eaca95d7eedb9e6697c0ae7a41003afb38dc514845dc3481a', '[\"*\"]', '2026-03-16 12:26:27', NULL, '2026-03-16 12:26:16', '2026-03-16 12:26:27'),
(18, 'App\\Models\\User', 4, 'auth_token', '027919442ce12c8f3aebe5d4c8b3b2f8481d99d00dac9e16724f70a485b0e78d', '[\"*\"]', '2026-03-16 12:52:17', NULL, '2026-03-16 12:26:39', '2026-03-16 12:52:17'),
(19, 'App\\Models\\User', 1, 'auth_token', 'c2599bdfbff86c467093c98b4077fc6aa942af884bff45ba685758299ff2fbeb', '[\"*\"]', '2026-03-16 13:06:40', NULL, '2026-03-16 12:52:27', '2026-03-16 13:06:40'),
(20, 'App\\Models\\User', 1, 'auth_token', '2eed0704055f51905e07dd140de503836b60082cf0669aae387f35a59d1949fc', '[\"*\"]', '2026-03-18 11:53:23', NULL, '2026-03-16 13:07:01', '2026-03-18 11:53:23'),
(21, 'App\\Models\\User', 1, 'auth_token', '058cb3b02e988bd5fc83ccef35118740c1b3f978e5b3adcea0023081635eed96', '[\"*\"]', '2026-03-18 11:56:39', NULL, '2026-03-18 11:54:09', '2026-03-18 11:56:39'),
(22, 'App\\Models\\User', 5, 'auth_token', 'c40b45bfb145d15e857955bdb3690694baaf4fc35b4fb7c001bb8b550c097638', '[\"*\"]', NULL, NULL, '2026-03-18 11:57:03', '2026-03-18 11:57:03'),
(23, 'App\\Models\\User', 5, 'auth_token', '275836b9e0073da2cace6b9ed6599f6a93534a6c11fb56e8732eccb883f0c4c1', '[\"*\"]', '2026-03-18 11:57:24', NULL, '2026-03-18 11:57:14', '2026-03-18 11:57:24'),
(24, 'App\\Models\\User', 1, 'auth_token', 'd925eb18626087b368018593197ca60d750c590f1fa64d1b47884af8e01b48b4', '[\"*\"]', '2026-03-18 12:11:22', NULL, '2026-03-18 11:57:38', '2026-03-18 12:11:22'),
(25, 'App\\Models\\User', 5, 'auth_token', 'bfc1c64b4bae5e537376cd466544d60b351b8b798d78987aede707e7941f86b7', '[\"*\"]', '2026-03-18 12:12:02', NULL, '2026-03-18 12:11:31', '2026-03-18 12:12:02'),
(26, 'App\\Models\\User', 1, 'auth_token', '574a16dc3f4ec84548b7f042f1f66a64cd81f76ba9928fc826b6dd1e9e7f1de5', '[\"*\"]', '2026-03-18 12:43:20', NULL, '2026-03-18 12:12:15', '2026-03-18 12:43:20'),
(27, 'App\\Models\\User', 1, 'auth_token', '0d7a70f6a018e7fd3c09ad4fd5771f064f60cd900a067efe0d4ea62b7495468d', '[\"*\"]', '2026-03-18 12:20:30', NULL, '2026-03-18 12:20:05', '2026-03-18 12:20:30'),
(28, 'App\\Models\\User', 1, 'auth_token', 'f7a0a9cb56f79cd39fa11213382b94d9b48cb1e240ac528a82d50224f2ee4d82', '[\"*\"]', '2026-03-19 12:11:24', NULL, '2026-03-19 10:12:34', '2026-03-19 12:11:24'),
(29, 'App\\Models\\User', 1, 'auth_token', '032e6d2bd0a66a416e006262eb08324accef9662026ae2839a30cb17f93deef1', '[\"*\"]', '2026-03-19 12:04:40', NULL, '2026-03-19 10:45:56', '2026-03-19 12:04:40'),
(30, 'App\\Models\\User', 1, 'auth_token', '942d17e929bf99f4be1c5d6630f6fa09cd2e96f94a43850cc8300da2f625048c', '[\"*\"]', '2026-03-19 12:12:15', NULL, '2026-03-19 12:11:39', '2026-03-19 12:12:15'),
(31, 'App\\Models\\User', 1, 'auth_token', 'a252af4d8ea7ceca6a6d9bdda0d02a9320bfe063a80964e02cab31239a3f6e19', '[\"*\"]', '2026-03-24 11:45:14', NULL, '2026-03-24 11:37:23', '2026-03-24 11:45:14'),
(32, 'App\\Models\\User', 1, 'auth_token', '847303856c6145f389e2aabd1c85b4501bbe248e615599d09805e49d3f557b04', '[\"*\"]', '2026-03-24 12:00:09', NULL, '2026-03-24 12:00:08', '2026-03-24 12:00:09'),
(33, 'App\\Models\\User', 1, 'auth_token', '739d0857654890bffcd520143d25024086aee93a4725713699e41839d2a59349', '[\"*\"]', '2026-03-24 12:21:36', NULL, '2026-03-24 12:03:28', '2026-03-24 12:21:36'),
(34, 'App\\Models\\User', 1, 'auth_token', 'a265bbf1e00f1eab22f066792f93c05ddc59264042805d7f42aa3c0f9deb1a7f', '[\"*\"]', NULL, NULL, '2026-03-24 12:08:48', '2026-03-24 12:08:48'),
(35, 'App\\Models\\User', 1, 'auth_token', '6fdd5425ca0d0b5d7d22053f84b72626edaadf53adcdf22b1e2253aa075a6d20', '[\"*\"]', NULL, NULL, '2026-03-24 12:21:50', '2026-03-24 12:21:50'),
(36, 'App\\Models\\User', 1, 'auth_token', '4c3478484faba52e035066f5ef3d6c4e1acd08f89609e564dfcb1084a489dd6a', '[\"*\"]', '2026-03-24 12:28:07', NULL, '2026-03-24 12:22:30', '2026-03-24 12:28:07'),
(37, 'App\\Models\\User', 1, 'auth_token', 'fb26519b6d86c2537df33644929f0e50c0c0a265bfce4eeeb4d87d9b53436d91', '[\"*\"]', '2026-03-24 12:34:15', NULL, '2026-03-24 12:28:17', '2026-03-24 12:34:15'),
(38, 'App\\Models\\User', 1, 'auth_token', 'd5316a4dc36bfdf5cf2599f64ea4996f276be203362f8b67ded4709b0d6ad03f', '[\"*\"]', NULL, NULL, '2026-03-24 12:33:10', '2026-03-24 12:33:10'),
(39, 'App\\Models\\User', 1, 'auth_token', '706905e8c2da5ddb70edef2c98b76d218a9df12b44340c3cb417b1c5a7c13edc', '[\"*\"]', '2026-03-24 12:38:12', NULL, '2026-03-24 12:34:25', '2026-03-24 12:38:12'),
(40, 'App\\Models\\User', 4, 'auth_token', '7f3c50e6ddd6def9ed39abb0d702ee186971853af10f87c8adf58fa2d88bed34', '[\"*\"]', '2026-03-24 12:57:03', NULL, '2026-03-24 12:38:26', '2026-03-24 12:57:03'),
(41, 'App\\Models\\User', 1, 'auth_token', '3596bbf4c5ac7e13a4ada23d5af95473faa263563c4747cc333368d7cf995404', '[\"*\"]', '2026-03-24 13:12:30', NULL, '2026-03-24 13:11:21', '2026-03-24 13:12:30'),
(42, 'App\\Models\\User', 4, 'auth_token', '8b20009bff76936f1bf97ac19ea49b9587b21e69e23a7b9070cea8bb2834756e', '[\"*\"]', '2026-03-24 13:17:19', NULL, '2026-03-24 13:12:43', '2026-03-24 13:17:19'),
(43, 'App\\Models\\User', 1, 'auth_token', 'c0ea61463b7e6859f97affe9577eb806d63fe7080c18b4fee624e4cbc003c114', '[\"*\"]', '2026-03-24 13:18:28', NULL, '2026-03-24 13:17:36', '2026-03-24 13:18:28'),
(44, 'App\\Models\\User', 1, 'auth_token', '652d6bed0a0842412a456bfe7ca66ab569d512cc77710dd2b9223201458ab5f6', '[\"*\"]', '2026-03-24 13:29:30', NULL, '2026-03-24 13:20:31', '2026-03-24 13:29:30'),
(45, 'App\\Models\\User', 1, 'auth_token', '8b4b7c939ce83fdb29f4a642e9fcd6895cc72e7e81d2bc58dc27f11b98d47dc2', '[\"*\"]', '2026-03-24 13:36:02', NULL, '2026-03-24 13:36:01', '2026-03-24 13:36:02');

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
  `role` enum('user','indtructor','admin') NOT NULL DEFAULT 'user',
  `subscription` timestamp NULL DEFAULT NULL,
  `subscription_type` varchar(255) DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `subscription`, `subscription_type`, `expired_at`) VALUES
(1, 'joud', 'joud@gmail.com', NULL, '$2y$12$6HYKSWCenrBwDFuWb.ZkgeCc5S2X/2N09gxsROt8MbPIaZuD3aPkW', NULL, '2026-03-14 12:08:32', '2026-03-16 11:42:01', 'admin', '2026-03-16 11:42:01', 'yearly', '2027-03-16 11:42:01'),
(3, 'john', 'john@gmail.com', NULL, '$2y$12$.Qtp1RpNo7E8Gt.QK5vLdOte24RqDWmp.DxwFRva47mp1fCUysVA2', NULL, '2026-03-16 09:04:58', '2026-03-16 12:13:44', 'user', '2026-03-16 12:13:44', 'monthly', '2026-04-16 11:13:44'),
(4, 'user', 'user@gmail.com', NULL, '$2y$12$eJxk9MTG5lclKUDZTQsmsODmwkvuQHXdvq/V4jW3FJZ35IdlAXu5.', NULL, '2026-03-16 12:18:45', '2026-03-16 12:27:00', 'user', '2026-03-16 12:27:00', 'monthly', '2026-04-16 11:27:00'),
(5, 'mira', 'mira@gmail.com', NULL, '$2y$12$DOQg74pvJwGAx.ETm8Q54eRTlRQ0aSjs85qarfkhJiskqrAXrG3Z.', NULL, '2026-03-18 11:57:02', '2026-03-18 12:11:48', 'user', '2026-03-18 12:11:48', 'monthly', '2026-04-18 11:11:48');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `video` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `course_id`, `title`, `description`, `video`, `created_at`, `updated_at`) VALUES
(1, 1, 'introduction to web development', 'in this video you will know what is web development', '1773498094.mp4', '2026-03-14 12:21:34', '2026-03-14 12:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `video_courses`
--

CREATE TABLE `video_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_images`
--
ALTER TABLE `home_images`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_course_id_foreign` (`course_id`);

--
-- Indexes for table `video_courses`
--
ALTER TABLE `video_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_courses_course_id_foreign` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_images`
--
ALTER TABLE `home_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `video_courses`
--
ALTER TABLE `video_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `video_courses`
--
ALTER TABLE `video_courses`
  ADD CONSTRAINT `video_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
