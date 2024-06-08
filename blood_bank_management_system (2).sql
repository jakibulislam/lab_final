-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2024 at 07:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blood_bank_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank_units`
--

CREATE TABLE `blood_bank_units` (
  `Unit_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Donor_ID` int(11) DEFAULT NULL,
  `Blood_Type` varchar(3) NOT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Donation_Date` date DEFAULT NULL,
  `Expiry_Date` date DEFAULT NULL,
  `Volume` decimal(5,2) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_bank_units`
--

INSERT INTO `blood_bank_units` (`Unit_ID`, `Name`, `Donor_ID`, `Blood_Type`, `Status`, `Donation_Date`, `Expiry_Date`, `Volume`, `Location`) VALUES
(1, 'Bangladesh Red Crescent Society', 10, 'O+', 'Available', '2023-05-05', '2023-08-05', 450.00, 'Barishal'),
(2, 'Bahhan', 2, 'B+', 'Available', '2023-02-20', '2023-05-20', 450.00, 'Chittagong'),
(3, 'Unit O1', 3, 'O-', 'Available', '2023-01-12', '2023-04-12', 450.00, 'Khulna'),
(4, 'Bangladesh Red Crescent Society', 4, 'AB+', 'Available', '2022-11-05', '2023-02-05', 450.00, 'Rajshahi'),
(5, 'Badon', 5, 'A-', 'Available', '2023-03-18', '2023-06-18', 450.00, 'Sylhet'),
(6, 'Barishal Blood Donors Club', 6, 'B-', 'Expired', '2023-04-10', '2023-07-10', 450.00, 'Barisal'),
(7, 'Bangladesh Red Crescent Society', 7, 'O+', 'Available', '2023-02-15', '2023-05-15', 450.00, 'Rangpur'),
(8, 'Bahan', 8, 'A+', 'Available', '2022-12-01', '2023-03-01', 450.00, 'Barishal'),
(9, 'অঙ্গীকার ব্লাড ডোনারস ক্লাব', 9, 'AB-', 'Unavailable', '2023-01-25', '2023-04-25', 450.00, 'Dhaka'),
(10, 'Bangladesh Red Crescent Society', 1, 'A+', 'Available', '2023-05-15', '2023-08-15', 450.00, 'Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `blood_requests`
--

CREATE TABLE `blood_requests` (
  `Request_ID` int(11) NOT NULL,
  `Requester_Name` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Blood_Type` varchar(3) NOT NULL,
  `Request_Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Quantity` decimal(5,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Fulfillment_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_requests`
--

INSERT INTO `blood_requests` (`Request_ID`, `Requester_Name`, `Phone`, `Blood_Type`, `Request_Date`, `Quantity`, `Status`, `Fulfillment_Date`) VALUES
(1, 'Mohammad Ali', '01810000001', 'A+', '2024-05-31 18:00:00', 2.00, 'Fulfilled', '2024-06-01'),
(2, 'Rahima Khatun', '01810000002', 'B+', '2024-05-19 18:00:00', 1.00, 'Fulfilled', '2024-05-21'),
(3, 'Abdul Karim', '01810000003', 'O-', '2023-04-14 18:00:00', 3.00, 'Fulfilled', '2023-04-15'),
(4, 'Jahanara Begum', '01810000004', 'AB+', '2024-06-05 18:00:00', 2.00, 'Pending', NULL),
(5, 'Rafiqul Islam', '01810000005', 'A-', '2023-12-04 18:00:00', 1.00, 'Cancelled', NULL),
(6, 'Hasina Akter', '01810000006', 'B-', '2023-01-19 18:00:00', 4.00, 'Fulfilled', '2023-01-22'),
(7, 'Selim Reza', '01810000007', 'O+', '2023-05-24 18:00:00', 2.00, 'Fulfilled', '2023-05-25'),
(8, 'Nasima Begum', '01810000008', 'A+', '2023-06-04 18:00:00', 3.00, 'Fulfilled', '2023-06-07'),
(9, 'Arif Hossain', '01810000009', 'AB-', '2023-03-14 18:00:00', 1.00, 'Cancelled', NULL),
(10, 'Kamal Hossain', '01810000010', 'O+', '2023-04-09 18:00:00', 2.00, 'Fulfilled', '2023-04-12');

-- --------------------------------------------------------

--
-- Table structure for table `blood_tests`
--

CREATE TABLE `blood_tests` (
  `Test_ID` int(11) NOT NULL,
  `Unit_ID` int(11) DEFAULT NULL,
  `Donor_ID` int(11) DEFAULT NULL,
  `Blood_Type` varchar(3) NOT NULL,
  `Test_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_tests`
--

INSERT INTO `blood_tests` (`Test_ID`, `Unit_ID`, `Donor_ID`, `Blood_Type`, `Test_Date`) VALUES
(1, 9, 10, 'A+', '2024-05-16'),
(2, 5, 8, 'B+', '2023-02-21'),
(3, 4, 3, 'O-', '2024-01-13'),
(4, 7, 6, 'AB+', '2024-11-06'),
(5, 2, 5, 'A-', '2023-03-19'),
(6, 6, 9, 'B-', '2023-04-11'),
(7, 1, 7, 'O+', '2023-02-16'),
(8, 8, 8, 'A+', '2024-12-02'),
(9, 3, 2, 'AB-', '2023-01-26'),
(10, 10, 1, 'O+', '2023-05-06');

-- --------------------------------------------------------

--
-- Table structure for table `blood_transfusions`
--

CREATE TABLE `blood_transfusions` (
  `Transfusion_ID` int(11) NOT NULL,
  `Blood_Type` varchar(3) NOT NULL,
  `Quantity` decimal(5,2) DEFAULT NULL,
  `Causes` varchar(100) DEFAULT NULL,
  `Transfusion_Date` date DEFAULT NULL,
  `Donor_ID` int(11) DEFAULT NULL,
  `Request_ID` int(11) DEFAULT NULL,
  `Unit_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_transfusions`
--

INSERT INTO `blood_transfusions` (`Transfusion_ID`, `Blood_Type`, `Quantity`, `Causes`, `Transfusion_Date`, `Donor_ID`, `Request_ID`, `Unit_ID`) VALUES
(1, 'O+', 2.00, 'Accident', '2023-06-02', 1, 7, 1),
(2, 'B+', 1.00, 'Surgery', '2023-05-26', 2, 2, 2),
(3, 'A-', NULL, 'Anemia', '2023-04-19', 3, 5, 3),
(4, 'AB+', 2.00, 'Cancer', '2023-03-11', 4, 4, 4),
(5, 'A-', 1.00, 'Surgery', '2023-02-06', 5, 5, 5),
(6, 'B-', 2.00, 'Accident', '2023-01-23', 6, 6, 6),
(7, 'O+', 2.00, 'Hemorrhage', '2023-05-26', 7, 10, 7),
(8, 'O-', 3.00, 'Leukemia', '2022-12-03', 8, 3, 8),
(9, 'AB-', 1.00, 'Sickle Cell Anemia', '2023-01-27', 9, 9, 9),
(10, 'B+', 2.00, 'Heart Surgery', '2023-05-07', 10, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `Donor_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Blood_Type` varchar(3) NOT NULL,
  `Age` int(11) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Blood_Pressure` varchar(20) DEFAULT NULL,
  `Weight` decimal(5,2) DEFAULT NULL,
  `Hemoglobin` decimal(4,2) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Last_Donation_Date` date DEFAULT NULL,
  `Medical_History` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`Donor_ID`, `Name`, `Blood_Type`, `Age`, `Gender`, `Blood_Pressure`, `Weight`, `Hemoglobin`, `Phone`, `Email`, `Last_Donation_Date`, `Medical_History`) VALUES
(1, 'Md. Imran Hossain', 'A+', 28, 'Male', '120/80', 70.50, 14.20, '01710000001', 'imran.hossain@example.com', '2023-05-15', 'None'),
(2, 'Fatema Begum', 'B+', 32, 'Female', '110/70', 60.00, 13.80, '01710000002', 'fatema.begum@example.com', '2023-02-20', 'Diabetes'),
(3, 'Ashraful Islam', 'O-', 45, 'Male', '130/85', 80.30, 15.00, '01710000003', 'ashraful.islam@example.com', '2023-01-12', 'Hypertension'),
(4, 'Rokeya Sultana', 'AB+', 29, 'Female', '115/75', 65.40, 13.50, '01710000004', 'rokeya.sultana@example.com', '2022-11-05', 'None'),
(5, 'Tanvir Ahmed', 'A-', 34, 'Male', '125/80', 75.00, 14.80, '01710000005', 'tanvir.ahmed@example.com', '2023-03-18', 'Asthma'),
(6, 'Sumaiya Akter', 'B-', 26, 'Female', '110/70', 55.20, 13.60, '01710000006', 'sumaiya.akter@example.com', '2023-04-10', 'None'),
(7, 'Rakibul Hasan', 'O+', 40, 'Male', '135/90', 82.50, 15.30, '01710000007', 'rakibul.hasan@example.com', '2023-02-15', 'Hypertension'),
(8, 'Shamima Nasrin', 'A+', 37, 'Female', '120/80', 67.00, 14.00, '01710000008', 'shamima.nasrin@example.com', '2022-12-01', 'None'),
(9, 'Nazmul Huda', 'AB-', 41, 'Male', '115/75', 78.90, 14.90, '01710000009', 'nazmul.huda@example.com', '2023-01-25', 'None'),
(10, 'Mariam Khanam', 'O+', 30, 'Female', '130/85', 62.30, 13.70, '01710000010', 'mariam.khanam@example.com', '2023-05-05', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `instruments`
--

CREATE TABLE `instruments` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `PurchaseDate` date DEFAULT NULL,
  `UnitID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instruments`
--

INSERT INTO `instruments` (`ID`, `Name`, `Quantity`, `PurchaseDate`, `UnitID`) VALUES
(1, 'Centrifuge', 2, '2023-01-15', 1),
(2, 'Blood Test kits', 100, '2023-02-20', 2),
(3, 'Refrigerator', 1, '2023-03-10', 3),
(4, 'Blood Bag', 400, '2023-04-05', 4),
(5, 'Blood Mixer', 5, '2023-05-12', 5),
(6, 'Slides', 1, '2023-06-18', 6),
(7, 'Incubator', 3, '2023-02-25', 7),
(8, 'Blood Collection Monitor', 2, '2023-03-30', 8),
(9, 'Blood Mixer', 10, '2023-04-15', 9),
(10, 'Blood Bag', 600, '2023-05-20', 10);

-- --------------------------------------------------------

--
-- Table structure for table `pathologist`
--

CREATE TABLE `pathologist` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `UnitID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pathologist`
--

INSERT INTO `pathologist` (`ID`, `Name`, `Phone`, `UnitID`) VALUES
(1, 'Dr. Kamal Uddin', '01810000011', 3),
(2, 'Dr. Rahima Khatun', '01810000012', 2),
(3, 'Dr. Tanvir Ahmed', '01810000013', 8),
(4, 'Dr. Shabnam Begum', '01810000014', 4),
(5, 'Dr. Hasan Mahmud', '01810000015', 7),
(6, 'Dr. Rasheda Akter', '01810000016', 6),
(7, 'Dr. Arif Hossain', '01810000017', 5),
(8, 'Dr. Salma Sultana', '01810000018', 1),
(9, 'Dr. Mahbub Alam', '01810000019', 10),
(10, 'Dr. Nasrin Akter', '01810000020', 9);

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `StaffID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `UnitID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`StaffID`, `Name`, `Role`, `ContactNumber`, `Email`, `UnitID`) VALUES
(1, 'Dr. Shafiq Rahman', 'Head of Blood Bank', '01910000001', 'shafiq.rahman@example.com', 1),
(2, 'Nusrat Jahan', 'Head of Blood Bank', '01910000002', 'nusrat.jahan@example.com', 6),
(3, 'Abul Hasan', 'Technician', '01910000003', 'abul.hasan@example.com', 1),
(4, 'Farhana Sultana', 'Head of Blood Bank', '01910000004', 'farhana.sultana@example.com', 2),
(5, 'Tariq Ahmed', 'Head of Blood Bank', '01910000005', 'tariq.ahmed@example.com', 5),
(6, 'Razia Begum', 'Receptionist', '01910000006', 'razia.begum@example.com', 1),
(7, 'Tanveer Islam', 'Technician', '01910000007', 'tanveer.islam@example.com', 7),
(8, 'Sabrina Akter', 'Head of Blood Bank', '01910000008', 'sabrina.akter@example.com', 3),
(9, 'Ferdous Alam', 'Head of Blood Bank', '01910000009', 'ferdous.alam@example.com', 9),
(10, 'Rehana Rahman', 'Head of Blood Bank', '01910000010', 'rehana.rahman@example.com', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_bank_units`
--
ALTER TABLE `blood_bank_units`
  ADD PRIMARY KEY (`Unit_ID`),
  ADD KEY `Donor_ID` (`Donor_ID`);

--
-- Indexes for table `blood_requests`
--
ALTER TABLE `blood_requests`
  ADD PRIMARY KEY (`Request_ID`);

--
-- Indexes for table `blood_tests`
--
ALTER TABLE `blood_tests`
  ADD PRIMARY KEY (`Test_ID`),
  ADD KEY `Unit_ID` (`Unit_ID`),
  ADD KEY `Donor_ID` (`Donor_ID`);

--
-- Indexes for table `blood_transfusions`
--
ALTER TABLE `blood_transfusions`
  ADD PRIMARY KEY (`Transfusion_ID`),
  ADD KEY `Donor_ID` (`Donor_ID`),
  ADD KEY `Request_ID` (`Request_ID`),
  ADD KEY `Unit_ID` (`Unit_ID`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`Donor_ID`);

--
-- Indexes for table `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UnitID` (`UnitID`);

--
-- Indexes for table `pathologist`
--
ALTER TABLE `pathologist`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UnitID` (`UnitID`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`StaffID`),
  ADD KEY `UnitID` (`UnitID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blood_bank_units`
--
ALTER TABLE `blood_bank_units`
  MODIFY `Unit_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blood_requests`
--
ALTER TABLE `blood_requests`
  MODIFY `Request_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blood_tests`
--
ALTER TABLE `blood_tests`
  MODIFY `Test_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blood_transfusions`
--
ALTER TABLE `blood_transfusions`
  MODIFY `Transfusion_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `donors`
--
ALTER TABLE `donors`
  MODIFY `Donor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `instruments`
--
ALTER TABLE `instruments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pathologist`
--
ALTER TABLE `pathologist`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood_bank_units`
--
ALTER TABLE `blood_bank_units`
  ADD CONSTRAINT `blood_bank_units_ibfk_1` FOREIGN KEY (`Donor_ID`) REFERENCES `donors` (`Donor_ID`);

--
-- Constraints for table `blood_tests`
--
ALTER TABLE `blood_tests`
  ADD CONSTRAINT `blood_tests_ibfk_1` FOREIGN KEY (`Unit_ID`) REFERENCES `blood_bank_units` (`Unit_ID`),
  ADD CONSTRAINT `blood_tests_ibfk_2` FOREIGN KEY (`Donor_ID`) REFERENCES `donors` (`Donor_ID`);

--
-- Constraints for table `blood_transfusions`
--
ALTER TABLE `blood_transfusions`
  ADD CONSTRAINT `blood_transfusions_ibfk_1` FOREIGN KEY (`Donor_ID`) REFERENCES `donors` (`Donor_ID`),
  ADD CONSTRAINT `blood_transfusions_ibfk_2` FOREIGN KEY (`Request_ID`) REFERENCES `blood_requests` (`Request_ID`),
  ADD CONSTRAINT `blood_transfusions_ibfk_3` FOREIGN KEY (`Unit_ID`) REFERENCES `blood_bank_units` (`Unit_ID`);

--
-- Constraints for table `instruments`
--
ALTER TABLE `instruments`
  ADD CONSTRAINT `instruments_ibfk_1` FOREIGN KEY (`UnitID`) REFERENCES `blood_bank_units` (`Unit_ID`);

--
-- Constraints for table `pathologist`
--
ALTER TABLE `pathologist`
  ADD CONSTRAINT `pathologist_ibfk_1` FOREIGN KEY (`UnitID`) REFERENCES `blood_bank_units` (`Unit_ID`);

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`UnitID`) REFERENCES `blood_bank_units` (`Unit_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
