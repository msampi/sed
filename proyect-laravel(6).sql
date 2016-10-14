-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 14-10-2016 a las 18:11:25
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

--
-- Volcado de datos para la tabla `actions`
--

INSERT INTO `actions` (`id`, `import_id`, `description`, `plan_id`, `created_at`, `updated_at`) VALUES
(1, 1, '{"1":"Realizar un Curso de habilidades de Comunicaci\\u00f3n"}', 1, '2016-10-11 15:40:32', '2016-10-11 15:40:32'),
(2, 2, '{"1":"Realizar un Curso de habilidades de Comunicaci\\u00f3n"}', 1, '2016-10-11 15:40:32', '2016-10-11 15:40:32'),
(3, 1, '{"1":"Participar en sesiones de trabajo entre \\u00e1reas"}', 2, '2016-10-11 15:40:32', '2016-10-11 15:40:32'),
(4, 2, '{"1":"Participar en sesiones de trabajo entre \\u00e1reas"}', 2, '2016-10-11 15:40:32', '2016-10-11 15:40:32');

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

--
-- Volcado de datos para la tabla `behaviours`
--

INSERT INTO `behaviours` (`id`, `import_id`, `description`, `competition_id`, `created_at`, `updated_at`) VALUES
(1, 1, '{"1":"Atiende a los clientes (internos y externos) de forma r\\u00e1pida y eficaz, con iniciativa y vocaci\\u00f3n continua de servicio "}', 1, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(2, 2, '{"1":"Aporta soluciones de calidad y valor a\\u00f1adido, estudiando a fondo los temas y buscando la excelencia "}', 1, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(3, 3, '{"1":"Es proactivo:  anticipa posibles obst\\u00e1culos y se adelanta a los dem\\u00e1s aportando soluciones pr\\u00e1cticas. "}', 1, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(4, 1, '{"1":"Asume y trata los proyectos en su conjunto (no como parcelas individuales) con responsabilidad \\u00fanica, organizando roles, trabajos y plazos"}', 2, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(5, 2, '{"1":"Facilita una comunicaci\\u00f3n directa y colaborativa con el equipo"}', 2, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(6, 3, '{"1":"Contribuir al objetivo del equipo, gui\\u00e1ndose por el inter\\u00e9s general, no dej\\u00e1ndose llevar por temas personales"}', 2, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(7, 1, '{"1":"Propone nuevos retos y proyectos, provocando acci\\u00f3n y movimiento en el equipo"}', 3, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(8, 2, '{"1":"Es consecuente con las decisiones tomadas y las lleva a cabo"}', 3, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(9, 3, '{"1":"Demuestra integridad al comunicar y actuar con transparencia, siendo coherente con las propias actuaciones. "}', 3, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(10, 4, '{"1":"Trata los temas profesionales con la confidencialidad debida en cada situaci\\u00f3n "}', 3, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(11, 1, '{"1":"Gestiona de forma eficiente los recursos (materiales, financieros y humanos) a su alcance para la consecuci\\u00f3n de los objetivos en tiempo y forma"}', 4, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(12, 2, '{"1":"Conoce y comprende el impacto de su actividad en el negocio y orienta su trabajo hacia niveles exigentes de calidad y rentabilidad"}', 4, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(13, 3, '{"1":"Demuestra ser proactivo y din\\u00e1mico, comprometi\\u00e9ndose en la consecuci\\u00f3n de objetivos"}', 4, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(14, 4, '{"1":"Promueve el cambio, sin aceptar el status quo"}', 4, '2016-10-11 18:40:32', '2016-10-11 18:40:32');

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

--
-- Volcado de datos para la tabla `behaviour_ratings`
--

INSERT INTO `behaviour_ratings` (`id`, `rating`, `behaviour_id`, `user_id`, `evaluator_id`, `stage`, `entry`, `created_at`, `updated_at`) VALUES
(1, '0', 1, 2, 0, 'half-year', 'user', '2016-10-12 01:15:38', '2016-10-12 01:38:36'),
(2, '0', 1, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:15:38', '2016-10-12 01:15:38'),
(3, '0', 1, 2, 0, 'end-year', 'user', '2016-10-12 01:15:38', '2016-10-12 01:38:36'),
(4, '0', 1, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:15:38', '2016-10-12 01:15:38'),
(5, '0', 2, 2, 0, 'half-year', 'user', '2016-10-12 01:15:38', '2016-10-12 01:38:36'),
(6, '0', 2, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:15:38', '2016-10-12 01:15:38'),
(7, '0', 2, 2, 0, 'end-year', 'user', '2016-10-12 01:15:38', '2016-10-12 01:38:36'),
(8, '0', 2, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:15:38', '2016-10-12 01:15:38'),
(9, '0', 3, 2, 0, 'half-year', 'user', '2016-10-12 01:15:38', '2016-10-12 01:38:36'),
(10, '0', 3, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:15:38', '2016-10-12 01:15:38'),
(11, '0', 3, 2, 0, 'end-year', 'user', '2016-10-12 01:15:38', '2016-10-12 01:38:36'),
(12, '0', 3, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:15:38', '2016-10-12 01:15:38');

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

--
-- Volcado de datos para la tabla `competitions`
--

INSERT INTO `competitions` (`id`, `import_id`, `name`, `description`, `weight`, `post_id`, `evaluation_id`, `created_at`, `updated_at`) VALUES
(1, 1, '{"1":"Orientacion al Cliente"}', '{"1":"descripcion 1"}', 10, 1, 6, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(2, 2, '{"1":"Trabajo en equipo"}', '{"1":"descripcion 2"}', 20, 2, 6, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(3, 3, '{"1":"Responsabilidad e implicaci\\u00f3n"}', '{"1":"descripcion 3"}', 40, 3, 6, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(4, 4, '{"1":"Orientaci\\u00f3n a resultados"}', '{"1":"descrricion 4"}', 50, 2, 6, '2016-10-11 18:40:32', '2016-10-11 18:40:32');

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

--
-- Volcado de datos para la tabla `competition_comments`
--

INSERT INTO `competition_comments` (`id`, `comment`, `user_id`, `evaluator_id`, `evaluation_id`, `competition_id`, `stage`, `entry`, `created_at`, `updated_at`) VALUES
(1, '', 2, 0, 6, 1, 'half-year', 'user', '2016-10-12 01:15:32', '2016-10-12 01:38:36'),
(2, '', 2, 2, 6, 1, 'half-year', 'evaluator', '2016-10-12 01:15:32', '2016-10-12 01:15:38'),
(3, '', 2, 0, 6, 1, 'end-year', 'user', '2016-10-12 01:15:32', '2016-10-12 01:38:36'),
(4, '', 2, 2, 6, 1, 'end-year', 'evaluator', '2016-10-12 01:15:32', '2016-10-12 01:15:38');

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
  `register_message_id` int(11) NOT NULL,
  `recovery_message_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluations`
--

INSERT INTO `evaluations` (`id`, `name`, `instructions`, `client_id`, `objectives_rating_id`, `competitions_rating_id`, `valorations_rating_id`, `start_year_start`, `start_year_end`, `half_year_start`, `half_year_end`, `end_year_start`, `end_year_end`, `vis_half_year_start`, `vis_half_year_end`, `vis_end_year_start`, `vis_end_year_end`, `visualization`, `welcome_message_id`, `register_message_id`, `recovery_message_id`, `created_at`, `updated_at`) VALUES
(6, 'Evaluacion People Experts', '', 4, 2, 2, 2, '2016-07-01 00:00:00', '2016-07-31 00:00:00', '2016-10-01 00:00:00', '2016-10-31 00:00:00', '2016-12-01 00:00:00', '2016-12-31 00:00:00', '2016-10-01 00:00:00', '2016-10-30 00:00:00', '2016-12-01 00:00:00', '2016-12-31 00:00:00', 1, 2, 1, 3, '2016-10-03 20:04:53', '2016-10-06 18:12:40');

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

--
-- Volcado de datos para la tabla `evaluation_user_evaluators`
--

INSERT INTO `evaluation_user_evaluators` (`id`, `evaluation_id`, `evaluator_id`, `user_id`, `status`, `post_id`, `category`, `created_at`, `updated_at`) VALUES
(2, 6, 2, 39, 0, 2, 'Gerente', '2016-10-11 15:40:32', '2016-10-11 15:42:42'),
(3, 6, 2, 37, 0, 2, '', '2016-10-11 15:42:19', '2016-10-11 15:42:19'),
(4, 6, 0, 2, 0, 1, '', '2016-10-11 15:43:10', '2016-10-11 15:43:10');

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
  `id` int(10) UNSIGNED NOT NULL,
  `import_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `evaluator_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `objectives`
--

INSERT INTO `objectives` (`id`, `import_id`, `name`, `description`, `weight`, `evaluation_id`, `post_id`, `user_id`, `evaluator_id`, `created_at`, `updated_at`) VALUES
(1, 1, '{"1":"Objetivo 1"}', '{"1":"Alcanzar un 100% de ventas del producto"}', 25, 6, 1, 0, 0, '2016-10-11 18:40:32', '2016-10-12 01:38:28'),
(2, 2, '{"1":"Objetivo 2"}', '{"1":"Maneja el programa de manera correcta"}', 0, 6, 2, 0, 0, '2016-10-11 18:40:32', '2016-10-12 01:38:28'),
(3, 3, '{"1":"Objetivo 3"}', '{"1":"Maneja el equipo de manera correcta"}', 0, 6, 3, 0, 0, '2016-10-11 18:40:32', '2016-10-12 01:38:28');

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

--
-- Volcado de datos para la tabla `objective_reviews`
--

INSERT INTO `objective_reviews` (`id`, `description`, `rating`, `evaluation_id`, `objective_id`, `user_id`, `stage`, `entry`, `created_at`, `updated_at`) VALUES
(1, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:35:54', '2016-10-12 01:35:54'),
(2, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:35:54', '2016-10-12 01:35:54'),
(3, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:35:54', '2016-10-12 01:35:54'),
(4, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:35:54', '2016-10-12 01:35:54'),
(5, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:35:54', '2016-10-12 01:35:54'),
(6, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:35:54', '2016-10-12 01:35:54'),
(7, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:35:54', '2016-10-12 01:35:54'),
(8, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:35:54', '2016-10-12 01:35:54'),
(9, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:35:54', '2016-10-12 01:35:54'),
(10, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:35:54', '2016-10-12 01:35:54'),
(11, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:35:54', '2016-10-12 01:35:54'),
(12, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:35:54', '2016-10-12 01:35:54'),
(13, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:36:04', '2016-10-12 01:36:04'),
(14, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:36:04', '2016-10-12 01:36:04'),
(15, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:36:04', '2016-10-12 01:36:04'),
(16, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:36:04', '2016-10-12 01:36:04'),
(17, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:36:04', '2016-10-12 01:36:04'),
(18, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:36:04', '2016-10-12 01:36:04'),
(19, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:36:04', '2016-10-12 01:36:04'),
(20, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:36:04', '2016-10-12 01:36:04'),
(21, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:36:04', '2016-10-12 01:36:04'),
(22, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:36:04', '2016-10-12 01:36:04'),
(23, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:36:04', '2016-10-12 01:36:04'),
(24, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:36:04', '2016-10-12 01:36:04'),
(25, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:36:14', '2016-10-12 01:36:14'),
(26, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:36:14', '2016-10-12 01:36:14'),
(27, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:36:14', '2016-10-12 01:36:14'),
(28, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:36:14', '2016-10-12 01:36:14'),
(29, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:36:14', '2016-10-12 01:36:14'),
(30, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:36:14', '2016-10-12 01:36:14'),
(31, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:36:14', '2016-10-12 01:36:14'),
(32, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:36:14', '2016-10-12 01:36:14'),
(33, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:36:14', '2016-10-12 01:36:14'),
(34, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:36:14', '2016-10-12 01:36:14'),
(35, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:36:14', '2016-10-12 01:36:14'),
(36, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:36:14', '2016-10-12 01:36:14'),
(37, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:36:24', '2016-10-12 01:36:24'),
(38, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:36:24', '2016-10-12 01:36:24'),
(39, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:36:24', '2016-10-12 01:36:24'),
(40, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:36:24', '2016-10-12 01:36:24'),
(41, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:36:24', '2016-10-12 01:36:24'),
(42, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:36:24', '2016-10-12 01:36:24'),
(43, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:36:24', '2016-10-12 01:36:24'),
(44, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:36:24', '2016-10-12 01:36:24'),
(45, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:36:24', '2016-10-12 01:36:24'),
(46, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:36:24', '2016-10-12 01:36:24'),
(47, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:36:24', '2016-10-12 01:36:24'),
(48, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:36:24', '2016-10-12 01:36:24'),
(49, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:36:34', '2016-10-12 01:36:34'),
(50, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:36:34', '2016-10-12 01:36:34'),
(51, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:36:34', '2016-10-12 01:36:34'),
(52, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:36:34', '2016-10-12 01:36:34'),
(53, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:36:34', '2016-10-12 01:36:34'),
(54, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:36:34', '2016-10-12 01:36:34'),
(55, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:36:34', '2016-10-12 01:36:34'),
(56, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:36:34', '2016-10-12 01:36:34'),
(57, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:36:34', '2016-10-12 01:36:34'),
(58, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:36:34', '2016-10-12 01:36:34'),
(59, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:36:34', '2016-10-12 01:36:34'),
(60, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:36:34', '2016-10-12 01:36:34'),
(61, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:36:44', '2016-10-12 01:36:44'),
(62, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:36:44', '2016-10-12 01:36:44'),
(63, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:36:44', '2016-10-12 01:36:44'),
(64, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:36:44', '2016-10-12 01:36:44'),
(65, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:36:44', '2016-10-12 01:36:44'),
(66, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:36:44', '2016-10-12 01:36:44'),
(67, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:36:44', '2016-10-12 01:36:44'),
(68, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:36:44', '2016-10-12 01:36:44'),
(69, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:36:44', '2016-10-12 01:36:44'),
(70, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:36:44', '2016-10-12 01:36:44'),
(71, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:36:44', '2016-10-12 01:36:44'),
(72, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:36:44', '2016-10-12 01:36:44'),
(73, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:37:02', '2016-10-12 01:37:02'),
(74, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:37:02', '2016-10-12 01:37:02'),
(75, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:37:02', '2016-10-12 01:37:02'),
(76, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:37:02', '2016-10-12 01:37:02'),
(77, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:37:02', '2016-10-12 01:37:02'),
(78, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:37:02', '2016-10-12 01:37:02'),
(79, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:37:02', '2016-10-12 01:37:02'),
(80, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:37:02', '2016-10-12 01:37:02'),
(81, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:37:02', '2016-10-12 01:37:02'),
(82, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:37:02', '2016-10-12 01:37:02'),
(83, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:37:02', '2016-10-12 01:37:02'),
(84, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:37:02', '2016-10-12 01:37:02'),
(85, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:37:07', '2016-10-12 01:37:07'),
(86, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:37:07', '2016-10-12 01:37:07'),
(87, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:37:07', '2016-10-12 01:37:07'),
(88, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:37:07', '2016-10-12 01:37:07'),
(89, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:37:07', '2016-10-12 01:37:07'),
(90, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:37:07', '2016-10-12 01:37:07'),
(91, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:37:07', '2016-10-12 01:37:07'),
(92, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:37:07', '2016-10-12 01:37:07'),
(93, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:37:07', '2016-10-12 01:37:07'),
(94, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:37:07', '2016-10-12 01:37:07'),
(95, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:37:07', '2016-10-12 01:37:07'),
(96, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:37:07', '2016-10-12 01:37:07'),
(97, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:37:19', '2016-10-12 01:37:19'),
(98, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:37:19', '2016-10-12 01:37:19'),
(99, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:37:19', '2016-10-12 01:37:19'),
(100, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:37:19', '2016-10-12 01:37:19'),
(101, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:37:19', '2016-10-12 01:37:19'),
(102, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:37:19', '2016-10-12 01:37:19'),
(103, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:37:19', '2016-10-12 01:37:19'),
(104, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:37:19', '2016-10-12 01:37:19'),
(105, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:37:19', '2016-10-12 01:37:19'),
(106, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:37:19', '2016-10-12 01:37:19'),
(107, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:37:19', '2016-10-12 01:37:19'),
(108, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:37:19', '2016-10-12 01:37:19'),
(109, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:37:24', '2016-10-12 01:37:24'),
(110, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:37:24', '2016-10-12 01:37:24'),
(111, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:37:24', '2016-10-12 01:37:24'),
(112, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:37:24', '2016-10-12 01:37:24'),
(113, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:37:24', '2016-10-12 01:37:24'),
(114, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:37:24', '2016-10-12 01:37:24'),
(115, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:37:24', '2016-10-12 01:37:24'),
(116, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:37:24', '2016-10-12 01:37:24'),
(117, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:37:24', '2016-10-12 01:37:24'),
(118, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:37:24', '2016-10-12 01:37:24'),
(119, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:37:24', '2016-10-12 01:37:24'),
(120, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:37:24', '2016-10-12 01:37:24'),
(121, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:37:36', '2016-10-12 01:37:36'),
(122, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:37:36', '2016-10-12 01:37:36'),
(123, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:37:36', '2016-10-12 01:37:36'),
(124, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:37:36', '2016-10-12 01:37:36'),
(125, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:37:36', '2016-10-12 01:37:36'),
(126, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:37:36', '2016-10-12 01:37:36'),
(127, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:37:36', '2016-10-12 01:37:36'),
(128, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:37:36', '2016-10-12 01:37:36'),
(129, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:37:36', '2016-10-12 01:37:36'),
(130, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:37:36', '2016-10-12 01:37:36'),
(131, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:37:36', '2016-10-12 01:37:36'),
(132, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:37:36', '2016-10-12 01:37:36'),
(133, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:37:46', '2016-10-12 01:37:46'),
(134, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:37:46', '2016-10-12 01:37:46'),
(135, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:37:46', '2016-10-12 01:37:46'),
(136, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:37:46', '2016-10-12 01:37:46'),
(137, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:37:46', '2016-10-12 01:37:46'),
(138, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:37:46', '2016-10-12 01:37:46'),
(139, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:37:46', '2016-10-12 01:37:46'),
(140, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:37:46', '2016-10-12 01:37:46'),
(141, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:37:46', '2016-10-12 01:37:46'),
(142, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:37:46', '2016-10-12 01:37:46'),
(143, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:37:46', '2016-10-12 01:37:46'),
(144, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:37:46', '2016-10-12 01:37:46'),
(145, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:37:58', '2016-10-12 01:37:58'),
(146, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:37:58', '2016-10-12 01:37:58'),
(147, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:37:58', '2016-10-12 01:37:58'),
(148, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:37:58', '2016-10-12 01:37:58'),
(149, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:37:58', '2016-10-12 01:37:58'),
(150, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:37:58', '2016-10-12 01:37:58'),
(151, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:37:58', '2016-10-12 01:37:58'),
(152, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:37:58', '2016-10-12 01:37:58'),
(153, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:37:58', '2016-10-12 01:37:58'),
(154, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:37:58', '2016-10-12 01:37:58'),
(155, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:37:58', '2016-10-12 01:37:58'),
(156, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:37:58', '2016-10-12 01:37:58'),
(157, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:38:12', '2016-10-12 01:38:12'),
(158, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:38:12', '2016-10-12 01:38:12'),
(159, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:38:12', '2016-10-12 01:38:12'),
(160, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:38:12', '2016-10-12 01:38:12'),
(161, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:38:12', '2016-10-12 01:38:12'),
(162, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:38:12', '2016-10-12 01:38:12'),
(163, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:38:12', '2016-10-12 01:38:12'),
(164, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:38:12', '2016-10-12 01:38:12'),
(165, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:38:12', '2016-10-12 01:38:12'),
(166, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:38:12', '2016-10-12 01:38:12'),
(167, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:38:12', '2016-10-12 01:38:12'),
(168, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:38:12', '2016-10-12 01:38:12'),
(169, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:38:15', '2016-10-12 01:38:15'),
(170, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:38:15', '2016-10-12 01:38:15'),
(171, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:38:15', '2016-10-12 01:38:15'),
(172, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:38:15', '2016-10-12 01:38:15'),
(173, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:38:15', '2016-10-12 01:38:15'),
(174, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:38:15', '2016-10-12 01:38:15'),
(175, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:38:15', '2016-10-12 01:38:15'),
(176, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:38:15', '2016-10-12 01:38:15'),
(177, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:38:15', '2016-10-12 01:38:15'),
(178, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:38:15', '2016-10-12 01:38:15'),
(179, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:38:15', '2016-10-12 01:38:15'),
(180, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:38:15', '2016-10-12 01:38:15'),
(181, '', '0', 6, 1, 2, 'half-year', 'user', '2016-10-12 01:38:28', '2016-10-12 01:38:28'),
(182, '', '0', 6, 1, 2, 'end-year', 'user', '2016-10-12 01:38:28', '2016-10-12 01:38:28'),
(183, '', '0', 6, 1, 2, 'half-year', 'evaluator', '2016-10-12 01:38:28', '2016-10-12 01:38:28'),
(184, '', '0', 6, 1, 2, 'end-year', 'evaluator', '2016-10-12 01:38:28', '2016-10-12 01:38:28'),
(185, '', '0', 6, 2, 2, 'half-year', 'user', '2016-10-12 01:38:28', '2016-10-12 01:38:28'),
(186, '', '0', 6, 2, 2, 'end-year', 'user', '2016-10-12 01:38:28', '2016-10-12 01:38:28'),
(187, '', '0', 6, 2, 2, 'half-year', 'evaluator', '2016-10-12 01:38:28', '2016-10-12 01:38:28'),
(188, '', '0', 6, 2, 2, 'end-year', 'evaluator', '2016-10-12 01:38:28', '2016-10-12 01:38:28'),
(189, '', '0', 6, 3, 2, 'half-year', 'user', '2016-10-12 01:38:28', '2016-10-12 01:38:28'),
(190, '', '0', 6, 3, 2, 'end-year', 'user', '2016-10-12 01:38:28', '2016-10-12 01:38:28'),
(191, '', '0', 6, 3, 2, 'half-year', 'evaluator', '2016-10-12 01:38:28', '2016-10-12 01:38:28'),
(192, '', '0', 6, 3, 2, 'end-year', 'evaluator', '2016-10-12 01:38:28', '2016-10-12 01:38:28'),
(193, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:38:50', '2016-10-12 01:38:50'),
(194, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:38:50', '2016-10-12 01:38:50'),
(195, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:38:50', '2016-10-12 01:38:50'),
(196, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:38:50', '2016-10-12 01:38:50'),
(197, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:39:01', '2016-10-12 01:39:01'),
(198, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:39:01', '2016-10-12 01:39:01'),
(199, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:39:01', '2016-10-12 01:39:01'),
(200, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:39:01', '2016-10-12 01:39:01'),
(201, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:39:10', '2016-10-12 01:39:10'),
(202, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:39:10', '2016-10-12 01:39:10'),
(203, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:39:11', '2016-10-12 01:39:11'),
(204, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:39:11', '2016-10-12 01:39:11'),
(205, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:39:20', '2016-10-12 01:39:20'),
(206, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:39:20', '2016-10-12 01:39:20'),
(207, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:39:20', '2016-10-12 01:39:20'),
(208, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:39:20', '2016-10-12 01:39:20'),
(209, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:39:30', '2016-10-12 01:39:30'),
(210, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:39:30', '2016-10-12 01:39:30'),
(211, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:39:30', '2016-10-12 01:39:30'),
(212, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:39:30', '2016-10-12 01:39:30'),
(213, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:39:43', '2016-10-12 01:39:43'),
(214, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:39:43', '2016-10-12 01:39:43'),
(215, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:39:43', '2016-10-12 01:39:43'),
(216, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:39:43', '2016-10-12 01:39:43'),
(217, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:39:50', '2016-10-12 01:39:50'),
(218, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:39:50', '2016-10-12 01:39:50'),
(219, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:39:50', '2016-10-12 01:39:50'),
(220, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:39:50', '2016-10-12 01:39:50'),
(221, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:40:00', '2016-10-12 01:40:00'),
(222, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:40:00', '2016-10-12 01:40:00'),
(223, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:40:00', '2016-10-12 01:40:00'),
(224, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:40:00', '2016-10-12 01:40:00'),
(225, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:40:11', '2016-10-12 01:40:11'),
(226, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:40:11', '2016-10-12 01:40:11'),
(227, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:40:11', '2016-10-12 01:40:11'),
(228, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:40:11', '2016-10-12 01:40:11'),
(229, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:40:20', '2016-10-12 01:40:20'),
(230, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:40:20', '2016-10-12 01:40:20'),
(231, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:40:20', '2016-10-12 01:40:20'),
(232, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:40:20', '2016-10-12 01:40:20'),
(233, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:40:30', '2016-10-12 01:40:30'),
(234, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:40:30', '2016-10-12 01:40:30'),
(235, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:40:30', '2016-10-12 01:40:30'),
(236, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:40:30', '2016-10-12 01:40:30'),
(237, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:40:41', '2016-10-12 01:40:41'),
(238, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:40:41', '2016-10-12 01:40:41'),
(239, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:40:41', '2016-10-12 01:40:41'),
(240, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:40:41', '2016-10-12 01:40:41'),
(241, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:40:50', '2016-10-12 01:40:50'),
(242, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:40:50', '2016-10-12 01:40:50'),
(243, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:40:50', '2016-10-12 01:40:50'),
(244, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:40:50', '2016-10-12 01:40:50'),
(245, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:41:00', '2016-10-12 01:41:00'),
(246, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:41:00', '2016-10-12 01:41:00'),
(247, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:41:00', '2016-10-12 01:41:00'),
(248, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:41:00', '2016-10-12 01:41:00'),
(249, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:41:10', '2016-10-12 01:41:10'),
(250, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:41:10', '2016-10-12 01:41:10'),
(251, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:41:10', '2016-10-12 01:41:10'),
(252, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:41:10', '2016-10-12 01:41:10'),
(253, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:41:20', '2016-10-12 01:41:20'),
(254, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:41:20', '2016-10-12 01:41:20'),
(255, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:41:20', '2016-10-12 01:41:20'),
(256, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:41:20', '2016-10-12 01:41:20'),
(257, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:41:37', '2016-10-12 01:41:37'),
(258, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:41:37', '2016-10-12 01:41:37'),
(259, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:41:37', '2016-10-12 01:41:37'),
(260, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:41:37', '2016-10-12 01:41:37'),
(261, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:41:40', '2016-10-12 01:41:40'),
(262, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:41:40', '2016-10-12 01:41:40'),
(263, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:41:40', '2016-10-12 01:41:40'),
(264, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:41:40', '2016-10-12 01:41:40'),
(265, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:41:50', '2016-10-12 01:41:50'),
(266, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:41:50', '2016-10-12 01:41:50'),
(267, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:41:50', '2016-10-12 01:41:50'),
(268, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:41:50', '2016-10-12 01:41:50'),
(269, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:42:00', '2016-10-12 01:42:00'),
(270, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:42:00', '2016-10-12 01:42:00'),
(271, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:42:00', '2016-10-12 01:42:00'),
(272, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:42:00', '2016-10-12 01:42:00'),
(273, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:42:10', '2016-10-12 01:42:10'),
(274, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:42:10', '2016-10-12 01:42:10'),
(275, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:42:10', '2016-10-12 01:42:10'),
(276, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:42:10', '2016-10-12 01:42:10'),
(277, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:42:20', '2016-10-12 01:42:20'),
(278, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:42:20', '2016-10-12 01:42:20'),
(279, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:42:20', '2016-10-12 01:42:20'),
(280, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:42:20', '2016-10-12 01:42:20'),
(281, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:42:30', '2016-10-12 01:42:30'),
(282, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:42:30', '2016-10-12 01:42:30'),
(283, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:42:30', '2016-10-12 01:42:30'),
(284, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:42:30', '2016-10-12 01:42:30'),
(285, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:42:40', '2016-10-12 01:42:40'),
(286, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:42:40', '2016-10-12 01:42:40'),
(287, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:42:40', '2016-10-12 01:42:40'),
(288, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:42:40', '2016-10-12 01:42:40'),
(289, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:42:50', '2016-10-12 01:42:50'),
(290, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:42:50', '2016-10-12 01:42:50'),
(291, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:42:50', '2016-10-12 01:42:50'),
(292, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:42:50', '2016-10-12 01:42:50'),
(293, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:43:00', '2016-10-12 01:43:00'),
(294, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:43:00', '2016-10-12 01:43:00'),
(295, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:43:00', '2016-10-12 01:43:00'),
(296, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:43:00', '2016-10-12 01:43:00'),
(297, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:43:10', '2016-10-12 01:43:10'),
(298, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:43:10', '2016-10-12 01:43:10'),
(299, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:43:10', '2016-10-12 01:43:10'),
(300, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:43:10', '2016-10-12 01:43:10'),
(301, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:43:20', '2016-10-12 01:43:20'),
(302, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:43:20', '2016-10-12 01:43:20'),
(303, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:43:20', '2016-10-12 01:43:20'),
(304, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:43:20', '2016-10-12 01:43:20'),
(305, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:43:30', '2016-10-12 01:43:30'),
(306, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:43:30', '2016-10-12 01:43:30'),
(307, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:43:30', '2016-10-12 01:43:30'),
(308, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:43:30', '2016-10-12 01:43:30'),
(309, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:43:40', '2016-10-12 01:43:40'),
(310, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:43:40', '2016-10-12 01:43:40'),
(311, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:43:40', '2016-10-12 01:43:40'),
(312, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:43:40', '2016-10-12 01:43:40'),
(313, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:43:50', '2016-10-12 01:43:50'),
(314, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:43:50', '2016-10-12 01:43:50'),
(315, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:43:50', '2016-10-12 01:43:50'),
(316, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:43:50', '2016-10-12 01:43:50'),
(317, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:44:00', '2016-10-12 01:44:00'),
(318, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:44:00', '2016-10-12 01:44:00'),
(319, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:44:00', '2016-10-12 01:44:00'),
(320, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:44:00', '2016-10-12 01:44:00'),
(321, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:44:10', '2016-10-12 01:44:10'),
(322, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:44:10', '2016-10-12 01:44:10'),
(323, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:44:10', '2016-10-12 01:44:10'),
(324, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:44:10', '2016-10-12 01:44:10'),
(325, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:44:20', '2016-10-12 01:44:20'),
(326, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:44:20', '2016-10-12 01:44:20'),
(327, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:44:20', '2016-10-12 01:44:20'),
(328, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:44:20', '2016-10-12 01:44:20'),
(329, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:44:30', '2016-10-12 01:44:30'),
(330, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:44:30', '2016-10-12 01:44:30'),
(331, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:44:30', '2016-10-12 01:44:30'),
(332, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:44:30', '2016-10-12 01:44:30'),
(333, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:44:46', '2016-10-12 01:44:46'),
(334, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:44:46', '2016-10-12 01:44:46'),
(335, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:44:47', '2016-10-12 01:44:47'),
(336, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:44:47', '2016-10-12 01:44:47'),
(337, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:44:50', '2016-10-12 01:44:50'),
(338, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:44:50', '2016-10-12 01:44:50'),
(339, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:44:50', '2016-10-12 01:44:50'),
(340, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:44:50', '2016-10-12 01:44:50'),
(341, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:45:00', '2016-10-12 01:45:00'),
(342, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:45:00', '2016-10-12 01:45:00'),
(343, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:45:00', '2016-10-12 01:45:00'),
(344, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:45:00', '2016-10-12 01:45:00'),
(345, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:45:10', '2016-10-12 01:45:10'),
(346, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:45:10', '2016-10-12 01:45:10'),
(347, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:45:10', '2016-10-12 01:45:10'),
(348, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:45:10', '2016-10-12 01:45:10'),
(349, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:45:20', '2016-10-12 01:45:20'),
(350, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:45:20', '2016-10-12 01:45:20'),
(351, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:45:20', '2016-10-12 01:45:20'),
(352, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:45:20', '2016-10-12 01:45:20'),
(353, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:45:30', '2016-10-12 01:45:30'),
(354, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:45:30', '2016-10-12 01:45:30'),
(355, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:45:30', '2016-10-12 01:45:30'),
(356, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:45:30', '2016-10-12 01:45:30'),
(357, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:45:40', '2016-10-12 01:45:40'),
(358, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:45:40', '2016-10-12 01:45:40'),
(359, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:45:40', '2016-10-12 01:45:40'),
(360, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:45:40', '2016-10-12 01:45:40'),
(361, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:45:50', '2016-10-12 01:45:50'),
(362, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:45:50', '2016-10-12 01:45:50'),
(363, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:45:50', '2016-10-12 01:45:50'),
(364, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:45:50', '2016-10-12 01:45:50'),
(365, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:46:00', '2016-10-12 01:46:00'),
(366, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:46:00', '2016-10-12 01:46:00'),
(367, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:46:00', '2016-10-12 01:46:00'),
(368, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:46:00', '2016-10-12 01:46:00'),
(369, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:46:10', '2016-10-12 01:46:10'),
(370, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:46:10', '2016-10-12 01:46:10'),
(371, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:46:10', '2016-10-12 01:46:10'),
(372, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:46:10', '2016-10-12 01:46:10'),
(373, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:46:20', '2016-10-12 01:46:20'),
(374, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:46:20', '2016-10-12 01:46:20'),
(375, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:46:20', '2016-10-12 01:46:20'),
(376, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:46:20', '2016-10-12 01:46:20'),
(377, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:46:30', '2016-10-12 01:46:30'),
(378, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:46:30', '2016-10-12 01:46:30'),
(379, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:46:30', '2016-10-12 01:46:30'),
(380, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:46:30', '2016-10-12 01:46:30'),
(381, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:46:40', '2016-10-12 01:46:40'),
(382, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:46:40', '2016-10-12 01:46:40'),
(383, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:46:40', '2016-10-12 01:46:40'),
(384, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:46:40', '2016-10-12 01:46:40'),
(385, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:46:50', '2016-10-12 01:46:50'),
(386, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:46:50', '2016-10-12 01:46:50'),
(387, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:46:50', '2016-10-12 01:46:50'),
(388, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:46:50', '2016-10-12 01:46:50'),
(389, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:47:00', '2016-10-12 01:47:00'),
(390, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:47:00', '2016-10-12 01:47:00'),
(391, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:47:00', '2016-10-12 01:47:00'),
(392, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:47:00', '2016-10-12 01:47:00'),
(393, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:47:10', '2016-10-12 01:47:10'),
(394, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:47:10', '2016-10-12 01:47:10'),
(395, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:47:10', '2016-10-12 01:47:10'),
(396, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:47:10', '2016-10-12 01:47:10'),
(397, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:47:20', '2016-10-12 01:47:20'),
(398, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:47:20', '2016-10-12 01:47:20'),
(399, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:47:20', '2016-10-12 01:47:20'),
(400, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:47:20', '2016-10-12 01:47:20'),
(401, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:47:30', '2016-10-12 01:47:30'),
(402, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:47:30', '2016-10-12 01:47:30'),
(403, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:47:30', '2016-10-12 01:47:30'),
(404, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:47:30', '2016-10-12 01:47:30'),
(405, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:47:40', '2016-10-12 01:47:40'),
(406, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:47:40', '2016-10-12 01:47:40'),
(407, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:47:40', '2016-10-12 01:47:40'),
(408, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:47:40', '2016-10-12 01:47:40'),
(409, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:47:50', '2016-10-12 01:47:50'),
(410, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:47:50', '2016-10-12 01:47:50'),
(411, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:47:50', '2016-10-12 01:47:50'),
(412, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:47:50', '2016-10-12 01:47:50'),
(413, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:48:00', '2016-10-12 01:48:00'),
(414, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:48:00', '2016-10-12 01:48:00'),
(415, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:48:00', '2016-10-12 01:48:00'),
(416, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:48:00', '2016-10-12 01:48:00'),
(417, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:48:10', '2016-10-12 01:48:10'),
(418, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:48:10', '2016-10-12 01:48:10'),
(419, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:48:10', '2016-10-12 01:48:10'),
(420, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:48:10', '2016-10-12 01:48:10'),
(421, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:48:20', '2016-10-12 01:48:20'),
(422, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:48:20', '2016-10-12 01:48:20'),
(423, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:48:20', '2016-10-12 01:48:20'),
(424, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:48:20', '2016-10-12 01:48:20'),
(425, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:48:30', '2016-10-12 01:48:30'),
(426, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:48:30', '2016-10-12 01:48:30'),
(427, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:48:30', '2016-10-12 01:48:30'),
(428, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:48:30', '2016-10-12 01:48:30'),
(429, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:48:40', '2016-10-12 01:48:40'),
(430, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:48:40', '2016-10-12 01:48:40'),
(431, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:48:40', '2016-10-12 01:48:40'),
(432, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:48:40', '2016-10-12 01:48:40'),
(433, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:48:50', '2016-10-12 01:48:50'),
(434, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:48:50', '2016-10-12 01:48:50'),
(435, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:48:50', '2016-10-12 01:48:50'),
(436, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:48:50', '2016-10-12 01:48:50'),
(437, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:49:00', '2016-10-12 01:49:00'),
(438, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:49:00', '2016-10-12 01:49:00'),
(439, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:49:00', '2016-10-12 01:49:00'),
(440, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:49:00', '2016-10-12 01:49:00'),
(441, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:49:10', '2016-10-12 01:49:10'),
(442, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:49:10', '2016-10-12 01:49:10'),
(443, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:49:10', '2016-10-12 01:49:10'),
(444, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:49:10', '2016-10-12 01:49:10'),
(445, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:49:20', '2016-10-12 01:49:20'),
(446, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:49:20', '2016-10-12 01:49:20'),
(447, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:49:20', '2016-10-12 01:49:20'),
(448, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:49:20', '2016-10-12 01:49:20'),
(449, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:49:30', '2016-10-12 01:49:30'),
(450, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:49:30', '2016-10-12 01:49:30'),
(451, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:49:30', '2016-10-12 01:49:30'),
(452, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:49:30', '2016-10-12 01:49:30'),
(453, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:49:40', '2016-10-12 01:49:40'),
(454, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:49:40', '2016-10-12 01:49:40'),
(455, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:49:40', '2016-10-12 01:49:40'),
(456, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:49:40', '2016-10-12 01:49:40'),
(457, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:49:50', '2016-10-12 01:49:50'),
(458, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:49:50', '2016-10-12 01:49:50'),
(459, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:49:50', '2016-10-12 01:49:50'),
(460, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:49:50', '2016-10-12 01:49:50'),
(461, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:50:00', '2016-10-12 01:50:00'),
(462, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:50:00', '2016-10-12 01:50:00'),
(463, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:50:00', '2016-10-12 01:50:00'),
(464, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:50:00', '2016-10-12 01:50:00'),
(465, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:50:10', '2016-10-12 01:50:10'),
(466, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:50:10', '2016-10-12 01:50:10'),
(467, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:50:10', '2016-10-12 01:50:10'),
(468, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:50:10', '2016-10-12 01:50:10'),
(469, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:50:20', '2016-10-12 01:50:20'),
(470, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:50:20', '2016-10-12 01:50:20'),
(471, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:50:20', '2016-10-12 01:50:20'),
(472, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:50:20', '2016-10-12 01:50:20'),
(473, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:50:30', '2016-10-12 01:50:30'),
(474, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:50:30', '2016-10-12 01:50:30'),
(475, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:50:30', '2016-10-12 01:50:30'),
(476, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:50:30', '2016-10-12 01:50:30'),
(477, '', '0', 6, 2, 37, 'half-year', 'user', '2016-10-12 01:50:40', '2016-10-12 01:50:40'),
(478, '', '0', 6, 2, 37, 'end-year', 'user', '2016-10-12 01:50:40', '2016-10-12 01:50:40'),
(479, '', '0', 6, 2, 37, 'half-year', 'evaluator', '2016-10-12 01:50:40', '2016-10-12 01:50:40'),
(480, '', '0', 6, 2, 37, 'end-year', 'evaluator', '2016-10-12 01:50:40', '2016-10-12 01:50:40');

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
-- Estructura de tabla para la tabla `performances`
--

CREATE TABLE `performances` (
  `id` int(11) NOT NULL,
  `user_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `evaluator_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `user_agree` tinyint(4) NOT NULL,
  `evaluator_agree` tinyint(4) NOT NULL,
  `user_final_score` int(11) NOT NULL,
  `evaluator_final_score` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluator_id` int(11) NOT NULL,
  `finish_user` tinyint(4) NOT NULL,
  `finish_evaluator` tinyint(4) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

--
-- Volcado de datos para la tabla `plans`
--

INSERT INTO `plans` (`id`, `import_id`, `name`, `evaluation_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 1, '{"1":"Orientaci\\u00f3n al cliente"}', 6, 1, '2016-10-11 15:40:32', '2016-10-11 15:40:32'),
(2, 2, '{"1":"Trabajo en equipo"}', 6, 2, '2016-10-11 15:40:32', '2016-10-11 15:40:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_areas`
--

CREATE TABLE `plan_areas` (
  `id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `stage` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
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
(1, 1, '{"1":"Director General"}', 6, 4, '2016-10-11 18:40:30', '2016-10-11 18:40:30'),
(2, 2, '{"1":"Director"}', 6, 4, '2016-10-11 18:40:30', '2016-10-11 18:40:30'),
(3, 3, '{"1":"Secretario"}', 6, 4, '2016-10-11 18:40:30', '2016-10-11 18:40:30');

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
  `user_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `trackings`
--

INSERT INTO `trackings` (`id`, `user_id`, `evaluation_id`, `client_id`, `created_at`, `updated_at`) VALUES
(3, 2, 6, 4, '2016-10-11 15:55:52', '2016-10-11 15:55:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tracking_actions`
--

CREATE TABLE `tracking_actions` (
  `id` int(11) NOT NULL,
  `tracking_id` int(11) NOT NULL,
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
(268, 3, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-10-12 16:36:36', '2016-10-12 16:36:36'),
(269, 3, 'firefox', '', '::1', '{"1":"Ingreso a listado de usuarios"}', '2016-10-12 16:36:38', '2016-10-12 16:36:38'),
(270, 3, 'firefox', '', '::1', '{"1":"Ingreso a valores"}', '2016-10-12 16:36:39', '2016-10-12 16:36:39'),
(271, 3, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-10-12 16:36:41', '2016-10-12 16:36:41'),
(272, 3, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-10-12 17:52:42', '2016-10-12 17:52:42'),
(273, 3, 'firefox', '', '::1', '{"1":"Ingreso a competencias"}', '2016-10-12 17:52:44', '2016-10-12 17:52:44'),
(274, 3, 'firefox', '', '::1', '{"1":"Salida del sistema"}', '2016-10-12 17:52:47', '2016-10-12 17:52:47'),
(275, 3, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-10-12 22:18:24', '2016-10-12 22:18:24'),
(276, 3, 'firefox', '', '::1', '{"1":"Ingreso a objetivos"}', '2016-10-12 22:47:30', '2016-10-12 22:47:30'),
(277, 3, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-10-13 18:39:11', '2016-10-13 18:39:11'),
(278, 3, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-10-13 18:45:27', '2016-10-13 18:45:27'),
(279, 3, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-10-13 18:59:02', '2016-10-13 18:59:02'),
(280, 3, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-10-13 22:30:51', '2016-10-13 22:30:51'),
(281, 3, 'firefox', '', '::1', '{"1":"Ingreso al sistema"}', '2016-10-14 16:10:18', '2016-10-14 16:10:18');

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
  `register_message_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `password`, `dni`, `remember_token`, `client_id`, `code`, `role_id`, `language_id`, `image`, `country`, `city`, `area`, `department`, `register_message_id`, `created_at`, `updated_at`) VALUES
(2, 'Patricio', 'Godoy Lastra', 'pgodoy@centromultimedia.com.ar', '$2y$10$BN3V4y23SA5wq1mr.cm/LOtS4MYKvaNYvCew0FN9ZcogeaC1WhenG', '25141390', '15VUaHJtVMuoBoAopBz2I5NC1BTV9VS6vIt7BQWl4YR2xDvgpq4ISw0ZOX99', 4, '245159', 3, 1, '', 'Argentina', 'Capital Federal', '223', 'dep', 0, '2016-05-22 04:23:31', '2016-10-12 20:52:47'),
(31, 'Superadmin', 'Superadmin', 'superadmin@superadmin.com', '$2a$04$KESIUGZkNuMzn37XuoYdPu4w.rrCHTO.f8zFf65k59SwqZK6owcbi', '29141390', 'ZFMol2oXuoL5N7v7YPKYYTco8IezQw8fB4E6u8gu5wjpNtYxFMXaYczIpeRX', 0, '245158', 1, 1, '', 'AR', 'Tandil', '223', 'dep', 0, '2016-05-22 04:23:31', '2016-10-12 20:52:36'),
(36, 'Admin', 'Cliente', 'admin@admin.com', '$2a$04$KESIUGZkNuMzn37XuoYdPu4w.rrCHTO.f8zFf65k59SwqZK6owcbi', '29141390', '7PJqRekYc6cAVSMvKcbR1G3jtuu5nGPZmvpvNeGb64mvHLxSkxbBDeX5LQDn', 4, '255159', 2, 1, '', 'AR', 'Tandil', '223', 'dep', 0, '2016-05-22 04:23:31', '2016-10-04 19:18:49'),
(37, 'Jose', 'Ramirez', 'jramirez@gmail.com', '$2y$10$2xgb3gwu6Lh56F7kC.PNBesMYaB.j9qdHlLHflf2pmK2KnhgN5t42', '214334', NULL, 4, '12345', 3, 1, NULL, 'Argentina', 'Buenos Aires', 'Capital', NULL, 0, '2016-10-11 18:40:31', '2016-10-11 18:40:31'),
(38, NULL, NULL, 'jfarihgfhgas@gmail.com', NULL, NULL, NULL, 0, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2016-10-11 18:40:31', '2016-10-11 18:40:31'),
(39, 'Jorge', 'Farias', 'jfarias@gmail.com', '$2y$10$nCccaFfDSk7jiWCO718ayuZO48J6UqI7JhmeonZsm3SUT0kBbwcxW', '7236647', NULL, 4, '2345', 3, 1, NULL, 'Argentina', 'Buenos Aires', 'Buenos Aires', NULL, 0, '2016-10-11 18:40:32', '2016-10-11 18:40:32');

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

--
-- Volcado de datos para la tabla `valorations`
--

INSERT INTO `valorations` (`id`, `import_id`, `name`, `description`, `weight`, `post_id`, `evaluation_id`, `created_at`, `updated_at`) VALUES
(1, 1, '{"1":"Valor 1"}', '{"1":"Descripcion del valor 1"}', 20, 1, 6, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(2, 2, '{"1":"Valor 2"}', '{"1":"Descripcion del valor 2"}', 30, 2, 6, '2016-10-11 18:40:32', '2016-10-11 18:40:32'),
(3, 3, '{"1":"Valor 3"}', '{"1":"Descripcion de valor 3"}', 40, 2, 6, '2016-10-11 18:40:32', '2016-10-11 18:40:32');

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

--
-- Volcado de datos para la tabla `valoration_comments`
--

INSERT INTO `valoration_comments` (`id`, `comment`, `user_id`, `evaluator_id`, `evaluation_id`, `valoration_id`, `stage`, `entry`, `created_at`, `updated_at`) VALUES
(1, '', 2, 0, 6, 1, 'half-year', 'user', '2016-10-12 19:36:39', '2016-10-12 19:36:39'),
(2, '', 2, 0, 6, 1, 'half-year', 'evaluator', '2016-10-12 19:36:39', '2016-10-12 19:36:39'),
(3, '', 2, 0, 6, 1, 'end-year', 'user', '2016-10-12 19:36:39', '2016-10-12 19:36:39'),
(4, '', 2, 0, 6, 1, 'end-year', 'evaluator', '2016-10-12 19:36:39', '2016-10-12 19:36:39');

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
-- Indices de la tabla `performances`
--
ALTER TABLE `performances`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `tracking_actions`
--
ALTER TABLE `tracking_actions`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `behaviours`
--
ALTER TABLE `behaviours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `behaviour_ratings`
--
ALTER TABLE `behaviour_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `competition_comments`
--
ALTER TABLE `competition_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `evaluation_user_evaluators`
--
ALTER TABLE `evaluation_user_evaluators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `objective_reviews`
--
ALTER TABLE `objective_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=481;
--
-- AUTO_INCREMENT de la tabla `performances`
--
ALTER TABLE `performances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tracking_actions`
--
ALTER TABLE `tracking_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;
--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT de la tabla `valorations`
--
ALTER TABLE `valorations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `valoration_comments`
--
ALTER TABLE `valoration_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
