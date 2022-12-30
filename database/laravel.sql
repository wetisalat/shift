-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 19, 2022 at 01:42 PM
-- Server version: 10.3.37-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `salary` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `user_id`, `date`, `type`, `salary`, `status`, `attachment`, `comment`, `created_at`, `updated_at`) VALUES
(1, 3, '2022-12-14 23:00:00', 'Péage', '1234', '2', '1670619201.png', 'bajn', '2022-12-09 19:53:21', '2022-12-09 19:53:21');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_03_000001_create_customer_columns', 1),
(4, '2019_05_03_000002_create_subscriptions_table', 1),
(5, '2019_05_03_000003_create_subscription_items_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2022_10_14_150330_create_permission_tables', 1),
(9, '2022_10_22_041209_add_abilities_to_permissions_table', 1),
(10, '2022_11_16_194629_add_user_id_and_gender_users_table', 2),
(11, '2022_12_04_120354_add_firstname_and_lastname_to_users', 3),
(12, '2022_12_04_211822_create_sessions_table', 4),
(13, '2022_12_04_231622_create_todos_table', 4),
(14, '2022_12_09_175608_expense', 5),
(15, '2022_12_09_180615_status', 5),
(32, '2022_12_09_031944_create_staffs_table', 6),
(33, '2022_12_10_120354_add_avatar_to_users', 6);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `user_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `action`, `subject`, `fields`, `conditions`, `created_at`, `updated_at`) VALUES
(1, 'read Dashboard', 'api', 'read', 'Dashboard', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(2, 'read Auth', 'api', 'read', 'Auth', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(3, 'read Clients', 'api', 'read', 'Clients', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(4, 'read Plan', 'api', 'read', 'Plan', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(5, 'read Coupons', 'api', 'read', 'Coupons', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(6, 'read Leave', 'api', 'read', 'Leave', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(7, 'read Lunch', 'api', 'read', 'Lunch', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(8, 'read Staff', 'api', 'read', 'Staff', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(9, 'read Todo', 'api', 'read', 'Todo', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(10, 'read Expenses', 'api', 'read', 'Expenses', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(11, 'read Schedule', 'api', 'read', 'Schedule', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(12, 'read Request', 'api', 'read', 'Request', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(13, 'read Attendance', 'api', 'read', 'Attendance', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(14, 'read Payroll', 'api', 'read', 'Payroll', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(15, 'read Analyse', 'api', 'read', 'Analyse', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(16, 'read Profil', 'api', 'read', 'Profil', NULL, NULL, '2022-11-06 16:58:31', '2022-11-06 16:58:31'),
(17, 'read Test', 'api', 'read', 'Test', NULL, NULL, '2022-11-06 16:58:31', '2022-11-06 16:58:31'),
(18, 'read Role Client', 'api', 'read', 'Role Client', NULL, NULL, '2022-11-06 16:58:31', '2022-11-06 16:58:31'),
(19, 'read Role Staff', 'api', 'read', 'Role Staff', NULL, NULL, '2022-11-06 16:58:31', '2022-11-06 16:58:31'),
(20, 'read Settings', 'api', 'read', 'Settings', NULL, NULL, '2022-11-06 16:58:30', '2022-11-06 16:58:30');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'Personal Access Token', '4c02b28cc995bdb9879e9fcb0c2d12f4b6c645acda1f34a222e48f50fa01e8c0', '[\"*\"]', NULL, '2022-11-06 17:12:04', '2022-11-06 17:12:04'),
(2, 'App\\Models\\User', 1, 'Personal Access Token', '5aaeb03d4c43c0b5fa488495af244f73b8915bb5f9dfbb660733e0b34f5ef1d0', '[\"*\"]', '2022-11-06 17:13:30', '2022-11-06 17:13:00', '2022-11-06 17:13:30'),
(3, 'App\\Models\\User', 2, 'Personal Access Token', '566e886f7a999b2bfe9044e0a42e28bc1d2d182e6057b1f06225f5c358476618', '[\"*\"]', NULL, '2022-11-06 17:17:10', '2022-11-06 17:17:10'),
(4, 'App\\Models\\User', 2, 'Personal Access Token', 'b079d7f33daa6902ae9f68fa00745a3ab14d771baa8721e6ff67b482440f15a8', '[\"*\"]', '2022-11-06 17:25:45', '2022-11-06 17:25:32', '2022-11-06 17:25:45'),
(5, 'App\\Models\\User', 3, 'Personal Access Token', '628484ed48a73408e2d72432f3b94bf6cf43c3197a1edfe8ad636e199c1d9703', '[\"*\"]', NULL, '2022-11-06 17:26:08', '2022-11-06 17:26:08'),
(6, 'App\\Models\\User', 3, 'Personal Access Token', '3f45b7eb3f202c3c18430f51b92683e6ae8a4e7fffac25165902ec72419e956c', '[\"*\"]', '2022-11-06 17:26:39', '2022-11-06 17:26:26', '2022-11-06 17:26:39'),
(7, 'App\\Models\\User', 1, 'Personal Access Token', 'e1ec653b6bd18b9f84a0e622931c61fbf6dc549c927b05f646abbea34e7f6ef1', '[\"*\"]', '2022-11-06 17:27:20', '2022-11-06 17:27:09', '2022-11-06 17:27:20'),
(8, 'App\\Models\\User', 3, 'Personal Access Token', '9f912af1b45bb9b6504cc67a23795c7693cfae0b40cfe46ab0f79da49fc73d6a', '[\"*\"]', '2022-11-06 17:31:01', '2022-11-06 17:30:49', '2022-11-06 17:31:01'),
(9, 'App\\Models\\User', 2, 'Personal Access Token', 'd0f537e2bd4dc5fd21e18dfcd015887e9059ce3bb01349e86145d572b49548d3', '[\"*\"]', '2022-11-07 12:31:14', '2022-11-07 12:31:13', '2022-11-07 12:31:14'),
(10, 'App\\Models\\User', 2, 'Personal Access Token', '976aa6ddc341db0d0ad029ca7ba64f971ad68c0098fb92325a355017b9db8423', '[\"*\"]', '2022-11-07 16:24:44', '2022-11-07 16:24:42', '2022-11-07 16:24:44'),
(11, 'App\\Models\\User', 2, 'Personal Access Token', '7642e8ac75cd70f1597e5b17607d600c0e07333c979f48bd4edb31106d25e5d6', '[\"*\"]', '2022-11-07 16:26:29', '2022-11-07 16:24:45', '2022-11-07 16:26:29'),
(12, 'App\\Models\\User', 1, 'Personal Access Token', '43025e47bac8d32dbe1ae0030001eacc74b873b7ee9f6dde4a76b1660c77b77d', '[\"*\"]', '2022-11-11 21:42:41', '2022-11-11 21:42:28', '2022-11-11 21:42:41'),
(13, 'App\\Models\\User', 2, 'Personal Access Token', '2d37fdb655f0c3769ae59147581e93bd9d94f46c3c2a76a43b90dba36409788c', '[\"*\"]', '2022-11-11 21:43:24', '2022-11-11 21:43:13', '2022-11-11 21:43:24'),
(14, 'App\\Models\\User', 3, 'Personal Access Token', 'd2a983d6c3ef69e2f95bd8b2b7ef9711d150eb580e0bf9ff9b0b9aa7a00e5623', '[\"*\"]', '2022-11-11 21:43:54', '2022-11-11 21:43:52', '2022-11-11 21:43:54'),
(15, 'App\\Models\\User', 3, 'Personal Access Token', 'd17c4ea3d7a4ec3a19a8134790988c7839d2a7ad6f9ece0b719034395cde4514', '[\"*\"]', '2022-11-11 21:44:04', '2022-11-11 21:43:54', '2022-11-11 21:44:04'),
(16, 'App\\Models\\User', 1, 'Personal Access Token', '53d45456d9b5aee3165df1fe1dc619afff39064f5edfa124819a1a4525248980', '[\"*\"]', '2022-11-12 09:15:22', '2022-11-12 09:14:50', '2022-11-12 09:15:22'),
(17, 'App\\Models\\User', 2, 'Personal Access Token', 'a149d0f5cd5a65445695547b2b439dd92c25eb6eed56b485b931f7f2684c7449', '[\"*\"]', '2022-11-12 09:19:29', '2022-11-12 09:19:15', '2022-11-12 09:19:29'),
(18, 'App\\Models\\User', 3, 'Personal Access Token', '79d1876cd1f3c24e04dcc3d84208978a4d2d987a5b7ff10c19d04cc7a4d0c819', '[\"*\"]', '2022-11-12 09:27:20', '2022-11-12 09:27:05', '2022-11-12 09:27:20'),
(19, 'App\\Models\\User', 1, 'Personal Access Token', 'a2a31237411c320bfc61b64e9f09759925cd35e839e8e4153845101f8adc7b31', '[\"*\"]', '2022-11-14 15:25:17', '2022-11-14 15:24:37', '2022-11-14 15:25:17'),
(20, 'App\\Models\\User', 2, 'Personal Access Token', '337c05b996a02a3d2093ec23c70ba6a5eeb38ec99b7899a61723a93adbda1adc', '[\"*\"]', '2022-11-14 15:26:11', '2022-11-14 15:25:57', '2022-11-14 15:26:11'),
(21, 'App\\Models\\User', 1, 'Personal Access Token', 'bfa52c6afc74d1a4954aecefd98e9696ed79fae97f517a06c4af3f6b7d745162', '[\"*\"]', '2022-11-14 15:37:44', '2022-11-14 15:37:28', '2022-11-14 15:37:44'),
(22, 'App\\Models\\User', 1, 'Personal Access Token', '5133602a1bea74fb2707085dfb2ad0a982653be6ac05005bfc81904c46a3ff53', '[\"*\"]', '2022-11-14 16:51:38', '2022-11-14 16:50:30', '2022-11-14 16:51:38'),
(23, 'App\\Models\\User', 2, 'Personal Access Token', '51c6593070bf09a851ca609b1517890f9907f0ea94509181346f6a9943fcc25c', '[\"*\"]', '2022-11-14 16:53:15', '2022-11-14 16:53:01', '2022-11-14 16:53:15'),
(24, 'App\\Models\\User', 3, 'Personal Access Token', '59d434228d665854d6ede98db6e62e982e198c0300596943823317fd5ef50af2', '[\"*\"]', '2022-11-14 16:55:28', '2022-11-14 16:55:12', '2022-11-14 16:55:28'),
(25, 'App\\Models\\User', 1, 'Personal Access Token', 'aa500854736d42ebc268ab858425555df60a6a55f2e1949cfe1385c53c4ee304', '[\"*\"]', '2022-11-14 16:56:19', '2022-11-14 16:55:57', '2022-11-14 16:56:19'),
(26, 'App\\Models\\User', 3, 'Personal Access Token', '87a9bc77c8811b23408a53b7f0f6edd92cada87a78c39f05aaa8f1ea04c55fc0', '[\"*\"]', '2022-11-14 17:35:22', '2022-11-14 17:34:58', '2022-11-14 17:35:22'),
(27, 'App\\Models\\User', 2, 'Personal Access Token', '5c0a7cd528fc368dc4c6d2e6dcd05bf62c60fe3e18a21d528319b40f88de2e10', '[\"*\"]', '2022-11-14 18:43:20', '2022-11-14 18:42:43', '2022-11-14 18:43:20'),
(28, 'App\\Models\\User', 3, 'Personal Access Token', '1e363ebb4f5bc3d0ab32074ea97d661560d9e03920e341097fa6f4e4b0ce5e6c', '[\"*\"]', '2022-11-14 18:46:09', '2022-11-14 18:45:49', '2022-11-14 18:46:09'),
(29, 'App\\Models\\User', 1, 'Personal Access Token', 'e54881bb50d65c5cfd119dfe8da6947977ca83ee8fc24e81108bce1ee1142bb5', '[\"*\"]', '2022-11-19 10:41:25', '2022-11-19 10:40:26', '2022-11-19 10:41:25'),
(30, 'App\\Models\\User', 2, 'Personal Access Token', '8ec447016dae2f9526a81a5d78bc4cba6532f3b167cc5c1df28c50d8765d9bf6', '[\"*\"]', '2022-11-19 10:42:12', '2022-11-19 10:41:52', '2022-11-19 10:42:12'),
(31, 'App\\Models\\User', 2, 'Personal Access Token', '166473dfe13b13350d69ed8787cf423fb9fa861050e312dd3138112ebbf3ada3', '[\"*\"]', '2022-11-19 10:45:07', '2022-11-19 10:44:36', '2022-11-19 10:45:07'),
(32, 'App\\Models\\User', 2, 'Personal Access Token', '4948744db674f5f8d1f94b5024d0b67f25a256921bdf473a06f93d53b69564c0', '[\"*\"]', '2022-11-19 17:18:44', '2022-11-19 16:47:22', '2022-11-19 17:18:44'),
(33, 'App\\Models\\User', 2, 'Personal Access Token', 'ac67080f796d23e2db3e0e5bd144603db54c8d477711a64b3259997bb7063e31', '[\"*\"]', '2022-11-19 17:46:04', '2022-11-19 17:46:02', '2022-11-19 17:46:04'),
(34, 'App\\Models\\User', 2, 'Personal Access Token', '01b63fd65fcd5e32d50e21fe2ee15e01a60085f97d0e173a00779ec00ff4ca72', '[\"*\"]', '2022-11-19 17:47:04', '2022-11-19 17:46:04', '2022-11-19 17:47:04'),
(35, 'App\\Models\\User', 2, 'Personal Access Token', '6d991bdedd8b5673cefdadf4baabd040fb37b28d41815de2b89590c561131074', '[\"*\"]', '2022-11-29 16:53:19', '2022-11-22 05:31:16', '2022-11-29 16:53:19'),
(36, 'App\\Models\\User', 2, 'Personal Access Token', '3bef627c950abb4bbfb181136253acadf6e8b07f4e7b5f5d16b3535381fe84c6', '[\"*\"]', '2022-11-22 17:33:12', '2022-11-22 17:23:06', '2022-11-22 17:33:12'),
(37, 'App\\Models\\User', 2, 'Personal Access Token', '942a6faaa626e34c5b1d828b3abc064b416148a53ced4f58a217ab88bb7a4ac9', '[\"*\"]', '2022-11-24 19:29:22', '2022-11-24 19:27:07', '2022-11-24 19:29:22'),
(38, 'App\\Models\\User', 2, 'Personal Access Token', 'b2f9ffceeb8f8268f40647658e7f45f07e84e7d31d23407b7e07c10417abca53', '[\"*\"]', '2022-11-25 20:36:46', '2022-11-25 20:34:28', '2022-11-25 20:36:46'),
(39, 'App\\Models\\User', 6, 'Personal Access Token', 'b68b4db29a0286c9b129ad25f65c613d694963c51d07ca3a8189c1e9d3ab3404', '[\"*\"]', '2022-11-25 20:38:48', '2022-11-25 20:38:22', '2022-11-25 20:38:48'),
(40, 'App\\Models\\User', 2, 'Personal Access Token', 'f159957e194d42986b43fafe2baa32bd008d712c644cc64dd12b37685e0a74d4', '[\"*\"]', '2022-11-26 16:01:50', '2022-11-26 14:58:21', '2022-11-26 16:01:50'),
(41, 'App\\Models\\User', 1, 'Personal Access Token', 'f5536ddae5ee5aaa2e6b8cff4bc28ce98c2364fe3374d313fdabd7ce4ef5e707', '[\"*\"]', '2022-11-26 16:06:17', '2022-11-26 16:03:01', '2022-11-26 16:06:17'),
(42, 'App\\Models\\User', 2, 'Personal Access Token', '80e9e2979cec3ad50e4006f48e39e2203bb528fdaaf8788139f27b27d5bdfa3b', '[\"*\"]', '2022-12-01 17:54:34', '2022-12-01 17:50:22', '2022-12-01 17:54:34'),
(43, 'App\\Models\\User', 2, 'Personal Access Token', '96a1cc5fc799c1776b8c02745746a7f8414db8d50ced1ab7ee8e77cbd7f9c740', '[\"*\"]', '2022-12-03 15:08:20', '2022-12-03 15:07:43', '2022-12-03 15:08:20'),
(44, 'App\\Models\\User', 1, 'Personal Access Token', 'f9650e8ed92f6774e1b328119139631d8cc7d9f5966ea939500e36984dfb0524', '[\"*\"]', '2022-12-03 17:26:19', '2022-12-03 17:25:48', '2022-12-03 17:26:19'),
(45, 'App\\Models\\User', 1, 'Personal Access Token', '50cd11e68b4b438be933e5a29485346610c29308ecbe364eb66da95ea2408c09', '[\"*\"]', '2022-12-03 17:27:16', '2022-12-03 17:27:04', '2022-12-03 17:27:16'),
(46, 'App\\Models\\User', 1, 'Personal Access Token', '1ad80b053b7caaea9ba380522bcfef959464cf7a4e64532ff1ace2e35c7315e5', '[\"*\"]', '2022-12-03 17:38:12', '2022-12-03 17:36:54', '2022-12-03 17:38:12'),
(47, 'App\\Models\\User', 3, 'Personal Access Token', 'b4407a40a63db005dfca0771fb29702bb822500f6176c7cd65e3372b043043cf', '[\"*\"]', '2022-12-03 17:49:42', '2022-12-03 17:49:30', '2022-12-03 17:49:42'),
(48, 'App\\Models\\User', 1, 'Personal Access Token', 'c2b9d4ae55a989ba9678bdc8ef41bbfb8546350ca0cd6c0ae72a8ea22e7bac2f', '[\"*\"]', '2022-12-03 18:29:58', '2022-12-03 18:29:39', '2022-12-03 18:29:58'),
(49, 'App\\Models\\User', 3, 'Personal Access Token', 'c750bd6f23aca2a3e484c9682685d5782db662a222f474fba3bd2f5374c3baca', '[\"*\"]', '2022-12-03 18:49:26', '2022-12-03 18:49:06', '2022-12-03 18:49:26'),
(50, 'App\\Models\\User', 1, 'Personal Access Token', 'f3d9492fb08aa9900398fed3917e14a4d0f5086fac2eeb1cec48921ff8e26fb7', '[\"*\"]', '2022-12-03 19:15:49', '2022-12-03 19:15:19', '2022-12-03 19:15:49'),
(51, 'App\\Models\\User', 1, 'Personal Access Token', '1bc2f6c2ea253f1edf433fa4c0151ce6012092f96a91f151d62d46b70880b7a4', '[\"*\"]', '2022-12-03 19:40:51', '2022-12-03 19:39:01', '2022-12-03 19:40:51'),
(52, 'App\\Models\\User', 3, 'Personal Access Token', 'e4ed48d899f1b8a6ac9cb5bcadc2137a8304c967e67825a6d97ab11258b929a1', '[\"*\"]', '2022-12-03 19:42:34', '2022-12-03 19:42:07', '2022-12-03 19:42:34'),
(53, 'App\\Models\\User', 3, 'Personal Access Token', '111ce30e81e523ad72da6824d6aaa5fa3cff4fc8ac0133c57609a8db44a3752d', '[\"*\"]', '2022-12-03 20:00:32', '2022-12-03 20:00:13', '2022-12-03 20:00:32'),
(54, 'App\\Models\\User', 2, 'Personal Access Token', 'cb168ef094980a82da97dfce5a2c2abbcf5ac48f5d581f9de2806cf82b23044c', '[\"*\"]', '2022-12-03 20:23:12', '2022-12-03 20:22:36', '2022-12-03 20:23:12'),
(55, 'App\\Models\\User', 3, 'Personal Access Token', 'aa5f1140da1dcf811f2952a89ceb58f82d0d2e1f494556a45290166aa81db6f8', '[\"*\"]', '2022-12-03 20:24:31', '2022-12-03 20:24:06', '2022-12-03 20:24:31'),
(56, 'App\\Models\\User', 2, 'Personal Access Token', 'e9da95f6d029dbe5bdc5e68db7fed174aa5c60c5bb5b0cc6a4d8b7a9214f3f44', '[\"*\"]', '2022-12-03 20:38:57', '2022-12-03 20:38:55', '2022-12-03 20:38:57'),
(57, 'App\\Models\\User', 2, 'Personal Access Token', '1a77a3c44d8dd29750a075817b473825aa223e5a9cd847b779a1be3aecc43421', '[\"*\"]', '2022-12-03 20:39:16', '2022-12-03 20:38:56', '2022-12-03 20:39:16'),
(58, 'App\\Models\\User', 3, 'Personal Access Token', 'd2636c948699180b75828b0cb856c03caba1f41f9623c2f7814f7f0bcc6cbc80', '[\"*\"]', '2022-12-03 20:39:53', '2022-12-03 20:39:37', '2022-12-03 20:39:53'),
(59, 'App\\Models\\User', 3, 'Personal Access Token', 'aeff2350a51a8cf2cf5b26a595ccff456abe667b5d95d4a054a8f983997a0ed7', '[\"*\"]', '2022-12-03 20:40:57', '2022-12-03 20:40:40', '2022-12-03 20:40:57'),
(60, 'App\\Models\\User', 2, 'Personal Access Token', '83972dc6e918a3b6eb58858dfc2b83ce16d587c7887d91ba0529c84e8feff116', '[\"*\"]', '2022-12-04 12:52:13', '2022-12-04 12:51:50', '2022-12-04 12:52:13'),
(61, 'App\\Models\\User', 2, 'Personal Access Token', '4c8a4c6f7b25e4a6cd29f27a203b26279f0c3be4be3d61c61a6fe9d3882fa452', '[\"*\"]', '2022-12-04 14:05:59', '2022-12-04 14:04:17', '2022-12-04 14:05:59'),
(62, 'App\\Models\\User', 3, 'Personal Access Token', '91d37ada4ff3599f84cc9ae4733a8557d2e9aca9e9979b8df6037308b73a2b32', '[\"*\"]', '2022-12-04 14:06:15', '2022-12-04 14:05:13', '2022-12-04 14:06:15'),
(63, 'App\\Models\\User', 2, 'Personal Access Token', '0972f796620f176ed064721d529212e4d362f9f7c68d4dfa74ed7649f2a3faa4', '[\"*\"]', '2022-12-08 10:35:23', '2022-12-08 10:34:26', '2022-12-08 10:35:23'),
(64, 'App\\Models\\User', 2, 'Personal Access Token', 'a7f869b004fac68315145e5b8ec4b7e3f201cd71829c91281c35f43eec40995e', '[\"*\"]', '2022-12-08 14:29:12', '2022-12-08 14:20:46', '2022-12-08 14:29:12'),
(65, 'App\\Models\\User', 2, 'Personal Access Token', '148ae032ab7e61152d2a21d10d4eb4c60408cec239cd448942f84ceafb209a35', '[\"*\"]', '2022-12-08 15:01:32', '2022-12-08 15:01:14', '2022-12-08 15:01:32'),
(66, 'App\\Models\\User', 2, 'Personal Access Token', 'fc7a090b256e62f2a7167a86467618887d98c103735db5b30440ff1ee0ef85c9', '[\"*\"]', '2022-12-08 15:21:10', '2022-12-08 15:21:10', '2022-12-08 15:21:10'),
(67, 'App\\Models\\User', 2, 'Personal Access Token', '4520136df11dec78ac847ce62077f2ed62302a32cefa6b6f426cb48259fff996', '[\"*\"]', '2022-12-08 16:39:53', '2022-12-08 16:38:21', '2022-12-08 16:39:53'),
(68, 'App\\Models\\User', 2, 'Personal Access Token', '6aeb2f4c3558b8d97e2dd3cca7d5587b2e780d6cb2fe7c19524b02d706b254f7', '[\"*\"]', '2022-12-08 17:25:25', '2022-12-08 17:08:40', '2022-12-08 17:25:25'),
(69, 'App\\Models\\User', 2, 'Personal Access Token', 'ac3036c220d0bfd6f388ee6eeb0325cc2b55496118c526e14142fbeb3378832e', '[\"*\"]', '2022-12-08 18:14:50', '2022-12-08 18:14:25', '2022-12-08 18:14:50'),
(70, 'App\\Models\\User', 2, 'Personal Access Token', 'e12b5f7669ab43ae25fce23adcd2fe236fe436e878a968d088131cfa0e1a5cc0', '[\"*\"]', '2022-12-08 18:34:36', '2022-12-08 18:27:15', '2022-12-08 18:34:36'),
(71, 'App\\Models\\User', 2, 'Personal Access Token', '646559b5d7b95f197513475ddc6cfbceca966d2fbb40e068776395e78ceb2be2', '[\"*\"]', '2022-12-08 18:35:07', '2022-12-08 18:35:05', '2022-12-08 18:35:07'),
(72, 'App\\Models\\User', 2, 'Personal Access Token', '4c6c534b486f8ed20f6b586a7ef8310a0491dc2be634a0daf148a128e686e3fe', '[\"*\"]', '2022-12-08 19:47:20', '2022-12-08 18:35:07', '2022-12-08 19:47:20'),
(73, 'App\\Models\\User', 1, 'Personal Access Token', 'e9dfb7246143471ff61215891b394898d1ea2ad2166c6be4d690999426d42283', '[\"*\"]', '2022-12-08 19:38:42', '2022-12-08 19:38:40', '2022-12-08 19:38:42'),
(74, 'App\\Models\\User', 2, 'Personal Access Token', '9efa27c7431fceb8313dfc82df168e3d0bf80b3dde0b665a107713410d3ab823', '[\"*\"]', '2022-12-09 05:50:43', '2022-12-09 05:48:27', '2022-12-09 05:50:43'),
(75, 'App\\Models\\User', 2, 'Personal Access Token', '9a9edf9226971895d7ad679fe8cf8893581351225760727cecb0669bd87b5f64', '[\"*\"]', '2022-12-09 05:51:22', '2022-12-09 05:51:03', '2022-12-09 05:51:22'),
(76, 'App\\Models\\User', 6, 'Personal Access Token', 'df0f9bf59d182be5c7606cc0575e9ff428cb83492b3298ff79c51cf4fd6f32af', '[\"*\"]', '2022-12-09 06:08:39', '2022-12-09 06:04:48', '2022-12-09 06:08:39'),
(77, 'App\\Models\\User', 3, 'Personal Access Token', 'a64389254923acac106672eb4eeeb4f1c3421786139e6c8a4a51490e95022b7a', '[\"*\"]', '2022-12-09 19:27:24', '2022-12-09 19:26:54', '2022-12-09 19:27:24'),
(78, 'App\\Models\\User', 2, 'Personal Access Token', '9d9feb4d182e0698fa65702d606f5464b0799d63aa1b4eec6f3593b1635fa926', '[\"*\"]', '2022-12-09 19:28:47', '2022-12-09 19:28:45', '2022-12-09 19:28:47'),
(79, 'App\\Models\\User', 3, 'Personal Access Token', 'eb34083f5b242d1021deb6717e3d35c7cb93c18c162877cd35c904dbdf5deda5', '[\"*\"]', '2022-12-09 19:36:48', '2022-12-09 19:36:28', '2022-12-09 19:36:48'),
(80, 'App\\Models\\User', 3, 'Personal Access Token', '9773691c19c9df8a815f9b40222e20daa8022cc7bd92f8fd350200353daa01e4', '[\"*\"]', '2022-12-09 19:52:56', '2022-12-09 19:52:38', '2022-12-09 19:52:56'),
(81, 'App\\Models\\User', 3, 'Personal Access Token', '63fd5e9d4b0723dccf9d53871337aa4301439b297a4d6603a4b7d5d95b25a8cd', '[\"*\"]', '2022-12-09 19:54:19', '2022-12-09 19:53:45', '2022-12-09 19:54:19'),
(82, 'App\\Models\\User', 2, 'Personal Access Token', 'f3cc33a70eeac0e5f69130010749dc04f720cae85593dd9302f74deb34c33059', '[\"*\"]', '2022-12-15 12:07:12', '2022-12-15 09:58:52', '2022-12-15 12:07:12'),
(83, 'App\\Models\\User', 2, 'Personal Access Token', 'e7e3ec031a0db59fb6d1a9a4d1e40155065a953613fb2aa65f019e2bb2518721', '[\"*\"]', '2022-12-15 10:06:14', '2022-12-15 10:03:26', '2022-12-15 10:06:14'),
(84, 'App\\Models\\User', 2, 'Personal Access Token', '85f21ab6c899df8fd8ea9f61867f55ba3c19c0fd9d86691328ac265a30ed0046', '[\"*\"]', '2022-12-15 10:06:51', '2022-12-15 10:06:32', '2022-12-15 10:06:51'),
(85, 'App\\Models\\User', 2, 'Personal Access Token', 'f5e3aad38489be31fde3cc5596a056becdd59bcf4c3ee469be7f43f7311ae17d', '[\"*\"]', '2022-12-15 12:28:23', '2022-12-15 10:17:45', '2022-12-15 12:28:23'),
(86, 'App\\Models\\User', 2, 'Personal Access Token', '1a5d2b45bb9a89bc8519f96a05eb737cc18009c7290ae3fba322fe772ce08ff3', '[\"*\"]', '2022-12-15 12:11:29', '2022-12-15 12:07:34', '2022-12-15 12:11:29'),
(87, 'App\\Models\\User', 2, 'Personal Access Token', 'c2293539e547e52b73f0ee862d92b11e98f12e9e1af1c173ddb7905bbe68943e', '[\"*\"]', '2022-12-15 12:14:58', '2022-12-15 12:11:58', '2022-12-15 12:14:58'),
(88, 'App\\Models\\User', 2, 'Personal Access Token', 'ad51068b1d9d2ad6701334a4835d682da071b7a401cbf0a0e6345cdd8e86a55c', '[\"*\"]', '2022-12-15 12:30:07', '2022-12-15 12:24:29', '2022-12-15 12:30:07'),
(89, 'App\\Models\\User', 2, 'Personal Access Token', '31bfb89ad527b27c6679f56b86f1868f18f618510ef14a9a9a783b97cdc86fac', '[\"*\"]', '2022-12-15 12:30:27', '2022-12-15 12:29:40', '2022-12-15 12:30:27'),
(90, 'App\\Models\\User', 2, 'Personal Access Token', 'becc2375b94f7a1c0afda287a524c510c9fbcf1c919dabe7d67ad88668a18658', '[\"*\"]', '2022-12-15 12:58:36', '2022-12-15 12:38:36', '2022-12-15 12:58:36'),
(91, 'App\\Models\\User', 2, 'Personal Access Token', '34e79c92634bf0f5fbede8d978dcc913e147130554a3c5dc87dd490581b37579', '[\"*\"]', '2022-12-15 13:17:41', '2022-12-15 13:11:34', '2022-12-15 13:17:41'),
(92, 'App\\Models\\User', 2, 'Personal Access Token', '2cfd7c8e6f4ead116f452d1b14ad33d7cde02e421091bc30761ce475627bc61f', '[\"*\"]', '2022-12-15 15:08:50', '2022-12-15 13:15:38', '2022-12-15 15:08:50'),
(93, 'App\\Models\\User', 2, 'Personal Access Token', '2b07cc02490df185784ab3bf0ce157a9bfc7ba318bc23a0a0d68cd500af021ab', '[\"*\"]', '2022-12-15 13:21:41', '2022-12-15 13:18:45', '2022-12-15 13:21:41'),
(94, 'App\\Models\\User', 2, 'Personal Access Token', 'ced18e5a1077774692b9466caf16e4a1b6c908bf8c83e7d0a219b3bab39ef980', '[\"*\"]', '2022-12-15 15:19:06', '2022-12-15 15:16:11', '2022-12-15 15:19:06'),
(95, 'App\\Models\\User', 3, 'Personal Access Token', 'c2b91a232c62d47a26c707ed2d4d90e914099d423bf67e847f712b487ae43acc', '[\"*\"]', '2022-12-15 15:30:37', '2022-12-15 15:28:10', '2022-12-15 15:30:37'),
(96, 'App\\Models\\User', 3, 'Personal Access Token', 'f9698989222d2fe7997748a828c6f2ddee42ea32dd31cce0402af2da77c28561', '[\"*\"]', '2022-12-15 16:54:20', '2022-12-15 15:34:42', '2022-12-15 16:54:20'),
(97, 'App\\Models\\User', 3, 'Personal Access Token', 'a03c9043028f6cce5d953643eb6919d88e9ddac215b1608154a4c96accc3e19d', '[\"*\"]', '2022-12-15 15:52:54', '2022-12-15 15:34:43', '2022-12-15 15:52:54'),
(98, 'App\\Models\\User', 2, 'Personal Access Token', 'a70fdb6cf24b0a2630312f1f42fc82984945fed0456aefc9e630a8889f1c0b04', '[\"*\"]', '2022-12-15 16:55:43', '2022-12-15 16:55:27', '2022-12-15 16:55:43'),
(99, 'App\\Models\\User', 3, 'Personal Access Token', 'c77fc1d6916880529eb35b42b445db1fe86390835c8071174294e2bc08ea6267', '[\"*\"]', '2022-12-15 17:19:02', '2022-12-15 16:55:57', '2022-12-15 17:19:02'),
(100, 'App\\Models\\User', 3, 'Personal Access Token', 'de01b7dc5b5021cf8b58271c67ccbd6d55b2c52a2f520ecca9e0d739a1989fe4', '[\"*\"]', '2022-12-15 17:57:29', '2022-12-15 17:55:37', '2022-12-15 17:57:29'),
(101, 'App\\Models\\User', 3, 'Personal Access Token', '495e38521fef9fa9f71de6f6cbd8ffdffecf97edb460396217e27fcf5aedbba4', '[\"*\"]', '2022-12-15 17:58:53', '2022-12-15 17:57:22', '2022-12-15 17:58:53'),
(102, 'App\\Models\\User', 2, 'Personal Access Token', '05c08ba5e79ca3045f63f7af02275b105145255aabb7606b8da7e9c56d0df086', '[\"*\"]', '2022-12-15 17:58:19', '2022-12-15 17:58:17', '2022-12-15 17:58:19'),
(103, 'App\\Models\\User', 3, 'Personal Access Token', '36336590810412c348aeb7edf04e090233188ce2bb83d408ffa1e5e089a220e9', '[\"*\"]', '2022-12-15 17:59:15', '2022-12-15 17:59:00', '2022-12-15 17:59:15'),
(104, 'App\\Models\\User', 2, 'Personal Access Token', '6d16f8fef134758d7c609bf4bc5fabdc252f91d600be8d2da67593cc38941376', '[\"*\"]', '2022-12-15 18:07:32', '2022-12-15 18:07:30', '2022-12-15 18:07:32'),
(105, 'App\\Models\\User', 2, 'Personal Access Token', 'e7561ecd754e0482b0804a6d2d3ae0f9cc8cf33657db9714939a5b821dafcd0a', '[\"*\"]', '2022-12-15 18:08:00', '2022-12-15 18:07:32', '2022-12-15 18:08:00'),
(106, 'App\\Models\\User', 3, 'Personal Access Token', 'dbaae50aa3b32b657de6f4e28cad91a4ad7361927f5befabb53285a34a55e1e6', '[\"*\"]', '2022-12-15 18:16:14', '2022-12-15 18:08:09', '2022-12-15 18:16:14'),
(107, 'App\\Models\\User', 3, 'Personal Access Token', 'e56c9bf3f768ed8fcd62ac4ff915ab8db485fd87e2edbadd4568b31bc467dcab', '[\"*\"]', '2022-12-15 18:51:18', '2022-12-15 18:32:41', '2022-12-15 18:51:18'),
(108, 'App\\Models\\User', 3, 'Personal Access Token', '085f6cfbadbfa7d418de80d98424142feef5e51276d21f0bd78232f9fc57be19', '[\"*\"]', '2022-12-15 18:54:55', '2022-12-15 18:51:26', '2022-12-15 18:54:55'),
(109, 'App\\Models\\User', 1, 'Personal Access Token', '84ea95e078e8936188a78438792cab414fc8bb0104071804923b902da4a031a3', '[\"*\"]', '2022-12-15 18:52:11', '2022-12-15 18:52:09', '2022-12-15 18:52:11'),
(110, 'App\\Models\\User', 3, 'Personal Access Token', '615fe3dd0b94b887e3df35e40fe7da54292b5d651b8f43f34d125a8e28eafb48', '[\"*\"]', '2022-12-15 18:59:28', '2022-12-15 18:52:35', '2022-12-15 18:59:28'),
(111, 'App\\Models\\User', 3, 'Personal Access Token', '18340ce7207d3d316835a694fe3d7f0472e3c00f87e119b1ecdef46b02e085f4', '[\"*\"]', '2022-12-15 19:00:49', '2022-12-15 18:59:37', '2022-12-15 19:00:49'),
(112, 'App\\Models\\User', 1, 'Personal Access Token', 'd0eb992261878200dd1d2252ea825f65dc951aa8ac2264e91313dff4ef5e036e', '[\"*\"]', '2022-12-15 19:03:16', '2022-12-15 19:02:59', '2022-12-15 19:03:16'),
(113, 'App\\Models\\User', 1, 'Personal Access Token', 'a1e63925673a923ace99404b71c0459687aa71ce4c3c7f752981fc92c92f3977', '[\"*\"]', '2022-12-15 19:05:19', '2022-12-15 19:05:07', '2022-12-15 19:05:19'),
(114, 'App\\Models\\User', 2, 'Personal Access Token', 'af4bc67efa0b6d1d5f9d2cffa79803003652c2352322e340f54a3ce9b17869b3', '[\"*\"]', '2022-12-15 19:27:01', '2022-12-15 19:21:26', '2022-12-15 19:27:01'),
(115, 'App\\Models\\User', 2, 'Personal Access Token', 'e45350cf7506c6565a62d53919fcb8961693c5dfcb0c81d9388599e9b641e267', '[\"*\"]', '2022-12-16 02:50:41', '2022-12-16 02:49:47', '2022-12-16 02:50:41'),
(116, 'App\\Models\\User', 2, 'Personal Access Token', '9355b16a7c603d99c1a8e0a5186dd6d5135850373f8938de7c2be6f0879a5c40', '[\"*\"]', NULL, '2022-12-16 05:06:23', '2022-12-16 05:06:23'),
(117, 'App\\Models\\User', 2, 'Personal Access Token', '18047b1aa7718b6c386030c778753c001ceb6add58312a16daa07846989e365a', '[\"*\"]', '2022-12-16 05:06:55', '2022-12-16 05:06:36', '2022-12-16 05:06:55'),
(118, 'App\\Models\\User', 2, 'Personal Access Token', 'bbaa9b115a9a3bb5fe475691979b8bbe36e0596112a17fcc6782d56327ab91ec', '[\"*\"]', '2022-12-16 22:34:37', '2022-12-16 05:07:39', '2022-12-16 22:34:37'),
(119, 'App\\Models\\User', 3, 'Personal Access Token', '86b829b1ad567395fce389ad6ac705fc9f771f7b713ace2e73729c26966990f4', '[\"*\"]', '2022-12-16 14:05:19', '2022-12-16 14:04:02', '2022-12-16 14:05:19'),
(120, 'App\\Models\\User', 3, 'Personal Access Token', '7b84c70f02a806078306428cd2b6890faeb7516d7400db59becbd6c62a1769cf', '[\"*\"]', '2022-12-16 14:07:48', '2022-12-16 14:05:28', '2022-12-16 14:07:48'),
(121, 'App\\Models\\User', 2, 'Personal Access Token', '11557cb57355229bdfa24c5c426cdfff856560ce4f4378065adb7e1e220ce317', '[\"*\"]', '2022-12-16 15:13:42', '2022-12-16 14:08:35', '2022-12-16 15:13:42'),
(122, 'App\\Models\\User', 2, 'Personal Access Token', '955646262c004b800d06fcbf3e37dbe7d644700975761e7434f730ee504871a5', '[\"*\"]', '2022-12-16 15:33:27', '2022-12-16 15:23:06', '2022-12-16 15:33:27'),
(123, 'App\\Models\\User', 3, 'Personal Access Token', 'f4b9b37e070a1ea74d96a06649ce625a73a8b5fe438bdabdd4a28d42cfa72131', '[\"*\"]', '2022-12-17 12:19:58', '2022-12-16 23:20:16', '2022-12-17 12:19:58'),
(124, 'App\\Models\\User', 3, 'Personal Access Token', '3dc5148cc66d86c30bec6e075ebe530576b37ccc9bdb92e0f16761f0862f3ebd', '[\"*\"]', '2022-12-17 07:01:27', '2022-12-17 07:00:17', '2022-12-17 07:01:27'),
(125, 'App\\Models\\User', 3, 'Personal Access Token', '676774839a7f5412251d4316d8776a3fc259f59b75378a73001b1eeed4d8a1a3', '[\"*\"]', '2022-12-17 07:01:51', '2022-12-17 07:01:36', '2022-12-17 07:01:51'),
(126, 'App\\Models\\User', 2, 'Personal Access Token', '93dfde36bf1b40dcb239aa27b3cd53e9d9c5af28edb96530edcf26353af27123', '[\"*\"]', '2022-12-17 07:39:55', '2022-12-17 07:02:30', '2022-12-17 07:39:55'),
(127, 'App\\Models\\User', 2, 'Personal Access Token', '4ff8e8d50447cf3ac5cc877bde4c86455c63e20ca955256a977b7b113187b61b', '[\"*\"]', '2022-12-17 07:40:36', '2022-12-17 07:40:34', '2022-12-17 07:40:36'),
(128, 'App\\Models\\User', 2, 'Personal Access Token', '4fb7d6536d2ce1b847f79c09633120e91da96aba2090ac880e964e7d965a41c1', '[\"*\"]', '2022-12-17 07:41:35', '2022-12-17 07:40:36', '2022-12-17 07:41:35'),
(129, 'App\\Models\\User', 3, 'Personal Access Token', 'fa170b3c31d742bb134c266def62ecb8d12d10d4b62ba83e909c3a9de80c3a5d', '[\"*\"]', '2022-12-17 12:26:39', '2022-12-17 12:20:27', '2022-12-17 12:26:39'),
(130, 'App\\Models\\User', 2, 'Personal Access Token', '09f37a9015d2807655a9ffe7cc2ddcfab9f1b24d148d285293d0da490c2e891f', '[\"*\"]', '2022-12-19 10:20:01', '2022-12-17 12:26:47', '2022-12-19 10:20:01'),
(131, 'App\\Models\\User', 3, 'Personal Access Token', '2dd23a4c00d090ebca1f991bb025ac1e13bdcd94743b1752378ce5d81d6b7691', '[\"*\"]', '2022-12-17 15:20:13', '2022-12-17 15:19:22', '2022-12-17 15:20:13'),
(132, 'App\\Models\\User', 2, 'Personal Access Token', 'ccaba21233cc691cf95eda5c684ac693f3e0386a756e6ed8034ec8b4db471b61', '[\"*\"]', '2022-12-17 16:37:30', '2022-12-17 15:20:33', '2022-12-17 16:37:30'),
(133, 'App\\Models\\User', 2, 'Personal Access Token', '9d97ab321a865613cb1bbe32bfc2367d1645df3ec692a58df77d763a8cc831ef', '[\"*\"]', '2022-12-17 18:10:24', '2022-12-17 16:37:59', '2022-12-17 18:10:24'),
(134, 'App\\Models\\User', 2, 'Personal Access Token', 'e3288c9939872a49c79cfb0405da7c9dd70c09db2a8b904c78fd48603ea01ef4', '[\"*\"]', '2022-12-18 11:32:39', '2022-12-18 11:32:37', '2022-12-18 11:32:39'),
(135, 'App\\Models\\User', 2, 'Personal Access Token', '461af27ea5411700edd761e737847472439653874cfd66cbd259599b23ae4360', '[\"*\"]', '2022-12-18 15:32:01', '2022-12-18 15:24:03', '2022-12-18 15:32:01'),
(136, 'App\\Models\\User', 2, 'Personal Access Token', 'aaa5c5b83e4fda77a10dca661478479e91bc9538b4605e121c8170926f5a79ae', '[\"*\"]', '2022-12-18 15:42:28', '2022-12-18 15:35:55', '2022-12-18 15:42:28'),
(137, 'App\\Models\\User', 2, 'Personal Access Token', 'f04f361cbbb7baec25e208b6e7d9a5f433732d361bf30361cb1d71b215ee0a4e', '[\"*\"]', '2022-12-18 16:10:34', '2022-12-18 15:39:00', '2022-12-18 16:10:34'),
(138, 'App\\Models\\User', 2, 'Personal Access Token', '42450e963db5c9bd8c2dccf4f63532ea2d4a58bcf265179956bdfee4707252c9', '[\"*\"]', '2022-12-18 16:07:29', '2022-12-18 15:58:48', '2022-12-18 16:07:29'),
(139, 'App\\Models\\User', 2, 'Personal Access Token', 'a3a9543b18c411f5e8a7069ba40bd02718cbdc0c09af3c143aba2fb71815d02e', '[\"*\"]', '2022-12-18 16:11:36', '2022-12-18 16:10:56', '2022-12-18 16:11:36'),
(140, 'App\\Models\\User', 2, 'Personal Access Token', '16a65dd39e31aa16758ce73aca3789df01cf7de55930db7b88332ee777c9b10e', '[\"*\"]', '2022-12-18 17:31:37', '2022-12-18 16:25:45', '2022-12-18 17:31:37'),
(141, 'App\\Models\\User', 2, 'Personal Access Token', 'b9364d88bb374377a0fdf99a2b9b17e8d0555c059da80d577396f779db63f2cf', '[\"*\"]', '2022-12-19 09:09:02', '2022-12-19 08:15:02', '2022-12-19 09:09:02'),
(142, 'App\\Models\\User', 2, 'Personal Access Token', '246cb69044fbecab2eeed2ff6c3928eb6b15ddb4fbd24f2c8c67a6867b356756', '[\"*\"]', '2022-12-19 09:09:26', '2022-12-19 09:09:10', '2022-12-19 09:09:26'),
(143, 'App\\Models\\User', 2, 'Personal Access Token', 'e268eb793948b50bf601a55464ce481d642c5e2a233482df482390e4429817ba', '[\"*\"]', '2022-12-19 09:29:04', '2022-12-19 09:24:57', '2022-12-19 09:29:04'),
(144, 'App\\Models\\User', 2, 'Personal Access Token', 'dd77d94c2ddbf3b60bc1850fa30adfc3f0145118e48b56fe6206eabcd30dc4fa', '[\"*\"]', '2022-12-19 09:44:07', '2022-12-19 09:44:05', '2022-12-19 09:44:07'),
(145, 'App\\Models\\User', 2, 'Personal Access Token', '854f462a9e0e2fbf2f0bc733f37a0ecab3e3b8440578c30fb211ebd5c2e990d8', '[\"*\"]', '2022-12-19 09:55:04', '2022-12-19 09:44:07', '2022-12-19 09:55:04'),
(146, 'App\\Models\\User', 2, 'Personal Access Token', '1053b6f9390034ca367cf253e122fa8678faf3631dd6efa8fc314a554e570fca', '[\"*\"]', '2022-12-19 10:05:49', '2022-12-19 09:59:13', '2022-12-19 10:05:49'),
(147, 'App\\Models\\User', 2, 'Personal Access Token', 'c6bb2790f6cb4d2727c87ab61dc6abb4e2162ba66167d57a8b2c3323d8ebe4a7', '[\"*\"]', '2022-12-19 10:29:31', '2022-12-19 10:08:35', '2022-12-19 10:29:31'),
(148, 'App\\Models\\User', 2, 'Personal Access Token', 'dc739aa74a2731871763b63b1acd7543167c817d2afa919dd1894af928152db0', '[\"*\"]', '2022-12-19 10:35:20', '2022-12-19 10:31:49', '2022-12-19 10:35:20');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'api', '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(2, 'client', 'api', '2022-11-06 16:58:30', '2022-11-06 16:58:30'),
(3, 'staff', 'api', '2022-11-06 16:58:30', '2022-11-06 16:58:30');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(8, 2),
(8, 3),
(9, 2),
(9, 3),
(10, 2),
(10, 3),
(11, 2),
(11, 3),
(12, 2),
(13, 2),
(13, 3),
(14, 2),
(15, 2),
(16, 3),
(17, 1),
(18, 2),
(19, 3),
(20, 2);

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
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `birth_date` date DEFAULT NULL,
  `placebirth` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `nin` varchar(255) DEFAULT NULL,
  `idnumber` varchar(255) DEFAULT NULL,
  `documenttype` varchar(255) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `full_name_1` varchar(255) DEFAULT NULL,
  `emergency_phone1` varchar(255) DEFAULT NULL,
  `emergency_relationship1` varchar(255) DEFAULT NULL,
  `full_name_2` varchar(255) DEFAULT NULL,
  `emergency_phone2` varchar(255) DEFAULT NULL,
  `emergency_relationship2` varchar(255) DEFAULT NULL,
  `contract` varchar(255) DEFAULT NULL,
  `timetype` varchar(255) DEFAULT NULL,
  `hiringdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `categorie` varchar(255) DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  `echelon` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `shift` varchar(255) DEFAULT NULL,
  `weeklyworkingtime` varchar(255) DEFAULT NULL,
  `monthly_salary` double DEFAULT NULL,
  `hourly_salary` double DEFAULT NULL,
  `overtime_salary` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `nightamount` varchar(255) DEFAULT NULL,
  `transportamount` varchar(255) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `bic` varchar(255) DEFAULT NULL,
  `iban` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `birth_date`, `placebirth`, `nationality`, `nin`, `idnumber`, `documenttype`, `expirydate`, `address_line_1`, `address_line_2`, `postcode`, `city`, `state`, `country`, `full_name_1`, `emergency_phone1`, `emergency_relationship1`, `full_name_2`, `emergency_phone2`, `emergency_relationship2`, `contract`, `timetype`, `hiringdate`, `enddate`, `categorie`, `statut`, `echelon`, `position`, `shift`, `weeklyworkingtime`, `monthly_salary`, `hourly_salary`, `overtime_salary`, `status`, `nightamount`, `transportamount`, `bankname`, `bic`, `iban`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 3, '2022-12-20', 'Abymes', 'Singapore', 'HHHHHHH', 'CCCCCCC', 'sejourcard', '2022-12-28', '12 rue de partout', 'Bat C', '75000', 'Courneuve', 'ile de france', 'China', 'mama', '+33 6 76 76 76 76', 'parent', 'wife', '+33 888 88 88 88', 'other', 'Mise à dispositon', 'Temps partiel', '2022-12-12', '2022-12-27', 'Cadre', 'CDD Saisonnier', '2', 'Manager', '', '12:00', 6566, 45, 87, '', 'AirBnB - 90€', 'Pass - 50€', 'BNP', 'FOFOXX', 'FR54FDL3L4L', '2022-11-06 17:26:06', '2022-12-19 10:35:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_product` varchar(255) NOT NULL,
  `stripe_price` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `assignee` varchar(100) DEFAULT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `due_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `user_id`, `title`, `assignee`, `tags`, `description`, `status`, `due_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 2, 'hhhh', '3', 'team', '<p>zertyui</p>', '', '2022-12-15', '2022-12-15 12:55:41', '2022-12-15 12:58:36', '2022-12-15 12:58:36'),
(3, 2, 'trtt', '3', 'low,high', '', 'Completed,Important', '2022-12-14', '2022-12-15 13:21:41', '2022-12-16 05:38:21', NULL),
(4, 2, 'test task', '6,3', 'team,medium,low', '<p>kjkj</p>', '', '2022-12-22', '2022-12-15 15:18:24', '2022-12-17 07:01:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_code` varchar(6) DEFAULT NULL,
  `two_factor_expires_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `avatar`, `firstname`, `lastname`, `email`, `gender`, `user_id`, `phone`, `email_verified_at`, `password`, `two_factor_code`, `two_factor_expires_at`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'Admin', NULL, NULL, NULL, 'admin@demo.com', '', 0, '', '2022-11-06 05:12:47', '$2y$10$TfuLWTIxO6qmIUlFtCABS.PB50s7f9lOxw.asHZp0zDpOuduwpbG6', '357924', NULL, NULL, '2022-11-06 17:12:03', '2022-12-15 19:05:07', NULL, NULL, NULL, NULL),
(2, 'Client', NULL, NULL, NULL, 'client@demo.com', '', 0, '', '2022-11-06 05:25:25', '$2y$10$ie6lHQ3DYLDg0wtAdd8kfuMDEBBGKPtLuTjh2mp5kppEmk3APxgdu', '410183', NULL, NULL, '2022-11-06 17:17:09', '2022-12-19 10:31:49', NULL, NULL, NULL, NULL),
(3, 'Albert Doe', 'storage/images/avatar/Tz9HGTQqFU.png', 'Albert', 'Doe', 'staff@demo.com', 'other', 2, '+33 2 22 22 20 00', '2022-11-06 05:26:17', '$2y$10$PFuQkaKSdirxyT5KK9a9seK7OeAhqyEvmRBu/ul0SP524Z08VBCVq', '279978', NULL, NULL, '2022-11-06 17:26:06', '2022-12-19 10:34:58', NULL, NULL, NULL, NULL),
(5, 'Albert Potter', NULL, 'Albert', 'Potter', 'staff2@demo.com', 'Other', 2, '+33 1 23 33 33', NULL, '$2y$10$SrLJyJSi17mS7Svt1X2eUu0dLSv/ONzHoRSPMZZ1Y8AZ5.GG4Kd2O', NULL, NULL, NULL, '2022-11-24 19:29:22', '2022-12-17 12:28:37', NULL, NULL, NULL, NULL),
(6, 'test staff3', NULL, 'test', 'staff3', 'staff3@demo.com', 'Other', 2, '+33 3 88 88 88 88', '2022-11-25 08:37:58', '$2y$10$ie6lHQ3DYLDg0wtAdd8kfuMDEBBGKPtLuTjh2mp5kppEmk3APxgdu', '732979', NULL, NULL, '2022-11-25 20:36:45', '2022-12-09 06:04:48', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`user_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`user_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`user_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`user_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_user_id_foreign` (`user_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `todos_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `todos`
--
ALTER TABLE `todos`
  ADD CONSTRAINT `todos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
