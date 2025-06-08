-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2024 at 09:45 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `online_bank_blockchain`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc_details`
--

CREATE TABLE IF NOT EXISTS `acc_details` (
  `accno` text,
  `uname` text,
  `acc_type` text,
  `details` text,
  `bank_id` text,
  `Status` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acc_details`
--

INSERT INTO `acc_details` (`accno`, `uname`, `acc_type`, `details`, `bank_id`, `Status`) VALUES
('64417', 'Rajesh', 'SAVING', 'Personal Account', '18', 'Accept'),
('3330193', 'nisarshaikh', 'CURRENT', 'current\r\n', '35', 'Accept');

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE IF NOT EXISTS `bank_details` (
  `bank_Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bank_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `bank_details`
--

INSERT INTO `bank_details` (`bank_Id`, `name`, `email`, `contact`, `address`, `website`, `password`) VALUES
(1, 'SBI', 'sbi@gmail.com', 'Your First School Name', 'ss', 'pune', 'Sbi@123'),
(3, 'ICICI Bank', 'icicibank@gmail.com', '9876543211', 'Pune', 'icici.com', 'I@1234'),
(4, 'Axis', 'axis@gmail.com', '8900890089', 'Adress', 'www.axis.com', '123'),
(5, 'hdfc', 'hdfc@gmail.com', '9359549359', 'Ahmednagar', 'hdfc.com', 'Hdfc@123'),
(6, 'HDFC', 'hdfc@gmail.com', '7387936865', 'Ahmednagar', 'hdfc.com', 'hdfc123');

-- --------------------------------------------------------

--
-- Table structure for table `newaccount`
--

CREATE TABLE IF NOT EXISTS `newaccount` (
  `accountno` int(10) DEFAULT NULL,
  `USERNAME` text,
  `PASSWORD` text,
  `REPASSWORD` text,
  `AMOUNT` text,
  `ADDRESS` text,
  `PHONE` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `otpcodetble`
--

CREATE TABLE IF NOT EXISTS `otpcodetble` (
  `email` text,
  `otpcode` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `otpcodetble`
--

INSERT INTO `otpcodetble` (`email`, `otpcode`) VALUES
('shaikhnisar107@gmail.com', '0'),
('kirantarate800@gmail.com', '0'),
('kirantarate800@gmail.com', '0'),
('sanketadhav2454@gmail.com', '0'),
('kirantarate8001@gmail.com', '0'),
('nobitadora9999@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('abhithorat@gmail.com', '0'),
('mauli@gmail.com', '0'),
('tamberajesh876@gmail.com', '0'),
('null', '0'),
('null', '0'),
('null', '0'),
('null', '0'),
('null', '0'),
('abhi999@gmail.com', '0'),
('abhi999@gmail.com', '0'),
('abc999@gmail.com', '0'),
('tamberajesh876@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('abhi@gmail.com', '0'),
('sanketadhav2454@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('kirantartae800@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('kirantartae800@gmail.com', '0'),
('kirantarate8001@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('shaikhnisar107@gmail.com', '0'),
('nobitadora9999@gmail.com', '0'),
('paresh@gmail.com', '0'),
('p@gmail.com', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tblaccountbank`
--

CREATE TABLE IF NOT EXISTS `tblaccountbank` (
  `bid` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` text,
  `BankName` text,
  `AccountType` text,
  `AccountDetails` text,
  `Accountno` text,
  `bank_id` text NOT NULL,
  `Amount_Account` text NOT NULL,
  `Status` varchar(30) NOT NULL DEFAULT 'waiting',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `tblaccountbank`
--

INSERT INTO `tblaccountbank` (`bid`, `UserName`, `BankName`, `AccountType`, `AccountDetails`, `Accountno`, `bank_id`, `Amount_Account`, `Status`) VALUES
(35, 'nisarshaikh', 'sbi@gmail.com', 'CURRENT', 'current\r\n', '0', '1', '0', 'Accept');

-- --------------------------------------------------------

--
-- Table structure for table `tblinsurance`
--

CREATE TABLE IF NOT EXISTS `tblinsurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tblinsurance`
--

INSERT INTO `tblinsurance` (`id`, `name`, `email`, `contact`, `address`, `website`, `password`) VALUES
(1, 'ICICI Lombard', 'icici@gmail.com', '9876543212', 'Pune', 'www.icici.com', 'IC@1122');

-- --------------------------------------------------------

--
-- Table structure for table `tblinsuranceinfo`
--

CREATE TABLE IF NOT EXISTS `tblinsuranceinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) DEFAULT NULL,
  `UserEmail` varchar(255) DEFAULT NULL,
  `Company_Name` varchar(255) NOT NULL,
  `Contact` varchar(255) NOT NULL,
  `WebSite` varchar(255) NOT NULL,
  `Policy_No` varchar(255) NOT NULL,
  `Policy_Name` varchar(255) NOT NULL,
  `Policy_Tenue` varchar(255) NOT NULL,
  `Base_Premium` varchar(255) NOT NULL,
  `Coverage_Info` varchar(255) NOT NULL,
  `Policy_Amount` varchar(255) NOT NULL,
  `Email_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tblinsuranceinfo`
--

INSERT INTO `tblinsuranceinfo` (`id`, `UserName`, `UserEmail`, `Company_Name`, `Contact`, `WebSite`, `Policy_No`, `Policy_Name`, `Policy_Tenue`, `Base_Premium`, `Coverage_Info`, `Policy_Amount`, `Email_ID`) VALUES
(2, 'Raj', NULL, 'ICICI Lombard', '9876543212', 'www.icici.com', 'AD34526', 'Healthy U', '10', '10000', 'Up to 2 Member', '10Lac', 'icici@gmail.com'),
(3, 'Raj', 'raj@gmail.com', 'ICICI Lombard', '9876543212', 'www.icici.com', 'AD34526', 'Healthy U', '10', '10000', 'Up to 2 Member', '10Lac', 'icici@gmail.com'),
(5, 'Komal', 'komal@gmail.com', 'ICICI Lombard', '9876543212', 'www.icici.com', 'AD34526', 'Healthy U', '10', '10000', 'Up to 2 Member', '10Lac', 'icici@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tblinsurance_details`
--

CREATE TABLE IF NOT EXISTS `tblinsurance_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) NOT NULL,
  `Company_Name` varchar(255) NOT NULL,
  `Contact` varchar(255) NOT NULL,
  `WebSite` varchar(255) NOT NULL,
  `Policy_No` varchar(255) NOT NULL,
  `Policy_Name` varchar(255) NOT NULL,
  `Policy_Tenue` varchar(255) NOT NULL,
  `Base_Premium` varchar(255) NOT NULL,
  `Coverage_Info` varchar(255) NOT NULL,
  `Policy_Amount` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tblinsurance_details`
--

INSERT INTO `tblinsurance_details` (`id`, `Email`, `Company_Name`, `Contact`, `WebSite`, `Policy_No`, `Policy_Name`, `Policy_Tenue`, `Base_Premium`, `Coverage_Info`, `Policy_Amount`) VALUES
(1, 'icici@gmail.com', 'ICICI Lombard', '9876543212', 'www.icici.com', 'AD34526', 'Healthy U', '10', '10000', 'Up to 2 Member', '10Lac'),
(2, 'icici@gmail.com', 'ICICI Lombard', '9876543212', 'www.icici.com', '1211', 'ICICI', '1200', '5LAC', '10LAC', '100000');

-- --------------------------------------------------------

--
-- Table structure for table `transferotpcode`
--

CREATE TABLE IF NOT EXISTS `transferotpcode` (
  `email` text,
  `otpcode` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transferotpcode`
--

INSERT INTO `transferotpcode` (`email`, `otpcode`) VALUES
('shaikhnisar107@gmail.com', '0766');

-- --------------------------------------------------------

--
-- Table structure for table `tx_details`
--

CREATE TABLE IF NOT EXISTS `tx_details` (
  `tx_id` int(10) NOT NULL AUTO_INCREMENT,
  `uname` text,
  `acc_no` text,
  `operation` text,
  `amt` text,
  `balance` text,
  `time1` text,
  `isnew` text,
  `Destination` text,
  `T_ID` text,
  `t_date` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`tx_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=78 ;

--
-- Dumping data for table `tx_details`
--

INSERT INTO `tx_details` (`tx_id`, `uname`, `acc_no`, `operation`, `amt`, `balance`, `time1`, `isnew`, `Destination`, `T_ID`, `t_date`) VALUES
(28, 'Nisar R. Shaikh', '9770120', 'DEPOSITE', '2000', '3000', 'Sat Mar 18 15:48:19 IST 2023', 'NO', 'self', '168101', NULL),
(29, 'Nisar R. Shaikh', '9770120', 'DEPOSITE', '1000', '5395', 'Sun Mar 19 22:17:02 IST 2023', 'NO', 'self', '197688', NULL),
(30, 'Nisar R. Shaikh', '9770120', 'WITHDRAW', '200', '5395', 'Mon Mar 20 00:15:03 IST 2023', 'NO', 'self', '197688', '20/03/2023'),
(31, 'Nisar R. Shaikh', '9770120', 'WITHDRAW', '200', '5395', 'Mon Mar 20 00:19:48 IST 2023', 'NO', 'self', '197688', '20/03/2023'),
(32, 'Nisar R. Shaikh', '9770120', 'TRANSFER', '100', '5395', 'Mon Mar 20 00:32:53 IST 2023', 'NO', 'self', '197688', '20/03/2023'),
(33, 'Kiran S. Tarate', '33953', 'DEPOSITE', '1000', '1588', 'Mon Mar 20 00:51:26 IST 2023', 'NO', 'self', '126735', NULL),
(34, 'Kiran S. Tarate', '33953', 'WITHDRAW', '100', '1588', 'Mon Mar 20 00:52:10 IST 2023', 'NO', 'self', '126735', '20/03/2023'),
(35, 'Kiran S. Tarate', '33953', 'TRANSFER', '200', '1588', 'Mon Mar 20 00:53:16 IST 2023', 'NO', 'self', '126735', '20/03/2023'),
(36, 'Kiran S. Tarate', '33953', 'WITHDRAW', '10', '1588', 'Mon Mar 20 00:55:19 IST 2023', 'NO', 'self', '126735', '20/03/2023'),
(37, 'Nisar R. Shaikh', '9770120', 'WITHDRAW', '1000', '5395', 'Mon Mar 20 11:53:27 IST 2023', 'NO', 'self', '197688', '20/03/2023'),
(38, 'Kiran S. Tarate', '33953', 'WITHDRAW', '100', '1588', 'Mon Mar 20 12:31:04 IST 2023', 'NO', 'self', '126735', '20/03/2023'),
(39, 'Kiran S. Tarate', '33953', 'TRANSFER', '1', '1588', 'Mon Mar 20 13:03:45 IST 2023', 'NO', 'self', '126735', '20/03/2023'),
(40, 'Kiran S. Tarate', '33953', 'TRANSFER', '1', '1588', 'Mon Mar 20 13:04:52 IST 2023', 'NO', 'self', '126735', '20/03/2023'),
(41, 'Kiran S. Tarate', '33953', 'DEPOSITE', '1000', '2588', 'Mon Mar 20 13:05:35 IST 2023', 'NO', 'self', '123678', NULL),
(42, 'Sanket A. Adhav', '610077', 'DEPOSITE', '5000', '5200', 'Mon Mar 20 14:53:16 IST 2023', 'NO', 'self', '126209', NULL),
(43, 'Sanket A. Adhav', '610077', 'DEPOSITE', '200', '5200', 'Mon Mar 20 14:59:50 IST 2023', 'YES', 'self', '126209', NULL),
(44, 'Rote mam', '4678523', 'DEPOSITE', '1000', '1000', 'Mon Mar 20 18:10:52 IST 2023', 'YES', 'self', '152912', NULL),
(45, 'Rote mam', '4678523', 'WITHDRAW', '10', '990', 'Mon Mar 20 18:11:31 IST 2023', 'YES', 'self', '160061', '20/03/2023'),
(46, 'Rote mam', '4678523', 'WITHDRAW', '10', '980', 'Mon Mar 20 18:12:38 IST 2023', 'YES', 'self', '184475', '20/03/2023'),
(47, 'Rote mam', '4678523', 'WITHDRAW', '10', '970', 'Mon Mar 20 18:12:48 IST 2023', 'YES', 'self', '151289', '20/03/2023'),
(48, 'Kiran S. Tarate', '33953', 'DEPOSITE', '1000', '2588', 'Tue Mar 21 09:48:47 IST 2023', 'YES', 'self', '123678', NULL),
(49, 'Kiran S. Tarate', '33953', 'WITHDRAW', '500', '2088', 'Tue Mar 21 09:49:52 IST 2023', 'YES', 'self', '146809', '21/03/2023'),
(50, 'Kiran S. Tarate', '33953', 'WITHDRAW', '500', '1588', 'Tue Mar 21 09:58:56 IST 2023', 'YES', 'self', '102047', '21/03/2023'),
(51, 'Nisar R. Shaikh', '9770120', 'TRANSFER', '100', '5395', 'Wed Mar 29 19:58:09 IST 2023', 'NO', 'self', '197688', '29/03/2023'),
(52, 'Nisar R. Shaikh', '9770120', 'TRANSFER', '100', '5395', 'Wed Mar 29 19:58:55 IST 2023', 'NO', 'self', '197688', '29/03/2023'),
(53, 'Nisar R. Shaikh', '9770120', 'WITHDRAW', '100', '5395', 'Wed Mar 29 20:00:41 IST 2023', 'NO', 'self', '197688', '29/03/2023'),
(54, 'Nisar R. Shaikh', '9770120', 'TRANSFER', '100', '5395', 'Wed Mar 29 20:01:30 IST 2023', 'NO', 'self', '197688', '29/03/2023'),
(55, 'Kiran S. Tarate', '33953', 'WITHDRAW', '100', '1488', 'Wed Mar 29 20:35:18 IST 2023', 'YES', 'self', '141215', '29/03/2023'),
(56, 'Nisar R. Shaikh', '9770120', 'WITHDRAW', '100', '5395', 'Wed Mar 29 20:38:24 IST 2023', 'NO', 'self', '197688', '29/03/2023'),
(57, 'Nisar R. Shaikh', '9770120', 'WITHDRAW', '100', '5395', 'Wed Mar 29 20:39:11 IST 2023', 'NO', 'self', '197688', '29/03/2023'),
(58, 'Nisar R. Shaikh', '9770120', 'WITHDRAW', '100', '5395', 'Wed Mar 29 20:39:43 IST 2023', 'NO', 'self', '197688', '29/03/2023'),
(59, 'Nisar R. Shaikh', '9770120', 'TRANSFER', '100', '5395', 'Wed Mar 29 20:40:26 IST 2023', 'NO', 'self', '197688', '29/03/2023'),
(60, 'Nisar R. Shaikh', '9770120', 'WITHDRAW', '100', '5395', 'Wed Mar 29 20:47:03 IST 2023', 'NO', 'self', '197688', '29/03/2023'),
(61, 'Nisar R. Shaikh', '9770120', 'TRANSFER', '105', '5395', 'Wed Mar 29 20:59:22 IST 2023', 'NO', 'self', '197688', '29/03/2023'),
(62, 'Nisar R. Shaikh', '9770120', 'TRANSFER', '100', '5395', 'Wed Mar 29 21:00:00 IST 2023', 'NO', 'self', '197688', '29/03/2023'),
(63, 'Nisar R. Shaikh', '9770120', 'DEPOSITE', '5000', '5395', 'Wed Mar 29 21:00:21 IST 2023', 'YES', 'self', '197688', NULL),
(64, 'Nisar R. Shaikh', '9770120', 'TRANSFER', '100', '5295', 'Wed Mar 29 21:04:15 IST 2023', 'YES', '33953', '177093', '29/03/2023'),
(65, 'Nisar R. Shaikh', '9770120', 'TRANSFER', '100', '5195', 'Thu Mar 30 10:58:27 IST 2023', 'YES', '33953', '124665', '30/03/2023'),
(66, 'Nisar R. Shaikh', '9770120', 'WITHDRAW', '100', '5095', 'Thu Mar 30 10:59:46 IST 2023', 'YES', 'self', '185990', '30/03/2023'),
(67, 'Nisar R. Shaikh', '9770120', 'WITHDRAW', '100', '4995', 'Thu Mar 30 11:01:59 IST 2023', 'YES', 'self', '179580', '30/03/2023'),
(68, 'Nisar R. Shaikh', '9770120', 'TRANSFER', '100', '4895', 'Thu Mar 30 11:10:15 IST 2023', 'YES', '33953', '189747', '30/03/2023'),
(69, 'Nisar R. Shaikh', '9770120', 'WITHDRAW', '100', '4795', 'Thu Mar 30 11:12:33 IST 2023', 'YES', 'self', '150574', '30/03/2023'),
(70, 'Nisar R. Shaikh', '9770120', 'TRANSFER', '100', '4695', 'Thu Mar 30 11:17:29 IST 2023', 'YES', '33953', '198918', '30/03/2023'),
(71, 'Nisar R. Shaikh', '9770120', 'WITHDRAW', '100', '4595', 'Thu Mar 30 11:19:47 IST 2023', 'YES', 'self', '189967', '30/03/2023'),
(72, 'nisarshaikh', '9926732', 'DEPOSITE', '100', '100', 'Tue Apr 04 20:45:34 IST 2023', 'YES', 'self', '101906', NULL),
(73, 'nisarshaikh', '9926732', 'WITHDRAW', '100', '0', 'Tue Apr 04 20:46:04 IST 2023', 'YES', 'self', '191757', '04/04/2023'),
(74, 'nisarshaikh', '9926732', 'DEPOSITE', '1000', '1000', 'Tue Apr 04 20:46:54 IST 2023', 'YES', 'self', '194915', NULL),
(75, 'nisarshaikh', '9926732', 'TRANSFER', '100', '900', 'Tue Apr 04 20:48:57 IST 2023', 'YES', '6722663', '115184', '04/04/2023'),
(76, 'sanketadhav', '3260558', 'DEPOSITE', '1000', '1000', 'Wed Apr 12 10:12:51 IST 2023', 'YES', 'self', '112397', NULL),
(77, 'nisarshaikh', '3330193', 'DEPOSITE', '1000', '1000', 'Wed Apr 19 14:52:42 IST 2023', 'YES', 'self', '183152', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sec_question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `dob` varchar(10) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `bloodGroup` varchar(5) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `resAddress` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `alternatecontact` varchar(255) NOT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `uname`, `password`, `sec_question`, `answer`, `dob`, `gender`, `bloodGroup`, `address`, `resAddress`, `email`, `mobile`, `alternatecontact`, `FileName`, `status`) VALUES
(23, 'Rajesh', 'abc123', 'Your First School Name?', 'MPVB', '19/11/1991', 'Male', 'O+ve', 'Bon Vivant Pune', 'A-701, BV', 'tamberajesh876@gmail.com', '9834727592', '9834727592', '', 'Active'),
(36, 'nisarshaikh', 'nisar123', 'Favorite Color Name?', 'white', '2023-04-02', 'Male', 'A', 'A/P Dhawalpuri, Tel-Parner, Dist-Ahmednagar', 'dhawalpuri', 'shaikhnisar107@gmail.com', '7387936866', '7387936863', 'Screenshot (494).png', 'Active'),
(38, 'jagruti', 'JAGU@123', 'Your First School Name?', 'gigabai', '1996-05-24', 'Female', 'B', 'pune', 'PUNE', 'paresh@gmail.com', '9985938558', '8875783447', 'bill.png', 'Active'),
(39, 'jagruti', 'jagu@123', 'Your First School Name?', 'gigabai', '1996-05-24', 'Female', 'B', 'pune', 'PUNE', 'p@gmail.com', '9985938558', '8875783447', 'bill.png', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawotpcode`
--

CREATE TABLE IF NOT EXISTS `withdrawotpcode` (
  `email` text,
  `otpcode` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `withdrawotpcode`
--

INSERT INTO `withdrawotpcode` (`email`, `otpcode`) VALUES
('shaikhnisar107@gmail.com', '8474');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
