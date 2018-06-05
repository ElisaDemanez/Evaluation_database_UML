-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2018 at 12:29 PM
-- Server version: 5.7.22-0ubuntu18.04.1
-- PHP Version: 7.2.5-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evaluation_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `accty_account_type`
--

CREATE TABLE `accty_account_type` (
  `accty_oid` int(11) NOT NULL,
  `accty_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acc_accounts`
--

CREATE TABLE `acc_accounts` (
  `acc_oid` int(11) NOT NULL,
  `fk_acc_accty` int(11) NOT NULL,
  `acc_email` varchar(255) NOT NULL,
  `acc_password` varchar(255) NOT NULL,
  `fk_acc_cli` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cli_clients`
--

CREATE TABLE `cli_clients` (
  `cli_oid` int(11) NOT NULL,
  `cli_lastname` varchar(45) NOT NULL,
  `cli_firstname` varchar(45) NOT NULL,
  `cli_phone_number` varchar(20) NOT NULL,
  `cli_street` varchar(145) NOT NULL,
  `fk_cli_tow` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cou_countries`
--

CREATE TABLE `cou_countries` (
  `cou_oid` int(11) NOT NULL,
  `cou_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `res_reservations`
--

CREATE TABLE `res_reservations` (
  `res_oid` int(11) NOT NULL,
  `fk_res_cli` int(11) NOT NULL,
  `fk_res_roo` int(11) NOT NULL,
  `res_arrival_date` date NOT NULL,
  `res_leaving_date` date NOT NULL,
  `fk_res_roost` int(11) NOT NULL,
  `res_comment` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `res_reservation_has_ser_services`
--

CREATE TABLE `res_reservation_has_ser_services` (
  `res_oid` int(11) NOT NULL,
  `ser_oid` int(11) NOT NULL,
  `res_ser_times_ordered` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roost_room_status`
--

CREATE TABLE `roost_room_status` (
  `roost_oid` int(11) NOT NULL,
  `roost_status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roo_rooms`
--

CREATE TABLE `roo_rooms` (
  `roo_oid` int(11) NOT NULL,
  `roo_name` varchar(45) NOT NULL,
  `roo_floor` int(11) NOT NULL,
  `roo_size` smallint(6) NOT NULL,
  `roo_type` char(1) NOT NULL DEFAULT 'c',
  `roo_view` varchar(45) DEFAULT NULL,
  `roo_disabled_access` tinyint(4) NOT NULL,
  `roo_bed_size` char(1) NOT NULL,
  `roo_price` int(11) NOT NULL,
  `roo_shower` bit(1) NOT NULL,
  `roo_bathtub` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sercat_service_category`
--

CREATE TABLE `sercat_service_category` (
  `sercat_oid` int(11) NOT NULL,
  `sercat_category` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ser_services`
--

CREATE TABLE `ser_services` (
  `ser_oid` int(11) NOT NULL,
  `ser_name` varchar(45) NOT NULL,
  `ser_description` varchar(450) NOT NULL,
  `ser_price` int(11) NOT NULL,
  `fk_ser_sercat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ser_services_availability_in_rooms`
--

CREATE TABLE `ser_services_availability_in_rooms` (
  `ser_oid` int(11) NOT NULL,
  `roo_oid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tow_towns`
--

CREATE TABLE `tow_towns` (
  `tow_oid` int(11) NOT NULL,
  `tow_name` varchar(45) NOT NULL,
  `tow_zip_code` varchar(20) NOT NULL,
  `fk_tow_cou` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accty_account_type`
--
ALTER TABLE `accty_account_type`
  ADD PRIMARY KEY (`accty_oid`),
  ADD UNIQUE KEY `accty_name_UNIQUE` (`accty_name`);

--
-- Indexes for table `acc_accounts`
--
ALTER TABLE `acc_accounts`
  ADD PRIMARY KEY (`acc_oid`),
  ADD UNIQUE KEY `email_UNIQUE` (`acc_email`),
  ADD UNIQUE KEY `fk_acc_cli_UNIQUE` (`fk_acc_cli`),
  ADD KEY `fk_accounts_clients_oid` (`fk_acc_cli`),
  ADD KEY `fk_accounts_accty_account_type1_idx` (`fk_acc_accty`);

--
-- Indexes for table `cli_clients`
--
ALTER TABLE `cli_clients`
  ADD PRIMARY KEY (`cli_oid`),
  ADD KEY `fk_cli_clients_tow_towns1_idx` (`fk_cli_tow`);

--
-- Indexes for table `cou_countries`
--
ALTER TABLE `cou_countries`
  ADD PRIMARY KEY (`cou_oid`),
  ADD UNIQUE KEY `cou_name` (`cou_name`);

--
-- Indexes for table `res_reservations`
--
ALTER TABLE `res_reservations`
  ADD PRIMARY KEY (`res_oid`),
  ADD KEY `fk_res_reservation_cli_clients1_idx` (`fk_res_cli`),
  ADD KEY `fk_res_reservation_chambre1_idx` (`fk_res_roo`),
  ADD KEY `fk_res_reservations_roost_room_status1_idx` (`fk_res_roost`);

--
-- Indexes for table `res_reservation_has_ser_services`
--
ALTER TABLE `res_reservation_has_ser_services`
  ADD PRIMARY KEY (`res_oid`,`ser_oid`),
  ADD KEY `fk_res_reservations_has_ser_services_ser_services1_idx` (`ser_oid`),
  ADD KEY `fk_res_reservations_has_ser_services_res_reservations1_idx` (`res_oid`);

--
-- Indexes for table `roost_room_status`
--
ALTER TABLE `roost_room_status`
  ADD PRIMARY KEY (`roost_oid`),
  ADD UNIQUE KEY `roost_status_UNIQUE` (`roost_status`);

--
-- Indexes for table `roo_rooms`
--
ALTER TABLE `roo_rooms`
  ADD PRIMARY KEY (`roo_oid`);

--
-- Indexes for table `sercat_service_category`
--
ALTER TABLE `sercat_service_category`
  ADD PRIMARY KEY (`sercat_oid`);

--
-- Indexes for table `ser_services`
--
ALTER TABLE `ser_services`
  ADD PRIMARY KEY (`ser_oid`),
  ADD KEY `fk_ser_services_sercat_service_category1_idx` (`fk_ser_sercat`);

--
-- Indexes for table `ser_services_availability_in_rooms`
--
ALTER TABLE `ser_services_availability_in_rooms`
  ADD PRIMARY KEY (`ser_oid`,`roo_oid`),
  ADD KEY `fk_ser_services_has_rooms_rooms1_idx` (`roo_oid`),
  ADD KEY `fk_ser_services_has_rooms_ser_services1_idx` (`ser_oid`);

--
-- Indexes for table `tow_towns`
--
ALTER TABLE `tow_towns`
  ADD PRIMARY KEY (`tow_oid`),
  ADD UNIQUE KEY `tow_name_UNIQUE` (`tow_name`),
  ADD KEY `fk_tow_towns_cou_countries` (`fk_tow_cou`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accty_account_type`
--
ALTER TABLE `accty_account_type`
  MODIFY `accty_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_accounts`
--
ALTER TABLE `acc_accounts`
  MODIFY `acc_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cli_clients`
--
ALTER TABLE `cli_clients`
  MODIFY `cli_oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cou_countries`
--
ALTER TABLE `cou_countries`
  MODIFY `cou_oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `res_reservations`
--
ALTER TABLE `res_reservations`
  MODIFY `res_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roost_room_status`
--
ALTER TABLE `roost_room_status`
  MODIFY `roost_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roo_rooms`
--
ALTER TABLE `roo_rooms`
  MODIFY `roo_oid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sercat_service_category`
--
ALTER TABLE `sercat_service_category`
  MODIFY `sercat_oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ser_services`
--
ALTER TABLE `ser_services`
  MODIFY `ser_oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tow_towns`
--
ALTER TABLE `tow_towns`
  MODIFY `tow_oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `acc_accounts`
--
ALTER TABLE `acc_accounts`
  ADD CONSTRAINT `fk_accounts_accty` FOREIGN KEY (`fk_acc_accty`) REFERENCES `accty_account_type` (`accty_oid`),
  ADD CONSTRAINT `fk_accounts_clients` FOREIGN KEY (`fk_acc_cli`) REFERENCES `cli_clients` (`cli_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cli_clients`
--
ALTER TABLE `cli_clients`
  ADD CONSTRAINT `fk_cli_clients_tow_towns` FOREIGN KEY (`fk_cli_tow`) REFERENCES `tow_towns` (`tow_oid`);

--
-- Constraints for table `res_reservations`
--
ALTER TABLE `res_reservations`
  ADD CONSTRAINT `fk_res_reservation_chambre1` FOREIGN KEY (`fk_res_roo`) REFERENCES `roo_rooms` (`roo_oid`),
  ADD CONSTRAINT `fk_res_reservation_cli_clients1` FOREIGN KEY (`fk_res_cli`) REFERENCES `cli_clients` (`cli_oid`),
  ADD CONSTRAINT `fk_res_reservations_roost_room_status1` FOREIGN KEY (`fk_res_roost`) REFERENCES `roost_room_status` (`roost_oid`);

--
-- Constraints for table `res_reservation_has_ser_services`
--
ALTER TABLE `res_reservation_has_ser_services`
  ADD CONSTRAINT `fk_res_reservations_has_ser_services_res_reservations1` FOREIGN KEY (`res_oid`) REFERENCES `res_reservations` (`res_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_res_reservations_has_ser_services_ser_services1` FOREIGN KEY (`ser_oid`) REFERENCES `ser_services` (`ser_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ser_services`
--
ALTER TABLE `ser_services`
  ADD CONSTRAINT `fk_ser_services_sercat_service_category1` FOREIGN KEY (`fk_ser_sercat`) REFERENCES `sercat_service_category` (`sercat_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ser_services_availability_in_rooms`
--
ALTER TABLE `ser_services_availability_in_rooms`
  ADD CONSTRAINT `fk_ser_services_has_rooms_rooms1` FOREIGN KEY (`roo_oid`) REFERENCES `roo_rooms` (`roo_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ser_services_has_rooms_ser_services1` FOREIGN KEY (`ser_oid`) REFERENCES `ser_services` (`ser_oid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tow_towns`
--
ALTER TABLE `tow_towns`
  ADD CONSTRAINT `fk_tow_towns_cou_countries` FOREIGN KEY (`fk_tow_cou`) REFERENCES `cou_countries` (`cou_oid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
