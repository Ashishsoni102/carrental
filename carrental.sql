-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2021 at 09:54 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessories`
--

CREATE TABLE `accessories` (
  `Accessory_ID` int(11) NOT NULL,
  `Type` varchar(15) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accessories`
--

INSERT INTO `accessories` (`Accessory_ID`, `Type`, `Amount`) VALUES
(1, 'GPS Navigation', 50),
(2, 'GPS Navigation', 50),
(3, 'GPS Navigation', 50),
(4, 'Baby Seater', 30),
(5, 'Baby Seater', 30);

-- --------------------------------------------------------

--
-- Table structure for table `accessory_reserved`
--

CREATE TABLE `accessory_reserved` (
  `Accessory_ID` int(11) NOT NULL,
  `Reservation_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accessory_reserved`
--

INSERT INTO `accessory_reserved` (`Accessory_ID`, `Reservation_ID`) VALUES
(1, 1),
(1, 4),
(2, 4),
(5, 2),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `additional_driver`
--

CREATE TABLE `additional_driver` (
  `Reservation_ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `additional_driver`
--

INSERT INTO `additional_driver` (`Reservation_ID`, `NAME`, `DOB`) VALUES
(1, 'William Smith', '1970-07-15'),
(2, 'Green Taylor', '1987-06-15'),
(2, 'Robert Moore', '1990-12-17'),
(4, 'Brad Cook', '1966-12-12'),
(5, 'Steve Fouts', '1976-05-28');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `VIN` char(17) NOT NULL,
  `Rental_Location_ID` int(11) NOT NULL,
  `Reg_No` varchar(15) DEFAULT NULL,
  `Status` varchar(15) NOT NULL,
  `Seating_Capacity` int(11) NOT NULL,
  `Disability_Friendly` char(1) DEFAULT NULL,
  `Car_Type` varchar(15) NOT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `Year` char(4) DEFAULT NULL,
  `Color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`VIN`, `Rental_Location_ID`, `Reg_No`, `Status`, `Seating_Capacity`, `Disability_Friendly`, `Car_Type`, `Model`, `Year`, `Color`) VALUES
('E902103289341098', 102, 'XYZ671', 'Available', 5, NULL, 'Premium', 'BMW', '2015', 'Black'),
('F152206785240289', 101, 'TXF101', 'Available', 5, 'N', 'Economy', 'Mazda3', '2007', 'Gold'),
('N892993994858292', 104, 'RAC829', 'Available', 15, NULL, 'MiniVan', 'Sienna', '2013', 'Black'),
('R908891209418173', 103, 'DOP391', 'Unavailable', 7, NULL, 'SUV', 'Acura MDX', '2014', 'White'),
('T201534710589051', 101, 'KYQ101', 'Available', 5, 'Y', 'Standard', 'Toyota Camry', '2012', 'Grey');

-- --------------------------------------------------------

--
-- Table structure for table `card_details`
--

CREATE TABLE `card_details` (
  `Login_ID` varchar(15) NOT NULL,
  `Name_On_Card` varchar(50) NOT NULL,
  `Card_No` char(16) NOT NULL,
  `Expiry_Date` date NOT NULL,
  `CVV` char(3) NOT NULL,
  `Billing_Address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `card_details`
--

INSERT INTO `card_details` (`Login_ID`, `Name_On_Card`, `Card_No`, `Expiry_Date`, `CVV`, `Billing_Address`) VALUES
('courtney90', 'Courtney Rollins', '4735111122223333', '2018-01-15', '833', '1530 S.Campbell Rd, Dallas, TX 75251'),
('manoj87', 'Manoj Punwani', '4233908110921001', '2019-12-31', '419', '9855 Shadow Way, TX 75243');

-- --------------------------------------------------------

--
-- Table structure for table `car_insurance`
--

CREATE TABLE `car_insurance` (
  `Car_Type` varchar(15) NOT NULL,
  `Insurance_Type` varchar(15) NOT NULL,
  `Insurance_Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_insurance`
--

INSERT INTO `car_insurance` (`Car_Type`, `Insurance_Type`, `Insurance_Price`) VALUES
('Economy', 'Comprehensive', 20),
('Economy', 'Liability', 10),
('MiniVan', 'Liability', 15),
('Premium', 'Liability', 20),
('Standard', 'Comprehensive', 20),
('Standard', 'Liability', 11),
('SUV', 'Comprehensive', 25),
('SUV', 'Liability', 13);

-- --------------------------------------------------------

--
-- Table structure for table `car_type`
--

CREATE TABLE `car_type` (
  `Car_Type` varchar(15) NOT NULL,
  `Price_Per_Day` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_type`
--

INSERT INTO `car_type` (`Car_Type`, `Price_Per_Day`) VALUES
('Economy', 20),
('MiniVan', 110),
('Premium', 150),
('Standard', 30),
('SUV', 90);

-- --------------------------------------------------------

--
-- Table structure for table `car_user`
--

CREATE TABLE `car_user` (
  `License_No` varchar(15) NOT NULL,
  `Fname` varchar(15) NOT NULL,
  `Mname` varchar(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Phone` char(10) NOT NULL,
  `DOB` date NOT NULL,
  `User_Type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_user`
--

INSERT INTO `car_user` (`License_No`, `Fname`, `Mname`, `Lname`, `Email`, `Address`, `Phone`, `DOB`, `User_Type`) VALUES
('C11609103', 'Courtney', NULL, 'Rollins', 'courtney.r@hotmail.com', '1530 S.Campbell Rd', '4697891045', '1990-03-20', 'Customer'),
('E12905109', 'Patrick', 'G', 'Cleaver', 'patric.c@yahoo.com', '1701 N.Campbell Rd, Dallas, TX-75243', '5022196058', '1970-01-10', 'Guest'),
('G30921561', 'Glenn', NULL, 'Tucker', 'glenn.t@hotmail.com', '101 Meritline drive', '8590125607', '1964-11-11', 'Customer'),
('M12098127', 'Manoj', NULL, 'Punwani', 'manoj123@gmail.com', '43 Greenville Road', '2048015647', '1987-04-24', 'Customer'),
('R12098127', 'Ron', NULL, 'Harper', 'ron.harper@hotmail.com', '43 Greenville Road', '2048015647', '1987-04-24', 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `Insurance_Type` varchar(15) NOT NULL,
  `Bodily_Coverage` int(11) NOT NULL,
  `Medical_Coverage` int(11) NOT NULL,
  `Collision_Coverage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`Insurance_Type`, `Bodily_Coverage`, `Medical_Coverage`, `Collision_Coverage`) VALUES
('Comprehensive', 50000, 50000, 50000),
('Liability', 25000, 50000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `offer_details`
--

CREATE TABLE `offer_details` (
  `Promo_Code` varchar(15) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Promo_Type` varchar(20) NOT NULL,
  `Is_One_Time` char(1) DEFAULT NULL,
  `Percentage` decimal(5,2) DEFAULT NULL,
  `Discounted_Amount` int(11) DEFAULT NULL,
  `Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offer_details`
--

INSERT INTO `offer_details` (`Promo_Code`, `Description`, `Promo_Type`, `Is_One_Time`, `Percentage`, `Discounted_Amount`, `Status`) VALUES
('CHRISTMAS10', 'Christmas 10% offer', 'Percentage', 'N', '10.00', NULL, 'Available'),
('July25', 'July $25.00 discount', 'Discounted Amount', 'Y', NULL, 25, 'Expired'),
('LaborDay5', 'Labor Day $5.00 offer', 'Discounted Amount', 'Y', NULL, 5, 'Expired'),
('NewYear10', 'New Year 10% offer', 'Percentage', 'N', '10.00', NULL, 'Available'),
('VeteranDay15', 'New Year 15% offer', 'Percentage', 'N', '15.00', NULL, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Amount_Paid` int(11) NOT NULL,
  `Card_No` char(16) DEFAULT NULL,
  `Expiry_Date` date DEFAULT NULL,
  `Name_On_Card` varchar(50) DEFAULT NULL,
  `CVV` char(3) DEFAULT NULL,
  `Billing_Address` varchar(50) DEFAULT NULL,
  `Reservation_ID` int(11) NOT NULL,
  `Login_ID` varchar(15) DEFAULT NULL,
  `Saved_Card_No` char(16) DEFAULT NULL,
  `Paid_By_Cash` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Amount_Paid`, `Card_No`, `Expiry_Date`, `Name_On_Card`, `CVV`, `Billing_Address`, `Reservation_ID`, `Login_ID`, `Saved_Card_No`, `Paid_By_Cash`) VALUES
(1001, 130, '4735111122223333', '2018-01-15', 'Patric Clever', '100', '1530 S.Campbell Rd, Dallas, TX 75251', 1, NULL, NULL, NULL),
(1002, 300, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 'Y'),
(1003, 99, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 'Y'),
(1004, 689, NULL, NULL, NULL, NULL, NULL, 3, 'courtney90', '4735111122223333', NULL),
(1005, 115, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `rental_location`
--

CREATE TABLE `rental_location` (
  `Rental_Location_ID` int(11) NOT NULL,
  `Phone` char(10) NOT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `Street_Name` varchar(40) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip_Code` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rental_location`
--

INSERT INTO `rental_location` (`Rental_Location_ID`, `Phone`, `Email`, `Street_Name`, `State`, `Zip_Code`) VALUES
(101, '9726031111', 'adams12@gmail.com', '980 Addison Road, Dallas', 'TX', '75123'),
(102, '9726032222', 'bobw@gmail.com', ' 111, Berlington Road, Dallas', 'TX', '75243'),
(103, '9721903121', 'patric.clever@gmail.com', ' 9855 Shadow Way, Dallas', 'TX', '75211'),
(104, '721903121', NULL, '434 Harrodswood Road, Irving', 'TX', '76512'),
(105, '5026981045', 'julier@gmail.com', '7788 internal Drive, Irving', 'TX', '77888');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `Reservation_ID` int(11) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Meter_Start` int(11) NOT NULL,
  `Meter_End` int(11) DEFAULT NULL,
  `Rental_Amount` int(11) NOT NULL,
  `Insurance_Amount` int(11) NOT NULL,
  `Actual_End_Date` date DEFAULT NULL,
  `Status` varchar(10) NOT NULL,
  `License_No` varchar(15) NOT NULL,
  `VIN` char(17) NOT NULL,
  `Promo_Code` varchar(15) DEFAULT NULL,
  `Additional_Amount` int(11) DEFAULT NULL,
  `Tot_Amount` int(11) NOT NULL,
  `Insurance_Type` varchar(15) DEFAULT NULL,
  `Penalty_Amount` int(11) DEFAULT NULL,
  `Drop_Location_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`Reservation_ID`, `Start_Date`, `End_Date`, `Meter_Start`, `Meter_End`, `Rental_Amount`, `Insurance_Amount`, `Actual_End_Date`, `Status`, `License_No`, `VIN`, `Promo_Code`, `Additional_Amount`, `Tot_Amount`, `Insurance_Type`, `Penalty_Amount`, `Drop_Location_ID`) VALUES
(1, '2015-11-06', '2015-11-12', 81256, 81300, 120, 10, '2015-11-12', 'Completed', 'E12905109', 'F152206785240289', NULL, NULL, 130, 'Liability', 0, 101),
(2, '2015-10-20', '2015-10-24', 76524, 76590, 120, 10, '2015-10-24', 'Completed', 'C11609103', 'T201534710589051', NULL, NULL, 130, 'Liability', 0, 101),
(3, '2015-12-06', '2015-12-12', 82001, NULL, 659, 30, NULL, 'Reserved', 'C11609103', 'N892993994858292', 'NewYear10', NULL, 689, 'Comprehensive', 0, 104),
(4, '2015-09-01', '2015-09-02', 51000, 51100, 90, 25, '2015-09-02', 'Completed', 'C11609103', 'R908891209418173', NULL, NULL, 115, 'Comprehensive', 0, 103),
(5, '2015-08-13', '2015-08-15', 51000, 51100, 299, 100, '2015-08-15', 'Completed', 'R12098127', 'E902103289341098', NULL, NULL, 399, 'Comprehensive', 0, 105);

-- --------------------------------------------------------

--
-- Table structure for table `user_credentials`
--

CREATE TABLE `user_credentials` (
  `Login_ID` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `Year_Of_Membership` char(4) NOT NULL,
  `License_No` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_credentials`
--

INSERT INTO `user_credentials` (`Login_ID`, `Password`, `Year_Of_Membership`, `License_No`) VALUES
('courtney90', 'bc125ac', '2009', 'C11609103'),
('glenn64', 'macpro99', '2011', 'G30921561'),
('manoj87', 'windows99', '2008', 'M12098127');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`Accessory_ID`);

--
-- Indexes for table `accessory_reserved`
--
ALTER TABLE `accessory_reserved`
  ADD PRIMARY KEY (`Accessory_ID`,`Reservation_ID`),
  ADD KEY `ACCESSORYRESERVFK` (`Reservation_ID`);

--
-- Indexes for table `additional_driver`
--
ALTER TABLE `additional_driver`
  ADD PRIMARY KEY (`Reservation_ID`,`NAME`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`VIN`),
  ADD UNIQUE KEY `Reg_No` (`Reg_No`),
  ADD KEY `CARVINTYPEFK` (`Car_Type`),
  ADD KEY `CARVINRENTALFK` (`Rental_Location_ID`);

--
-- Indexes for table `card_details`
--
ALTER TABLE `card_details`
  ADD PRIMARY KEY (`Login_ID`,`Card_No`);

--
-- Indexes for table `car_insurance`
--
ALTER TABLE `car_insurance`
  ADD PRIMARY KEY (`Car_Type`,`Insurance_Type`),
  ADD KEY `INSURANCETYPEFK` (`Insurance_Type`);

--
-- Indexes for table `car_type`
--
ALTER TABLE `car_type`
  ADD PRIMARY KEY (`Car_Type`);

--
-- Indexes for table `car_user`
--
ALTER TABLE `car_user`
  ADD PRIMARY KEY (`License_No`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`Insurance_Type`);

--
-- Indexes for table `offer_details`
--
ALTER TABLE `offer_details`
  ADD PRIMARY KEY (`Promo_Code`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `PAYMENTRESERVATIONFK` (`Reservation_ID`),
  ADD KEY `PAYMENTLOGINFK` (`Login_ID`,`Saved_Card_No`);

--
-- Indexes for table `rental_location`
--
ALTER TABLE `rental_location`
  ADD PRIMARY KEY (`Rental_Location_ID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Reservation_ID`),
  ADD KEY `RSERVLOCATIONFK` (`Drop_Location_ID`),
  ADD KEY `RESLICENSEFK` (`License_No`),
  ADD KEY `VINRESERVATIONFK` (`VIN`),
  ADD KEY `PROMORESERVATIONFK` (`Promo_Code`),
  ADD KEY `INSURESERVATIONFK` (`Insurance_Type`);

--
-- Indexes for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD PRIMARY KEY (`Login_ID`),
  ADD KEY `USRLIC` (`License_No`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accessory_reserved`
--
ALTER TABLE `accessory_reserved`
  ADD CONSTRAINT `ACCESSFK` FOREIGN KEY (`Accessory_ID`) REFERENCES `accessories` (`Accessory_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `ACCESSORYRESERVFK` FOREIGN KEY (`Reservation_ID`) REFERENCES `reservation` (`Reservation_ID`) ON DELETE CASCADE;

--
-- Constraints for table `additional_driver`
--
ALTER TABLE `additional_driver`
  ADD CONSTRAINT `ADDTIONALFK` FOREIGN KEY (`Reservation_ID`) REFERENCES `reservation` (`Reservation_ID`) ON DELETE CASCADE;

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `CARVINRENTALFK` FOREIGN KEY (`Rental_Location_ID`) REFERENCES `rental_location` (`Rental_Location_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `CARVINTYPEFK` FOREIGN KEY (`Car_Type`) REFERENCES `car_type` (`Car_Type`) ON DELETE CASCADE;

--
-- Constraints for table `card_details`
--
ALTER TABLE `card_details`
  ADD CONSTRAINT `USRCARDFK` FOREIGN KEY (`Login_ID`) REFERENCES `user_credentials` (`Login_ID`) ON DELETE CASCADE;

--
-- Constraints for table `car_insurance`
--
ALTER TABLE `car_insurance`
  ADD CONSTRAINT `CARTYPEFK` FOREIGN KEY (`Car_Type`) REFERENCES `car_type` (`Car_Type`) ON DELETE CASCADE,
  ADD CONSTRAINT `INSURANCETYPEFK` FOREIGN KEY (`Insurance_Type`) REFERENCES `insurance` (`Insurance_Type`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `PAYMENTLOGINFK` FOREIGN KEY (`Login_ID`,`Saved_Card_No`) REFERENCES `card_details` (`Login_ID`, `Card_No`) ON DELETE CASCADE,
  ADD CONSTRAINT `PAYMENTRESERVATIONFK` FOREIGN KEY (`Reservation_ID`) REFERENCES `reservation` (`Reservation_ID`) ON DELETE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `INSURESERVATIONFK` FOREIGN KEY (`Insurance_Type`) REFERENCES `insurance` (`Insurance_Type`) ON DELETE CASCADE,
  ADD CONSTRAINT `PROMORESERVATIONFK` FOREIGN KEY (`Promo_Code`) REFERENCES `offer_details` (`Promo_Code`) ON DELETE CASCADE,
  ADD CONSTRAINT `RESLICENSEFK` FOREIGN KEY (`License_No`) REFERENCES `car_user` (`License_No`) ON DELETE CASCADE,
  ADD CONSTRAINT `RSERVLOCATIONFK` FOREIGN KEY (`Drop_Location_ID`) REFERENCES `rental_location` (`Rental_Location_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `VINRESERVATIONFK` FOREIGN KEY (`VIN`) REFERENCES `car` (`VIN`) ON DELETE CASCADE;

--
-- Constraints for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD CONSTRAINT `USRLIC` FOREIGN KEY (`License_No`) REFERENCES `car_user` (`License_No`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
