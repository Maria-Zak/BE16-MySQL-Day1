-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 05, 2022 at 03:51 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `address_c`
--

CREATE TABLE `address_c` (
  `address_id` int(11) NOT NULL,
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
-- Table structure for table `car_state`
--

CREATE TABLE `car_state` (
  `car_state_id` int(11) NOT NULL,
  `wheels` varchar(40) DEFAULT NULL,
  `vehicle_structure` varchar(40) DEFAULT NULL
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
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `address_c_rental`
--
ALTER TABLE `address_c_rental`
  ADD PRIMARY KEY (`address_c_rental_id`);

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
-- Indexes for table `car_state`
--
ALTER TABLE `car_state`
  ADD PRIMARY KEY (`car_state_id`);

--
-- Indexes for table `date_reservation`
--
ALTER TABLE `date_reservation`
  ADD PRIMARY KEY (`date_reservation_id`);

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
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `address_c`
--
ALTER TABLE `address_c`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `address_c_rental`
--
ALTER TABLE `address_c_rental`
  MODIFY `address_c_rental_id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `car_state`
--
ALTER TABLE `car_state`
  MODIFY `car_state_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `date_reservation`
--
ALTER TABLE `date_reservation`
  MODIFY `date_reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wanted_car`
--
ALTER TABLE `wanted_car`
  MODIFY `wanted_car_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
