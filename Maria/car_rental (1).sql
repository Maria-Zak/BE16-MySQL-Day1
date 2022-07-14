-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 05, 2022 at 10:15 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rental`
--
CREATE DATABASE IF NOT EXISTS `car_rental` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `car_rental`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `zip` int(11) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `area` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `zip`, `country`, `city`, `area`) VALUES
(1, 8644, 'Austria', 'Sankt Lorenzen im Mürztal', 'Steiermark'),
(2, 5271, 'Austria', 'Burgkirchen', 'Oberösterreich'),
(3, 5271, 'Austria', 'Burgkirchen', 'Oberösterreich'),
(4, 8505, 'Austria', 'Sankt Andrä-Höch', 'Steiermark'),
(5, 8243, 'Austria', 'Schäffern', 'Steiermark');

-- --------------------------------------------------------

--
-- Table structure for table `address_c`
--

CREATE TABLE `address_c` (
  `address_c_id` int(11) NOT NULL,
  `zip` int(11) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `area` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `address_c_rental`
--

CREATE TABLE `address_c_rental` (
  `address_c_rental_id` int(11) NOT NULL,
  `zip` int(11) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `area` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL,
  `fk_agency_location` int(11) DEFAULT NULL,
  `fk_return` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agency_location`
--

CREATE TABLE `agency_location` (
  `agency_location_id` int(11) NOT NULL,
  `zip` int(11) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `area` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `cars_id` int(11) NOT NULL,
  `cars_name` varchar(40) DEFAULT NULL,
  `cars_speed` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car_rental`
--

CREATE TABLE `car_rental` (
  `car_rental_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fk_address_c_rental` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car_state`
--

CREATE TABLE `car_state` (
  `car_state_id` int(11) NOT NULL,
  `wheels` varchar(40) DEFAULT NULL,
  `vehicle_structure` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `checking_center`
--

CREATE TABLE `checking_center` (
  `checking_center_id` int(11) NOT NULL,
  `additional_charges` varchar(50) DEFAULT NULL,
  `fk_checking_result` int(11) DEFAULT NULL,
  `fk_agency` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `checking_result`
--

CREATE TABLE `checking_result` (
  `checking_result_id` int(11) NOT NULL,
  `gasoline_inspection` tinyint(1) DEFAULT NULL,
  `fk_car_state` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `fk_car_rental_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `age` smallint(3) DEFAULT NULL,
  `driving_licence` tinyint(1) DEFAULT NULL,
  `budget` varchar(5) DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_wanted_car` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `date_reservation`
--

CREATE TABLE `date_reservation` (
  `date_reservation_id` int(11) NOT NULL,
  `date_reservation_start_date` date DEFAULT NULL,
  `date_reservation_end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `online_car_rental`
--

CREATE TABLE `online_car_rental` (
  `online_car_rental_id` int(11) NOT NULL,
  `car_rental_name` varchar(40) DEFAULT NULL,
  `selected_car` varchar(30) DEFAULT NULL,
  `car_rental_url` varchar(50) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_cars` int(11) DEFAULT NULL,
  `fk_address_c` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `invoice` varchar(40) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `fk_online_car_rental_id` int(11) DEFAULT NULL,
  `fk_date_reservation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE `return` (
  `return_id` int(11) NOT NULL,
  `return_date` date DEFAULT NULL,
  `fk_client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wanted_car`
--

CREATE TABLE `wanted_car` (
  `wanted_car_id` int(11) NOT NULL,
  `car_name` varchar(40) DEFAULT NULL,
  `car_type` varchar(40) DEFAULT NULL,
  `car_speed` varchar(40) DEFAULT NULL,
  `car_module` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wanted_car`
--

INSERT INTO `wanted_car` (`wanted_car_id`, `car_name`, `car_type`, `car_speed`, `car_module`) VALUES
(1, 'Volkswagen', 'Yellow', '162', 'New Beetle'),
(2, 'Nissan', 'Yellow', '334', 'Quest'),
(3, 'Aston Martin', 'Goldenrod', '831', 'DBS'),
(4, 'Ford', 'Violet', '180', 'Escape'),
(5, 'Mercedes-Benz', 'Aquamarine', '201', 'SLK-Class');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `address_c`
--
ALTER TABLE `address_c`
  ADD PRIMARY KEY (`address_c_id`);

--
-- Indexes for table `address_c_rental`
--
ALTER TABLE `address_c_rental`
  ADD PRIMARY KEY (`address_c_rental_id`);

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`),
  ADD KEY `fk_agency_location` (`fk_agency_location`),
  ADD KEY `fk_return` (`fk_return`);

--
-- Indexes for table `agency_location`
--
ALTER TABLE `agency_location`
  ADD PRIMARY KEY (`agency_location_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`cars_id`);

--
-- Indexes for table `car_rental`
--
ALTER TABLE `car_rental`
  ADD PRIMARY KEY (`car_rental_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`),
  ADD KEY `fk_address_c_rental` (`fk_address_c_rental`);

--
-- Indexes for table `car_state`
--
ALTER TABLE `car_state`
  ADD PRIMARY KEY (`car_state_id`);

--
-- Indexes for table `checking_center`
--
ALTER TABLE `checking_center`
  ADD PRIMARY KEY (`checking_center_id`),
  ADD KEY `fk_checking_result` (`fk_checking_result`),
  ADD KEY `fk_agency` (`fk_agency`);

--
-- Indexes for table `checking_result`
--
ALTER TABLE `checking_result`
  ADD PRIMARY KEY (`checking_result_id`),
  ADD KEY `fk_car_state` (`fk_car_state`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `fk_car_rental_id` (`fk_car_rental_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_address` (`fk_address`),
  ADD KEY `fk_wanted_car` (`fk_wanted_car`);

--
-- Indexes for table `date_reservation`
--
ALTER TABLE `date_reservation`
  ADD PRIMARY KEY (`date_reservation_id`);

--
-- Indexes for table `online_car_rental`
--
ALTER TABLE `online_car_rental`
  ADD PRIMARY KEY (`online_car_rental_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_cars` (`fk_cars`),
  ADD KEY `fk_address_c` (`fk_address_c`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_online_car_rental_id` (`fk_online_car_rental_id`),
  ADD KEY `fk_date_reservation` (`fk_date_reservation`);

--
-- Indexes for table `return`
--
ALTER TABLE `return`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_client_id` (`fk_client_id`);

--
-- Indexes for table `wanted_car`
--
ALTER TABLE `wanted_car`
  ADD PRIMARY KEY (`wanted_car_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `address_c`
--
ALTER TABLE `address_c`
  MODIFY `address_c_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `address_c_rental`
--
ALTER TABLE `address_c_rental`
  MODIFY `address_c_rental_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `agency_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agency_location`
--
ALTER TABLE `agency_location`
  MODIFY `agency_location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `cars_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_rental`
--
ALTER TABLE `car_rental`
  MODIFY `car_rental_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_state`
--
ALTER TABLE `car_state`
  MODIFY `car_state_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checking_center`
--
ALTER TABLE `checking_center`
  MODIFY `checking_center_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checking_result`
--
ALTER TABLE `checking_result`
  MODIFY `checking_result_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `date_reservation`
--
ALTER TABLE `date_reservation`
  MODIFY `date_reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_car_rental`
--
ALTER TABLE `online_car_rental`
  MODIFY `online_car_rental_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return`
--
ALTER TABLE `return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wanted_car`
--
ALTER TABLE `wanted_car`
  MODIFY `wanted_car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agency`
--
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`fk_agency_location`) REFERENCES `agency_location` (`agency_location_id`),
  ADD CONSTRAINT `agency_ibfk_2` FOREIGN KEY (`fk_return`) REFERENCES `return` (`return_id`);

--
-- Constraints for table `car_rental`
--
ALTER TABLE `car_rental`
  ADD CONSTRAINT `car_rental_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`),
  ADD CONSTRAINT `car_rental_ibfk_2` FOREIGN KEY (`fk_address_c_rental`) REFERENCES `address_c_rental` (`address_c_rental_id`);

--
-- Constraints for table `checking_center`
--
ALTER TABLE `checking_center`
  ADD CONSTRAINT `checking_center_ibfk_1` FOREIGN KEY (`fk_checking_result`) REFERENCES `checking_result` (`checking_result_id`),
  ADD CONSTRAINT `checking_center_ibfk_2` FOREIGN KEY (`fk_agency`) REFERENCES `agency` (`agency_id`);

--
-- Constraints for table `checking_result`
--
ALTER TABLE `checking_result`
  ADD CONSTRAINT `checking_result_ibfk_1` FOREIGN KEY (`fk_car_state`) REFERENCES `car_state` (`car_state_id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`fk_car_rental_id`) REFERENCES `car_rental` (`car_rental_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_address`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_wanted_car`) REFERENCES `wanted_car` (`wanted_car_id`);

--
-- Constraints for table `online_car_rental`
--
ALTER TABLE `online_car_rental`
  ADD CONSTRAINT `online_car_rental_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `online_car_rental_ibfk_2` FOREIGN KEY (`fk_cars`) REFERENCES `cars` (`cars_id`),
  ADD CONSTRAINT `online_car_rental_ibfk_3` FOREIGN KEY (`fk_address_c`) REFERENCES `address_c` (`address_c_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_online_car_rental_id`) REFERENCES `online_car_rental` (`online_car_rental_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_date_reservation`) REFERENCES `date_reservation` (`date_reservation_id`);

--
-- Constraints for table `return`
--
ALTER TABLE `return`
  ADD CONSTRAINT `return_ibfk_1` FOREIGN KEY (`fk_client_id`) REFERENCES `client` (`client_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
