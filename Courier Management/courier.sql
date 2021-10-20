-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2018 at 10:47 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `courier`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookingtable`
--

CREATE TABLE `bookingtable` (
  `BId` int(11) NOT NULL,
  `ToName` varchar(100) NOT NULL,
  `ToAddress` varchar(50) NOT NULL,
  `ToPin` int(11) NOT NULL DEFAULT '0',
  `CourWeight` varchar(45) NOT NULL,
  `CourType` varchar(45) NOT NULL,
  `Amount` double NOT NULL DEFAULT '0',
  `FromName` varchar(45) NOT NULL,
  `FromAddress` varchar(45) NOT NULL,
  `FromContact` varchar(45) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookingtable`
--

INSERT INTO `bookingtable` (`BId`, `ToName`, `ToAddress`, `ToPin`, `CourWeight`, `CourType`, `Amount`, `FromName`, `FromAddress`, `FromContact`, `date`) VALUES
(1, 'arnold', 'xyz xyz xyz xyz ', 123123, '23kg', 'vessels', 231, 'smith', 'xyz xyz xyz xyz', '123123123321', '2018-09-06 14:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `branchtable`
--

CREATE TABLE `branchtable` (
  `Id` int(11) NOT NULL,
  `branchcode` varchar(50) NOT NULL,
  `branchName` varchar(50) NOT NULL,
  `branchAddress` varchar(150) NOT NULL,
  `Bpin` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branchtable`
--

INSERT INTO `branchtable` (`Id`, `branchcode`, `branchName`, `branchAddress`, `Bpin`) VALUES
(1, 'BR123123', 'kolkatabranch', 'xyz xyz xyz', '233233');

-- --------------------------------------------------------

--
-- Table structure for table `deliverytable`
--

CREATE TABLE `deliverytable` (
  `DId` int(11) NOT NULL,
  `courNumber` varchar(50) NOT NULL,
  `branchcode` varchar(50) NOT NULL,
  `staffname` varchar(50) NOT NULL,
  `deliveredTo` varchar(50) NOT NULL,
  `Ddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliverytable`
--

INSERT INTO `deliverytable` (`DId`, `courNumber`, `branchcode`, `staffname`, `deliveredTo`, `Ddate`) VALUES
(1, '1', 'BR123123', 'john', 'arnold', '2018-09-06 14:17:32');

-- --------------------------------------------------------

--
-- Table structure for table `sheduletable`
--

CREATE TABLE `sheduletable` (
  `ShId` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `cournum` varchar(50) NOT NULL,
  `branchcode` varchar(50) NOT NULL,
  `staffname` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sheduletable`
--

INSERT INTO `sheduletable` (`ShId`, `date`, `cournum`, `branchcode`, `staffname`) VALUES
(1, '2018-09-06 14:17:04', '1', 'BR123123', 'john');

-- --------------------------------------------------------

--
-- Table structure for table `stafftable`
--

CREATE TABLE `stafftable` (
  `SId` int(11) NOT NULL,
  `BCode` varchar(50) NOT NULL,
  `StaffName` varchar(50) NOT NULL,
  `StaffContact` varchar(15) NOT NULL,
  `StaffAddress` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stafftable`
--

INSERT INTO `stafftable` (`SId`, `BCode`, `StaffName`, `StaffContact`, `StaffAddress`) VALUES
(1, 'BR123123', 'john', '12312312332', 'xyz xyz xyz xyz'),
(2, 'BR123123', 'mark', '12312312332', 'xyz xyz xyz ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookingtable`
--
ALTER TABLE `bookingtable`
  ADD PRIMARY KEY (`BId`);

--
-- Indexes for table `branchtable`
--
ALTER TABLE `branchtable`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `branchcode` (`branchcode`);

--
-- Indexes for table `deliverytable`
--
ALTER TABLE `deliverytable`
  ADD PRIMARY KEY (`DId`);

--
-- Indexes for table `sheduletable`
--
ALTER TABLE `sheduletable`
  ADD PRIMARY KEY (`ShId`);

--
-- Indexes for table `stafftable`
--
ALTER TABLE `stafftable`
  ADD PRIMARY KEY (`SId`),
  ADD KEY `par_ind` (`BCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookingtable`
--
ALTER TABLE `bookingtable`
  MODIFY `BId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `branchtable`
--
ALTER TABLE `branchtable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deliverytable`
--
ALTER TABLE `deliverytable`
  MODIFY `DId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sheduletable`
--
ALTER TABLE `sheduletable`
  MODIFY `ShId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stafftable`
--
ALTER TABLE `stafftable`
  MODIFY `SId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stafftable`
--
ALTER TABLE `stafftable`
  ADD CONSTRAINT `fk_branchTable` FOREIGN KEY (`BCode`) REFERENCES `branchtable` (`branchcode`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
