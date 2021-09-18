-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-09-2021 a las 23:52:02
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CrearCompras` (IN `pp` INT(10), IN `nombreProducto` INT(10), IN `nombreProveedor` VARCHAR(50), IN `cantidad` INT(10), IN `valor` DOUBLE)  BEGIN
    insert into compras (ComNombreProducto, TbiInventario_Inv_NombreProducto, ComNombre_Proveedor, ComCantidad, ComValor) values (PP, Producto, Inventario, Proveedor, Cantidad, Valor);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CrearCompras_Ventas` (IN `TbiCompras_Nombre_Producto_sl` INT(10), IN `TbiVentas_VenValor_sl` DOUBLE)  BEGIN
    insert into compras_Ventas (TbiCompras_Nombre_Producto, TbiVentas_VenValor) values ( TbiCompras_Nombre_Producto_sl, TbiVentas_VenValor_sl);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CrearEfectivo` (IN `Cliente` INT(10), IN `Fecha` DATE, IN `Hora` TIME, IN `Cajero` VARCHAR(50), IN `Valor` INT(10), IN `Caja` INT(10))  BEGIN
    insert into Efectivo (EfeNombreCliente, EfeFecha, EfeHora, EfeNombreCajero, EfeValor, EfeNumeroCaja ) values (Cliente, Fecha, Hora, Cajero, Valor, Caja);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CrearEmpleado` (IN `id` INT(10), IN `identificacion` INT(10), IN `nombre` VARCHAR(50), IN `area` VARCHAR(50))  BEGIN
    insert into empleados (EmpID, EmpNumero_Identificacion, EmpNombre, EmpArea) values (id, identificacion, nombre, area);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CrearInventario` (IN `NumProducto` INT(10), IN `Producto` VARCHAR(50), IN `Cantidad` INT(10), IN `Entidad` VARCHAR(50), IN `Fecha_Ingreso` DATE)  BEGIN
    insert into Efectivo (InvNombreProducto, Nombre_Producto, InvCantidad, InvEntidad, InvFechaIngreso) values (NumProducto, Producto, Cantidad, Entidad, Fecha_Ingreso);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CrearPagos` (IN `Cliente_tp` VARCHAR(200), IN `Ventas_tp` DOUBLE, IN `Fecha_tp` DATE, IN `Hora_tp` TIME)  BEGIN
    insert into Efectivo (PagNombre_Cliente, TbiVentas_VenValor, PagFecha, PagHora) values (Cliente_tp, Ventas_tp, Fecha_tp, Hora_tp);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CrearTransferencia` (IN `TipoCuenta` VARCHAR(50), IN `PagosCliente` VARCHAR(50), IN `Banco` VARCHAR(50), IN `Telefono` INT(10), IN `valor` DOUBLE)  BEGIN
    insert into transferencia (TraTipo_de_Cuenta, TblPagos_PagNombre_Cliente, TraBanco, TraTelefono, TraValor) values (TipoCuenta, PagosCliente, Banco, Telefono, Valor);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_CrearVentas` (IN `Valor` DOUBLE, IN `Fecha` DATE, IN `Hora` TIME)  BEGIN
    insert into transferencia (VenValor, VenFecha, venHora) values (Valor, Fecha, Hora);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ObtenerEmpleados` ()  BEGIN
    select * from empleados;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `Id` int(11) NOT NULL,
  `InvNombre_Producto` varchar(50) NOT NULL,
  `ComNombre_Proveedor` varchar(50) NOT NULL,
  `ComCantidad` int(10) NOT NULL,
  `ComValor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`Id`, `InvNombre_Producto`, `ComNombre_Proveedor`, `ComCantidad`, `ComValor`) VALUES
(1, 'Carne bola', 'Fasenda', 900, 100),
(2, 'Cerveza Blonde litro', 'Cervecería Bicla Ber', 40, 240),
(3, 'Cerveza Red Ipa litro', 'Cervecería la Quince', 60, 360),
(4, 'Queso medio bloque', 'supermecado teusaquillo', 100, 6800),
(5, 'Cerveza Segovia litros', 'la rola', 40, 280);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_ventas`
--

CREATE TABLE `compras_ventas` (
  `TblCompras_ComNombre_Producto` int(10) NOT NULL,
  `TblVentas_VenValor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `efectivo`
--

CREATE TABLE `efectivo` (
  `EfeNombreCliente` varchar(50) NOT NULL,
  `EfeFecha` date NOT NULL,
  `EfeHora` time NOT NULL,
  `EfeNombreCajero` varchar(50) NOT NULL,
  `EfeValor` int(10) NOT NULL,
  `EfeNumeroCaja` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `efectivo`
--

INSERT INTO `efectivo` (`EfeNombreCliente`, `EfeFecha`, `EfeHora`, `EfeNombreCajero`, `EfeValor`, `EfeNumeroCaja`) VALUES
('Miller Garcia', '2021-07-10', '19:35:00', 'Fina Ciacia', 25, 2),
('Miller Garcia Rojas', '2021-07-10', '20:10:00', 'Fina Ciacia', 70, 3),
('Vanesa Benavides', '2021-07-10', '19:30:00', 'Fina Ciacia', 50, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `EmpID` int(11) NOT NULL,
  `EmpNumero_Identificacion` int(10) NOT NULL,
  `EmpNombre` varchar(50) NOT NULL,
  `EmpArea` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`EmpID`, `EmpNumero_Identificacion`, `EmpNombre`, `EmpArea`) VALUES
(2, 457691, 'Johana Vander Veis', 'Gerente'),
(3, 643228, 'Fina Ciacia', 'Cajera'),
(4, 100290, 'Carla Rico', 'Mesera'),
(5, 1033452687, 'julian enrique', 'cocina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `Id` int(11) NOT NULL,
  `InvNombre_Producto` varchar(50) NOT NULL,
  `InvProveedor` varchar(200) NOT NULL,
  `InvCantidad` int(100) NOT NULL,
  `InvPrecio` int(100) NOT NULL,
  `InvFecha_Ingreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`Id`, `InvNombre_Producto`, `InvProveedor`, `InvCantidad`, `InvPrecio`, `InvFecha_Ingreso`) VALUES
(11, 'Pechuga de pollo', 'Mac pollo', 500, 80000, '2021-09-13'),
(13, 'Carne bola', 'fasenda', 800, 110000, '2021-09-12'),
(14, 'Tortillas Maiz', 'La lupe', 60, 45000, '2021-09-10'),
(15, 'Tomates', 'Supermecado ara', 15, 7500, '2021-09-10'),
(16, 'Cebolla Cabezona ', 'Supermecado ara', 15, 10500, '2021-09-10'),
(17, 'Aguacate', 'Supermecado teusaquillo', 3, 3800, '2021-09-10'),
(18, 'Papas por libra', 'Supermecado teusaquillo', 3, 4800, '2021-09-10'),
(19, 'Queso medio bloque', 'Supermecado teusaquillo', 100, 6800, '2021-09-10'),
(20, 'Cerveza Blonde litros', 'Cervecería Bicla Ber', 20, 220000, '2021-09-10'),
(21, 'Cerveza red Ipa litros', 'Cervecería la quince', 20, 240000, '2021-09-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `Id` int(11) NOT NULL,
  `Usuario` varchar(200) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `Activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`Id`, `Usuario`, `Password`, `Activo`) VALUES
(1, 'francy', 'Abcd1234*', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `PagNombre_Cliente` varchar(200) NOT NULL,
  `TblVentas_VenValor` double NOT NULL,
  `PagFecha` date NOT NULL,
  `PagHora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`PagNombre_Cliente`, `TblVentas_VenValor`, `PagFecha`, `PagHora`) VALUES
('Daniel Gutiérrez', 32, '2021-07-11', '17:17:00'),
('David Lopez', 45, '2021-07-11', '17:37:00'),
('Julian Arjona', 36, '2021-07-11', '17:05:00'),
('Karen Gallego', 42, '2021-07-11', '17:49:00'),
('Lina Guzmán', 46, '2021-07-11', '17:11:00'),
('Paola Marin', 58, '2021-07-11', '17:28:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencia`
--

CREATE TABLE `transferencia` (
  `TraTipo_de_Cuenta` varchar(50) NOT NULL,
  `TblPagos_PagNombre_Cliente` varchar(50) NOT NULL,
  `TraBanco` varchar(50) NOT NULL,
  `TraTelefono` int(10) NOT NULL,
  `TraValor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `transferencia`
--

INSERT INTO `transferencia` (`TraTipo_de_Cuenta`, `TblPagos_PagNombre_Cliente`, `TraBanco`, `TraTelefono`, `TraValor`) VALUES
('Cuenta de Ahorros', 'Fabio Cortez', 'Banco Colpatria', 3890571, 37),
('Cuenta Debito', 'Jessica Cortes', 'Banco Davivienda', 8851356, 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `VenValor` double NOT NULL,
  `VenFecha` date NOT NULL,
  `VenHora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`VenValor`, `VenFecha`, `VenHora`) VALUES
(20, '2021-07-10', '20:30:00'),
(28, '2021-07-10', '21:05:00'),
(32, '2021-07-10', '20:43:00'),
(36, '2021-07-10', '21:09:00'),
(45, '2021-07-10', '08:39:00'),
(56, '2021-07-10', '08:57:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `compras_ventas`
--
ALTER TABLE `compras_ventas`
  ADD PRIMARY KEY (`TblCompras_ComNombre_Producto`);

--
-- Indices de la tabla `efectivo`
--
ALTER TABLE `efectivo`
  ADD PRIMARY KEY (`EfeNombreCliente`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`EmpID`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`PagNombre_Cliente`);

--
-- Indices de la tabla `transferencia`
--
ALTER TABLE `transferencia`
  ADD PRIMARY KEY (`TraTipo_de_Cuenta`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`VenValor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `EmpID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras_ventas`
--
ALTER TABLE `compras_ventas`
  ADD CONSTRAINT `compras_ventas_ibfk_2` FOREIGN KEY (`TblVentas_VenValor`) REFERENCES `ventas` (`VenValor`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`TblVentas_VenValor`) REFERENCES `ventas` (`VenValor`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`PagNombre_Cliente`) REFERENCES `transferencia` (`TraTipo_de_Cuenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
