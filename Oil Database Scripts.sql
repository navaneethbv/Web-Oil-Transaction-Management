-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2014 at 08:20 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `oil`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `stname` varchar(30) NOT NULL DEFAULT '',
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `zipcode` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`stname`,`zipcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`stname`, `city`, `state`, `zipcode`) VALUES
('333 Village drive Apt 667', 'Euless', 'TX', '75455'),
('755 Water View Road Apt 2111', 'Richardson', 'TX', '75889'),
('885 Langford Blvd Apt 554', 'Dallas', 'TX', '75252'),
('997 North road Apt 997', 'Richardson', 'TX', '75280');

-- --------------------------------------------------------

--
-- Table structure for table `belongsto`
--

CREATE TABLE IF NOT EXISTS `belongsto` (
  `clientid` int(11) NOT NULL,
  `category` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`clientid`),
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `belongsto`
--

INSERT INTO `belongsto` (`clientid`, `category`) VALUES
(11, 'gold'),
(12, 'gold'),
(5, 'silver'),
(6, 'silver'),
(7, 'silver'),
(8, 'silver'),
(9, 'silver'),
(10, 'silver');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `emailid` varchar(30) NOT NULL,
  `cellnum` varchar(15) NOT NULL,
  `phnum` varchar(15) NOT NULL,
  `oilbalance` double NOT NULL,
  `cashbalance` double NOT NULL DEFAULT '10000',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `userid_2` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `userid`, `fname`, `lname`, `emailid`, `cellnum`, `phnum`, `oilbalance`, `cashbalance`) VALUES
(5, 'bhaddin', 'Brad', 'Haddin', 'bhaddin@gmail.com', '4694528889', '4694528887', 500, 10000),
(6, 'dwarner', 'David', 'Warner', 'dwarner@gmail.com', '4694528877', '4694528855', 673, 5650),
(7, 'gbailey', 'George', 'Bailey', 'gbailey@gmail.com', '4694528854', '46945288823', 500, 10000),
(8, 'jdustin', 'James', 'Dustin', 'jdustin@gmail.com', '4694528887', '4694528884', 500, 10000),
(9, 'mhussey', 'Michel', 'Hussey', 'mhussey@gmail.com', '4694524489', '7794528889', 250, 5500),
(10, 'phughes', 'Phil', 'Hughes', 'phughes@gmail.com', '5588779968', '5544778566', 400, 10000),
(11, 'psiddle', 'Peter', 'Siddle', 'psiddle@gmail.com', '8855441222', '4485548865', 1000, 10000),
(12, 'client1', 'client1', '', '', '', '', 500, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `clienttype`
--

CREATE TABLE IF NOT EXISTS `clienttype` (
  `category` varchar(15) NOT NULL DEFAULT '',
  `comrate` double DEFAULT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clienttype`
--

INSERT INTO `clienttype` (`category`, `comrate`) VALUES
('gold', 15),
('silver', 20);

-- --------------------------------------------------------

--
-- Table structure for table `client_trader_transaction_history`
--

CREATE TABLE IF NOT EXISTS `client_trader_transaction_history` (
  `client_id` int(11) NOT NULL DEFAULT '0',
  `trader_id` int(11) NOT NULL DEFAULT '0',
  `transaction_id` int(11) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cost_of_transaction` double NOT NULL,
  `com_charge` double NOT NULL,
  `settled_flag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`client_id`,`trader_id`,`transaction_id`),
  KEY `trader_id` (`trader_id`),
  KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_trader_transaction_history`
--

INSERT INTO `client_trader_transaction_history` (`client_id`, `trader_id`, `transaction_id`, `date`, `cost_of_transaction`, `com_charge`, `settled_flag`) VALUES
(6, 6, 46, '2014-11-26 06:35:34', 750, 150, 2),
(6, 6, 47, '2014-11-26 06:36:46', 1125, 225, 3),
(6, 6, 48, '2014-11-26 07:48:03', 1500, 300, 2),
(6, 6, 49, '2014-11-26 07:56:34', 2250, 450, 2),
(6, 6, 50, '2014-11-26 08:00:14', 750, 2, 2),
(6, 6, 52, '2014-11-27 03:10:52', 2250, 450, 3),
(9, 9, 51, '2014-11-26 08:10:59', 3750, 750, 2);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `productid` int(11) NOT NULL DEFAULT '0',
  `oilrepo` double DEFAULT NULL,
  `priceperbarrel` double DEFAULT NULL,
  `cashrepo` double DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`productid`, `oilrepo`, `priceperbarrel`, `cashrepo`) VALUES
(0, 2000, 75, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `livesin`
--

CREATE TABLE IF NOT EXISTS `livesin` (
  `clientid` int(11) NOT NULL DEFAULT '0',
  `stname` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`clientid`,`stname`),
  KEY `stname` (`stname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livesin`
--

INSERT INTO `livesin` (`clientid`, `stname`) VALUES
(5, '333 Village drive Apt 667'),
(6, '755 Water View Road Apt 2111'),
(7, '885 Langford Blvd Apt 554'),
(8, '997 North road Apt 997');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `USERID` varchar(20) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `ROLEID` int(11) NOT NULL,
  PRIMARY KEY (`USERID`),
  KEY `ROLEID` (`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`USERID`, `PASSWORD`, `ROLEID`) VALUES
('bhaddin', '9fa222e8fd9c5afd555b2e33bee8be95', 1),
('bkumar', 'bd9502261ea727b403f00ba56d880092', 2),
('client1', 'a165dd3c2e98d5d607181d0b87a4c66b', 1),
('dwarner', 'aee9f52b9e05b68703de6f4b4806cecb', 1),
('gbailey', '3a38b7f430e4c9a1f6c48725a0682e60', 1),
('jdustin', '142d31dfd6e3e249af79f137a6b5dff0', 1),
('mhussey', '65166787cb2b994cdcfa97c75dc25903', 1),
('msdhoni', '83d64e6e23c2682d41f45c3c91b870d5', 2),
('nsrini', 'f76be7d1f2d056db1396ddedf203be08', 3),
('phughes', '22c07f2dc0e3b47542d2220533ced573', 1),
('psiddle', '6b040edae5f72afbbcdfa014730e4b74', 1),
('rdravid', 'e26a9ee92ec19bb4f1e7800ab20f0de9', 2),
('rjadeja', '54cf276cab67658e21fa45f43f259e08', 2),
('rsharma', '8f65fa5ee8a3e6f6bb4d1263a8784f69', 2),
('stendulkar', '3a8cdab834adf60fe528a33fe78b5e1e', 2),
('vkohli', 'a178fcf46a400c1e98cd43f7de2c949a', 2),
('vsehwag', 'a178fcf46a400c1e98cd43f7de2c949a', 2);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL,
  `desc` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `desc`) VALUES
(1, 'client_role'),
(2, 'trader_role'),
(3, 'manager'),
(4, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `trader`
--

CREATE TABLE IF NOT EXISTS `trader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phnum` varchar(15) NOT NULL,
  `userid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trader_userid` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `trader`
--

INSERT INTO `trader` (`id`, `name`, `phnum`, `userid`) VALUES
(3, 'Virat Kohli', '8971474189', 'vkohli'),
(4, 'M S Dhoni', '8557856556', 'msdhoni'),
(5, 'Sachin Tedulkar', '78445858455', 'stendulkar'),
(6, 'V Sehwag', '9844180687', 'vsehwag'),
(7, 'Rohit Sharma', '875654542', 'rsharma'),
(8, 'Rahul Dravid', '9900522550', 'rdravid'),
(9, 'B kumar', '9686855889', 'bkumar');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` double NOT NULL COMMENT 'quantity of oil bought or sold',
  `buy_sell` varchar(1) NOT NULL,
  `cost_of_transaction` double NOT NULL,
  `comtype` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `quantity`, `buy_sell`, `cost_of_transaction`, `comtype`) VALUES
(46, 10, 'b', 750, 1),
(47, 15, 's', 1125, 1),
(48, 20, 'b', 1500, 1),
(49, 30, 'b', 2250, 1),
(50, 10, 's', 750, 0),
(51, 50, 'b', 3750, 1),
(52, 30, 'b', 2250, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `belongsto`
--
ALTER TABLE `belongsto`
  ADD CONSTRAINT `belongsto_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `belongsto_ibfk_2` FOREIGN KEY (`category`) REFERENCES `clienttype` (`category`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `login` (`USERID`) ON DELETE CASCADE;

--
-- Constraints for table `client_trader_transaction_history`
--
ALTER TABLE `client_trader_transaction_history`
  ADD CONSTRAINT `client_trader_transaction_history_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `client_trader_transaction_history_ibfk_2` FOREIGN KEY (`trader_id`) REFERENCES `trader` (`id`),
  ADD CONSTRAINT `client_trader_transaction_history_ibfk_3` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`);

--
-- Constraints for table `livesin`
--
ALTER TABLE `livesin`
  ADD CONSTRAINT `livesin_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `livesin_ibfk_2` FOREIGN KEY (`stname`) REFERENCES `address` (`stname`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`ROLEID`) REFERENCES `role` (`id`);

--
-- Constraints for table `trader`
--
ALTER TABLE `trader`
  ADD CONSTRAINT `trader_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `login` (`USERID`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
