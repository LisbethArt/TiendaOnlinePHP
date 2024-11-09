-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 09-11-2024 a las 06:18:51
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
-- Base de datos: `tiendaonline`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'meraki', 'meraki@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Motorola'),
(5, 'LG'),
(6, 'Marca de Ropa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(54, 3, '::1', 14, 4),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(162, 3, '::1', -1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electrónica'),
(2, 'Ropa de dama'),
(3, 'Ropa de caballero'),
(4, 'Ropa de niños'),
(5, 'Muebles'),
(6, 'Electrodomésticos'),
(7, 'Aparatos electrónicos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'meraki@gmail.com'),
(4, 'help.meraki@gmail.com'),
(5, 'info.meraki@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(2, 28, 'Julio Guardado', 'julio@gmail.com', 'CZ', 'San Salvador', 'xd', 560074, 'Julio', '151654168146846', '12/22', 2, 30000, 5485);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` float DEFAULT 0,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL,
  `product_with_discount` tinyint(1) DEFAULT 0,
  `product_discount` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`, `product_with_discount`, `product_discount`) VALUES
(1, 1, 2, 'Samsung S22 Ultra', 899.99, 'Samsung S22 Ultra', 'product07.png', 'samsung mobile electronics', 0, 0),
(2, 1, 3, 'iPhone 16 Pro', 1350, 'iPhone 16 Pro', 'iphone16pro.png', 'mobile iphone apple', 1, 10),
(3, 1, 2, 'iPad Air 13', 1050, 'iPad Air 13', 'ipadA13.png', 'apple ipad tablet', 0, 0),
(4, 1, 3, 'iPhone 14 Pro', 1250, 'iPhone 14 Pro', 'iphone14pro.png', 'iphone apple mobile', 0, 0),
(5, 1, 2, 'iPad Air 5ta Gen', 850, 'iPad Air 5ta Gen', 'iPad-air5ta.png', 'ipad tablet samsung', 1, 15),
(6, 1, 1, 'Samsung Laptop R Series', 950, 'Samsung Laptop R Series', 'laptop_PNG5939.png', 'samsung laptop ', 0, 0),
(7, 1, 1, 'Laptop Pavillion', 750, 'Laptop Hp Pavillion', 'laptop_PNG5930.png', 'laptop hp pavillion', 0, 0),
(8, 1, 4, 'Sony Xperia', 999.95, 'Sony Mobile', 'sonyXperia.png', 'sony mobile', 0, 0),
(9, 5, 0, 'Estantería', 55.2, 'Estantería', 'furniture-book-shelf-250x250.jpg', 'book shelf furniture', 0, 0),
(10, 6, 2, 'Refrigeradora', 740.2, 'Refrigerator', 'CT_WM_BTS-BTC-AppliancesHome_20150723.jpg', 'refrigerator samsung', 0, 0),
(11, 6, 5, 'Plancha', 25, 'Plancha', 'iron.JPG', 'iron', 0, 0),
(12, 6, 5, 'Licuadora', 20.5, 'Licuadora', 'singer-mixer-grinder-mg-46-medium_4bfa018096c25dec7ba0af40662856ef.jpg', 'Mixer Grinder', 0, 0),
(13, 3, 6, 'Camisa de hombre', 15.9, 'Camisas', 'pm1.JPG', 'suit boys shirts', 1, 5),
(14, 3, 6, 'Camisa de hombre', 18.2, 'Camisas', 'pm2.JPG', 'suit boys shirts', 0, 0),
(15, 3, 6, 'Camisa de hombre', 41.26, 'Camisas', 'pm3.JPG', 'suit boys shirts', 0, 0),
(16, 3, 6, 'Camisa de hombre', 20, 'Camisas', 'ms1.JPG', 'suit boys shirts', 0, 0),
(17, 3, 6, 'Camisa de hombre', 34.2, 'Camisas', 'ms2.JPG', 'suit boys shirts', 1, 6),
(18, 3, 6, 'Camisa de hombre', 21.8, 'Camisas', 'ms3.JPG', 'suit boys shirts', 0, 0),
(19, 3, 6, 'Camisa de hombre', 15, 'Camisas', 'pm7.JPG', 'suit boys shirts', 0, 0),
(20, 3, 6, 'Camisa de hombre', 16, 'Camisas', 'i3.JPG', 'suit boys shirts', 0, 0),
(21, 3, 6, 'Camisa de hombre', 18, 'Camisas', 'pm9.JPG', 'suit boys shirts', 0, 0),
(22, 3, 6, 'Camisa de hombre', 20, 'Camisas', 'a2.JPG', 'suit boys shirts', 0, 0),
(23, 3, 6, 'Camisa de hombre', 24.5, 'Camisas', 'pm11.JPG', 'suit boys shirts', 0, 0),
(24, 3, 6, 'Camisa de hombre', 25.2, 'Camisas', 'pm12.JPG', 'suit boys shirts', 1, 4),
(25, 3, 6, 'Camisa de hombre', 19.7, 'Camisas', 'pm13.JPG', 'suit boys shirts', 0, 0),
(26, 3, 6, 'Jeans de hombre', 30.5, 'Pantalones', 'pt1.JPG', 'boys Jeans Pant', 0, 0),
(27, 3, 6, 'Jeans de hombre', 40.8, 'Pantalones', 'pt2.JPG', 'boys Jeans Pant', 0, 0),
(28, 3, 6, 'Jeans de hombre', 28.7, 'Pantalones', 'pt3.JPG', 'boys Jeans Pant', 0, 0),
(29, 3, 6, 'Pantalón de caballero', 21.6, 'Pantalones', 'pt8.JPG', 'boys Jeans Pant', 0, 0),
(30, 7, 2, 'Cámara', 10.45, 'Cámara', 'product09.png', 'camera with 3D pixels camera electronics gadgets', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(28, 'Julio', 'Guardado', 'julio@gmail.com', 'julio123456', '1234567896', 'CZ', 'San Salvado'),
(29, 'Emerson', 'Rivas', 'emerson@gmail.com', '123456789', '11223344', 'Mi casa', 'San Salvado');

--
-- Disparadores `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Shohanur', 'Rahman', 'shohan@apricotstore.com', 'shohan', '9448121558', 'DSC', 'Dhaka'),
(15, 'Mehedi', 'Hasan', 'mehedi@apricotstore.com', 'mehedi', '536487276', ',DSC', 'Dhaka'),
(16, 'Asif', 'Rahman', 'asif@apricotstore.com', 'asif', '9877654334', 'DSC', 'Dhaka'),
(19, 'Niloy', 'Hasan', 'niloy@apricotstore.com', 'niloy', '9871236534', 'DSC', 'Dhaka'),
(21, 'Jony', 'Hasan', 'jony@apricotstore.com', 'jony', '202-555-01', 'DSC', 'Dhaka'),
(22, 'Maruf', 'Mia', 'maruf@apricotstore.com', 'maruf', '9877654334', 'DSC', 'Dhaka'),
(23, 'tausif', 'Mia', 'tausif@apricotstore.com', 'tausif', '9876543234', 'DSC', 'Dhaka'),
(24, 'limon', 'Sheikh', 'limon@apricotstore.com', 'limon', '9535688928', 'DSC', 'Dhaka'),
(25, 'rafin', 'Molla', 'rafin@apricotstore.com', 'rafin', '9535688928', 'DSC', 'Dhaka'),
(26, 'xd', 'xd', 'xd@gmail.com', 'xd', '185474585', 'xd', 'xd'),
(27, 'xd', 'xd', 'xd@gmail.com', 'xd', '123456', 'xd', 'xd'),
(28, 'Julio', 'Guardado', 'julio@gmail.com', 'julio123456', '1234567896', 'CZ', 'San Salvado'),
(29, 'Emerson', 'Riva', 'emerson@gmail.com', '123456789', '11223344', 'Mi casa', 'San Salvado'),
(30, 'leonardo', 'Mejia', 'mejia@gmail.com', '123456789', '12345678', 'San Salvador', 'Su casa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indices de la tabla `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indices de la tabla `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Filtros para la tabla `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
