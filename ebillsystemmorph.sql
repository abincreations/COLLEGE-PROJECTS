-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2021 at 07:33 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebillsystem`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `unitstoamount` (IN `units` INT(14), OUT `result` INT(14))  BEGIN
   
    DECLARE a INT(14) DEFAULT 0;
    DECLARE b INT(14) DEFAULT 0;
    DECLARE c INT(14) DEFAULT 0;

    SELECT four FROM unitsRate INTO a ;
    SELECT six FROM unitsRate INTO b ;
    SELECT fifteen FROM unitsRate INTO c  ;

    IF units<=100
    then
        SELECT a*units INTO result;
    
    ELSEIF 100<units AND units<=150
    then
        SELECT b*units INTO result;
    ELSEIF units > 150 
    then
        SELECT c*units INTO result;
    END IF;

END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `curdate1` () RETURNS INT(11) BEGIN
    DECLARE x INT;
    SET x = DAYOFMONTH(CURDATE());
    IF (x=1)
    THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(14) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `pass`) VALUES
(1, 'Administrator One', 'admin@gmail.com', 'Password@123'),
(2, 'Administrator Two', 'admin2@gmail.com', 'admin2');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(14) NOT NULL,
  `aid` int(14) NOT NULL,
  `uid` int(14) NOT NULL,
  `units` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `bdate` date NOT NULL,
  `ddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `aid`, `uid`, `units`, `amount`, `status`, `bdate`, `ddate`) VALUES
(17, 1, 8, 100, '400.00', 'PROCESSED', '2021-10-06', '2021-10-25'),
(18, 1, 1, 170, '2550.00', 'PROCESSED', '2021-11-10', '2021-11-29'),
(19, 1, 2, 78, '312.00', 'PENDING', '2021-11-20', '2021-12-12'),
(20, 1, 3, 70, '280.00', 'PROCESSED', '2021-12-10', '2021-12-25'),
(21, 1, 4, 202, '3030.00', 'PENDING', '2021-12-15', '2021-12-31'),
(22, 1, 9, 55, '220.00', 'PROCESSED', '2021-12-31', '2022-01-20'),
(23, 1, 11, 89, '356.00', 'PROCESSED', '2022-01-01', '2022-01-25'),
(24, 1, 7, 55, '220.00', 'PENDING', '2022-01-10', '2022-01-30');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(14) NOT NULL,
  `uid` int(14) NOT NULL,
  `aid` int(14) NOT NULL,
  `complaint` varchar(140) NOT NULL,
  `status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`id`, `uid`, `aid`, `complaint`, `status`) VALUES
(1, 1, 1, 'Transaction Not Processed', 'PROCESSED'),
(2, 1, 1, 'Transaction Not Processed', 'PROCESSED'),
(3, 2, 1, 'Previous Complaint Not Processed', 'PROCESSED'),
(4, 2, 1, 'Transaction Not Processed', 'PROCESSED'),
(5, 2, 2, 'Transaction Not Processed', 'PROCESSED'),
(6, 1, 1, 'Bill Not Correct', 'PROCESSED'),
(7, 3, 1, 'Bill Not Correct', 'PROCESSED'),
(8, 3, 2, 'Transaction Not Processed', 'PROCESSED'),
(9, 4, 2, 'Transaction Not Processed', 'PROCESSED'),
(10, 4, 1, 'Bill Not Correct', 'PROCESSED'),
(11, 5, 2, 'Bill Generated Late', 'PROCESSED'),
(12, 1, 2, 'Bill Generated Late', 'NOT PROCESSED'),
(13, 11, 1, 'Bill Generated Late', 'PROCESSED');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(14) NOT NULL,
  `bid` int(14) NOT NULL,
  `payable` decimal(10,2) NOT NULL,
  `pdate` date DEFAULT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `bid`, `payable`, `pdate`, `status`) VALUES
(17, 17, '400.00', '2021-07-06', 'PROCESSED'),
(18, 18, '2550.00', '2021-07-10', 'PROCESSED'),
(19, 19, '380.00', NULL, 'PENDING'),
(20, 20, '280.00', '2021-07-10', 'PROCESSED'),
(21, 21, '3100.00', NULL, 'PENDING'),
(22, 22, '220.00', '2021-07-10', 'PROCESSED'),
(23, 23, '356.00', '2021-07-10', 'PROCESSED'),
(24, 24, '280.00', NULL, 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `unitsrate`
--

CREATE TABLE `unitsrate` (
  `sno` int(1) DEFAULT NULL,
  `twohundred` int(14) NOT NULL,
  `fivehundred` int(14) NOT NULL,
  `thousand` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unitsrate`
--

INSERT INTO `unitsrate` (`sno`, `twohundred`, `fivehundred`, `thousand`) VALUES
(1, 2, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(14) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `phone`, `pass`, `address`) VALUES
(1, 'Freddy\n', 'freddy@gmail.com', '7450002145', 'password', 'Kolar'),
(2, 'Antony', 'antony@gmail.com', '7854547855', 'password', 'Devanahalli'),
(3, 'Albert', 'albert@gmail.com', '7012569980', 'password', 'Wincent Circle'),
(4, 'Jeffrey', 'jeffrey@gmail.com', '7012458888', 'password', 'Banaswadi'),
(5, 'Sandhra', 'sandra@gmail.com', '7012565800', 'password', 'Indira Nagar'),
(6, 'Ezhumalai', 'ezhumalai@gmail.com', '7896541000', 'password', 'Yeswanthpur'),
(7, 'Jithin', 'jithin@gmail.com', '70145850025', 'password', 'Electronic City'),
(8, 'Liyana', 'liyana@gmail.com', '7012545555', 'password', 'Frazer Town'),
(9, 'Williams', 'williams@gmail.com', '7696969855', 'password', 'Madiwala'),
(10, 'Christina', 'christina@gmail.com', '7896500010', 'password', 'MG ROAD'),
(11, 'Toufir', 'toufir@gmail.com', '7412580020', 'password', 'Bommanahalli');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aid` (`aid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aid` (`aid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
