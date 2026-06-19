-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2026 a las 22:12:30
-- Versión del servidor: 10.6.25-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alertas_inasistencia`
--

CREATE TABLE `alertas_inasistencia` (
  `id_alerta` int(11) NOT NULL COMMENT 'Clave primaria. Identificador de la alerta.\n',
  `aprendiz_id` int(11) NOT NULL COMMENT 'Llave foránea. Relaciona la alerta con el aprendiz.\n',
  `cantidad_fallas` int(11) NOT NULL COMMENT 'Número acumulado de inasistencias.\n',
  `fecha_alerta` datetime NOT NULL COMMENT 'Fecha de generación de la alerta.\n',
  `mensaje` text NOT NULL COMMENT 'Descripción o detalle de la alerta.\n',
  `coordinacion_id` int(11) NOT NULL COMMENT 'Coordinación que recibe o emite la alerta.\n\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alertas_inasistencia`
--

INSERT INTO `alertas_inasistencia` (`id_alerta`, `aprendiz_id`, `cantidad_fallas`, `fecha_alerta`, `mensaje`, `coordinacion_id`) VALUES
(1, 3, 1, '2024-06-11 08:00:00', 'El aprendiz del programa de Diseño Gráfico ha acumulado 1 falla. Se requiere seguimiento.', 2),
(2, 2, 1, '2024-06-12 08:00:00', 'El aprendiz del programa de Análisis y Desarrollo de Software ha acumulado 1 falla.', 1),
(3, 5, 1, '2024-06-12 08:30:00', 'El aprendiz del programa de Gestión Logística presentó inasistencia injustificada.', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambiente`
--

CREATE TABLE `ambiente` (
  `id_ambiente` int(11) NOT NULL COMMENT 'Clave primaria. Identificador único del ambiente.\n',
  `num_ambiente` smallint(6) NOT NULL COMMENT 'Número o código del ambiente físico.\n',
  `capacidad` smallint(6) NOT NULL COMMENT 'Cantidad de personas que pueden estar en un ambiente',
  `tipo_ambiente` varchar(45) NOT NULL COMMENT 'Tipo del ambiente (auditorio, sala, aula, etc.).\n',
  `estado` varchar(30) NOT NULL COMMENT 'Estado actual del ambiente (disponible, ocupado, mantenimiento, etc.).\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ambiente`
--

INSERT INTO `ambiente` (`id_ambiente`, `num_ambiente`, `capacidad`, `tipo_ambiente`, `estado`) VALUES
(1, 101, 30, 'Aula de Clases', 'Disponible'),
(2, 102, 25, 'Laboratorio de Cómputo', 'Disponible'),
(3, 103, 30, 'Aula de Clases', 'Disponible'),
(4, 201, 20, 'Taller de Diseño', 'Disponible'),
(5, 202, 18, 'Laboratorio de Multimedia', 'Disponible'),
(6, 301, 40, 'Salón Multipropósito', 'En mantenimiento'),
(7, 401, 15, 'Laboratorio de Enfermería', 'Disponible'),
(8, 402, 12, 'Consultorio de Práctica', 'Disponible'),
(9, 501, 35, 'Taller de Mecánica', 'Disponible'),
(10, 502, 25, 'Laboratorio de Soldadura De maquinas', 'En mantenimiento'),
(11, 108, 25, 'Aula de Informatica 3', 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendiz`
--

CREATE TABLE `aprendiz` (
  `Usuario_id_usuario` int(11) NOT NULL,
  `programas_id_programas` int(11) DEFAULT NULL,
  `ficha_idficha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aprendiz`
--

INSERT INTO `aprendiz` (`Usuario_id_usuario`, `programas_id_programas`, `ficha_idficha`) VALUES
(11, 1, 1),
(12, 1, 1),
(13, 2, 2),
(14, 2, 2),
(15, 3, 3),
(16, 5, 5),
(17, 5, 5),
(18, 6, 6),
(19, 7, 7),
(20, 4, 4),
(42, 1, 7),
(45, 1, 8),
(52, 1, 8),
(65, 1, 8),
(66, 1, 9),
(67, NULL, 1),
(68, NULL, 8),
(73, NULL, 15),
(74, 1, 15),
(80, NULL, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_ambiente`
--

CREATE TABLE `asignacion_ambiente` (
  `id_asignacion` bigint(20) UNSIGNED NOT NULL,
  `instructor_Usuario_id_usuario` int(11) NOT NULL,
  `ambiente_id` int(11) NOT NULL,
  `trimestre` varchar(50) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jornada_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `asignacion_ambiente`
--

INSERT INTO `asignacion_ambiente` (`id_asignacion`, `instructor_Usuario_id_usuario`, `ambiente_id`, `trimestre`, `fecha_inicio`, `fecha_fin`, `estado`, `created_at`, `updated_at`, `jornada_id`) VALUES
(6, 44, 5, 'Trimestre VI', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 1),
(7, 44, 7, 'Trimestre I', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 2),
(8, 3, 5, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 2),
(11, 3, 5, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 1),
(12, 4, 1, 'Trimestre III', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 2),
(13, 5, 2, 'Trimestre V', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 2),
(14, 6, 1, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 2),
(15, 7, 3, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 1),
(16, 4, 3, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 2),
(17, 7, 4, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 1),
(18, 5, 4, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 2),
(19, 7, 6, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 1),
(20, 6, 6, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 2),
(21, 3, 8, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 1),
(22, 7, 8, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 2),
(23, 4, 9, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 1),
(24, 44, 9, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 2),
(25, 6, 10, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 1),
(26, 5, 10, 'Trimestre II', '2026-06-15', '2026-09-13', 'ACTIVO', NULL, NULL, 2),
(27, 44, 11, 'Trimestre III', '2026-06-18', '2026-09-15', 'ACTIVO', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 3, 'add_permission'),
(6, 'Can change permission', 3, 'change_permission'),
(7, 'Can delete permission', 3, 'delete_permission'),
(8, 'Can view permission', 3, 'view_permission'),
(9, 'Can add group', 2, 'add_group'),
(10, 'Can change group', 2, 'change_group'),
(11, 'Can delete group', 2, 'delete_group'),
(12, 'Can view group', 2, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add identifier', 7, 'add_identifier'),
(26, 'Can change identifier', 7, 'change_identifier'),
(27, 'Can delete identifier', 7, 'delete_identifier'),
(28, 'Can view identifier', 7, 'view_identifier'),
(29, 'Can add range', 8, 'add_range'),
(30, 'Can change range', 8, 'change_range'),
(31, 'Can delete range', 8, 'delete_range'),
(32, 'Can view range', 8, 'view_range'),
(33, 'Can add record', 9, 'add_record'),
(34, 'Can change record', 9, 'change_record'),
(35, 'Can delete record', 9, 'delete_record'),
(36, 'Can view record', 9, 'view_record'),
(37, 'Can add data wizard', 10, 'add_run'),
(38, 'Can change data wizard', 10, 'change_run'),
(39, 'Can delete data wizard', 10, 'delete_run'),
(40, 'Can view data wizard', 10, 'view_run'),
(41, 'Can add run log', 11, 'add_runlog'),
(42, 'Can change run log', 11, 'change_runlog'),
(43, 'Can delete run log', 11, 'delete_runlog'),
(44, 'Can view run log', 11, 'view_runlog'),
(45, 'Can add file source', 12, 'add_filesource'),
(46, 'Can change file source', 12, 'change_filesource'),
(47, 'Can delete file source', 12, 'delete_filesource'),
(48, 'Can view file source', 12, 'view_filesource'),
(49, 'Can add url source', 13, 'add_urlsource'),
(50, 'Can change url source', 13, 'change_urlsource'),
(51, 'Can delete url source', 13, 'delete_urlsource'),
(52, 'Can view url source', 13, 'view_urlsource'),
(53, 'Can add alertas inasistencia', 14, 'add_alertasinasistencia'),
(54, 'Can change alertas inasistencia', 14, 'change_alertasinasistencia'),
(55, 'Can delete alertas inasistencia', 14, 'delete_alertasinasistencia'),
(56, 'Can view alertas inasistencia', 14, 'view_alertasinasistencia'),
(57, 'Can add ambiente', 15, 'add_ambiente'),
(58, 'Can change ambiente', 15, 'change_ambiente'),
(59, 'Can delete ambiente', 15, 'delete_ambiente'),
(60, 'Can view ambiente', 15, 'view_ambiente'),
(61, 'Can add usuario', 52, 'add_usuario'),
(62, 'Can change usuario', 52, 'change_usuario'),
(63, 'Can delete usuario', 52, 'delete_usuario'),
(64, 'Can view usuario', 52, 'view_usuario'),
(65, 'Can add auth group', 17, 'add_authgroup'),
(66, 'Can change auth group', 17, 'change_authgroup'),
(67, 'Can delete auth group', 17, 'delete_authgroup'),
(68, 'Can view auth group', 17, 'view_authgroup'),
(69, 'Can add auth group permissions', 18, 'add_authgrouppermissions'),
(70, 'Can change auth group permissions', 18, 'change_authgrouppermissions'),
(71, 'Can delete auth group permissions', 18, 'delete_authgrouppermissions'),
(72, 'Can view auth group permissions', 18, 'view_authgrouppermissions'),
(73, 'Can add auth permission', 19, 'add_authpermission'),
(74, 'Can change auth permission', 19, 'change_authpermission'),
(75, 'Can delete auth permission', 19, 'delete_authpermission'),
(76, 'Can view auth permission', 19, 'view_authpermission'),
(77, 'Can add auth user', 20, 'add_authuser'),
(78, 'Can change auth user', 20, 'change_authuser'),
(79, 'Can delete auth user', 20, 'delete_authuser'),
(80, 'Can view auth user', 20, 'view_authuser'),
(81, 'Can add auth user groups', 21, 'add_authusergroups'),
(82, 'Can change auth user groups', 21, 'change_authusergroups'),
(83, 'Can delete auth user groups', 21, 'delete_authusergroups'),
(84, 'Can view auth user groups', 21, 'view_authusergroups'),
(85, 'Can add auth user user permissions', 22, 'add_authuseruserpermissions'),
(86, 'Can change auth user user permissions', 22, 'change_authuseruserpermissions'),
(87, 'Can delete auth user user permissions', 22, 'delete_authuseruserpermissions'),
(88, 'Can view auth user user permissions', 22, 'view_authuseruserpermissions'),
(89, 'Can add coordinacion', 23, 'add_coordinacion'),
(90, 'Can change coordinacion', 23, 'change_coordinacion'),
(91, 'Can delete coordinacion', 23, 'delete_coordinacion'),
(92, 'Can view coordinacion', 23, 'view_coordinacion'),
(93, 'Can add data wizard identifier', 25, 'add_datawizardidentifier'),
(94, 'Can change data wizard identifier', 25, 'change_datawizardidentifier'),
(95, 'Can delete data wizard identifier', 25, 'delete_datawizardidentifier'),
(96, 'Can view data wizard identifier', 25, 'view_datawizardidentifier'),
(97, 'Can add data wizard range', 26, 'add_datawizardrange'),
(98, 'Can change data wizard range', 26, 'change_datawizardrange'),
(99, 'Can delete data wizard range', 26, 'delete_datawizardrange'),
(100, 'Can view data wizard range', 26, 'view_datawizardrange'),
(101, 'Can add data wizard record', 27, 'add_datawizardrecord'),
(102, 'Can change data wizard record', 27, 'change_datawizardrecord'),
(103, 'Can delete data wizard record', 27, 'delete_datawizardrecord'),
(104, 'Can view data wizard record', 27, 'view_datawizardrecord'),
(105, 'Can add data wizard run', 28, 'add_datawizardrun'),
(106, 'Can change data wizard run', 28, 'change_datawizardrun'),
(107, 'Can delete data wizard run', 28, 'delete_datawizardrun'),
(108, 'Can view data wizard run', 28, 'view_datawizardrun'),
(109, 'Can add data wizard runlog', 29, 'add_datawizardrunlog'),
(110, 'Can change data wizard runlog', 29, 'change_datawizardrunlog'),
(111, 'Can delete data wizard runlog', 29, 'delete_datawizardrunlog'),
(112, 'Can view data wizard runlog', 29, 'view_datawizardrunlog'),
(113, 'Can add django admin log', 30, 'add_djangoadminlog'),
(114, 'Can change django admin log', 30, 'change_djangoadminlog'),
(115, 'Can delete django admin log', 30, 'delete_djangoadminlog'),
(116, 'Can view django admin log', 30, 'view_djangoadminlog'),
(117, 'Can add django content type', 31, 'add_djangocontenttype'),
(118, 'Can change django content type', 31, 'change_djangocontenttype'),
(119, 'Can delete django content type', 31, 'delete_djangocontenttype'),
(120, 'Can view django content type', 31, 'view_djangocontenttype'),
(121, 'Can add django migrations', 32, 'add_djangomigrations'),
(122, 'Can change django migrations', 32, 'change_djangomigrations'),
(123, 'Can delete django migrations', 32, 'delete_djangomigrations'),
(124, 'Can view django migrations', 32, 'view_djangomigrations'),
(125, 'Can add django session', 33, 'add_djangosession'),
(126, 'Can change django session', 33, 'change_djangosession'),
(127, 'Can delete django session', 33, 'delete_djangosession'),
(128, 'Can view django session', 33, 'view_djangosession'),
(129, 'Can add ficha', 34, 'add_ficha'),
(130, 'Can change ficha', 34, 'change_ficha'),
(131, 'Can delete ficha', 34, 'delete_ficha'),
(132, 'Can view ficha', 34, 'view_ficha'),
(133, 'Can add historico incidentes', 36, 'add_historicoincidentes'),
(134, 'Can change historico incidentes', 36, 'change_historicoincidentes'),
(135, 'Can delete historico incidentes', 36, 'delete_historicoincidentes'),
(136, 'Can view historico incidentes', 36, 'view_historicoincidentes'),
(137, 'Can add jornada', 38, 'add_jornada'),
(138, 'Can change jornada', 38, 'change_jornada'),
(139, 'Can delete jornada', 38, 'delete_jornada'),
(140, 'Can view jornada', 38, 'view_jornada'),
(141, 'Can add modalidad', 39, 'add_modalidad'),
(142, 'Can change modalidad', 39, 'change_modalidad'),
(143, 'Can delete modalidad', 39, 'delete_modalidad'),
(144, 'Can view modalidad', 39, 'view_modalidad'),
(145, 'Can add programas', 40, 'add_programas'),
(146, 'Can change programas', 40, 'change_programas'),
(147, 'Can delete programas', 40, 'delete_programas'),
(148, 'Can view programas', 40, 'view_programas'),
(149, 'Can add recursos', 41, 'add_recursos'),
(150, 'Can change recursos', 41, 'change_recursos'),
(151, 'Can delete recursos', 41, 'delete_recursos'),
(152, 'Can view recursos', 41, 'view_recursos'),
(153, 'Can add registro inasistencia', 42, 'add_registroinasistencia'),
(154, 'Can change registro inasistencia', 42, 'change_registroinasistencia'),
(155, 'Can delete registro inasistencia', 42, 'delete_registroinasistencia'),
(156, 'Can view registro inasistencia', 42, 'view_registroinasistencia'),
(157, 'Can add registro incidente', 43, 'add_registroincidente'),
(158, 'Can change registro incidente', 43, 'change_registroincidente'),
(159, 'Can delete registro incidente', 43, 'delete_registroincidente'),
(160, 'Can view registro incidente', 43, 'view_registroincidente'),
(161, 'Can add registro minuta', 44, 'add_registrominuta'),
(162, 'Can change registro minuta', 44, 'change_registrominuta'),
(163, 'Can delete registro minuta', 44, 'delete_registrominuta'),
(164, 'Can view registro minuta', 44, 'view_registrominuta'),
(165, 'Can add rol', 45, 'add_rol'),
(166, 'Can change rol', 45, 'change_rol'),
(167, 'Can delete rol', 45, 'delete_rol'),
(168, 'Can view rol', 45, 'view_rol'),
(169, 'Can add sources filesource', 46, 'add_sourcesfilesource'),
(170, 'Can change sources filesource', 46, 'change_sourcesfilesource'),
(171, 'Can delete sources filesource', 46, 'delete_sourcesfilesource'),
(172, 'Can view sources filesource', 46, 'view_sourcesfilesource'),
(173, 'Can add sources urlsource', 47, 'add_sourcesurlsource'),
(174, 'Can change sources urlsource', 47, 'change_sourcesurlsource'),
(175, 'Can delete sources urlsource', 47, 'delete_sourcesurlsource'),
(176, 'Can view sources urlsource', 47, 'view_sourcesurlsource'),
(177, 'Can add tipo incidente', 48, 'add_tipoincidente'),
(178, 'Can change tipo incidente', 48, 'change_tipoincidente'),
(179, 'Can delete tipo incidente', 48, 'delete_tipoincidente'),
(180, 'Can view tipo incidente', 48, 'view_tipoincidente'),
(181, 'Can add tipo recurso', 49, 'add_tiporecurso'),
(182, 'Can change tipo recurso', 49, 'change_tiporecurso'),
(183, 'Can delete tipo recurso', 49, 'delete_tiporecurso'),
(184, 'Can view tipo recurso', 49, 'view_tiporecurso'),
(185, 'Can add traslado recurso', 50, 'add_trasladorecurso'),
(186, 'Can change traslado recurso', 50, 'change_trasladorecurso'),
(187, 'Can delete traslado recurso', 50, 'delete_trasladorecurso'),
(188, 'Can view traslado recurso', 50, 'view_trasladorecurso'),
(189, 'Can add user rol', 51, 'add_userrol'),
(190, 'Can change user rol', 51, 'change_userrol'),
(191, 'Can delete user rol', 51, 'delete_userrol'),
(192, 'Can view user rol', 51, 'view_userrol'),
(193, 'Can add aprendiz', 16, 'add_aprendiz'),
(194, 'Can change aprendiz', 16, 'change_aprendiz'),
(195, 'Can delete aprendiz', 16, 'delete_aprendiz'),
(196, 'Can view aprendiz', 16, 'view_aprendiz'),
(197, 'Can add coordinador', 24, 'add_coordinador'),
(198, 'Can change coordinador', 24, 'change_coordinador'),
(199, 'Can delete coordinador', 24, 'delete_coordinador'),
(200, 'Can view coordinador', 24, 'view_coordinador'),
(201, 'Can add guarda seguridad', 35, 'add_guardaseguridad'),
(202, 'Can change guarda seguridad', 35, 'change_guardaseguridad'),
(203, 'Can delete guarda seguridad', 35, 'delete_guardaseguridad'),
(204, 'Can view guarda seguridad', 35, 'view_guardaseguridad'),
(205, 'Can add instructor', 37, 'add_instructor'),
(206, 'Can change instructor', 37, 'change_instructor'),
(207, 'Can delete instructor', 37, 'delete_instructor'),
(208, 'Can view instructor', 37, 'view_instructor'),
(209, 'Can add admin', 53, 'add_admin'),
(210, 'Can change admin', 53, 'change_admin'),
(211, 'Can delete admin', 53, 'delete_admin'),
(212, 'Can view admin', 53, 'view_admin'),
(213, 'Can add usuario', 54, 'add_usuario'),
(214, 'Can change usuario', 54, 'change_usuario'),
(215, 'Can delete usuario', 54, 'delete_usuario'),
(216, 'Can view usuario', 54, 'view_usuario'),
(217, 'Can add instructor', 55, 'add_instructor'),
(218, 'Can change instructor', 55, 'change_instructor'),
(219, 'Can delete instructor', 55, 'delete_instructor'),
(220, 'Can view instructor', 55, 'view_instructor'),
(221, 'Can add asignacion ambiente', 56, 'add_asignacionambiente'),
(222, 'Can change asignacion ambiente', 56, 'change_asignacionambiente'),
(223, 'Can delete asignacion ambiente', 56, 'delete_asignacionambiente'),
(224, 'Can view asignacion ambiente', 56, 'view_asignacionambiente'),
(225, 'Can add justificacion', 57, 'add_justificacion'),
(226, 'Can change justificacion', 57, 'change_justificacion'),
(227, 'Can delete justificacion', 57, 'delete_justificacion'),
(228, 'Can view justificacion', 57, 'view_justificacion'),
(229, 'Can add mantenimiento ambiente', 58, 'add_mantenimientoambiente'),
(230, 'Can change mantenimiento ambiente', 58, 'change_mantenimientoambiente'),
(231, 'Can delete mantenimiento ambiente', 58, 'delete_mantenimientoambiente'),
(232, 'Can view mantenimiento ambiente', 58, 'view_mantenimientoambiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinacion`
--

CREATE TABLE `coordinacion` (
  `id_coordinacion` int(11) NOT NULL COMMENT 'Clave primaria. Identificador de la coordinación.\n',
  `nombre_coordinacion` varchar(45) NOT NULL COMMENT 'Nombre de la coordinación (ej. tecnologia e innovacion).\n',
  `correo_coordinacion` varchar(30) NOT NULL COMMENT 'Correo electrónico institucional de la coordinación.\n\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `coordinacion`
--

INSERT INTO `coordinacion` (`id_coordinacion`, `nombre_coordinacion`, `correo_coordinacion`) VALUES
(1, 'Coordinación de Sistemas', 'sistemas@sena.edu.co'),
(2, 'Coordinación de Diseño', 'diseno@sena.edu.co'),
(3, 'Coordinación de Logística', 'logistica@sena.edu.co'),
(4, 'Coordinación de Salud', 'salud@sena.edu.co'),
(5, 'Coordinación de Industria', 'industria@sena.edu.co');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinador`
--

CREATE TABLE `coordinador` (
  `Usuario_id_usuario` int(11) NOT NULL,
  `coordinacion_id_coordinacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `coordinador`
--

INSERT INTO `coordinador` (`Usuario_id_usuario`, `coordinacion_id_coordinacion`) VALUES
(43, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_wizard_identifier`
--

CREATE TABLE `data_wizard_identifier` (
  `id` int(11) NOT NULL,
  `serializer` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `attr_id` int(10) UNSIGNED DEFAULT NULL CHECK (`attr_id` >= 0),
  `resolved` tinyint(1) NOT NULL,
  `attr_field` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_wizard_range`
--

CREATE TABLE `data_wizard_range` (
  `id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `header_col` int(11) NOT NULL,
  `start_col` int(11) NOT NULL,
  `end_col` int(11) DEFAULT NULL,
  `header_row` int(11) NOT NULL,
  `start_row` int(11) NOT NULL,
  `end_row` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `identifier_id` int(11) NOT NULL,
  `run_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_wizard_record`
--

CREATE TABLE `data_wizard_record` (
  `id` int(11) NOT NULL,
  `object_id` int(10) UNSIGNED DEFAULT NULL CHECK (`object_id` >= 0),
  `row` int(10) UNSIGNED NOT NULL CHECK (`row` >= 0),
  `success` tinyint(1) NOT NULL,
  `fail_reason` longtext DEFAULT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `run_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_wizard_run`
--

CREATE TABLE `data_wizard_run` (
  `id` int(11) NOT NULL,
  `record_count` int(11) DEFAULT NULL,
  `loader` varchar(255) DEFAULT NULL,
  `serializer` varchar(255) DEFAULT NULL,
  `object_id` int(10) UNSIGNED DEFAULT NULL CHECK (`object_id` >= 0),
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_wizard_runlog`
--

CREATE TABLE `data_wizard_runlog` (
  `id` int(11) NOT NULL,
  `event` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `run_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(53, 'AdminApp', 'admin'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'data_wizard', 'identifier'),
(8, 'data_wizard', 'range'),
(9, 'data_wizard', 'record'),
(10, 'data_wizard', 'run'),
(11, 'data_wizard', 'runlog'),
(55, 'InstApp', 'instructor'),
(14, 'LoginApp', 'alertasinasistencia'),
(15, 'LoginApp', 'ambiente'),
(16, 'LoginApp', 'aprendiz'),
(56, 'LoginApp', 'asignacionambiente'),
(17, 'LoginApp', 'authgroup'),
(18, 'LoginApp', 'authgrouppermissions'),
(19, 'LoginApp', 'authpermission'),
(20, 'LoginApp', 'authuser'),
(21, 'LoginApp', 'authusergroups'),
(22, 'LoginApp', 'authuseruserpermissions'),
(23, 'LoginApp', 'coordinacion'),
(24, 'LoginApp', 'coordinador'),
(25, 'LoginApp', 'datawizardidentifier'),
(26, 'LoginApp', 'datawizardrange'),
(27, 'LoginApp', 'datawizardrecord'),
(28, 'LoginApp', 'datawizardrun'),
(29, 'LoginApp', 'datawizardrunlog'),
(30, 'LoginApp', 'djangoadminlog'),
(31, 'LoginApp', 'djangocontenttype'),
(32, 'LoginApp', 'djangomigrations'),
(33, 'LoginApp', 'djangosession'),
(34, 'LoginApp', 'ficha'),
(35, 'LoginApp', 'guardaseguridad'),
(36, 'LoginApp', 'historicoincidentes'),
(37, 'LoginApp', 'instructor'),
(38, 'LoginApp', 'jornada'),
(57, 'LoginApp', 'justificacion'),
(58, 'LoginApp', 'mantenimientoambiente'),
(39, 'LoginApp', 'modalidad'),
(40, 'LoginApp', 'programas'),
(41, 'LoginApp', 'recursos'),
(42, 'LoginApp', 'registroinasistencia'),
(43, 'LoginApp', 'registroincidente'),
(44, 'LoginApp', 'registrominuta'),
(45, 'LoginApp', 'rol'),
(46, 'LoginApp', 'sourcesfilesource'),
(47, 'LoginApp', 'sourcesurlsource'),
(48, 'LoginApp', 'tipoincidente'),
(49, 'LoginApp', 'tiporecurso'),
(50, 'LoginApp', 'trasladorecurso'),
(51, 'LoginApp', 'userrol'),
(52, 'LoginApp', 'usuario'),
(6, 'sessions', 'session'),
(12, 'sources', 'filesource'),
(13, 'sources', 'urlsource'),
(54, 'UsuarioApp', 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(2, 'contenttypes', '0001_initial', '2026-03-27 15:44:34.074246'),
(3, 'auth', '0001_initial', '2026-03-27 15:44:34.896640'),
(4, 'admin', '0001_initial', '2026-03-27 15:44:35.092855'),
(5, 'admin', '0002_logentry_remove_auto_add', '2026-03-27 15:44:35.107242'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2026-03-27 15:44:35.160720'),
(7, 'contenttypes', '0002_remove_content_type_name', '2026-03-27 15:44:35.304448'),
(8, 'auth', '0002_alter_permission_name_max_length', '2026-03-27 15:44:35.381318'),
(9, 'auth', '0003_alter_user_email_max_length', '2026-03-27 15:44:35.425618'),
(10, 'auth', '0004_alter_user_username_opts', '2026-03-27 15:44:35.438325'),
(11, 'auth', '0005_alter_user_last_login_null', '2026-03-27 15:44:35.508793'),
(12, 'auth', '0006_require_contenttypes_0002', '2026-03-27 15:44:35.513844'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2026-03-27 15:44:35.530291'),
(14, 'auth', '0008_alter_user_username_max_length', '2026-03-27 15:44:35.576937'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2026-03-27 15:44:35.623864'),
(16, 'auth', '0010_alter_group_name_max_length', '2026-03-27 15:44:35.674237'),
(17, 'auth', '0011_update_proxy_permissions', '2026-03-27 15:44:35.711605'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2026-03-27 15:44:35.760127'),
(19, 'data_wizard', '0001_initial', '2026-03-27 15:44:36.576446'),
(20, 'data_wizard', '0002_auto_20190306_2022', '2026-03-27 15:44:37.064904'),
(21, 'data_wizard', '0003_alter_run_options', '2026-03-27 15:44:37.085071'),
(22, 'sessions', '0001_initial', '2026-03-27 15:44:37.160967'),
(23, 'sources', '0001_initial', '2026-03-27 15:44:37.240857'),
(24, 'sources', '0002_source_user', '2026-03-27 15:44:37.472034'),
(25, 'AdminApp', '0001_initial', '2026-04-03 22:11:29.224453'),
(26, 'UsuarioApp', '0001_initial', '2026-04-03 22:16:44.419868'),
(27, 'InstApp', '0001_initial', '2026-04-03 22:17:06.921123'),
(28, 'LoginApp', '0002_alter_aprendiz_options_alter_coordinador_options_and_more', '2026-04-05 04:47:12.120370'),
(29, 'LoginApp', '0001_initial', '2026-04-05 05:01:36.284447'),
(30, 'LoginApp', '0002_remove_ficha_instructores_ficha_instructor', '2026-04-05 16:59:03.517961'),
(31, 'LoginApp', '0002_revert_to_original', '2026-04-05 17:32:22.099163'),
(32, 'LoginApp', '0003_add_estado_tipo_asignacion_justificacion', '2026-06-10 23:35:05.583382'),
(33, 'AdminApp', '0002_alter_admin_options', '2026-06-15 03:24:11.773221'),
(34, 'LoginApp', '0004_asignacionambiente_jornada_and_more', '2026-06-15 03:24:12.904325'),
(35, 'UsuarioApp', '0002_alter_usuario_options', '2026-06-15 03:24:12.916417'),
(36, 'sources', '0003_alter_filesource_id_alter_urlsource_id', '2026-06-15 03:24:13.379069'),
(38, 'LoginApp', '0005_mantenimientoambiente_and_more', '2026-06-15 19:38:29.934285'),
(39, 'LoginApp', '0006_delete_mantenimientoambiente', '2026-06-15 19:54:58.086960'),
(40, 'LoginApp', '0007_alter_trasladorecurso_options', '2026-06-15 20:11:13.058083'),
(41, 'LoginApp', '0008_trasladorecurso_ambiente_origen_and_more', '2026-06-15 20:11:13.355845'),
(42, 'LoginApp', '0009_ficha_instructores_trasladorecurso_ambiente_origen_and_more', '2026-06-18 02:48:06.472459'),
(43, 'LoginApp', '0010_trasladorecurso_ambiente_origen_and_more', '2026-06-18 02:48:44.078583'),
(44, 'LoginApp', '0011_remove_ficha_instructor_usuario_id_usuario', '2026-06-18 02:51:20.849049'),
(45, 'LoginApp', '0012_alter_trasladorecurso_ambiente_destino_and_more', '2026-06-18 02:53:35.050176');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('f9a7ppj9gxho55kfl1lcdngsvod0d0n8', 'eyJ1c3VhcmlvX2lkIjoyMX0:1wa5L0:66HK-K_IJWwQkZtpzWtuWNXYBOMi4r3JS5XjeacsjH8', '2026-07-02 05:30:50.838734'),
('t8dqw8qrugf09cbg18cqste0naqghcpz', 'eyJ1c3VhcmlvX2lkIjo0Nn0:1wARSA:rpFwmGYRCK1ozuTN19xwr-gmhq4FfxKGXucxjBMQ3fQ', '2026-04-22 11:52:14.725287');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `ficha`
--

CREATE TABLE `ficha` (
  `idficha` int(11) NOT NULL,
  `Num_ficha` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ficha`
--

INSERT INTO `ficha` (`idficha`, `Num_ficha`) VALUES
(1, 2271021),
(2, 2271022),
(3, 2271023),
(4, 2271025),
(5, 2271026),
(6, 2271027),
(7, 2271028),
(8, 3197815),
(9, 3197833),
(11, 3178657),
(14, 3197856),
(15, 3187960),
(16, 3202357),
(17, 3228913);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_instructor`
--

CREATE TABLE `ficha_instructor` (
  `id` bigint(20) NOT NULL,
  `ficha_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ficha_instructor`
--

INSERT INTO `ficha_instructor` (`id`, `ficha_id`, `instructor_id`) VALUES
(1, 1, 3),
(2, 2, 4),
(3, 3, 5),
(4, 4, 4),
(5, 5, 6),
(6, 6, 7),
(7, 7, 3),
(8, 8, 44),
(9, 9, 44),
(11, 11, 4),
(12, 14, 44),
(13, 15, 72),
(14, 16, 72),
(15, 16, 44),
(16, 14, 6),
(17, 17, 72),
(18, 17, 44);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guarda_seguridad`
--

CREATE TABLE `guarda_seguridad` (
  `Usuario_id_usuario` int(11) NOT NULL,
  `turno` varchar(6) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `guarda_seguridad`
--

INSERT INTO `guarda_seguridad` (`Usuario_id_usuario`, `turno`, `fecha_ingreso`, `estado`) VALUES
(8, 'Mañana', '2020-07-01', 'Activo'),
(9, 'Tarde', '2019-11-01', 'Activo'),
(10, 'Noche', '2021-02-15', 'Activo'),
(46, 'Mañana', '2025-12-10', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_incidentes`
--

CREATE TABLE `historico_incidentes` (
  `id_historico` int(11) NOT NULL COMMENT 'Clave primaria. Identificador del historial del incidente.\n',
  `incidente_id` int(11) NOT NULL COMMENT 'Llave foránea. Incidente asociado.\n',
  `ambiente_id` int(11) NOT NULL COMMENT 'Llave foránea. Ambiente en donde ocurrió.\n',
  `tipo_incidente_id` int(11) NOT NULL COMMENT 'Llave foránea. Tipo de incidente registrado.\n',
  `descripcion` text DEFAULT NULL COMMENT 'Descripción de los hechos o seguimiento.\n',
  `fecha_registro` datetime NOT NULL COMMENT 'Fecha del registro en el historial.\n\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historico_incidentes`
--

INSERT INTO `historico_incidentes` (`id_historico`, `incidente_id`, `ambiente_id`, `tipo_incidente_id`, `descripcion`, `fecha_registro`) VALUES
(7, 18, 5, 2, 'Se daño un equipo en plena formación, ya se aviso a coordinación', '2026-04-06 19:29:25'),
(8, 19, 6, 1, 'Se quemo la toma del ambiente, impidiendo que los computadores tengan energía y posibilitando daños en los equipos', '2026-04-07 19:14:53'),
(9, 20, 4, 3, 'Se fue el internet en varios equipos del ambiente 201', '2026-04-07 19:15:43'),
(11, 20, 4, 3, 'Cambio de estado: \'ABIERTO\' → \'En Proceso\'. Nota: Se esta realizando la reconexion en el ambiente 201', '2026-06-15 00:35:09'),
(12, 20, 4, 3, 'Cambio de estado: \'En Proceso\' → \'Cerrado\'', '2026-06-15 19:43:22'),
(13, 19, 6, 1, 'Cambio de estado: \'ABIERTO\' → \'En Proceso\'. Nota: Se esta haciendo el cambio de instalacion', '2026-06-15 19:46:05'),
(14, 19, 6, 1, 'Nota de seguimiento: Los técnicos están haciendo pruebas de que la instalación funcione', '2026-06-15 20:00:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE `instructor` (
  `Usuario_id_usuario` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `coordinacion_id_coordinacion` int(11) DEFAULT NULL,
  `estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`Usuario_id_usuario`, `email`, `telefono`, `coordinacion_id_coordinacion`, `estado`) VALUES
(1, 'carlos.rodriguez@sena.edu.co', '3224352644', 1, 'Activo'),
(3, 'juan.perez@sena.edu.co', '3001112233', 1, 'Activo'),
(4, 'maria.lopez@sena.edu.co', '3012223344', 2, 'Activo'),
(5, 'pedro.martinez@sena.edu.co', '3023334455', 3, 'Activo'),
(6, 'laura.torres@sena.edu.co', '3034445566', 4, 'Activo'),
(7, 'diego.ramirez@sena.edu.co', '3045556677', 5, 'Activo'),
(44, 'instructor@gmail.com', '3232302010', 1, 'Activo'),
(69, 'jorge.bermudez@sena.edu.co', '3214567890', 2, 'activo'),
(70, 'adriana.guerrero@sena.edu.co', '3017894561', 4, 'activo'),
(72, 'sicesoft@outlook.com', '3114509550', 1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
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
-- Estructura de tabla para la tabla `job_batches`
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
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `id_jornada` int(11) NOT NULL COMMENT 'Clave primaria. Identificador de la jornada.\n',
  `nombre_jornada` enum('Mañana','Tarde','Noche','Madrugada') NOT NULL COMMENT 'Nombre de la jornada (mañana, tarde, noche).\n\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jornada`
--

INSERT INTO `jornada` (`id_jornada`, `nombre_jornada`) VALUES
(1, 'Mañana'),
(2, 'Tarde'),
(3, 'Noche');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `justificacion`
--

CREATE TABLE `justificacion` (
  `id_justificacion` bigint(20) UNSIGNED NOT NULL,
  `registro_inasistencia_id` int(11) NOT NULL,
  `archivo_pdf` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'PENDIENTE',
  `usuario_revisor_id` int(11) DEFAULT NULL,
  `fecha_revision` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `justificacion`
--

INSERT INTO `justificacion` (`id_justificacion`, `registro_inasistencia_id`, `archivo_pdf`, `descripcion`, `estado`, `usuario_revisor_id`, `fecha_revision`, `created_at`, `updated_at`) VALUES
(1, 17, 'justificaciones/MANUAL_INSTALACION_LMACK.pdf', NULL, 'Pendiente', NULL, NULL, '2026-06-14 20:03:17', NULL),
(2, 18, 'justificaciones/MANUAL_INSTALACION_LMACK_8xA5AN6.pdf', NULL, 'Aprobada', NULL, NULL, '2026-06-14 20:08:50', NULL),
(4, 21, 'justificaciones/MANUAL_INSTALACION_LMACK_VSJGvJo.pdf', NULL, 'Aprobada', NULL, NULL, '2026-06-16 03:00:15', NULL),
(5, 22, 'justificaciones/MANUAL_INSTALACION_LMACK_xEIPOhS.pdf', 'Se recibe la justificacion', 'Aprobada', NULL, NULL, '2026-06-17 18:17:41', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_05_03_215243_add_estado_to_registro_incidente_table', 2),
(5, '2026_05_03_215246_add_tipo_inasistencia_to_registro_inasistencia_table', 3),
(6, '2026_05_03_215247_create_asignacion_ambientes_table', 4),
(7, '2026_05_03_215247_create_justificacions_table', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

CREATE TABLE `modalidad` (
  `id_modalidad` int(11) NOT NULL COMMENT 'Clave primaria. Identificador de la modalidad.\n',
  `nombre_modalidad` enum('Presencial','sincronica') NOT NULL COMMENT 'Nombre de la modalidad (presencial, sincronica).\n\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`id_modalidad`, `nombre_modalidad`) VALUES
(1, 'Presencial'),
(2, 'sincronica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `id_programas` int(11) NOT NULL COMMENT 'Clave primaria. Identificador del programa académico.\n',
  `nombre_programa` varchar(50) NOT NULL COMMENT 'Nombre del programa.\n',
  `nivel_formacion` varchar(30) NOT NULL COMMENT 'Nivel de formación (tecnólogo, técnico, etc.).\n',
  `duracion` varchar(50) NOT NULL COMMENT 'Duración estimada del programa.\n',
  `jornada_id` int(11) NOT NULL COMMENT 'Jornada asignada.\n',
  `modalidad_id` int(11) NOT NULL COMMENT 'Modalidad del programa.\n',
  `coordinacion_id` int(11) NOT NULL COMMENT 'Coordinación responsable del programa.\n\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`id_programas`, `nombre_programa`, `nivel_formacion`, `duracion`, `jornada_id`, `modalidad_id`, `coordinacion_id`) VALUES
(1, 'Análisis y Desarrollo de Software', 'Tecnólogo', '24 meses', 1, 2, 1),
(2, 'Diseño Gráfico Publicitario', 'Técnico', '18 meses', 2, 1, 2),
(3, 'Gestión Logística', 'Tecnólogo', '24 meses', 3, 2, 3),
(4, 'Contabilidad y Finanzas', 'Tecnólogo', '24 meses', 1, 1, 1),
(5, 'Multimedia', 'Técnico', '18 meses', 2, 2, 2),
(6, 'Auxiliar en Enfermería', 'Técnico', '18 meses', 1, 1, 4),
(7, 'Mecánica Industrial', 'Tecnólogo', '24 meses', 2, 1, 5),
(8, 'Desarrollo Web', 'Especialización', '6 meses', 3, 2, 1),
(9, 'Gastronomia', 'Tecnico', '12 meses', 1, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

CREATE TABLE `recursos` (
  `id_recurso` int(11) NOT NULL COMMENT 'Clave primaria. Identificador del recurso.\n',
  `serial_recurso` varchar(100) NOT NULL COMMENT 'Serial físico o interno del recurso.\n',
  `num_recurso` tinyint(4) NOT NULL COMMENT 'Nombre del recurso en el ambiente.\n',
  `nombre_recurso` varchar(60) NOT NULL COMMENT 'Nombre del recurso.\n',
  `tipo_recurso` int(11) NOT NULL COMMENT 'Llave foránea. Tipo de recurso.\n',
  `estado` enum('Disponible','En mantenimiento','Dañado') DEFAULT NULL COMMENT 'Estado del recurso (operativo, dañado, en mantenimiento).\n',
  `observacion` text DEFAULT NULL COMMENT 'Observacion hacia algun recurso.',
  `ambiente_id` int(11) NOT NULL COMMENT 'Llave foranea, Ambiente al que pertenece.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recursos`
--

INSERT INTO `recursos` (`id_recurso`, `serial_recurso`, `num_recurso`, `nombre_recurso`, `tipo_recurso`, `estado`, `observacion`, `ambiente_id`) VALUES
(1, 'PC-LAB-001', 1, 'Computador Dell OptiPlex 1', 1, 'Disponible', 'Funcionando correctamente', 2),
(2, 'PC-LAB-002', 2, 'Computador Dell OptiPlex 2', 1, 'Disponible', 'Funcionando correctamente', 3),
(3, 'PC-LAB-003', 3, 'Computador Dell OptiPlex 3', 1, 'Dañado', 'Necesita mantenimiento', 3),
(4, 'PROY-AUL-001', 1, 'Proyector Epson PowerLite', 2, 'Disponible', 'Funcionando correctamente', 3),
(5, 'PROY-AUL-002', 2, 'Proyector BenL MS524', 2, 'En mantenimiento', 'Toma por cambiar', 5),
(6, 'IMPR-ADM-001', 1, 'Impresora HP LaserJet Pro', 3, 'Disponible', 'Funcionando correctamente', 7),
(7, 'IMPR-ADM-002', 2, 'Impresora Canon Pixma', 3, 'Dañado', 'Necesita tinta', 7),
(8, 'SILLA-101-01', 1, 'Silla Ergonómica Azul', 4, 'Disponible', 'Buen estado', 8),
(9, 'MESA-101-01', 1, 'Mesa de Trabajo Madera', 4, 'Disponible', 'Rayones menores', 9),
(10, 'MART-501-01', 1, 'Martillo de Carpintero', 5, 'Disponible', 'Buen estado', 10),
(11, 'SOLD-502-01', 1, 'Soldador Eléctrico 110V', 5, 'Disponible', 'Funcionando correctamente', 1),
(12, 'SPEAK-201-01', 1, 'Parlantes Logitech Z313', 6, 'Disponible', 'Funcionando correctamente', 2),
(13, 'MIC-201-01', 1, 'Micrófono Audio-Technica', 6, 'Dañado', 'Cable defectuoso', 1),
(14, 'SWITCH-102-01', 1, 'Switch Cisco 24 puertos', 7, 'Disponible', 'Funcionando correctamente', 2),
(15, 'ROUTER-ADM-01', 1, 'Router TP-Link AC1750', 7, 'Disponible', 'Funcionando correctamente', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_inasistencia`
--

CREATE TABLE `registro_inasistencia` (
  `id_inasistencia` int(11) NOT NULL,
  `fecha_inasistencia` date NOT NULL,
  `estado_inasistencia` varchar(1) NOT NULL,
  `tipo_inasistencia` varchar(20) DEFAULT NULL,
  `jornada_id` int(11) NOT NULL COMMENT 'Jornada del aprendiz.\n',
  `aprendiz_Usuario_id_usuario` int(11) NOT NULL COMMENT 'Llave foránea al aprendiz.\n\n',
  `instructor_Usuario_id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_inasistencia`
--

INSERT INTO `registro_inasistencia` (`id_inasistencia`, `fecha_inasistencia`, `estado_inasistencia`, `tipo_inasistencia`, `jornada_id`, `aprendiz_Usuario_id_usuario`, `instructor_Usuario_id_usuario`) VALUES
(1, '2024-06-10', 'S', NULL, 1, 11, 3),
(2, '2024-06-10', 'S', NULL, 1, 12, 3),
(3, '2024-06-10', 'R', NULL, 2, 13, 4),
(4, '2024-06-10', 'S', NULL, 2, 14, 4),
(5, '2024-06-10', 'S', NULL, 3, 15, 5),
(6, '2024-06-11', 'S', NULL, 1, 11, 3),
(7, '2024-06-11', 'R', NULL, 1, 12, 3),
(8, '2024-06-11', 'S', NULL, 2, 13, 4),
(9, '2024-06-11', 'S', NULL, 2, 14, 4),
(10, '2024-06-11', 'N', NULL, 3, 15, 5),
(12, '2025-12-10', 'N', NULL, 2, 45, 44),
(17, '2026-04-08', 'N', NULL, 1, 42, 44),
(18, '2026-06-14', '', 'Justificada', 1, 66, 44),
(21, '2026-06-15', 'J', 'Justificada', 2, 73, 72),
(22, '2026-06-17', 'J', 'Justificada', 1, 74, 72),
(23, '2026-06-17', 'N', 'No justificada', 3, 80, 44),
(24, '2026-06-17', 'N', 'No justificada', 3, 80, 72);

--
-- Disparadores `registro_inasistencia`
--
DELIMITER $$
CREATE TRIGGER `contar_inasistencias_aprendiz` AFTER INSERT ON `registro_inasistencia` FOR EACH ROW BEGIN
    DECLARE total_fallas INT;
    DECLARE coordinacion_aprendiz INT;

    -- Contar inasistencias ('N')
    SELECT COUNT(*) INTO total_fallas
    FROM registro_inasistencia
    WHERE aprendiz_Usuario_id_usuario = NEW.aprendiz_Usuario_id_usuario
      AND estado_inasistencia = 'N';

    -- Obtener la coordinación del aprendiz
    SELECT p.coordinacion_id INTO coordinacion_aprendiz
    FROM aprendiz a
    INNER JOIN programas p 
        ON a.programas_id_programas = p.id_programas
    WHERE a.Usuario_id_usuario = NEW.aprendiz_Usuario_id_usuario;

    -- Si tiene 5 o más fallas, generar o actualizar alerta
    IF total_fallas >= 5 THEN
        
        IF EXISTS (
            SELECT 1 FROM alertas_inasistencia
            WHERE aprendiz_id = NEW.aprendiz_Usuario_id_usuario
        ) THEN
            UPDATE alertas_inasistencia
            SET cantidad_fallas = total_fallas,
                fecha_alerta = NOW(),
                mensaje = CONCAT(
                    '⚠️ ALERTA CRÍTICA: El aprendiz con ID ',
                    NEW.aprendiz_Usuario_id_usuario,
                    ' tiene ',
                    total_fallas,
                    ' inasistencias. Se debe iniciar proceso de deserción académica.'
                )
            WHERE aprendiz_id = NEW.aprendiz_Usuario_id_usuario;

        ELSE
            INSERT INTO alertas_inasistencia (
                aprendiz_id,
                cantidad_fallas,
                fecha_alerta,
                mensaje,
                coordinacion_id
            )
            VALUES (
                NEW.aprendiz_Usuario_id_usuario,
                total_fallas,
                NOW(),
                CONCAT(
                    '⚠️ ALERTA CRÍTICA: El aprendiz con ID ',
                    NEW.aprendiz_Usuario_id_usuario,
                    ' tiene ',
                    total_fallas,
                    ' inasistencias. Se debe iniciar proceso de deserción académica.'
                ),
                IFNULL(coordinacion_aprendiz, 1)
            );
        END IF;

    END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_incidente`
--

CREATE TABLE `registro_incidente` (
  `id_incidente` int(11) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `fecha_incidente` date NOT NULL,
  `hora_incidente` time(6) NOT NULL,
  `ambiente_id` int(11) NOT NULL COMMENT 'Ambiente donde sucedió.\n',
  `tipo_inc_id` int(11) NOT NULL COMMENT 'Tipo de incidente.\n',
  `estado` varchar(20) NOT NULL DEFAULT 'ABIERTO',
  `usuario_id_usuario` int(11) NOT NULL,
  `nivel_gravedad` varchar(10) NOT NULL DEFAULT 'Medio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_incidente`
--

INSERT INTO `registro_incidente` (`id_incidente`, `descripcion`, `fecha_incidente`, `hora_incidente`, `ambiente_id`, `tipo_inc_id`, `estado`, `usuario_id_usuario`, `nivel_gravedad`) VALUES
(1, 'Cortocircuito en tomacorriente principal del laboratorio', '2024-06-10', '09:30:00.000000', 2, 1, 'ABIERTO', 3, 'Medio'),
(2, 'Monitor del computador PC-LAB-003 no enciende', '2024-06-11', '14:00:00.000000', 2, 2, 'ABIERTO', 3, 'Medio'),
(3, 'Fallo total de internet en el taller de diseño', '2024-06-12', '10:15:00.000000', 4, 3, 'ABIERTO', 4, 'Medio'),
(4, 'Pata de silla SILLA-101-01 presenta grieta', '2024-06-13', '11:45:00.000000', 1, 4, 'ABIERTO', 4, 'Medio'),
(5, 'Estudiante presentó desmayo durante práctica', '2024-06-14', '08:00:00.000000', 7, 5, 'ABIERTO', 5, 'Medio'),
(6, 'Acceso no autorizado detectado en laboratorio', '2024-06-15', '22:30:00.000000', 2, 6, 'ABIERTO', 6, 'Medio'),
(7, 'Proyector PROY-AUL-002 se apaga automáticamente', '2024-06-16', '15:20:00.000000', 4, 2, 'ABIERTO', 7, 'Medio'),
(8, 'Fuga de agua en el taller de soldadura', '2024-06-17', '07:45:00.000000', 10, 1, 'ABIERTO', 8, 'Medio'),
(18, 'Se daño un equipo en plena formación, ya se aviso a mantenimiento', '2026-04-06', '19:28:00.000000', 7, 2, 'ABIERTO', 44, 'Medio'),
(19, 'Se quemo la toma del ambiente, impidiendo que los computadores tengan energía y posibilitando daños en los equipos', '2026-04-07', '19:13:00.000000', 6, 1, 'En Proceso', 44, 'Alto'),
(20, 'Se fue el internet en varios equipos del ambiente 201', '2026-04-07', '19:15:00.000000', 4, 3, 'Cerrado', 44, 'Bajo');

--
-- Disparadores `registro_incidente`
--
DELIMITER $$
CREATE TRIGGER `responsable_registro_incidente` AFTER INSERT ON `registro_incidente` FOR EACH ROW BEGIN
    INSERT INTO historico_incidentes (
        incidente_id,
        ambiente_id,
        tipo_incidente_id,
        descripcion,
        fecha_registro
    )
    VALUES (
        NEW.id_incidente,
        NEW.ambiente_id,
        NEW.tipo_inc_id,
        NEW.descripcion,
        NOW()
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_minuta`
--

CREATE TABLE `registro_minuta` (
  `id_minuta` int(11) NOT NULL COMMENT 'Clave primaria. Identificador del registro de minuta.\n',
  `fecha_hora_recibo` datetime NOT NULL COMMENT 'Fecha y hora de recibo del ambiente.\n',
  `fecha_hora_entrega` datetime NOT NULL COMMENT 'Fecha y hora de entrega.\n',
  `novedad` text DEFAULT NULL COMMENT 'Novedad o eventualidad ocurrida.\n',
  `descripcion_min` text DEFAULT NULL COMMENT 'Observaciones generales.\n',
  `estado` text NOT NULL COMMENT 'Estado general del ambiente al momento.\n',
  `ambiente_id` int(11) NOT NULL COMMENT 'Ambiente relacionado.\n',
  `guarda_seguridad_Usuario_id_usuario` int(11) NOT NULL COMMENT 'Guarda que recibió o entregó.\n\n',
  `responsable_id` int(11) NOT NULL,
  `registro_minutacol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro_minuta`
--

INSERT INTO `registro_minuta` (`id_minuta`, `fecha_hora_recibo`, `fecha_hora_entrega`, `novedad`, `descripcion_min`, `estado`, `ambiente_id`, `guarda_seguridad_Usuario_id_usuario`, `responsable_id`, `registro_minutacol`) VALUES
(1, '2024-06-15 07:00:00', '2024-06-15 13:00:00', 'Entrega normal del ambiente, sin novedades', 'Recibo y entrega de ambiente 101 sin incidentes', 'Disponible', 1, 8, 3, NULL),
(2, '2024-06-15 13:00:00', '2024-06-15 19:00:00', 'Se reporta problema de conectividad en diseño', 'Ambiente 201 presenta fallas de red intermitentes', 'Disponible', 4, 9, 4, NULL),
(3, '2024-06-15 19:00:00', '2024-06-16 07:00:00', 'Ronda nocturna sin incidentes', 'Verificación de seguridad en todos los ambientes', 'Disponible', 2, 10, 5, NULL),
(4, '2024-06-16 07:00:00', '2024-06-16 13:00:00', 'Reporte de equipo dañado en laboratorio', 'PC-LAB-003 presenta falla en monitor', 'Disponible', 2, 8, 6, NULL),
(5, '2024-06-16 13:00:00', '2024-06-16 19:00:00', 'Mantenimiento preventivo realizado', 'Limpieza y verificación de equipos en taller mecánica', 'Disponible', 9, 9, 7, NULL),
(6, '2024-06-17 07:00:00', '2024-06-17 13:00:00', 'Emergencia médica atendida satisfactoriamente', 'Estudiante atendido por desmayo, trasladado a enfermería', 'Disponible', 7, 8, 3, NULL),
(8, '2025-12-11 21:44:00', '2025-12-11 21:46:00', 'Ninguna', 'Todo correcto', 'Disponible', 1, 46, 44, NULL),
(9, '2025-12-11 21:48:00', '2025-12-11 21:50:00', 'Todo bien', 'Normal', 'Disponible', 1, 46, 44, NULL),
(10, '2025-12-12 02:43:00', '2025-12-12 02:45:00', 'Nada nuevo\r\n', 'Todo correcto', 'Disponible', 1, 46, 44, NULL),
(13, '2025-12-12 11:51:00', '2025-12-12 11:54:00', 'Nuevo ambiente ', 'apertura de ambiente', 'Disponible', 3, 46, 7, NULL),
(15, '2026-04-07 00:54:00', '2026-04-07 03:54:00', 'Se abre el ambiente 301', 'El instructor solicita apertura de ambiente 301', 'Disponible', 6, 46, 44, NULL),
(16, '2026-04-08 09:53:00', '2026-04-08 11:53:00', 'n', 'Aula en clase', 'Disponible', 4, 46, 7, NULL),
(17, '2026-06-15 03:33:04', '2026-06-14 21:33:00', 'Se abre el ambiente 202', 'Ninguna novedad', 'Disponible', 5, 46, 44, NULL),
(18, '2026-06-15 18:22:00', '2026-06-15 18:25:00', 'Ninguna', 'Todo correcto', 'Disponible', 7, 46, 44, NULL),
(19, '2026-06-15 18:52:00', '2026-06-15 18:55:00', 'Ninguna', 'Todo correcto', 'Disponible', 5, 46, 44, NULL),
(20, '2026-06-15 19:13:00', '2026-06-15 19:16:00', 'Ninguna', 'Todo correcto', 'Disponible', 1, 46, 4, NULL),
(21, '2026-06-15 20:39:00', '2026-06-15 20:45:00', 'Ninguna', 'Nada', 'Disponible', 7, 46, 44, NULL);

--
-- Disparadores `registro_minuta`
--
DELIMITER $$
CREATE TRIGGER `tr_asignar_estado_minuta` BEFORE INSERT ON `registro_minuta` FOR EACH ROW BEGIN
    IF NEW.fecha_hora_entrega > NOW() THEN
        SET NEW.estado = 'Ocupado';
    ELSE
        SET NEW.estado = 'Disponible';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL COMMENT 'Clave primaria. Identificador del rol.\n',
  `nombre_rol` varchar(45) NOT NULL COMMENT 'Nombre del rol (aprendiz, instructor, etc.).\n\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Instructor'),
(3, 'Aprendiz'),
(4, 'Guarda de Seguridad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
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
-- Estructura de tabla para la tabla `sources_filesource`
--

CREATE TABLE `sources_filesource` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sources_urlsource`
--

CREATE TABLE `sources_urlsource` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(200) NOT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_incidente`
--

CREATE TABLE `tipo_incidente` (
  `id_tipo_inc` int(11) NOT NULL COMMENT 'Clave primaria. Identificador del tipo de incidente.\n',
  `tipo_incidente` varchar(45) NOT NULL COMMENT 'Nombre del tipo.\n',
  `observacion_inc` text NOT NULL COMMENT 'Observación adicional.\n\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_incidente`
--

INSERT INTO `tipo_incidente` (`id_tipo_inc`, `tipo_incidente`, `observacion_inc`) VALUES
(1, 'Falla Eléctrica', 'Problemas con el suministro de energía'),
(2, 'Daño de Equipo', 'Equipo de cómputo defectuoso'),
(3, 'Problema de Conectividad', 'Fallo en la red de internet'),
(4, 'Falla de Mobiliario', 'Silla o mesa rota'),
(5, 'Emergencia Médica', 'Situación de salud de un aprendiz o instructor'),
(6, 'Problema de Seguridad', 'Incidentes relacionados con la seguridad del centro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_recurso`
--

CREATE TABLE `tipo_recurso` (
  `id_tipo_recurso` int(11) NOT NULL COMMENT 'Clave primaria. Identificador del tipo de recurso.\n',
  `recurso_tipo` varchar(45) NOT NULL COMMENT 'Nombre del tipo (ej. PC, proyector, aire, etc.).\n',
  `descripcion_tipo` varchar(60) DEFAULT NULL COMMENT 'Descripción adicional.\n\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_recurso`
--

INSERT INTO `tipo_recurso` (`id_tipo_recurso`, `recurso_tipo`, `descripcion_tipo`) VALUES
(1, 'Computador', 'Equipo informático de escritorio'),
(2, 'Proyector', 'Equipo para proyección de imágenes'),
(3, 'Impresora', 'Dispositivo para imprimir documentos'),
(4, 'Mobiliario', 'Sillas, mesas, armarios'),
(5, 'Herramienta', 'Herramientas manuales o eléctricas'),
(6, 'Audio/Video', 'Equipos de sonido y video'),
(7, 'Red', 'Equipos de networking y comunicaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado_recurso`
--

CREATE TABLE `traslado_recurso` (
  `id_traslado` int(11) NOT NULL COMMENT 'Clave primaria. Identificador del traslado.\n',
  `recurso_id` int(11) NOT NULL COMMENT 'Recurso trasladado.\n',
  `ambiente_origen` int(11) NOT NULL COMMENT 'Ambiente de origen.\n',
  `ambiente_destino` int(11) NOT NULL COMMENT 'Ambiente de destino.\n',
  `fecha_traslado` datetime NOT NULL COMMENT 'Fecha del traslado.\n',
  `observacion` text DEFAULT NULL COMMENT 'Observaciones del traslado.\n\n',
  `instructor_destino` int(11) DEFAULT NULL,
  `instructor_origen` int(11) DEFAULT NULL,
  `tiempo_prestamo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `traslado_recurso`
--

INSERT INTO `traslado_recurso` (`id_traslado`, `recurso_id`, `ambiente_origen`, `ambiente_destino`, `fecha_traslado`, `observacion`, `instructor_destino`, `instructor_origen`, `tiempo_prestamo`) VALUES
(2, 1, 1, 2, '2025-12-12 03:06:00', 'Se presta temporalmente', 4, 3, '2 horas'),
(6, 4, 2, 3, '2025-12-12 03:32:00', 'Se presta el proyector dos', 4, 3, '2 horas'),
(8, 6, 4, 7, '2025-12-12 03:39:00', 'Se devuelve impresora', 4, 3, '2 horas'),
(11, 7, 7, 2, '2026-04-07 01:26:00', 'Se hace traslado de impresora', 4, 3, '2 horas'),
(12, 10, 10, 1, '2026-06-15 20:44:00', 'Se realiza prestamo temporal', 44, 6, '6 horas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_rol`
--

CREATE TABLE `user_rol` (
  `id_user_rol` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_rol`
--

INSERT INTO `user_rol` (`id_user_rol`, `id_usuario`, `id_rol`) VALUES
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 4),
(9, 9, 4),
(10, 10, 4),
(11, 11, 3),
(12, 12, 3),
(13, 13, 3),
(14, 14, 3),
(15, 15, 3),
(16, 16, 3),
(17, 17, 3),
(18, 18, 3),
(19, 19, 3),
(20, 20, 3),
(21, 21, 1),
(42, 42, 3),
(43, 43, 1),
(44, 44, 2),
(45, 45, 3),
(46, 46, 4),
(52, 52, 3),
(68, 65, 3),
(69, 66, 3),
(70, 67, 3),
(71, 68, 3),
(72, 69, 2),
(73, 70, 2),
(77, 73, 3),
(78, 72, 2),
(79, 74, 3),
(82, 1, 2),
(88, 80, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `p_nombre` varchar(50) NOT NULL,
  `s_nombre` varchar(50) DEFAULT NULL,
  `p_apellido` varchar(45) NOT NULL,
  `s_apellido` varchar(45) DEFAULT NULL,
  `tipo_documento` varchar(4) NOT NULL,
  `num_documento` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL COMMENT 'Contraseña cifrada.\n\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `p_nombre`, `s_nombre`, `p_apellido`, `s_apellido`, `tipo_documento`, `num_documento`, `correo`, `contraseña`) VALUES
(1, 'Carlos', 'Alberto', 'Rodriguez', 'Peña', 'CC', 1012345001, 'carlos.rodriguez@sena.edu.co', '0192023a7bbd73250516f069df18b500'),
(2, 'Ana', 'Maria', 'Gonzalez', 'Lopez', 'CC', 1012345002, 'ana.gonzalez@sena.edu.co', '1a145a23d6e47aadfe2063f1f951e691'),
(3, 'Juan', 'Carlos', 'Perez', 'Gomez', 'CC', 1012345003, 'juan.perez@sena.edu.co', '04b918c442e65393a51bbc5053182e94'),
(4, 'Maria', 'Alejandra', 'Lopez', 'Diaz', 'CC', 1012345004, 'maria.lopez@sena.edu.co', '9564628d490f9ad17f45191e01cd7aae'),
(5, 'Pedro', 'Luis', 'Martinez', 'Silva', 'CC', 1012345005, 'pedro.martinez@sena.edu.co', 'b6de54b24ff4234c4f8226aaee5279a7'),
(6, 'Laura', 'Sofia', 'Torres', 'Vargas', 'CC', 1012345006, 'laura.torres@sena.edu.co', 'd217ffa64094a64f26dae45343d576d5'),
(7, 'Diego', 'Andres', 'Ramirez', 'Castro', 'CC', 1012345007, 'diego.ramirez@sena.edu.co', '22d90ef7d0e27f194ced2add1ede92d9'),
(8, 'Roberto', 'Antonio', 'Morales', 'Ruiz', 'CC', 1012345008, 'roberto.morales@sena.edu.co', '8dc137e098b97d39ba9915f9e7a45e57'),
(9, 'Carmen', 'Isabel', 'Jimenez', 'Herrera', 'CC', 1012345009, 'carmen.jimenez@sena.edu.co', 'b676728cb9ca01df59767ec700ef2e34'),
(10, 'Fernando', 'Jose', 'Gutierrez', 'Sanchez', 'CC', 1012345010, 'fernando.gutierrez@sena.edu.co', 'c32bc6d9da419ec0efafac778b2d29f9'),
(11, 'Alejandro', 'David', 'Moreno', 'Ortega', 'TI', 1012345011, 'alejandro.moreno@misena.edu.co', '0ad573be49c0c011c304fdb2970c4459'),
(12, 'Valentina', 'Camila', 'Diaz', 'Suarez', 'TI', 1012345012, 'valentina.diaz@misena.edu.co', '7a4e1484b9ad8b2f796b6db886f180a5'),
(13, 'Sebastian', 'Nicolas', 'Vargas', 'Mendez', 'TI', 1012345013, 'sebastian.vargas@misena.edu.co', 'b33cee39b81423da28a67ded123e181b'),
(14, 'Isabella', 'Andrea', 'Rojas', 'Pineda', 'TI', 1012345014, 'isabella.rojas@misena.edu.co', '37adf989e70a814429b0495773f87f26'),
(15, 'Mateo', 'Alejandro', 'Castillo', 'Vega', 'TI', 1012345015, 'mateo.castillo@misena.edu.co', 'd94095750f31d48813e82913e8209511'),
(16, 'Sophia', 'Valentina', 'Hernandez', 'Molina', 'TI', 1012345016, 'sophia.hernandez@misena.edu.co', 'a1c75410f4497cc90e499aa1640a6111'),
(17, 'Daniel', 'Santiago', 'Florez', 'Rios', 'TI', 1012345017, 'daniel.florez@misena.edu.co', '15122e8adf18b1a3ea40838034fb7718'),
(18, 'Camila', 'Alejandra', 'Acosta', 'Guerrero', 'TI', 1012345018, 'camila.acosta@misena.edu.co', '2803413a0bec8c4c8a70831be6c0b94c'),
(19, 'Andres', 'Felipe', 'Ospina', 'Cardenas', 'TI', 1012345019, 'andres.ospina@misena.edu.co', 'ab53cd4138c6cc21c856de4360c2bd1f'),
(20, 'Mariana', 'Juliana', 'Parra', 'Aguilar', 'TI', 1012345020, 'mariana.parra@misena.edu.co', '1153693d12f4d097c1b02d9ad5d787ec'),
(21, 'David', 'Santiago', 'Cruz', 'Amado', 'CC', 1013123184, 'david.cruz@sena.edu.co', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5'),
(42, 'Luis', 'Javier', 'Mariño', 'Beltran', 'CC', 1021672531, 'soylucho2006@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(43, 'Elkin ', 'Gustavo', 'Olarte', 'Olarte', 'CC', 1140914957, 'elkingustavo15@gmail.com', '8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414'),
(44, 'Kennen', 'Stwd', 'Cortes', 'Chaparro', 'CC', 1234567890, 'instructor@gmail.com', '47e91eba0cc1d77bcd14812ab877ef64962ba8be7aedf495bbdc1914c0780378'),
(45, 'Camilo', 'Andrey', 'Diaz', 'Sarmiento', 'CC', 1010101010, 'camilo@gmail.com', '5aea47df7713fa92d0abe9cfeea34261396541a0c432c8a45a68acecc9f65ec2'),
(46, 'Mahily :3', 'Kathalina', 'Gutierrez', 'Ramirez', 'TI', 1028487888, 'guarda@gmail.com', '13791440eec56d20730b2c42e51e36f51d793d2f0e81483bbf6130f316661510'),
(52, 'Sergio', 'Alejandro', 'Espinoza', 'Muñoz', 'CC', 1000726773, 'sergio@gmail.com', 'e77cb994418f5bc0ec1007b6c137918d9aed4e7b0bde45d74a50d09272c2d602'),
(65, 'Nicolas', 'Andrey', 'Tavarez', 'Sanchez', 'TI', 1140915463, 'nicolas@gmail.com', 'f65c20e8412f0eb2ade4531ad3d2471bcbafe5f2d3cdaa6324a6e47356a3f819'),
(66, 'Valerie', '', 'Hernandez', '', 'CC', 79919258, 'valerie@gmail.com', '046b9667462a716e1a5121095f11153101a8b8d4358222af8c8e1b98a9bec1f1'),
(67, 'Carlos', 'Andres', 'Ramirez', 'Pedraza', 'CC', 1023456789, 'carlos.ramirez@sena.edu.co', '8df25db9f7c3fd2a50f5fe37fa7ef138'),
(68, 'Valentina', 'Sofia', 'Torres', 'Muñoz', 'CC', 1098765432, 'valentina.torres@sena.edu.co', '8df25db9f7c3fd2a50f5fe37fa7ef138'),
(69, 'Jorge', 'Luis', 'Bermudez', 'Castro', 'CC', 79456123, 'jorge.bermudez@sena.edu.co', '8df25db9f7c3fd2a50f5fe37fa7ef138'),
(70, 'Adriana', 'Paola', 'Guerrero', 'Salinas', 'CC', 52789456, 'adriana.guerrero@sena.edu.co', '8df25db9f7c3fd2a50f5fe37fa7ef138'),
(72, 'Paula', 'Andrea', 'Conde', 'Aguja', 'CC', 1023378379, 'condepaula472@gmail.com', 'c56393689c5b7d0dc0135ec12e1f7639195b44442fbc74ba7bec2bddcf902a14'),
(73, 'Julian', 'Alonso', 'Perez', 'Garcia', 'CC', 1234567880, 'pa.alvaritocruz@gmail.com', 'eb52fc9a4b3a81a2000a9e774d5aa515'),
(74, 'Sharon', 'Daniela', 'Hernandez', 'Puerto', 'CC', 202466675, 'sharond_hernandezp@soy.sena.edu.co', '49fdb41edb85ad332a8f871af8f0d7629183469ed665db19fbd062c8facb2f43'),
(80, 'Juan', 'Carlos', 'Perez', 'Garcia', 'CC', 12345678, 'juan@sena.edu.co', 'eb52fc9a4b3a81a2000a9e774d5aa515');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `alertas_inasistencia`
--
ALTER TABLE `alertas_inasistencia`
  ADD PRIMARY KEY (`id_alerta`),
  ADD KEY `coordinacion_id` (`coordinacion_id`);

--
-- Indices de la tabla `ambiente`
--
ALTER TABLE `ambiente`
  ADD PRIMARY KEY (`id_ambiente`);

--
-- Indices de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`Usuario_id_usuario`),
  ADD KEY `programas_id_programas` (`programas_id_programas`),
  ADD KEY `ficha_idficha` (`ficha_idficha`);

--
-- Indices de la tabla `asignacion_ambiente`
--
ALTER TABLE `asignacion_ambiente`
  ADD PRIMARY KEY (`id_asignacion`),
  ADD KEY `asignacion_ambiente_instructor_usuario_id_usuario_foreign` (`instructor_Usuario_id_usuario`),
  ADD KEY `asignacion_ambiente_ambiente_id_foreign` (`ambiente_id`),
  ADD KEY `asignacion_ambiente_jornada_id_76f6b438_fk_jornada_id_jornada` (`jornada_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `coordinacion`
--
ALTER TABLE `coordinacion`
  ADD PRIMARY KEY (`id_coordinacion`);

--
-- Indices de la tabla `coordinador`
--
ALTER TABLE `coordinador`
  ADD PRIMARY KEY (`Usuario_id_usuario`),
  ADD KEY `coordinacion_id_coordinacion` (`coordinacion_id_coordinacion`);

--
-- Indices de la tabla `data_wizard_identifier`
--
ALTER TABLE `data_wizard_identifier`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `data_wizard_range`
--
ALTER TABLE `data_wizard_range`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_wizard_range_run_id_9710f2b9_fk_data_wizard_run_id` (`run_id`),
  ADD KEY `data_wizard_range_identifier_id_95d321ae_fk_data_wiza` (`identifier_id`);

--
-- Indices de la tabla `data_wizard_record`
--
ALTER TABLE `data_wizard_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_wizard_record_run_id_fac342f0_fk_data_wizard_run_id` (`run_id`),
  ADD KEY `data_wizard_record_content_type_id_f2a3c06c_fk_django_co` (`content_type_id`);

--
-- Indices de la tabla `data_wizard_run`
--
ALTER TABLE `data_wizard_run`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_wizard_run_content_type_id_70de43ee_fk_django_co` (`content_type_id`),
  ADD KEY `data_wizard_run_user_id_c1617f52_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `data_wizard_runlog`
--
ALTER TABLE `data_wizard_runlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_wizard_runlog_run_id_4614c618_fk_data_wizard_run_id` (`run_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `ficha`
--
ALTER TABLE `ficha`
  ADD PRIMARY KEY (`idficha`);

--
-- Indices de la tabla `ficha_instructor`
--
ALTER TABLE `ficha_instructor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `guarda_seguridad`
--
ALTER TABLE `guarda_seguridad`
  ADD PRIMARY KEY (`Usuario_id_usuario`);

--
-- Indices de la tabla `historico_incidentes`
--
ALTER TABLE `historico_incidentes`
  ADD PRIMARY KEY (`id_historico`),
  ADD KEY `incidente_id` (`incidente_id`),
  ADD KEY `ambiente_id` (`ambiente_id`),
  ADD KEY `tipo_incidente_id` (`tipo_incidente_id`);

--
-- Indices de la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`Usuario_id_usuario`),
  ADD KEY `coordinacion_id_coordinacion` (`coordinacion_id_coordinacion`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`id_jornada`);

--
-- Indices de la tabla `justificacion`
--
ALTER TABLE `justificacion`
  ADD PRIMARY KEY (`id_justificacion`),
  ADD KEY `justificacion_registro_inasistencia_id_foreign` (`registro_inasistencia_id`),
  ADD KEY `justificacion_usuario_revisor_id_foreign` (`usuario_revisor_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  ADD PRIMARY KEY (`id_modalidad`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`id_programas`),
  ADD KEY `jornada_id` (`jornada_id`),
  ADD KEY `modalidad_id` (`modalidad_id`),
  ADD KEY `coordinacion_id` (`coordinacion_id`);

--
-- Indices de la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD PRIMARY KEY (`id_recurso`),
  ADD KEY `tipo_recurso` (`tipo_recurso`),
  ADD KEY `ambiente_id` (`ambiente_id`);

--
-- Indices de la tabla `registro_inasistencia`
--
ALTER TABLE `registro_inasistencia`
  ADD PRIMARY KEY (`id_inasistencia`),
  ADD KEY `jornada_id` (`jornada_id`),
  ADD KEY `aprendiz_Usuario_id_usuario` (`aprendiz_Usuario_id_usuario`),
  ADD KEY `instructor_Usuario_id_usuario` (`instructor_Usuario_id_usuario`);

--
-- Indices de la tabla `registro_incidente`
--
ALTER TABLE `registro_incidente`
  ADD PRIMARY KEY (`id_incidente`),
  ADD KEY `ambiente_id` (`ambiente_id`),
  ADD KEY `tipo_inc_id` (`tipo_inc_id`),
  ADD KEY `usuario_id_usuario` (`usuario_id_usuario`);

--
-- Indices de la tabla `registro_minuta`
--
ALTER TABLE `registro_minuta`
  ADD PRIMARY KEY (`id_minuta`),
  ADD KEY `ambiente_id` (`ambiente_id`),
  ADD KEY `guarda_seguridad_Usuario_id_usuario` (`guarda_seguridad_Usuario_id_usuario`),
  ADD KEY `responsable_id` (`responsable_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `sources_filesource`
--
ALTER TABLE `sources_filesource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sources_filesource_user_id_eed9dcc7_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `sources_urlsource`
--
ALTER TABLE `sources_urlsource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sources_urlsource_user_id_49916f8f_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `tipo_incidente`
--
ALTER TABLE `tipo_incidente`
  ADD PRIMARY KEY (`id_tipo_inc`);

--
-- Indices de la tabla `tipo_recurso`
--
ALTER TABLE `tipo_recurso`
  ADD PRIMARY KEY (`id_tipo_recurso`);

--
-- Indices de la tabla `traslado_recurso`
--
ALTER TABLE `traslado_recurso`
  ADD PRIMARY KEY (`id_traslado`),
  ADD KEY `recurso_id` (`recurso_id`),
  ADD KEY `ambiente_origen` (`ambiente_origen`),
  ADD KEY `traslado_recurso_instructor_destino_4efe2099_fk_instructo` (`instructor_destino`),
  ADD KEY `traslado_recurso_instructor_origen_1a06a65c_fk_instructo` (`instructor_origen`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `user_rol`
--
ALTER TABLE `user_rol`
  ADD PRIMARY KEY (`id_user_rol`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alertas_inasistencia`
--
ALTER TABLE `alertas_inasistencia`
  MODIFY `id_alerta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria. Identificador de la alerta.\n', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `asignacion_ambiente`
--
ALTER TABLE `asignacion_ambiente`
  MODIFY `id_asignacion` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `coordinacion`
--
ALTER TABLE `coordinacion`
  MODIFY `id_coordinacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria. Identificador de la coordinación.\n', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `data_wizard_identifier`
--
ALTER TABLE `data_wizard_identifier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `data_wizard_range`
--
ALTER TABLE `data_wizard_range`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `data_wizard_record`
--
ALTER TABLE `data_wizard_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `data_wizard_run`
--
ALTER TABLE `data_wizard_run`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `data_wizard_runlog`
--
ALTER TABLE `data_wizard_runlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ficha`
--
ALTER TABLE `ficha`
  MODIFY `idficha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ficha_instructor`
--
ALTER TABLE `ficha_instructor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `historico_incidentes`
--
ALTER TABLE `historico_incidentes`
  MODIFY `id_historico` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria. Identificador del historial del incidente.\n', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `justificacion`
--
ALTER TABLE `justificacion`
  MODIFY `id_justificacion` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `recursos`
--
ALTER TABLE `recursos`
  MODIFY `id_recurso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria. Identificador del recurso.\n', AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `registro_inasistencia`
--
ALTER TABLE `registro_inasistencia`
  MODIFY `id_inasistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `registro_incidente`
--
ALTER TABLE `registro_incidente`
  MODIFY `id_incidente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `registro_minuta`
--
ALTER TABLE `registro_minuta`
  MODIFY `id_minuta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria. Identificador del registro de minuta.\n', AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `sources_filesource`
--
ALTER TABLE `sources_filesource`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sources_urlsource`
--
ALTER TABLE `sources_urlsource`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `traslado_recurso`
--
ALTER TABLE `traslado_recurso`
  MODIFY `id_traslado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria. Identificador del traslado.\n', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_rol`
--
ALTER TABLE `user_rol`
  MODIFY `id_user_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alertas_inasistencia`
--
ALTER TABLE `alertas_inasistencia`
  ADD CONSTRAINT `alertas_inasistencia_ibfk_1` FOREIGN KEY (`coordinacion_id`) REFERENCES `coordinacion` (`id_coordinacion`);

--
-- Filtros para la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD CONSTRAINT `aprendiz_ibfk_1` FOREIGN KEY (`programas_id_programas`) REFERENCES `programas` (`id_programas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `aprendiz_ibfk_2` FOREIGN KEY (`Usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `aprendiz_ibfk_3` FOREIGN KEY (`ficha_idficha`) REFERENCES `ficha` (`idficha`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asignacion_ambiente`
--
ALTER TABLE `asignacion_ambiente`
  ADD CONSTRAINT `asignacion_ambiente_ambiente_id_foreign` FOREIGN KEY (`ambiente_id`) REFERENCES `ambiente` (`id_ambiente`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignacion_ambiente_instructor_usuario_id_usuario_foreign` FOREIGN KEY (`instructor_Usuario_id_usuario`) REFERENCES `instructor` (`Usuario_id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignacion_ambiente_jornada_id_76f6b438_fk_jornada_id_jornada` FOREIGN KEY (`jornada_id`) REFERENCES `jornada` (`id_jornada`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `coordinador`
--
ALTER TABLE `coordinador`
  ADD CONSTRAINT `coordinador_ibfk_1` FOREIGN KEY (`Usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `coordinador_ibfk_2` FOREIGN KEY (`coordinacion_id_coordinacion`) REFERENCES `coordinacion` (`id_coordinacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `data_wizard_range`
--
ALTER TABLE `data_wizard_range`
  ADD CONSTRAINT `data_wizard_range_identifier_id_95d321ae_fk_data_wiza` FOREIGN KEY (`identifier_id`) REFERENCES `data_wizard_identifier` (`id`),
  ADD CONSTRAINT `data_wizard_range_run_id_9710f2b9_fk_data_wizard_run_id` FOREIGN KEY (`run_id`) REFERENCES `data_wizard_run` (`id`);

--
-- Filtros para la tabla `data_wizard_record`
--
ALTER TABLE `data_wizard_record`
  ADD CONSTRAINT `data_wizard_record_content_type_id_f2a3c06c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `data_wizard_record_run_id_fac342f0_fk_data_wizard_run_id` FOREIGN KEY (`run_id`) REFERENCES `data_wizard_run` (`id`);

--
-- Filtros para la tabla `data_wizard_run`
--
ALTER TABLE `data_wizard_run`
  ADD CONSTRAINT `data_wizard_run_content_type_id_70de43ee_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `data_wizard_run_user_id_c1617f52_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `data_wizard_runlog`
--
ALTER TABLE `data_wizard_runlog`
  ADD CONSTRAINT `data_wizard_runlog_run_id_4614c618_fk_data_wizard_run_id` FOREIGN KEY (`run_id`) REFERENCES `data_wizard_run` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `guarda_seguridad`
--
ALTER TABLE `guarda_seguridad`
  ADD CONSTRAINT `guarda_seguridad_ibfk_1` FOREIGN KEY (`Usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `historico_incidentes`
--
ALTER TABLE `historico_incidentes`
  ADD CONSTRAINT `historico_incidentes_ibfk_1` FOREIGN KEY (`incidente_id`) REFERENCES `registro_incidente` (`id_incidente`),
  ADD CONSTRAINT `historico_incidentes_ibfk_2` FOREIGN KEY (`ambiente_id`) REFERENCES `ambiente` (`id_ambiente`),
  ADD CONSTRAINT `historico_incidentes_ibfk_3` FOREIGN KEY (`tipo_incidente_id`) REFERENCES `tipo_incidente` (`id_tipo_inc`);

--
-- Filtros para la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`Usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `instructor_ibfk_2` FOREIGN KEY (`coordinacion_id_coordinacion`) REFERENCES `coordinacion` (`id_coordinacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `justificacion`
--
ALTER TABLE `justificacion`
  ADD CONSTRAINT `justificacion_registro_inasistencia_id_foreign` FOREIGN KEY (`registro_inasistencia_id`) REFERENCES `registro_inasistencia` (`id_inasistencia`) ON DELETE CASCADE,
  ADD CONSTRAINT `justificacion_usuario_revisor_id_foreign` FOREIGN KEY (`usuario_revisor_id`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL;

--
-- Filtros para la tabla `programas`
--
ALTER TABLE `programas`
  ADD CONSTRAINT `programas_ibfk_1` FOREIGN KEY (`jornada_id`) REFERENCES `jornada` (`id_jornada`),
  ADD CONSTRAINT `programas_ibfk_2` FOREIGN KEY (`modalidad_id`) REFERENCES `modalidad` (`id_modalidad`),
  ADD CONSTRAINT `programas_ibfk_3` FOREIGN KEY (`coordinacion_id`) REFERENCES `coordinacion` (`id_coordinacion`);

--
-- Filtros para la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD CONSTRAINT `recursos_ibfk_1` FOREIGN KEY (`tipo_recurso`) REFERENCES `tipo_recurso` (`id_tipo_recurso`),
  ADD CONSTRAINT `recursos_ibfk_2` FOREIGN KEY (`ambiente_id`) REFERENCES `ambiente` (`id_ambiente`);

--
-- Filtros para la tabla `registro_inasistencia`
--
ALTER TABLE `registro_inasistencia`
  ADD CONSTRAINT `registro_inasistencia_ibfk_1` FOREIGN KEY (`jornada_id`) REFERENCES `jornada` (`id_jornada`),
  ADD CONSTRAINT `registro_inasistencia_ibfk_2` FOREIGN KEY (`aprendiz_Usuario_id_usuario`) REFERENCES `aprendiz` (`Usuario_id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `registro_inasistencia_ibfk_3` FOREIGN KEY (`instructor_Usuario_id_usuario`) REFERENCES `instructor` (`Usuario_id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro_incidente`
--
ALTER TABLE `registro_incidente`
  ADD CONSTRAINT `registro_incidente_ibfk_1` FOREIGN KEY (`ambiente_id`) REFERENCES `ambiente` (`id_ambiente`),
  ADD CONSTRAINT `registro_incidente_ibfk_2` FOREIGN KEY (`tipo_inc_id`) REFERENCES `tipo_incidente` (`id_tipo_inc`),
  ADD CONSTRAINT `registro_incidente_ibfk_3` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registro_minuta`
--
ALTER TABLE `registro_minuta`
  ADD CONSTRAINT `registro_minuta_ibfk_1` FOREIGN KEY (`ambiente_id`) REFERENCES `ambiente` (`id_ambiente`),
  ADD CONSTRAINT `registro_minuta_ibfk_2` FOREIGN KEY (`guarda_seguridad_Usuario_id_usuario`) REFERENCES `guarda_seguridad` (`Usuario_id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `registro_minuta_ibfk_3` FOREIGN KEY (`responsable_id`) REFERENCES `instructor` (`Usuario_id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sources_filesource`
--
ALTER TABLE `sources_filesource`
  ADD CONSTRAINT `sources_filesource_user_id_eed9dcc7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `sources_urlsource`
--
ALTER TABLE `sources_urlsource`
  ADD CONSTRAINT `sources_urlsource_user_id_49916f8f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `traslado_recurso`
--
ALTER TABLE `traslado_recurso`
  ADD CONSTRAINT `traslado_recurso_ibfk_1` FOREIGN KEY (`recurso_id`) REFERENCES `recursos` (`id_recurso`),
  ADD CONSTRAINT `traslado_recurso_ibfk_2` FOREIGN KEY (`ambiente_origen`) REFERENCES `ambiente` (`id_ambiente`),
  ADD CONSTRAINT `traslado_recurso_instructor_destino_4efe2099_fk_instructo` FOREIGN KEY (`instructor_destino`) REFERENCES `instructor` (`Usuario_id_usuario`),
  ADD CONSTRAINT `traslado_recurso_instructor_origen_1a06a65c_fk_instructo` FOREIGN KEY (`instructor_origen`) REFERENCES `instructor` (`Usuario_id_usuario`);

--
-- Filtros para la tabla `user_rol`
--
ALTER TABLE `user_rol`
  ADD CONSTRAINT `user_rol_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `user_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
