-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-10-2016 a las 00:28:56
-- Versión del servidor: 5.6.28
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyect-laravel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actions`
--

CREATE TABLE `actions` (
  `id` int(11) NOT NULL,
  `import_id` int(11) NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `plan_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerts`
--

CREATE TABLE `alerts` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `behaviours`
--

CREATE TABLE `behaviours` (
  `id` int(10) UNSIGNED NOT NULL,
  `import_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `competition_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `behaviour_ratings`
--

CREATE TABLE `behaviour_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `rating` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `behaviour_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluator_id` int(11) NOT NULL,
  `stage` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `entry` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `name`, `logo`, `description`, `created_at`, `updated_at`) VALUES
(4, 'People Experts', '', '<p>Descripcion<br></p>', '2016-09-29 02:29:24', '2016-09-29 02:29:24'),
(6, 'Cliente Test', NULL, '', '2016-09-30 22:08:02', '2016-09-30 22:08:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competitions`
--

CREATE TABLE `competitions` (
  `id` int(10) UNSIGNED NOT NULL,
  `import_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `post_id` int(10) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competition_comments`
--

CREATE TABLE `competition_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluator_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `competition_id` int(11) NOT NULL,
  `stage` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `entry` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluations`
--

CREATE TABLE `evaluations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8_unicode_ci NOT NULL,
  `client_id` int(11) UNSIGNED NOT NULL,
  `objectives_rating_id` int(11) NOT NULL,
  `competitions_rating_id` int(11) NOT NULL,
  `valorations_rating_id` int(11) NOT NULL,
  `start_year_start` datetime NOT NULL,
  `start_year_end` datetime NOT NULL,
  `half_year_start` datetime NOT NULL,
  `half_year_end` datetime NOT NULL,
  `end_year_start` datetime NOT NULL,
  `end_year_end` datetime NOT NULL,
  `vis_half_year_start` datetime NOT NULL,
  `vis_half_year_end` datetime NOT NULL,
  `vis_end_year_start` datetime NOT NULL,
  `vis_end_year_end` datetime NOT NULL,
  `visualization` tinyint(4) NOT NULL,
  `welcome_message_id` int(11) NOT NULL,
  `resgister_message_id` int(11) NOT NULL,
  `recovery_message_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluations`
--

INSERT INTO `evaluations` (`id`, `name`, `instructions`, `client_id`, `objectives_rating_id`, `competitions_rating_id`, `valorations_rating_id`, `start_year_start`, `start_year_end`, `half_year_start`, `half_year_end`, `end_year_start`, `end_year_end`, `vis_half_year_start`, `vis_half_year_end`, `vis_end_year_start`, `vis_end_year_end`, `visualization`, `welcome_message_id`, `resgister_message_id`, `recovery_message_id`, `created_at`, `updated_at`) VALUES
(5, 'Evaluacion People Experts', '<p>desc<br></p>', 4, 2, 2, 2, '2016-09-28 00:00:00', '2016-09-28 00:00:00', '2016-09-28 00:00:00', '2016-09-28 00:00:00', '2016-09-28 00:00:00', '2016-09-28 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, 0, '2016-09-29 03:35:14', '2016-09-29 03:35:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluation_user_evaluators`
--

CREATE TABLE `evaluation_user_evaluators` (
  `id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `evaluator_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `post_id` int(11) NOT NULL,
  `category` varchar(256) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `languages`
--

INSERT INTO `languages` (`id`, `name`, `prefix`, `created_at`, `updated_at`) VALUES
(1, 'Español', 'es', NULL, NULL),
(2, 'English', 'en', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `subject` text CHARACTER SET latin1 NOT NULL,
  `from` varchar(256) CHARACTER SET latin1 NOT NULL,
  `message` text CHARACTER SET latin1 NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `messages`
--

INSERT INTO `messages` (`id`, `subject`, `from`, `message`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '{"1":"Registro de Usuario (default)","2":"User registration (default)"}', '{"1":"client_name","2":"client_name"}', '{"1":"<p>Estimado user_name,&nbsp; user_last_name.<\\/p><p>client_name le da la bienvenida al registro de nuestra plataforma.<\\/p><p>Su clave de acceso a la misma es: user_password con nombre de usuario: user_email.<\\/p><p>Puede ingresar mediante el siguiente enlace: web_link<\\/p><p>Gracias<\\/p><p>El equipo de client_name<br><\\/p>","2":""}', 0, '2016-09-30 19:17:44', '2016-09-30 19:49:12'),
(2, '{"1":"Bienvenida a evaluaci\\u00f3n (default)","2":"Evaluation welcome (default)"}', '{"1":"client_name","2":"client_name"}', '{"1":"<p><\\/p><p>Estimado user_name,  user_last_name.<\\/p><p>client_name le da la bienvenida a la evaluacion evaluation_name.<\\/p><p>Puede ingresar mediante el siguiente enlace: web_link<\\/p><p>Gracias<\\/p><p>El equipo de client_name<\\/p><br><p><\\/p>","2":""}', 0, '2016-09-30 19:45:16', '2016-09-30 19:47:31'),
(3, '{"1":"Recuperacion de clave (default)","2":"Password recovery (default)"}', '{"1":"client_name","2":"client_name"}', '{"1":"<p><\\/p><p>Estimado user_name,  user_last_name.<\\/p><p>Su contrase\\u00f1a se ha restablecido correctamente. Su nueva contrase\\u00f1a es: user_password<br><\\/p><p>Puede ingresar mediante el siguiente enlace: web_link<\\/p><p>Gracias<\\/p><p>El equipo de client_name<\\/p><br><p><\\/p>","2":""}', 0, '2016-09-30 19:48:46', '2016-09-30 19:48:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_04_29_234927_create_companies_table', 2),
('2016_04_30_144744_create_companies_table', 3),
('2016_04_30_165352_create_evaluations_table', 4),
('2016_05_01_000749_create_roles_table', 5),
('2016_05_01_001621_create_locations_table', 6),
('2016_05_01_132450_create_languages_table', 7),
('2016_05_01_134450_create_knowledges_table', 8),
('2016_05_01_143740_create_valorations_table', 9),
('2016_05_01_144847_create_values_table', 10),
('2016_05_01_150421_create_competitions_table', 11),
('2016_05_01_150509_create_behaviours_table', 12),
('2016_05_02_230711_create_objectives_table', 13),
('2016_05_02_231727_create_types_table', 13),
('2016_05_04_225107_create_languages_table', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objectives`
--

CREATE TABLE `objectives` (
  `id` int(10) UNSIGNED NOT NULL,
  `import_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `evaluator_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objective_reviews`
--

CREATE TABLE `objective_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `rating` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `objective_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `stage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('matiassampietro@gmail.com', '4ab10e4ad48540f2fba08ab4a0e5427b12595d735a69bbaf0aeb33252f7f3d15', '2016-07-30 02:40:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `import_id` int(11) NOT NULL,
  `name` text CHARACTER SET latin1 NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_areas`
--

CREATE TABLE `plan_areas` (
  `id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluator_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_comments`
--

CREATE TABLE `plan_comments` (
  `id` int(11) NOT NULL,
  `comment` text CHARACTER SET utf8 NOT NULL,
  `type` int(11) NOT NULL,
  `stage` varchar(256) CHARACTER SET utf8 NOT NULL,
  `entry` varchar(256) CHARACTER SET utf8 NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluator_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_improvement`
--

CREATE TABLE `plan_improvement` (
  `id` int(11) NOT NULL,
  `objectives` text CHARACTER SET utf8 NOT NULL,
  `meta` text CHARACTER SET utf8 NOT NULL,
  `dev_action` text CHARACTER SET utf8 NOT NULL,
  `resources` text CHARACTER SET utf8 NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `import_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `evaluation_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `import_id`, `name`, `evaluation_id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 0, '{"1":"Director","2":"Director"}', 5, 4, '2016-10-01 16:12:25', '2016-10-01 16:12:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ratings`
--

INSERT INTO `ratings` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'rating porcentual', '2016-09-29 03:34:32', '2016-09-29 03:34:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', NULL, NULL),
(2, 'admin', NULL, NULL),
(3, 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trackings`
--

CREATE TABLE `trackings` (
  `id` int(11) NOT NULL,
  `browser` varchar(256) CHARACTER SET latin1 NOT NULL,
  `ip` varchar(256) CHARACTER SET latin1 NOT NULL,
  `stage` varchar(256) CHARACTER SET latin1 NOT NULL,
  `action` text CHARACTER SET latin1 NOT NULL,
  `country` varchar(256) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(11) NOT NULL,
  `words` text CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `words`, `created_at`, `updated_at`) VALUES
(21, '{"1":"Sistema","2":"System","3":"Sistema"}', '2016-05-24 02:22:54', '2016-05-24 02:22:54'),
(22, '{"1":"NAVEGACI\\u00d3N PRINCIPAL","2":"MAIN NAVIGATION","3":"vaisdviuasidncljasnd"}', '2016-05-24 02:36:47', '2016-06-06 19:35:52'),
(23, '{"1":"Bienvenido","2":"Welcome","3":"Benvenue"}', '2016-05-24 02:37:35', '2016-07-29 20:46:17'),
(24, '{"1":"Usuarios","2":"Users"}', '2016-05-24 02:37:54', '2016-05-24 02:37:54'),
(25, '{"1":"Compa\\u00f1ias","2":"Companies"}', '2016-05-24 02:38:18', '2016-05-24 02:38:18'),
(26, '{"1":"Idiomas","2":"Languages"}', '2016-05-24 02:38:37', '2016-05-24 02:38:37'),
(27, '{"1":"Valoraciones","2":"Valorations"}', '2016-05-24 02:38:52', '2016-05-24 02:38:52'),
(28, '{"1":"Clientes","2":"Clients","3":""}', '2016-06-07 18:08:11', '2016-06-07 18:08:11'),
(29, '{"1":"Primera Etapa","2":"First Stage"}', '2016-07-27 15:52:28', '2016-07-27 15:52:28'),
(30, '{"1":"Segunda Etapa","2":"Second Stage"}', '2016-07-27 15:53:54', '2016-07-27 15:53:54'),
(32, '{"1":"Evaluaciones","2":"Evaluations","3":""}', '2016-08-01 14:48:21', '2016-08-01 14:48:21'),
(33, '{"1":"Uno o varios archivos que desea importar ya existen en la base de datos. Por favor cambie el\\/los nombre\\/s e intente nuevamente ","2":"Uno o varios archivos que desea importar ya existen en la base de datos. Por favor cambie el\\/los nombre\\/s e intente nuevamente ","3":"Uno o varios archivos que desea importar ya existen en la base de datos. Por favor cambie el\\/los nombre\\/s e intente nuevamente "}', '2016-08-26 20:47:46', '2016-08-26 20:47:46'),
(34, '{"1":"Editar Traducci\\u00f3n","2":"Edit Translate","3":"Editar Traducci\\u00f3n"}', '2016-08-26 20:48:54', '2016-08-26 20:48:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dni` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `password`, `dni`, `remember_token`, `client_id`, `code`, `role_id`, `language_id`, `image`, `country`, `city`, `area`, `department`, `created_at`, `updated_at`) VALUES
(2, 'Patricio', 'Godoy Lastra', 'pgodoy@centromultimedia.com.ar', '$2y$10$BN3V4y23SA5wq1mr.cm/LOtS4MYKvaNYvCew0FN9ZcogeaC1WhenG', '25141390', 'xi0kmP9Z9vDIkYT7vloZsKoGOZSBI1VQH8W0bFNRYoz2iQ2GFveXFrAVVjaf', 3, '245159', 3, 1, '', 'Argentina', 'Capital Federal', '223', 'dep', '2016-05-22 04:23:31', '2016-09-27 17:32:35'),
(31, 'Superadmin', 'Superadmin', 'superadmin@superadmin.com', '$2a$04$KESIUGZkNuMzn37XuoYdPu4w.rrCHTO.f8zFf65k59SwqZK6owcbi', '29141390', '9MwJRmAZySfUyXZcApsfYbpgyA5peOg5T7oLm4f5m8WerpFc92P60QFvrMER', 0, '245158', 1, 1, '', 'AR', 'Tandil', '223', 'dep', '2016-05-22 04:23:31', '2016-10-01 16:16:53'),
(36, 'Admin', 'Cliente', 'admin@admin.com', '$2a$04$KESIUGZkNuMzn37XuoYdPu4w.rrCHTO.f8zFf65k59SwqZK6owcbi', '29141390', 'An6pWAAvarErj4pJ0lHUCJ0rPLpJvv6tF64Y4lynjbfMACsabjObJ8Fa5NMv', 4, '255159', 2, 1, '', 'AR', 'Tandil', '223', 'dep', '2016-05-22 04:23:31', '2016-09-29 03:33:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valorations`
--

CREATE TABLE `valorations` (
  `id` int(10) UNSIGNED NOT NULL,
  `import_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoration_comments`
--

CREATE TABLE `valoration_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluator_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `valoration_id` int(11) NOT NULL,
  `stage` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `entry` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoration_ratings`
--

CREATE TABLE `valoration_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `rating` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `valoration_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluator_id` int(11) NOT NULL,
  `stage` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `entry` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `values`
--

CREATE TABLE `values` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `rating_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `values`
--

INSERT INTO `values` (`id`, `value`, `rating_id`, `created_at`, `updated_at`) VALUES
(89, '{"1":"0","2":""}', 2, '2016-09-29 03:34:32', '2016-09-29 03:34:32'),
(90, '{"1":"25","2":""}', 2, '2016-09-29 03:34:32', '2016-09-29 03:34:32'),
(91, '{"1":"50","2":""}', 2, '2016-09-29 03:34:32', '2016-09-29 03:34:32'),
(92, '{"1":"75","2":""}', 2, '2016-09-29 03:34:32', '2016-09-29 03:34:32'),
(93, '{"1":"100","2":""}', 2, '2016-09-29 03:34:32', '2016-09-29 03:34:32');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `behaviours`
--
ALTER TABLE `behaviours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `behaviours_competition_id_foreign` (`competition_id`);

--
-- Indices de la tabla `behaviour_ratings`
--
ALTER TABLE `behaviour_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competitions_post_foreign_key` (`post_id`);

--
-- Indices de la tabla `competition_comments`
--
ALTER TABLE `competition_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competitions_post_foreign_key` (`user_id`);

--
-- Indices de la tabla `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluation_user_evaluators`
--
ALTER TABLE `evaluation_user_evaluators`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `objectives`
--
ALTER TABLE `objectives`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `objective_reviews`
--
ALTER TABLE `objective_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plan_areas`
--
ALTER TABLE `plan_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plan_comments`
--
ALTER TABLE `plan_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plan_improvement`
--
ALTER TABLE `plan_improvement`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trackings`
--
ALTER TABLE `trackings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `valorations`
--
ALTER TABLE `valorations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `valoration_comments`
--
ALTER TABLE `valoration_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competitions_post_foreign_key` (`user_id`);

--
-- Indices de la tabla `valoration_ratings`
--
ALTER TABLE `valoration_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `values`
--
ALTER TABLE `values`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `behaviours`
--
ALTER TABLE `behaviours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `behaviour_ratings`
--
ALTER TABLE `behaviour_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `competition_comments`
--
ALTER TABLE `competition_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `evaluation_user_evaluators`
--
ALTER TABLE `evaluation_user_evaluators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `objectives`
--
ALTER TABLE `objectives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `objective_reviews`
--
ALTER TABLE `objective_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `plan_areas`
--
ALTER TABLE `plan_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `plan_comments`
--
ALTER TABLE `plan_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `plan_improvement`
--
ALTER TABLE `plan_improvement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `trackings`
--
ALTER TABLE `trackings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `valorations`
--
ALTER TABLE `valorations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `valoration_comments`
--
ALTER TABLE `valoration_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `valoration_ratings`
--
ALTER TABLE `valoration_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `values`
--
ALTER TABLE `values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
