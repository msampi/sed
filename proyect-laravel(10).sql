-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-12-2016 a las 15:28:39
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
  `plan_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `actions`
--

INSERT INTO `actions` (`id`, `import_id`, `description`, `plan_id`, `created_at`, `updated_at`) VALUES
(9, 1, '{"1":"Realizar un Curso de habilidades de Comunicaci\\u00f3n"}', 5, '2016-11-16 18:46:43', '2016-11-16 18:46:43'),
(10, 2, '{"1":"Realizar un Curso de habilidades de Comunicaci\\u00f3n"}', 5, '2016-11-16 18:46:43', '2016-11-16 18:46:43'),
(11, 1, '{"1":"Participar en sesiones de trabajo entre \\u00e1reas"}', 6, '2016-11-16 18:46:43', '2016-11-16 18:46:43'),
(12, 2, '{"1":"Participar en sesiones de trabajo entre \\u00e1reas"}', 6, '2016-11-16 18:46:43', '2016-11-16 18:46:43');

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

--
-- Volcado de datos para la tabla `alerts`
--

INSERT INTO `alerts` (`id`, `name`, `description`, `evaluation_id`, `created_at`, `updated_at`) VALUES
(1, '', '{"1":"Nueva Alerta para evaluacion de people experts","2":""}', 3, '2016-11-23 17:29:36', '2016-11-23 17:29:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerts_users`
--

CREATE TABLE `alerts_users` (
  `alert_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alerts_users`
--

INSERT INTO `alerts_users` (`alert_id`, `user_id`) VALUES
(1, 76);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `behaviours`
--

CREATE TABLE `behaviours` (
  `id` int(10) UNSIGNED NOT NULL,
  `import_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `competition_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `behaviours`
--

INSERT INTO `behaviours` (`id`, `import_id`, `description`, `competition_id`, `created_at`, `updated_at`) VALUES
(29, 1, '{"1":"Atiende a los clientes (internos y externos) de forma r\\u00e1pida y eficaz, con iniciativa y vocaci\\u00f3n continua de servicio "}', 9, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(30, 2, '{"1":"Aporta soluciones de calidad y valor a\\u00f1adido, estudiando a fondo los temas y buscando la excelencia "}', 9, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(31, 3, '{"1":"Es proactivo:  anticipa posibles obst\\u00e1culos y se adelanta a los dem\\u00e1s aportando soluciones pr\\u00e1cticas. "}', 9, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(32, 1, '{"1":"Asume y trata los proyectos en su conjunto (no como parcelas individuales) con responsabilidad \\u00fanica, organizando roles, trabajos y plazos"}', 10, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(33, 2, '{"1":"Facilita una comunicaci\\u00f3n directa y colaborativa con el equipo"}', 10, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(34, 3, '{"1":"Contribuir al objetivo del equipo, gui\\u00e1ndose por el inter\\u00e9s general, no dej\\u00e1ndose llevar por temas personales"}', 10, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(35, 1, '{"1":"Propone nuevos retos y proyectos, provocando acci\\u00f3n y movimiento en el equipo"}', 11, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(36, 2, '{"1":"Es consecuente con las decisiones tomadas y las lleva a cabo"}', 11, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(37, 3, '{"1":"Demuestra integridad al comunicar y actuar con transparencia, siendo coherente con las propias actuaciones. "}', 11, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(38, 4, '{"1":"Trata los temas profesionales con la confidencialidad debida en cada situaci\\u00f3n "}', 11, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(39, 1, '{"1":"Gestiona de forma eficiente los recursos (materiales, financieros y humanos) a su alcance para la consecuci\\u00f3n de los objetivos en tiempo y forma"}', 12, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(40, 2, '{"1":"Conoce y comprende el impacto de su actividad en el negocio y orienta su trabajo hacia niveles exigentes de calidad y rentabilidad"}', 12, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(41, 3, '{"1":"Demuestra ser proactivo y din\\u00e1mico, comprometi\\u00e9ndose en la consecuci\\u00f3n de objetivos"}', 12, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(42, 4, '{"1":"Promueve el cambio, sin aceptar el status quo"}', 12, '2016-11-16 21:46:43', '2016-11-16 21:46:43');

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
  `evaluation_id` int(11) NOT NULL,
  `stage` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `entry` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `behaviour_ratings`
--

INSERT INTO `behaviour_ratings` (`id`, `rating`, `behaviour_id`, `user_id`, `evaluator_id`, `evaluation_id`, `stage`, `entry`, `created_at`, `updated_at`) VALUES
(171, '2', 29, 73, 0, 3, 'half-year', 'user', '2016-11-16 21:53:14', '2016-11-20 17:58:33'),
(172, '0', 29, 73, 73, 3, 'half-year', 'evaluator', '2016-11-16 21:53:14', '2016-11-20 17:24:05'),
(173, '0', 29, 73, 0, 3, 'end-year', 'user', '2016-11-16 21:53:14', '2016-11-20 17:58:33'),
(174, '0', 29, 73, 73, 3, 'end-year', 'evaluator', '2016-11-16 21:53:14', '2016-11-20 17:24:05'),
(175, '3', 30, 73, 0, 3, 'half-year', 'user', '2016-11-16 21:53:14', '2016-11-20 17:58:33'),
(176, '0', 30, 73, 73, 3, 'half-year', 'evaluator', '2016-11-16 21:53:14', '2016-11-20 17:24:05'),
(177, '1', 30, 73, 0, 3, 'end-year', 'user', '2016-11-16 21:53:14', '2016-11-20 17:58:33'),
(178, '0', 30, 73, 73, 3, 'end-year', 'evaluator', '2016-11-16 21:53:14', '2016-11-20 17:24:05'),
(179, '3', 31, 73, 0, 3, 'half-year', 'user', '2016-11-16 21:53:14', '2016-11-20 17:58:33'),
(180, '0', 31, 73, 73, 3, 'half-year', 'evaluator', '2016-11-16 21:53:14', '2016-11-20 17:24:05'),
(181, '0', 31, 73, 0, 3, 'end-year', 'user', '2016-11-16 21:53:14', '2016-11-20 17:58:33'),
(182, '0', 31, 73, 73, 3, 'end-year', 'evaluator', '2016-11-16 21:53:14', '2016-11-20 17:24:05'),
(183, '0', 29, 76, 0, 3, 'half-year', 'user', '2016-11-23 15:13:33', '2016-11-25 00:28:41'),
(184, '0', 29, 76, 76, 3, 'half-year', 'evaluator', '2016-11-23 15:13:33', '2016-11-23 15:13:33'),
(185, '0', 29, 76, 0, 3, 'end-year', 'user', '2016-11-23 15:13:33', '2016-11-25 00:28:41'),
(186, '0', 29, 76, 76, 3, 'end-year', 'evaluator', '2016-11-23 15:13:33', '2016-11-23 15:13:33'),
(187, '0', 30, 76, 0, 3, 'half-year', 'user', '2016-11-23 15:13:33', '2016-11-25 00:28:41'),
(188, '0', 30, 76, 76, 3, 'half-year', 'evaluator', '2016-11-23 15:13:33', '2016-11-23 15:13:33'),
(189, '0', 30, 76, 0, 3, 'end-year', 'user', '2016-11-23 15:13:33', '2016-11-25 00:28:41'),
(190, '0', 30, 76, 76, 3, 'end-year', 'evaluator', '2016-11-23 15:13:33', '2016-11-23 15:13:33'),
(191, '0', 31, 76, 0, 3, 'half-year', 'user', '2016-11-23 15:13:33', '2016-11-25 00:28:41'),
(192, '0', 31, 76, 76, 3, 'half-year', 'evaluator', '2016-11-23 15:13:33', '2016-11-23 15:13:33'),
(193, '0', 31, 76, 0, 3, 'end-year', 'user', '2016-11-23 15:13:33', '2016-11-25 00:28:41'),
(194, '0', 31, 76, 76, 3, 'end-year', 'evaluator', '2016-11-23 15:13:33', '2016-11-23 15:13:33'),
(195, '2', 29, 72, 0, 3, 'half-year', 'user', '2016-11-24 23:14:02', '2016-11-25 01:29:44'),
(196, '0', 29, 72, 72, 3, 'half-year', 'evaluator', '2016-11-24 23:14:02', '2016-11-24 23:14:02'),
(197, '0', 29, 72, 0, 3, 'end-year', 'user', '2016-11-24 23:14:02', '2016-11-25 01:29:44'),
(198, '0', 29, 72, 72, 3, 'end-year', 'evaluator', '2016-11-24 23:14:02', '2016-11-24 23:14:02'),
(199, '1', 30, 72, 0, 3, 'half-year', 'user', '2016-11-24 23:14:02', '2016-11-25 01:29:44'),
(200, '0', 30, 72, 72, 3, 'half-year', 'evaluator', '2016-11-24 23:14:02', '2016-11-24 23:14:02'),
(201, '0', 30, 72, 0, 3, 'end-year', 'user', '2016-11-24 23:14:02', '2016-11-25 01:29:44'),
(202, '0', 30, 72, 72, 3, 'end-year', 'evaluator', '2016-11-24 23:14:02', '2016-11-24 23:14:02'),
(203, '3', 31, 72, 0, 3, 'half-year', 'user', '2016-11-24 23:14:02', '2016-11-25 01:29:44'),
(204, '0', 31, 72, 72, 3, 'half-year', 'evaluator', '2016-11-24 23:14:02', '2016-11-24 23:14:02'),
(205, '0', 31, 72, 0, 3, 'end-year', 'user', '2016-11-24 23:14:02', '2016-11-25 01:29:44'),
(206, '0', 31, 72, 72, 3, 'end-year', 'evaluator', '2016-11-24 23:14:02', '2016-11-24 23:14:02');

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
(4, 'People Experts', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod \r\ntempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea \r\ncommodi consequat. Quis aute iure reprehenderit in voluptate velit esse \r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat \r\ncupiditat non proident, sunt in culpa qui officia deserunt mollit anim \r\nid est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod \r\ntempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea \r\ncommodi consequat. Quis aute iure reprehenderit in voluptate velit esse \r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat \r\ncupiditat non proident, sunt in culpa qui officia deserunt mollit anim \r\nid est laborum.<br></p>', '2016-09-29 02:29:24', '2016-11-01 02:10:15'),
(6, 'Cliente Test', NULL, '', '2016-09-30 22:08:02', '2016-09-30 22:08:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competitions`
--

CREATE TABLE `competitions` (
  `id` int(11) UNSIGNED NOT NULL,
  `import_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `post_id` int(11) UNSIGNED DEFAULT NULL,
  `evaluation_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `competitions`
--

INSERT INTO `competitions` (`id`, `import_id`, `name`, `description`, `weight`, `post_id`, `evaluation_id`, `created_at`, `updated_at`) VALUES
(9, 1, '{"1":"Orientacion al Cliente"}', '{"1":"descripcion 1"}', 10, 7, 3, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(10, 2, '{"1":"Trabajo en equipo"}', '{"1":"descripcion 2"}', 20, 8, 3, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(11, 3, '{"1":"Responsabilidad e implicaci\\u00f3n"}', '{"1":"descripcion 3"}', 40, 9, 3, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(12, 4, '{"1":"Orientaci\\u00f3n a resultados"}', '{"1":"descrricion 4"}', 50, 8, 3, '2016-11-16 21:46:43', '2016-11-16 21:46:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competition_comments`
--

CREATE TABLE `competition_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluator_id` int(11) NOT NULL,
  `evaluation_id` int(11) UNSIGNED NOT NULL,
  `competition_id` int(11) UNSIGNED NOT NULL,
  `stage` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `entry` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `competition_comments`
--

INSERT INTO `competition_comments` (`id`, `comment`, `user_id`, `evaluator_id`, `evaluation_id`, `competition_id`, `stage`, `entry`, `created_at`, `updated_at`) VALUES
(33, '', 73, 0, 3, 9, 'half-year', 'user', '2016-11-16 21:53:11', '2016-11-20 17:58:33'),
(34, '', 73, 73, 3, 9, 'half-year', 'evaluator', '2016-11-16 21:53:11', '2016-11-16 21:53:14'),
(35, '', 73, 0, 3, 9, 'end-year', 'user', '2016-11-16 21:53:11', '2016-11-20 17:58:33'),
(36, '', 73, 73, 3, 9, 'end-year', 'evaluator', '2016-11-16 21:53:11', '2016-11-16 21:53:14'),
(37, '', 76, 0, 3, 9, 'half-year', 'user', '2016-11-23 15:13:30', '2016-11-25 00:28:41'),
(38, '', 76, 76, 3, 9, 'half-year', 'evaluator', '2016-11-23 15:13:30', '2016-11-23 15:13:33'),
(39, '', 76, 0, 3, 9, 'end-year', 'user', '2016-11-23 15:13:30', '2016-11-25 00:28:41'),
(40, '', 76, 76, 3, 9, 'end-year', 'evaluator', '2016-11-23 15:13:30', '2016-11-23 15:13:33'),
(41, '', 72, 0, 3, 9, 'half-year', 'user', '2016-11-24 23:13:59', '2016-11-25 01:29:44'),
(42, '', 72, 72, 3, 9, 'half-year', 'evaluator', '2016-11-24 23:13:59', '2016-11-24 23:14:02'),
(43, '', 72, 0, 3, 9, 'end-year', 'user', '2016-11-24 23:13:59', '2016-11-25 01:29:44'),
(44, '', 72, 72, 3, 9, 'end-year', 'evaluator', '2016-11-24 23:13:59', '2016-11-24 23:14:02');

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

--
-- Volcado de datos para la tabla `documents`
--

INSERT INTO `documents` (`id`, `evaluation_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 2, 'sed-evaluacion.xlsx-2.xlsx', '2016-11-10 19:14:28', '2016-11-10 19:14:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluations`
--

CREATE TABLE `evaluations` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `vis_half_year_start` datetime DEFAULT NULL,
  `vis_half_year_end` datetime DEFAULT NULL,
  `vis_end_year_start` datetime DEFAULT NULL,
  `vis_end_year_end` datetime DEFAULT NULL,
  `visualization` tinyint(4) NOT NULL,
  `welcome_message_id` int(11) NOT NULL,
  `register_message_id` int(11) NOT NULL,
  `recovery_message_id` int(11) NOT NULL,
  `mandatory_sections` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluations`
--

INSERT INTO `evaluations` (`id`, `name`, `instructions`, `client_id`, `objectives_rating_id`, `competitions_rating_id`, `valorations_rating_id`, `start_year_start`, `start_year_end`, `half_year_start`, `half_year_end`, `end_year_start`, `end_year_end`, `vis_half_year_start`, `vis_half_year_end`, `vis_end_year_start`, `vis_end_year_end`, `visualization`, `welcome_message_id`, `register_message_id`, `recovery_message_id`, `mandatory_sections`, `created_at`, `updated_at`) VALUES
(3, 'Evaluacion people Experts', '', 4, 11, 11, 11, '2016-11-16 00:00:00', '2016-12-31 00:00:00', '2016-11-01 00:00:00', '2016-11-30 00:00:00', '2016-11-01 00:00:00', '2016-12-30 00:00:00', '2016-11-01 00:00:00', '2016-11-30 00:00:00', '2016-11-01 00:00:00', '2016-11-30 00:00:00', 1, 2, 1, 3, '["1","2","3"]', '2016-11-16 21:46:42', '2016-11-24 23:47:11'),
(4, 'Evaluacion de cliente test', '', 6, 11, 11, 11, '2016-11-23 00:00:00', '2016-11-24 00:00:00', '2016-11-23 00:00:00', '2016-11-24 00:00:00', '2016-11-23 00:00:00', '2016-11-24 00:00:00', NULL, NULL, NULL, NULL, 0, 1, 1, 1, '["1","2"]', '2016-11-23 20:21:09', '2016-11-23 20:21:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluation_user_evaluators`
--

CREATE TABLE `evaluation_user_evaluators` (
  `id` int(11) NOT NULL,
  `evaluation_id` int(11) UNSIGNED NOT NULL,
  `evaluator_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status_objectives` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_competitions` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `status_valorations` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `started` tinyint(4) NOT NULL,
  `post_id` int(11) NOT NULL,
  `category` varchar(256) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluation_user_evaluators`
--

INSERT INTO `evaluation_user_evaluators` (`id`, `evaluation_id`, `evaluator_id`, `user_id`, `status_objectives`, `status_competitions`, `status_valorations`, `started`, `post_id`, `category`, `created_at`, `updated_at`) VALUES
(15, 3, 76, 72, '["2","2","2"]', '[0,"2","2"]', '[0,"2","2"]', 1, 7, '', '2016-11-16 18:46:43', '2016-11-24 20:47:36'),
(16, 3, 76, 74, '[0,0,0]', '[0,0,0]', '[0,0,0]', 1, 8, '', '2016-11-16 18:46:43', '2016-11-23 19:58:42'),
(18, 3, 76, 75, '[0,0,0]', '[0,0,0]', '[0,0,0]', 1, 7, '', '2016-11-16 18:46:43', '2016-11-23 19:58:42'),
(19, 3, 0, 76, '["1","1",1]', '[0,"2",1]', '[0,"2",1]', 1, 7, '', '2016-11-20 22:02:26', '2016-11-24 20:47:44'),
(20, 3, 76, 2, '', '', '', 0, 7, '', '2016-11-25 18:47:27', '2016-11-25 18:47:27');

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
(1, '{"1":"Registro de Usuario (default)","2":"User registration (default)"}', '{"1":"client_name","2":"client_name"}', '{"1":"<p>Estimado user_name,&nbsp; user_last_name.<\\/p><p>client_name le da la bienvenida a nuestra plataforma.<br><\\/p><p>En breve recibira otro email para activar su usuario configurando su nueva contrase\\u00f1a de acceso.<br><\\/p><p>Gracias<br><\\/p><p>El equipo client_name <br><\\/p>","2":"<p><\\/p><p>Dear user_name,  user_last_name.<\\/p><p>client_name welcomes you to uor plataform.<\\/p><p>You will receive another email shortly to activate your user account setting up your password.<br><\\/p><p>Thanks<br><\\/p><p>client_name Team<\\/p><br><p><\\/p>"}', 0, '2016-09-30 19:17:44', '2016-11-10 14:41:23'),
(2, '{"1":"Bienvenida a evaluaci\\u00f3n (default)","2":"Evaluation welcome (default)"}', '{"1":"client_name","2":"client_name"}', '{"1":"<p><\\/p><p>Estimado user_name,  user_last_name.<\\/p><p>client_name le da la bienvenida a la evaluacion evaluation_name.<\\/p><p>Puede ingresar mediante el siguiente enlace: web_link<\\/p><p>Gracias<\\/p><p>El equipo de client_name<\\/p><br><p><\\/p>","2":""}', 0, '2016-09-30 19:45:16', '2016-09-30 19:47:31'),
(3, '{"1":"Recuperacion de clave (default)","2":"Password recovery (default)"}', '{"1":"client_name","2":"client_name"}', '{"1":"<p><\\/p><p>Estimado user_name,  user_last_name.<\\/p><p>Su contrase\\u00f1a se ha restablecido correctamente. Su nueva contrase\\u00f1a es: user_password<br><\\/p><p>Puede ingresar mediante el siguiente enlace: web_link<\\/p><p>Gracias<\\/p><p>El equipo de client_name<\\/p><br><p><\\/p>","2":""}', 0, '2016-09-30 19:48:46', '2016-09-30 19:48:46'),
(4, '{"1":"Bienvenida People Experts","2":""}', '{"1":"People Experts","2":""}', '{"1":"<p>lalalalal<br><\\/p>","2":""}', 4, '2016-10-03 14:35:07', '2016-10-04 16:14:06');

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
  `id` int(11) UNSIGNED NOT NULL,
  `import_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `evaluation_id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) UNSIGNED DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `evaluator_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `objectives`
--

INSERT INTO `objectives` (`id`, `import_id`, `name`, `description`, `weight`, `evaluation_id`, `post_id`, `user_id`, `evaluator_id`, `created_at`, `updated_at`) VALUES
(355, 1, '{"1":"Objetivo 1"}', '{"1":"Alcanzar un 100% de ventas del producto"}', 25, 3, 7, 0, 0, '2016-11-16 21:46:43', '2016-11-16 21:52:50'),
(356, 2, '{"1":"Objetivo 2"}', '{"1":"Maneja el programa de manera correcta"}', 45, 3, 8, NULL, NULL, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(357, 3, '{"1":"Objetivo 3"}', '{"1":"Maneja el equipo de manera correcta"}', 55, 3, 9, NULL, NULL, '2016-11-16 21:46:43', '2016-11-16 21:46:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objective_reviews`
--

CREATE TABLE `objective_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `rating` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `evaluation_id` int(11) UNSIGNED NOT NULL,
  `objective_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `stage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `objective_reviews`
--

INSERT INTO `objective_reviews` (`id`, `description`, `rating`, `evaluation_id`, `objective_id`, `user_id`, `stage`, `entry`, `created_at`, `updated_at`) VALUES
(282, '', '2', 3, 355, 73, 'half-year', 'user', '2016-11-16 21:50:56', '2016-11-19 00:17:25'),
(283, '', '0', 3, 355, 73, 'end-year', 'user', '2016-11-16 21:50:56', '2016-11-19 00:05:33'),
(284, '', '0', 3, 355, 73, 'half-year', 'evaluator', '2016-11-16 21:50:56', '2016-11-16 21:50:58'),
(285, '', '0', 3, 355, 73, 'end-year', 'evaluator', '2016-11-16 21:50:56', '2016-11-16 21:50:58'),
(286, '', '2', 3, 355, 72, 'half-year', 'user', '2016-11-17 23:31:53', '2016-11-25 01:29:26'),
(287, '', '3', 3, 355, 72, 'end-year', 'user', '2016-11-17 23:31:53', '2016-11-25 01:29:28'),
(288, '', '0', 3, 355, 72, 'half-year', 'evaluator', '2016-11-17 23:31:53', '2016-11-17 23:31:55'),
(289, '', '0', 3, 355, 72, 'end-year', 'evaluator', '2016-11-17 23:31:53', '2016-11-17 23:31:55'),
(290, '', '2', 3, 355, 76, 'half-year', 'user', '2016-11-23 15:11:34', '2016-11-25 00:23:43'),
(291, '', '1', 3, 355, 76, 'end-year', 'user', '2016-11-23 15:11:34', '2016-11-24 23:58:49'),
(292, '', '0', 3, 355, 76, 'half-year', 'evaluator', '2016-11-23 15:11:34', '2016-11-24 23:09:44'),
(293, '', '0', 3, 355, 76, 'end-year', 'evaluator', '2016-11-23 15:11:34', '2016-11-24 23:09:44');

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
('jramirez@gmail.com', 'c3c360409ebca688d3eadaa81c15d718a56fa856c8c97af7b91cd71a715b3ee7', '2016-11-16 21:46:51'),
('jfarias@gmail.com', 'f23dd73036903e38f350290f728b33d13420891bc9a69fa76787b2a57e9f3530', '2016-11-16 21:47:03'),
('Kcastaneda@clarkemodet.com.pe', '6ac743363cdada0d7e0c5b15f5b5d73e754aa41507f20e569decbb11dd7244db', '2016-11-16 21:47:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `performances`
--

CREATE TABLE `performances` (
  `id` int(11) NOT NULL,
  `user_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `evaluator_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `user_agree` tinyint(4) NOT NULL,
  `user_result` int(11) NOT NULL,
  `evaluator_result` int(11) NOT NULL,
  `final_score` int(11) NOT NULL,
  `evaluation_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `evaluator_id` int(11) NOT NULL,
  `finish_user` tinyint(4) NOT NULL,
  `finish_evaluator` tinyint(4) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `performances`
--

INSERT INTO `performances` (`id`, `user_comment`, `evaluator_comment`, `user_agree`, `user_result`, `evaluator_result`, `final_score`, `evaluation_id`, `user_id`, `evaluator_id`, `finish_user`, `finish_evaluator`, `created_at`, `updated_at`) VALUES
(1, '<p>comentarios<br></p>', '', 1, 200, 0, 150, 3, 72, 0, 0, 0, 2016, 2016);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plans`
--

CREATE TABLE `plans` (
  `id` int(11) UNSIGNED NOT NULL,
  `import_id` int(11) NOT NULL,
  `name` text CHARACTER SET latin1 NOT NULL,
  `evaluation_id` int(11) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `plans`
--

INSERT INTO `plans` (`id`, `import_id`, `name`, `evaluation_id`, `post_id`, `created_at`, `updated_at`) VALUES
(5, 1, '{"1":"Orientaci\\u00f3n al cliente"}', 3, 7, '2016-11-16 18:46:43', '2016-11-16 18:46:43'),
(6, 2, '{"1":"Trabajo en equipo"}', 3, 8, '2016-11-16 18:46:43', '2016-11-16 18:46:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_areas`
--

CREATE TABLE `plan_areas` (
  `id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `stage` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `plan_id` int(11) UNSIGNED NOT NULL,
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
  `evaluation_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluator_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `plan_comments`
--

INSERT INTO `plan_comments` (`id`, `comment`, `type`, `stage`, `entry`, `evaluation_id`, `user_id`, `evaluator_id`, `created_at`, `updated_at`) VALUES
(57, '', 1, 'half-year', 'user', 3, 73, 0, '2016-11-16 18:50:52', '2016-11-18 20:52:08'),
(58, '', 1, 'half-year', 'evaluator', 3, 73, 73, '2016-11-16 18:50:52', '2016-11-16 18:50:55'),
(59, '', 1, 'end-year', 'user', 3, 73, 0, '2016-11-16 18:50:52', '2016-11-18 20:52:08'),
(60, '', 1, 'end-year', 'evaluator', 3, 73, 73, '2016-11-16 18:50:52', '2016-11-16 18:50:55'),
(61, '', 2, 'half-year', 'user', 3, 73, 0, '2016-11-16 18:50:52', '2016-11-18 20:52:08'),
(62, '', 2, 'half-year', 'evaluator', 3, 73, 73, '2016-11-16 18:50:52', '2016-11-16 18:50:55'),
(63, '', 2, 'end-year', 'user', 3, 73, 0, '2016-11-16 18:50:52', '2016-11-18 20:52:08'),
(64, '', 2, 'end-year', 'evaluator', 3, 73, 0, '2016-11-16 18:50:52', '2016-11-18 20:52:08');

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
  `evaluation_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `import_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `evaluation_id` int(11) UNSIGNED DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `import_id`, `name`, `evaluation_id`, `client_id`, `created_at`, `updated_at`) VALUES
(7, 1, '{"1":"Director General"}', 3, 4, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(8, 2, '{"1":"Director"}', 3, 4, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(9, 3, '{"1":"Secretario"}', 3, 4, '2016-11-16 21:46:43', '2016-11-16 21:46:43');

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
(11, 'Rating People Experts', '2016-11-15 17:48:43', '2016-11-15 17:55:41');

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
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `evaluation_id` int(11) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `trackings`
--

INSERT INTO `trackings` (`id`, `user_id`, `evaluation_id`, `client_id`, `created_at`, `updated_at`) VALUES
(4, 76, 3, 4, '2016-11-20 22:03:28', '2016-11-20 22:03:28'),
(5, 72, 3, 4, '2016-11-23 20:02:06', '2016-11-23 20:02:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tracking_actions`
--

CREATE TABLE `tracking_actions` (
  `id` int(11) NOT NULL,
  `tracking_id` int(11) UNSIGNED NOT NULL,
  `browser` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `action` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tracking_actions`
--

INSERT INTO `tracking_actions` (`id`, `tracking_id`, `browser`, `country`, `ip`, `action`, `created_at`, `updated_at`) VALUES
(394, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-20 22:03:28', '2016-11-20 22:03:28'),
(395, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-20 22:03:32', '2016-11-20 22:03:32'),
(396, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-20 22:03:37', '2016-11-20 22:03:37'),
(397, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-20 22:38:15', '2016-11-20 22:38:15'),
(398, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-22 22:52:41', '2016-11-22 22:52:41'),
(399, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-22 22:52:46', '2016-11-22 22:52:46'),
(400, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 11:35:49', '2016-11-23 11:35:49'),
(401, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 11:42:13', '2016-11-23 11:42:13'),
(402, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-23 12:11:33', '2016-11-23 12:11:33'),
(403, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-23 12:13:14', '2016-11-23 12:13:14'),
(404, 4, 'firefox', '', '::1', '{"1":"Ingreso a competencias"}', '2016-11-23 12:13:30', '2016-11-23 12:13:30'),
(405, 4, 'firefox', '', '::1', '{"1":"Ingreso a competencias"}', '2016-11-23 12:14:21', '2016-11-23 12:14:21'),
(406, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-23 12:15:00', '2016-11-23 12:15:00'),
(407, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 12:16:27', '2016-11-23 12:16:27'),
(408, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-23 12:16:31', '2016-11-23 12:16:31'),
(409, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 12:19:11', '2016-11-23 12:19:11'),
(410, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 12:19:14', '2016-11-23 12:19:14'),
(411, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-23 12:33:42', '2016-11-23 12:33:42'),
(412, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 12:34:22', '2016-11-23 12:34:22'),
(413, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 12:45:20', '2016-11-23 12:45:20'),
(414, 4, 'firefox', '', '::1', '{"1":"Ingreso a competencias"}', '2016-11-23 12:47:47', '2016-11-23 12:47:47'),
(415, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 12:47:53', '2016-11-23 12:47:53'),
(416, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-23 13:06:32', '2016-11-23 13:06:32'),
(417, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 13:08:40', '2016-11-23 13:08:40'),
(418, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 17:29:44', '2016-11-23 17:29:44'),
(419, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 17:30:03', '2016-11-23 17:30:03'),
(420, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 17:32:44', '2016-11-23 17:32:44'),
(421, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 17:33:09', '2016-11-23 17:33:09'),
(422, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 17:35:30', '2016-11-23 17:35:30'),
(423, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-23 18:21:07', '2016-11-23 18:21:07'),
(424, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 18:21:58', '2016-11-23 18:21:58'),
(425, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-23 18:40:49', '2016-11-23 18:40:49'),
(426, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 18:42:34', '2016-11-23 18:42:34'),
(427, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 19:01:28', '2016-11-23 19:01:28'),
(428, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 19:28:33', '2016-11-23 19:28:33'),
(429, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 19:43:19', '2016-11-23 19:43:19'),
(430, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 19:43:39', '2016-11-23 19:43:39'),
(431, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 19:44:20', '2016-11-23 19:44:20'),
(432, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 19:45:12', '2016-11-23 19:45:12'),
(433, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 19:58:42', '2016-11-23 19:58:42'),
(434, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 20:01:04', '2016-11-23 20:01:04'),
(435, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-23 20:01:17', '2016-11-23 20:01:17'),
(436, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 20:02:06', '2016-11-23 20:02:06'),
(437, 5, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-23 20:02:10', '2016-11-23 20:02:10'),
(438, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 20:02:14', '2016-11-23 20:02:14'),
(439, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 20:02:18', '2016-11-23 20:02:18'),
(440, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-23 20:02:34', '2016-11-23 20:02:34'),
(441, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 20:03:07', '2016-11-23 20:03:07'),
(442, 5, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 20:03:09', '2016-11-23 20:03:09'),
(443, 5, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-23 20:03:11', '2016-11-23 20:03:11'),
(444, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 20:03:18', '2016-11-23 20:03:18'),
(445, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 20:03:20', '2016-11-23 20:03:20'),
(446, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-23 20:12:38', '2016-11-23 20:12:38'),
(447, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 20:12:44', '2016-11-23 20:12:44'),
(448, 5, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-23 20:12:55', '2016-11-23 20:12:55'),
(449, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 20:13:00', '2016-11-23 20:13:00'),
(450, 5, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-23 20:13:02', '2016-11-23 20:13:02'),
(451, 5, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-23 20:13:15', '2016-11-23 20:13:15'),
(452, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 20:13:25', '2016-11-23 20:13:25'),
(453, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 20:13:28', '2016-11-23 20:13:28'),
(454, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-23 21:40:50', '2016-11-23 21:40:50'),
(455, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 21:40:56', '2016-11-23 21:40:56'),
(456, 5, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-23 21:41:01', '2016-11-23 21:41:01'),
(457, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-23 21:47:27', '2016-11-23 21:47:27'),
(458, 5, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-23 21:47:30', '2016-11-23 21:47:30'),
(459, 5, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-23 22:24:18', '2016-11-23 22:24:18'),
(460, 5, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-23 23:29:21', '2016-11-23 23:29:21'),
(461, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 18:13:46', '2016-11-24 18:13:46'),
(462, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 18:13:49', '2016-11-24 18:13:49'),
(463, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 18:21:19', '2016-11-24 18:21:19'),
(464, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 18:22:13', '2016-11-24 18:22:13'),
(465, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-24 18:22:22', '2016-11-24 18:22:22'),
(466, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 18:22:27', '2016-11-24 18:22:27'),
(467, 5, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 18:22:31', '2016-11-24 18:22:31'),
(468, 5, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-24 18:22:33', '2016-11-24 18:22:33'),
(469, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 18:22:39', '2016-11-24 18:22:39'),
(470, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 18:22:42', '2016-11-24 18:22:42'),
(471, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 18:23:07', '2016-11-24 18:23:07'),
(472, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 18:33:52', '2016-11-24 18:33:52'),
(473, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 18:33:55', '2016-11-24 18:33:55'),
(474, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 18:36:27', '2016-11-24 18:36:27'),
(475, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 18:36:58', '2016-11-24 18:36:58'),
(476, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 18:40:30', '2016-11-24 18:40:30'),
(477, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 18:41:43', '2016-11-24 18:41:43'),
(478, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 18:43:01', '2016-11-24 18:43:01'),
(479, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 18:43:04', '2016-11-24 18:43:04'),
(480, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 18:43:08', '2016-11-24 18:43:08'),
(481, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 19:07:03', '2016-11-24 19:07:03'),
(482, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 19:07:06', '2016-11-24 19:07:06'),
(483, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 19:07:09', '2016-11-24 19:07:09'),
(484, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 19:07:12', '2016-11-24 19:07:12'),
(485, 4, 'firefox', '', '::1', '{"1":"Ingreso a competencias"}', '2016-11-24 19:38:33', '2016-11-24 19:38:33'),
(486, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 19:38:42', '2016-11-24 19:38:42'),
(487, 4, 'firefox', '', '::1', '{"1":"Ingreso a competencias"}', '2016-11-24 19:38:44', '2016-11-24 19:38:44'),
(488, 4, 'firefox', '', '::1', '{"1":"Ingreso a valores"}', '2016-11-24 19:38:47', '2016-11-24 19:38:47'),
(489, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 19:38:50', '2016-11-24 19:38:50'),
(490, 4, 'firefox', '', '::1', '{"1":"Ingreso a valores"}', '2016-11-24 19:38:53', '2016-11-24 19:38:53'),
(491, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 19:39:01', '2016-11-24 19:39:01'),
(492, 4, 'firefox', '', '::1', '{"1":"Ingreso a valores"}', '2016-11-24 19:39:03', '2016-11-24 19:39:03'),
(493, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:02:45', '2016-11-24 20:02:45'),
(494, 4, 'firefox', '', '::1', '{"1":"Ingreso a valores"}', '2016-11-24 20:03:01', '2016-11-24 20:03:01'),
(495, 4, 'firefox', '', '::1', '{"1":"Ingreso a valores"}', '2016-11-24 20:03:38', '2016-11-24 20:03:38'),
(496, 4, 'firefox', '', '::1', '{"1":"Ingreso a valores"}', '2016-11-24 20:03:55', '2016-11-24 20:03:55'),
(497, 4, 'firefox', '', '::1', '{"1":"Ingreso a valores"}', '2016-11-24 20:09:35', '2016-11-24 20:09:35'),
(498, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 20:09:42', '2016-11-24 20:09:42'),
(499, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:09:44', '2016-11-24 20:09:44'),
(500, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 20:09:46', '2016-11-24 20:09:46'),
(501, 4, 'firefox', '', '::1', '{"1":"Ingreso a competencias"}', '2016-11-24 20:09:49', '2016-11-24 20:09:49'),
(502, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:09:54', '2016-11-24 20:09:54'),
(503, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:10:09', '2016-11-24 20:10:09'),
(504, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-24 20:10:19', '2016-11-24 20:10:19'),
(505, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:10:24', '2016-11-24 20:10:24'),
(506, 5, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 20:13:50', '2016-11-24 20:13:50'),
(507, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:13:53', '2016-11-24 20:13:53'),
(508, 5, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 20:13:56', '2016-11-24 20:13:56'),
(509, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:13:58', '2016-11-24 20:13:58'),
(510, 5, 'firefox', '', '::1', '{"1":"Ingreso a competencias"}', '2016-11-24 20:13:59', '2016-11-24 20:13:59'),
(511, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:14:02', '2016-11-24 20:14:02'),
(512, 5, 'firefox', '', '::1', '{"1":"Ingreso a valores"}', '2016-11-24 20:14:04', '2016-11-24 20:14:04'),
(513, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:14:06', '2016-11-24 20:14:06'),
(514, 5, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-24 20:14:09', '2016-11-24 20:14:09'),
(515, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:14:14', '2016-11-24 20:14:14'),
(516, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:14:17', '2016-11-24 20:14:17'),
(517, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:16:02', '2016-11-24 20:16:02'),
(518, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:37:46', '2016-11-24 20:37:46'),
(519, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:37:58', '2016-11-24 20:37:58'),
(520, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:40:52', '2016-11-24 20:40:52'),
(521, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:41:07', '2016-11-24 20:41:07'),
(522, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:41:24', '2016-11-24 20:41:24'),
(523, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:41:41', '2016-11-24 20:41:41'),
(524, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:41:56', '2016-11-24 20:41:56'),
(525, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:42:43', '2016-11-24 20:42:43'),
(526, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:43:05', '2016-11-24 20:43:05'),
(527, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:43:25', '2016-11-24 20:43:25'),
(528, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:43:41', '2016-11-24 20:43:41'),
(529, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:44:00', '2016-11-24 20:44:00'),
(530, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:44:16', '2016-11-24 20:44:16'),
(531, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:44:50', '2016-11-24 20:44:50'),
(532, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:45:00', '2016-11-24 20:45:00'),
(533, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:45:10', '2016-11-24 20:45:10'),
(534, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:45:42', '2016-11-24 20:45:42'),
(535, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:46:09', '2016-11-24 20:46:09'),
(536, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:46:21', '2016-11-24 20:46:21'),
(537, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-24 20:46:26', '2016-11-24 20:46:26'),
(538, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:47:23', '2016-11-24 20:47:23'),
(539, 5, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 20:47:25', '2016-11-24 20:47:25'),
(540, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:47:28', '2016-11-24 20:47:28'),
(541, 5, 'firefox', '', '::1', '{"1":"Ingreso a competencias"}', '2016-11-24 20:47:30', '2016-11-24 20:47:30'),
(542, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:47:33', '2016-11-24 20:47:33'),
(543, 5, 'firefox', '', '::1', '{"1":"Ingreso a valores"}', '2016-11-24 20:47:34', '2016-11-24 20:47:34'),
(544, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:47:37', '2016-11-24 20:47:37'),
(545, 5, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-24 20:47:39', '2016-11-24 20:47:39'),
(546, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:47:44', '2016-11-24 20:47:44'),
(547, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:47:46', '2016-11-24 20:47:46'),
(548, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:50:48', '2016-11-24 20:50:48'),
(549, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:52:07', '2016-11-24 20:52:07'),
(550, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:53:21', '2016-11-24 20:53:21'),
(551, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:58:35', '2016-11-24 20:58:35'),
(552, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 20:58:40', '2016-11-24 20:58:40'),
(553, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 20:58:50', '2016-11-24 20:58:50'),
(554, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 20:58:53', '2016-11-24 20:58:53'),
(555, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 20:58:59', '2016-11-24 20:58:59'),
(556, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 21:23:04', '2016-11-24 21:23:04'),
(557, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-24 21:24:05', '2016-11-24 21:24:05'),
(558, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 21:25:54', '2016-11-24 21:25:54'),
(559, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 21:26:02', '2016-11-24 21:26:02'),
(560, 4, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 21:27:08', '2016-11-24 21:27:08'),
(561, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 21:27:34', '2016-11-24 21:27:34'),
(562, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 21:27:47', '2016-11-24 21:27:47'),
(563, 4, 'firefox', '', '::1', '{"1":"Ingreso a competencias"}', '2016-11-24 21:28:30', '2016-11-24 21:28:30'),
(564, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 21:28:41', '2016-11-24 21:28:41'),
(565, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 21:31:07', '2016-11-24 21:31:07'),
(566, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:02:48', '2016-11-24 22:02:48'),
(567, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:07:14', '2016-11-24 22:07:14'),
(568, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:07:28', '2016-11-24 22:07:28'),
(569, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:07:58', '2016-11-24 22:07:58'),
(570, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:09:29', '2016-11-24 22:09:29'),
(571, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:09:44', '2016-11-24 22:09:44'),
(572, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:10:10', '2016-11-24 22:10:10'),
(573, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:23:55', '2016-11-24 22:23:55'),
(574, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:24:16', '2016-11-24 22:24:16'),
(575, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:28:43', '2016-11-24 22:28:43'),
(576, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-24 22:29:15', '2016-11-24 22:29:15'),
(577, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 22:29:21', '2016-11-24 22:29:21'),
(578, 5, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-11-24 22:29:24', '2016-11-24 22:29:24'),
(579, 5, 'firefox', '', '::1', '{"1":"Ingreso a competencias"}', '2016-11-24 22:29:33', '2016-11-24 22:29:33'),
(580, 5, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-24 22:29:45', '2016-11-24 22:29:45'),
(581, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-24 22:29:50', '2016-11-24 22:29:50'),
(582, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:29:52', '2016-11-24 22:29:52'),
(583, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:30:50', '2016-11-24 22:30:50'),
(584, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-24 22:32:04', '2016-11-24 22:32:04'),
(585, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-25 18:46:32', '2016-11-25 18:46:32'),
(586, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-25 18:46:34', '2016-11-25 18:46:34'),
(587, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-25 18:46:42', '2016-11-25 18:46:42'),
(588, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-25 18:47:40', '2016-11-25 18:47:40'),
(589, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-25 18:47:42', '2016-11-25 18:47:42'),
(590, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-25 18:58:43', '2016-11-25 18:58:43'),
(591, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-25 18:59:00', '2016-11-25 18:59:00'),
(592, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-25 18:59:15', '2016-11-25 18:59:15'),
(593, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-25 18:59:24', '2016-11-25 18:59:24'),
(594, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-25 18:59:29', '2016-11-25 18:59:29'),
(595, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-25 18:59:42', '2016-11-25 18:59:42'),
(596, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-25 18:59:52', '2016-11-25 18:59:52'),
(597, 5, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-25 18:59:58', '2016-11-25 18:59:58'),
(598, 4, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-25 19:00:11', '2016-11-25 19:00:11'),
(599, 4, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-11-25 19:00:12', '2016-11-25 19:00:12'),
(600, 4, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-11-25 19:00:51', '2016-11-25 19:00:51'),
(601, 5, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-11-25 19:01:30', '2016-11-25 19:01:30');

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
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dni` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` int(11) UNSIGNED DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `register_message_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `password`, `dni`, `remember_token`, `client_id`, `code`, `role_id`, `language_id`, `image`, `country`, `city`, `area`, `department`, `zone`, `register_message_id`, `created_at`, `updated_at`) VALUES
(2, 'Patricio', 'Godoy Lastra', 'pgodoy@centromultimedia.com.ar', '$2y$10$BN3V4y23SA5wq1mr.cm/LOtS4MYKvaNYvCew0FN9ZcogeaC1WhenG', '25141390', 'j9lePlLhwU7P8WL0Sq4VgLoZaBnphiU75T3zZe4RVQEvbYKI0I8XrAzx3tml', 4, '245159', 3, 1, '', 'Argentina', 'Capital Federal', '223', 'dep', '', 0, '2016-05-22 04:23:31', '2016-10-25 02:38:09'),
(31, 'Superadmin', 'Superadmin', 'superadmin@superadmin.com', '$2a$04$KESIUGZkNuMzn37XuoYdPu4w.rrCHTO.f8zFf65k59SwqZK6owcbi', '29141390', 'XT1KqDu87KBuUAIKofRzFci2Zz5w0gBY03sNRHCdaICIZHoB4MQW8uNos0BP', NULL, '245158', 1, 1, '', 'AR', 'Tandil', '223', 'dep', '', 0, '2016-05-22 04:23:31', '2016-11-25 22:01:26'),
(36, 'Admin', 'Cliente', 'admin@admin.com', '$2a$04$KESIUGZkNuMzn37XuoYdPu4w.rrCHTO.f8zFf65k59SwqZK6owcbi', '29141390', 'mTXRgrntMsqCUBUn2wY07lOYrxt0HvSWcONVTMvCETdDO2cJG2skJNnq09H1', 4, '255159', 2, 1, '', 'AR', 'Tandil', '223', 'dep', '', 0, '2016-05-22 04:23:31', '2016-11-23 20:28:53'),
(72, 'Jose', 'Ramirez', 'jramirez@gmail.com', '$2a$04$KESIUGZkNuMzn37XuoYdPu4w.rrCHTO.f8zFf65k59SwqZK6owcbi', '214334', 'Pi7WC15ONkzyVz0cH0JaFt64CEAWY7c8SAEsGd63ptxgGvR3hPQKI5zock7x', 4, '12345', 3, 1, NULL, 'Argentina', 'Buenos Aires', 'Capital', NULL, NULL, 0, '2016-11-16 21:46:43', '2016-11-25 21:59:58'),
(74, 'Jorge', 'Farias', 'jfarias@gmail.com', NULL, '7236647', NULL, 4, '2345', 3, 1, NULL, 'Argentina', 'Buenos Aires', 'Buenos Aires', NULL, NULL, 0, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(75, 'JOSE', 'TRUJILLO', 'Kcastaneda@clarkemodet.com.pe', NULL, 'PE-00399', NULL, 4, '32500399', 3, 1, NULL, 'España', 'Madrid', 'Chamartin zona', 'departamento', NULL, 0, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(76, 'Matias', 'sampietro', 'matiassampietro@gmail.com', '$2y$10$bnd.TdBP9qZ9zqZ8OOtdZ.FG/JxdM39NPCwewzff9bb2snyBUFbYK', '29141390', 'J7hjNpMskpwaIGU6N7wVAlI3RUBOBuJIjNiGaaxq1gj5J22iK0rcI8HHccZb', 4, '2983798213', 3, 1, NULL, '', '', '', '', '', 1, '2016-11-21 01:02:05', '2016-11-25 22:00:52');

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
  `post_id` int(11) UNSIGNED DEFAULT NULL,
  `evaluation_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `valorations`
--

INSERT INTO `valorations` (`id`, `import_id`, `name`, `description`, `weight`, `post_id`, `evaluation_id`, `created_at`, `updated_at`) VALUES
(7, 1, '{"1":"Valor 1"}', '{"1":"Descripcion del valor 1"}', 20, 7, 3, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(8, 2, '{"1":"Valor 2"}', '{"1":"Descripcion del valor 2"}', 30, 8, 3, '2016-11-16 21:46:43', '2016-11-16 21:46:43'),
(9, 3, '{"1":"Valor 3"}', '{"1":"Descripcion de valor 3"}', 40, 8, 3, '2016-11-16 21:46:43', '2016-11-16 21:46:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoration_comments`
--

CREATE TABLE `valoration_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluator_id` int(11) NOT NULL,
  `evaluation_id` int(11) UNSIGNED NOT NULL,
  `valoration_id` int(11) UNSIGNED NOT NULL,
  `stage` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `entry` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `valoration_comments`
--

INSERT INTO `valoration_comments` (`id`, `comment`, `user_id`, `evaluator_id`, `evaluation_id`, `valoration_id`, `stage`, `entry`, `created_at`, `updated_at`) VALUES
(1, '', 73, 0, 3, 7, 'half-year', 'user', '2016-11-18 23:51:17', '2016-11-20 18:43:08'),
(2, '', 73, 73, 3, 7, 'half-year', 'evaluator', '2016-11-18 23:51:17', '2016-11-18 23:51:20'),
(3, '', 73, 0, 3, 7, 'end-year', 'user', '2016-11-18 23:51:17', '2016-11-20 18:43:08'),
(4, '', 73, 73, 3, 7, 'end-year', 'evaluator', '2016-11-18 23:51:17', '2016-11-18 23:51:20'),
(5, '', 76, 0, 3, 7, 'half-year', 'user', '2016-11-24 22:38:47', '2016-11-24 23:09:41'),
(6, '', 76, 76, 3, 7, 'half-year', 'evaluator', '2016-11-24 22:38:47', '2016-11-24 22:38:50'),
(7, '', 76, 0, 3, 7, 'end-year', 'user', '2016-11-24 22:38:47', '2016-11-24 23:09:41'),
(8, '', 76, 76, 3, 7, 'end-year', 'evaluator', '2016-11-24 22:38:47', '2016-11-24 22:38:50'),
(9, '', 72, 0, 3, 7, 'half-year', 'user', '2016-11-24 23:14:04', '2016-11-24 23:47:36'),
(10, '', 72, 72, 3, 7, 'half-year', 'evaluator', '2016-11-24 23:14:04', '2016-11-24 23:14:06'),
(11, '', 72, 0, 3, 7, 'end-year', 'user', '2016-11-24 23:14:04', '2016-11-24 23:47:36'),
(12, '', 72, 72, 3, 7, 'end-year', 'evaluator', '2016-11-24 23:14:04', '2016-11-24 23:14:06');

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
  `evaluation_id` int(11) NOT NULL,
  `stage` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `entry` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `valoration_ratings`
--

INSERT INTO `valoration_ratings` (`id`, `rating`, `valoration_id`, `user_id`, `evaluator_id`, `evaluation_id`, `stage`, `entry`, `created_at`, `updated_at`) VALUES
(1, '2', 7, 73, 0, 3, 'half-year', 'user', '2016-11-18 23:51:20', '2016-11-20 18:43:08'),
(2, '0', 7, 73, 0, 3, 'half-year', 'evaluator', '2016-11-18 23:51:20', '2016-11-20 18:43:08'),
(3, '3', 7, 73, 0, 3, 'end-year', 'user', '2016-11-18 23:51:20', '2016-11-20 18:43:08'),
(4, '0', 7, 73, 0, 3, 'end-year', 'evaluator', '2016-11-18 23:51:20', '2016-11-20 18:43:08'),
(5, '0', 7, 76, 0, 3, 'half-year', 'user', '2016-11-24 22:38:50', '2016-11-24 23:09:41'),
(6, '0', 7, 76, 0, 3, 'half-year', 'evaluator', '2016-11-24 22:38:50', '2016-11-24 23:09:41'),
(7, '0', 7, 76, 0, 3, 'end-year', 'user', '2016-11-24 22:38:50', '2016-11-24 23:09:41'),
(8, '0', 7, 76, 0, 3, 'end-year', 'evaluator', '2016-11-24 22:38:50', '2016-11-24 23:09:41'),
(9, '0', 7, 72, 0, 3, 'half-year', 'user', '2016-11-24 23:14:06', '2016-11-24 23:47:36'),
(10, '0', 7, 72, 0, 3, 'half-year', 'evaluator', '2016-11-24 23:14:06', '2016-11-24 23:47:36'),
(11, '0', 7, 72, 0, 3, 'end-year', 'user', '2016-11-24 23:14:06', '2016-11-24 23:47:36'),
(12, '0', 7, 72, 0, 3, 'end-year', 'evaluator', '2016-11-24 23:14:06', '2016-11-24 23:47:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `values`
--

CREATE TABLE `values` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `rating_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `values`
--

INSERT INTO `values` (`id`, `value`, `name`, `rating_id`, `created_at`, `updated_at`) VALUES
(10, 0, '{"1":"malo","2":"bad"}', 11, '2016-11-15 17:48:43', '2016-11-15 17:55:41'),
(12, 1, '{"1":"bueno","2":"good"}', 11, '2016-11-15 17:55:41', '2016-11-15 17:55:41'),
(13, 2, '{"1":"muy bueno","2":"very good"}', 11, '2016-11-15 17:55:41', '2016-11-15 17:55:41'),
(14, 3, '{"1":"excelente","2":"excelent"}', 11, '2016-11-15 17:55:41', '2016-11-15 17:55:41');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indices de la tabla `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alerts_users`
--
ALTER TABLE `alerts_users`
  ADD PRIMARY KEY (`alert_id`,`user_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `behaviour_id` (`behaviour_id`);

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
  ADD KEY `evaluation_id` (`evaluation_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indices de la tabla `competition_comments`
--
ALTER TABLE `competition_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_id` (`evaluation_id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- Indices de la tabla `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indices de la tabla `evaluation_user_evaluators`
--
ALTER TABLE `evaluation_user_evaluators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_id` (`evaluation_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_id` (`evaluation_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indices de la tabla `objective_reviews`
--
ALTER TABLE `objective_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_id` (`evaluation_id`),
  ADD KEY `objective_id` (`objective_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `performances`
--
ALTER TABLE `performances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_id` (`evaluation_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_id` (`evaluation_id`);

--
-- Indices de la tabla `plan_areas`
--
ALTER TABLE `plan_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indices de la tabla `plan_comments`
--
ALTER TABLE `plan_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_id` (`evaluation_id`);

--
-- Indices de la tabla `plan_improvement`
--
ALTER TABLE `plan_improvement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_id` (`evaluation_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_id` (`evaluation_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `evaluation_id` (`evaluation_id`);

--
-- Indices de la tabla `tracking_actions`
--
ALTER TABLE `tracking_actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tracking_id` (`tracking_id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `client_id` (`client_id`);

--
-- Indices de la tabla `valorations`
--
ALTER TABLE `valorations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_id` (`evaluation_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indices de la tabla `valoration_comments`
--
ALTER TABLE `valoration_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluation_id` (`evaluation_id`),
  ADD KEY `valoration_id` (`valoration_id`);

--
-- Indices de la tabla `valoration_ratings`
--
ALTER TABLE `valoration_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `valoration_id` (`valoration_id`);

--
-- Indices de la tabla `values`
--
ALTER TABLE `values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rating_id` (`rating_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `behaviours`
--
ALTER TABLE `behaviours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `behaviour_ratings`
--
ALTER TABLE `behaviour_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;
--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `competition_comments`
--
ALTER TABLE `competition_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT de la tabla `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `evaluation_user_evaluators`
--
ALTER TABLE `evaluation_user_evaluators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `objectives`
--
ALTER TABLE `objectives`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;
--
-- AUTO_INCREMENT de la tabla `objective_reviews`
--
ALTER TABLE `objective_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;
--
-- AUTO_INCREMENT de la tabla `performances`
--
ALTER TABLE `performances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `plan_areas`
--
ALTER TABLE `plan_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `plan_comments`
--
ALTER TABLE `plan_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT de la tabla `plan_improvement`
--
ALTER TABLE `plan_improvement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `trackings`
--
ALTER TABLE `trackings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tracking_actions`
--
ALTER TABLE `tracking_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=602;
--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT de la tabla `valorations`
--
ALTER TABLE `valorations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `valoration_comments`
--
ALTER TABLE `valoration_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `valoration_ratings`
--
ALTER TABLE `valoration_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `values`
--
ALTER TABLE `values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actions`
--
ALTER TABLE `actions`
  ADD CONSTRAINT `actions_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `alerts_users`
--
ALTER TABLE `alerts_users`
  ADD CONSTRAINT `alerts_users_ibfk_1` FOREIGN KEY (`alert_id`) REFERENCES `alerts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `behaviours`
--
ALTER TABLE `behaviours`
  ADD CONSTRAINT `behaviours_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `behaviour_ratings`
--
ALTER TABLE `behaviour_ratings`
  ADD CONSTRAINT `behaviour_ratings_ibfk_1` FOREIGN KEY (`behaviour_id`) REFERENCES `behaviours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `competitions`
--
ALTER TABLE `competitions`
  ADD CONSTRAINT `competitions_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `competitions_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `competition_comments`
--
ALTER TABLE `competition_comments`
  ADD CONSTRAINT `competition_comments_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `competition_comments_ibfk_2` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `evaluation_user_evaluators`
--
ALTER TABLE `evaluation_user_evaluators`
  ADD CONSTRAINT `evaluation_user_evaluators_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `objectives`
--
ALTER TABLE `objectives`
  ADD CONSTRAINT `objectives_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `objectives_ibfk_3` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `objective_reviews`
--
ALTER TABLE `objective_reviews`
  ADD CONSTRAINT `objective_reviews_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `performances`
--
ALTER TABLE `performances`
  ADD CONSTRAINT `performances_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `performances_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `plans`
--
ALTER TABLE `plans`
  ADD CONSTRAINT `plans_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `plan_areas`
--
ALTER TABLE `plan_areas`
  ADD CONSTRAINT `plan_areas_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `plan_comments`
--
ALTER TABLE `plan_comments`
  ADD CONSTRAINT `plan_comments_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `plan_improvement`
--
ALTER TABLE `plan_improvement`
  ADD CONSTRAINT `plan_improvement_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `trackings`
--
ALTER TABLE `trackings`
  ADD CONSTRAINT `trackings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trackings_ibfk_2` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tracking_actions`
--
ALTER TABLE `tracking_actions`
  ADD CONSTRAINT `tracking_actions_ibfk_1` FOREIGN KEY (`tracking_id`) REFERENCES `trackings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `valorations`
--
ALTER TABLE `valorations`
  ADD CONSTRAINT `valorations_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `valorations_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `valoration_comments`
--
ALTER TABLE `valoration_comments`
  ADD CONSTRAINT `valoration_comments_ibfk_1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `valoration_comments_ibfk_2` FOREIGN KEY (`valoration_id`) REFERENCES `valorations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `valoration_ratings`
--
ALTER TABLE `valoration_ratings`
  ADD CONSTRAINT `valoration_ratings_ibfk_1` FOREIGN KEY (`valoration_id`) REFERENCES `valorations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `values`
--
ALTER TABLE `values`
  ADD CONSTRAINT `values_ibfk_1` FOREIGN KEY (`rating_id`) REFERENCES `ratings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
