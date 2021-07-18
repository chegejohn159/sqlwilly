-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jul 18, 2021 at 04:47 PM
-- Server version: 10.5.4-MariaDB
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `afyayetu`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `availability_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `availability_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhgoml3vtdhfi1pfddeoiw8wq9` (`availability_id`),
  KEY `FKa8m1smlfsc8kkjn2t6wpdmysk` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `availability_id`, `user_id`, `patient_id`, `availability_code`) VALUES
(4, 7, 14, 14, 7),
(5, 6, 20, 20, 6),
(6, 8, 19, 19, 8),
(7, 9, 20, 20, 9);

-- --------------------------------------------------------

--
-- Table structure for table `availability`
--

DROP TABLE IF EXISTS `availability`;
CREATE TABLE IF NOT EXISTS `availability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `max_patients` int(11) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8jagyqewh1bhblcrdqoo3dk0` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `availability`
--

INSERT INTO `availability` (`id`, `date`, `max_patients`, `time`, `user_id`, `doctor_id`) VALUES
(6, '2021-07-06', 4, '08 AM 03 PM', 15, 15),
(7, '2021-07-13', 2, '07 AM 03 PM', 18, 18),
(8, '2021-07-14', 6, '08 AM 05 PM', 18, 18),
(9, '2021-07-15', 8, '08 AM 06 PM', 15, 15);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_PATIENT'),
(3, 'ROLE_DOCTOR');

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

DROP TABLE IF EXISTS `specialization`;
CREATE TABLE IF NOT EXISTS `specialization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialization`
--

INSERT INTO `specialization` (`id`, `description`, `name`) VALUES
(1, 'teeth', 'dentist'),
(2, 'eyes', 'optician'),
(3, 'skin', 'dematologist'),
(4, 'massage', 'physiotherapist');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dob` date DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `second_name` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `specialization_id` int(11) DEFAULT NULL,
  `role_code` int(11) DEFAULT NULL,
  `specialization_code` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`),
  KEY `FK1vqpers6a5rrwsicoav089vg5` (`specialization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `dob`, `first_name`, `gender`, `last_name`, `phone`, `second_name`, `role_id`, `specialization_id`, `role_code`, `specialization_code`, `email`, `password`) VALUES
(14, '2021-07-01', 'john', 'm', 'kamau', '0744562314', 'chege', 2, NULL, 2, NULL, 'kamau@gmail.com', '$2a$10$pMnvV7euDxuPdmtY.bE.1egUXQ/cpClObYcpzDATYcPwOwzL7T8H6'),
(15, '2021-07-22', 'ann', 'f', 'mukethe', '012547896', 'mary', 3, 2, 3, 2, 'ann@gmail.com', '$2a$10$CbxgRllF3rSnXX5cGYezbuCNVcEpFXezM7I3BT8kFTWko9pB8l/Li'),
(16, '2021-07-12', 'george', 'm', 'kariuki', '045876352', 'ngugi', 1, NULL, 1, NULL, 'george@gmail.com', '$2a$10$ri0mT.SJO1IzO7Btg726YeL615neSz7i3ITax2SCRqrwAvdPczBy.'),
(17, '2021-07-16', 'morris', 'm', 'thiongo', '012485896', 'mwangi', 3, 4, 3, 4, 'moris@gmail.com', '$2a$10$tj/48EJks95KsJF4JNf07OazZoTZnwdsPLIohSCS8/D10xiJainiC'),
(18, '2021-07-22', 'carol', 'f', 'muchiri', '0745852365', 'nyambura', 1, 2, 1, 2, 'carol@gmail.com', '$2a$10$tVKc6.WoH.WA5yQhUY9eHOuALNzQFgjcsgkxJ2Znf25i0QN/IdqFu'),
(19, '2021-07-20', 'julie', 'f', 'waweru', '074521369', 'nduta', 2, NULL, 2, NULL, 'julie@gmail.com', '$2a$10$iJbTD0juPXEjHdLaUkWIju.Q7jtgwsj7XPns.CRanyCqinMExR0EG'),
(20, '2021-07-05', 'leah', 'f', 'karimi', '074869354', 'wanjiru', 2, NULL, 2, NULL, 'leah@gmail.com', '$2a$10$B.hEXPOp.2dnhdYmmkYi.enYL5hGCBPsr7w4a/aE9gaytR5DUpGlq'),
(21, '2021-07-01', 'john', 'm', 'kamau', '0744562314', 'chege', 2, NULL, 2, NULL, 'john@gmail.com', '$2a$10$6./25GxN614AeoCQ0MyQVuw91HBkltsL.IdkuL2uXn8JKmrYNeswy');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `FKa8m1smlfsc8kkjn2t6wpdmysk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKhgoml3vtdhfi1pfddeoiw8wq9` FOREIGN KEY (`availability_id`) REFERENCES `availability` (`id`);

--
-- Constraints for table `availability`
--
ALTER TABLE `availability`
  ADD CONSTRAINT `FK8jagyqewh1bhblcrdqoo3dk0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK1vqpers6a5rrwsicoav089vg5` FOREIGN KEY (`specialization_id`) REFERENCES `specialization` (`id`),
  ADD CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
