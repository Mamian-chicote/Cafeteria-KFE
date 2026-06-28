-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-06-2026 a las 05:54:27
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cafeteria_db`
--
CREATE DATABASE IF NOT EXISTS `cafeteria_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cafeteria_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id`, `correo`, `password`) VALUES
(1, 'admin@cecytem.edu.mx', '$2y$10$Qk3R29u1Z.QWk0F0V9K9O.5O/6lH4d1YJ7uQp1Sj5M8f/L1vH.vXq');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `nombre`, `correo`, `password`) VALUES
(1, 'Alumno Prueba', 'alumno@cecytem.edu.mx', '$2y$10$MhFOo/Iz9p.5dapWpcx44OOwxuK30SuwRe55L0xLQP5HCQ4nlxu92'),
(2, 'alan', 'lol@cecytem.edu.mx', '$2y$10$8yj1Uk7tNAaYSpbA7dkRdOAvpjiBKR3OjXRx1TavNIJRoLGevPEh2'),
(3, 'Damian', 'Damian@soycecytem.mx', '$2y$10$J8ibs0DGxpjmBZaQQA0ireIqHO08KR5vjQCnHuKahQ3sbSZ5AsJ0W');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `productos` text DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `metodo_pago` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `nombre_cliente`, `productos`, `total`, `fecha`, `metodo_pago`) VALUES
(1, 'Miranda', 'El carrito está vacío\nCafé Americano - $25.00', 25.00, '2026-06-27 23:56:20', ''),
(2, 'Garcia', 'El carrito está vacío\nAgua de Sabor - $25.00', 25.00, '2026-06-28 00:01:54', ''),
(3, 'Damian', 'El carrito está vacío\nCafé Americano - $25.00\nAgua de Sabor - $25.00', 50.00, '2026-06-28 00:47:50', ''),
(4, 'Sol', 'El carrito está vacío\nGomitas - $13.00\nTorta - $32.00', 45.00, '2026-06-28 03:06:57', 'transferencia'),
(5, 'polis', 'El carrito está vacío\nGomitas - $13.00\nTorta - $32.00', 45.00, '2026-06-28 03:12:39', 'efectivo'),
(6, 'Sara', 'El carrito está vacío\nGomitas - $13.00\nTorta - $32.00\nBoing de Uva - $30.00', 75.00, '2026-06-28 03:21:25', 'tarjeta'),
(7, 'Lopez', 'El carrito está vacío\nTorta - $32.00\nBoing de Uva - $30.00\nGomitas - $13.00\nCafé Americano - $26.00', 101.00, '2026-06-28 03:25:53', 'efectivo'),
(8, 'Ñamo', 'El carrito está vacío\nCafé Americano - $26.00\nGomitas - $13.00', 39.00, '2026-06-28 03:43:13', 'efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `agotado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `categoria`, `precio`, `agotado`) VALUES
(1, 'Café Americano', 'undefined', 'undefined', 26.00, 0),
(2, 'Hamburguesa Clásica', 'Carne de res, queso, lechuga', 'Comida', 50.00, 0),
(3, 'Agua de Sabor', 'Agua de horchata', 'agua', 25.00, 0),
(5, 'Boing de Uva', 'Boing de Uva', 'Agua', 30.00, 0),
(6, 'Torta', 'null', 'comida', 32.00, 0),
(7, 'Gomitas', 'gomitas de panditas', 'dulces', 13.00, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
