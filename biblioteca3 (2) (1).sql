-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2024 a las 20:18:37
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
-- Base de datos: `biblioteca3`
--
CREATE DATABASE IF NOT EXISTS `biblioteca3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `biblioteca3`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `autor_id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`autor_id`, `nombre`, `apellido`) VALUES
(1, 'Gabriel', 'García Márquez'),
(2, 'J.K.', 'Rowling'),
(3, 'George', 'Orwell'),
(4, 'Harper', 'Lee'),
(5, 'J.R.R.', 'Tolkien'),
(6, 'Jane', 'Austen'),
(7, 'Ernest', 'Hemingway'),
(8, 'Agatha', 'Christie'),
(9, 'Leo', 'Tolstoy'),
(10, 'F. Scott', 'Fitzgerald');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp(),
  `contrasena` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `email`, `telefono`, `direccion`, `fecha_registro`, `contrasena`) VALUES
(1, 'Juan', 'Pérez', 'juan.perez@example.com', '123456789', 'Calle A, Ciudad', '2024-01-29 06:35:16', NULL),
(2, 'Ana', 'Gómez', 'ana.gomez@example.com', '987654321', 'Messi', '2024-01-29 06:35:16', '1234'),
(3, 'Carlos', 'Rodríguez', 'carlos.rodriguez@example.com', '555123456', 'Plaza C, Ciudad', '2024-01-29 06:35:16', NULL),
(4, 'Toni', 'Postigo', 'toni@', '123456789', 'Tomeu', '2024-01-29 06:35:16', '123'),
(5, 'Pedro', 'Martínez', 'pedro.martinez2@example.com', '123789456', 'Avenida E, Ciudad', '2024-01-29 06:35:16', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_publicacion` date DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `cantidad_disponible` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor_id`, `precio`, `descripcion`, `fecha_publicacion`, `genero`, `isbn`, `cantidad_disponible`) VALUES
(1, 'Cien años de soledad', 1, 19.99, 'Un clásico de la literatura latinoamericana.', '1967-05-30', 'Realismo mágico', '9780140153703', 6),
(2, 'Harry Potter and the Sorcerer\'s Stone', 2, 29.99, 'El inicio de la saga de Harry Potter.', '1997-06-26', 'Fantasía', '9780590353427', 2),
(3, '1984', 3, 15.99, 'Una distopía clásica que aborda temas de control totalitario.', '1949-06-08', 'Ciencia ficción', '9780451524935', 3),
(4, 'To Kill a Mockingbird', 4, 12.99, 'Una obra maestra que aborda temas de justicia y discriminación racial.', '1960-07-11', 'Ficción', '9780061120084', 4),
(5, 'The Hobbit', 5, 22.99, 'Una emocionante aventura en la Tierra Media.', '1937-09-21', 'Fantasía', '9780261102217', 0),
(6, 'Pride and Prejudice', 6, 17.99, 'Una novela clásica de amor y sociedad.', '1813-01-28', 'Romance', '9780141439518', 6),
(7, 'The Old Man and the Sea', 7, 14.99, 'La lucha de un pescador contra un enorme pez.', '1952-09-01', 'Ficción', '9780684801223', 5),
(8, 'Murder on the Orient Express', 8, 18.99, 'Un intrigante misterio de Agatha Christie.', '1934-01-01', 'Misterio', '9780062693662', 4),
(9, 'War and Peace', 9, 27.99, 'Una epopeya histórica sobre la sociedad rusa durante las guerras napoleónicas.', '1869-01-01', 'Histórico', '9780192833983', 6),
(10, 'The Great Gatsby', 10, 16.99, 'Un retrato de la alta sociedad estadounidense en los años 20.', '1925-04-10', 'Ficción', '9780743273565', 1),
(15, 'dsadsa', 6, 12.88, 'sfds', NULL, 'das', 'asdasd', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_prestamo` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_libro` int(11) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `precio_devolver` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id_prestamo`, `id_cliente`, `id_libro`, `fecha_prestamo`, `fecha_devolucion`, `precio_devolver`) VALUES
(1, 1, 6, '2024-02-05', '2024-02-20', NULL),
(2, 2, 7, '2024-02-10', NULL, NULL),
(3, 3, 8, '2024-02-15', '2024-03-01', NULL),
(4, 4, 9, '2024-02-18', NULL, NULL),
(5, 5, 10, '2024-02-20', '2024-03-05', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `contraseña`) VALUES
(1, 'Toni', '123'),
(2, 'Moreno', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`autor_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_libro` (`id_libro`),
  ADD KEY `fk_cliente_prestamo` (`id_cliente`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `autor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`autor_id`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `fk_cliente_prestamo` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
