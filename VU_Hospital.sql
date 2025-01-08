-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 08, 2025 at 07:13 PM
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
-- Database: `VU_Hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `epidemiological_data`
--

CREATE TABLE `epidemiological_data` (
  `Data_ID` int(11) NOT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  `Recorded_Date` date DEFAULT NULL,
  `Cases_Per_Thousand_People` int(11) DEFAULT NULL,
  `Rainfall` int(11) DEFAULT NULL,
  `Average_Temperature` decimal(5,2) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  `Added_By` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facility_type`
--

CREATE TABLE `facility_type` (
  `Facility_Type_ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Date_Updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geographical_location`
--

CREATE TABLE `geographical_location` (
  `Location_ID` int(11) NOT NULL,
  `Village` varchar(100) DEFAULT NULL,
  `Parish` varchar(100) DEFAULT NULL,
  `Sub_County` varchar(100) DEFAULT NULL,
  `County` varchar(100) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  `Population` int(11) DEFAULT NULL,
  `Coordinates` varchar(100) DEFAULT NULL,
  `Malaria_Risk_Level` varchar(50) DEFAULT NULL,
  `Health_Facilities_Count` int(11) DEFAULT NULL,
  `ITN_Coverage` decimal(5,2) DEFAULT NULL,
  `Recorded_Cases` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_facility`
--

CREATE TABLE `health_facility` (
  `Facility_ID` int(11) NOT NULL,
  `Facility_Name` varchar(100) DEFAULT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  `Facility_Type` int(11) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Contact_Details` varchar(100) DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Facility_Head` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interventions`
--

CREATE TABLE `interventions` (
  `Intervention_ID` int(11) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Outcome` varchar(50) DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laboratory_tests`
--

CREATE TABLE `laboratory_tests` (
  `Test_ID` int(11) NOT NULL,
  `Case_ID` int(11) DEFAULT NULL,
  `Test_Type` varchar(50) DEFAULT NULL,
  `Test_Date` date DEFAULT NULL,
  `Test_Result` varchar(50) DEFAULT NULL,
  `Technician_ID` int(11) DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Added_By` int(11) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_cases`
--

CREATE TABLE `malaria_cases` (
  `Case_ID` int(11) NOT NULL,
  `Facility_ID` int(11) DEFAULT NULL,
  `Type_of_Malaria` varchar(50) DEFAULT NULL,
  `Treatment_ID` int(11) DEFAULT NULL,
  `Outcome_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_type`
--

CREATE TABLE `malaria_type` (
  `Type_ID` int(11) NOT NULL,
  `Type_Name` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Added_By` int(11) DEFAULT NULL,
  `Date_Updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_data`
--

CREATE TABLE `patient_data` (
  `Patient_ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `Next_of_Kin` varchar(100) DEFAULT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `Referral_ID` int(11) NOT NULL,
  `Case_ID` int(11) DEFAULT NULL,
  `Referred_From` int(11) DEFAULT NULL,
  `Referred_To` int(11) DEFAULT NULL,
  `Referral_Date` date DEFAULT NULL,
  `Reason` text DEFAULT NULL,
  `Outcome_ID` int(11) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  `Referred_By` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `Resource_ID` int(11) NOT NULL,
  `Facility_ID` int(11) DEFAULT NULL,
  `Resource_Type` varchar(50) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Last_Updated_Date` date DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supply_chain`
--

CREATE TABLE `supply_chain` (
  `Supply_ID` int(11) NOT NULL,
  `Resource_ID` int(11) DEFAULT NULL,
  `Facility_ID` int(11) DEFAULT NULL,
  `Quantity_Shipped` int(11) DEFAULT NULL,
  `Shipment_Date` date DEFAULT NULL,
  `Expected_Arrival_Date` date DEFAULT NULL,
  `Shipped_By` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

CREATE TABLE `system_log` (
  `Log_ID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Activity` text DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `IP_Address` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `Training_ID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Training_Type` varchar(100) DEFAULT NULL,
  `Training_Date` date DEFAULT NULL,
  `Completion_Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `Treatment_ID` int(11) NOT NULL,
  `Treatment_Name` varchar(50) DEFAULT NULL,
  `Treatment_Description` text DEFAULT NULL,
  `Dosage` varchar(50) DEFAULT NULL,
  `Side_Effects` text DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment_outcomes`
--

CREATE TABLE `treatment_outcomes` (
  `Outcome_ID` int(11) NOT NULL,
  `Outcome_Name` varchar(50) DEFAULT NULL,
  `Outcome_Description` text DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Added_By` int(11) DEFAULT NULL,
  `Update_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Preferred_Name` varchar(50) DEFAULT NULL,
  `Role_ID` int(11) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Facility_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `Role_ID` int(11) NOT NULL,
  `Role_Name` varchar(50) DEFAULT NULL,
  `Role_Description` text DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit_records`
--

CREATE TABLE `visit_records` (
  `Visit_ID` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Visit_Number` int(11) DEFAULT NULL,
  `Visit_Date` date DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT NULL,
  `Facility_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `epidemiological_data`
--
ALTER TABLE `epidemiological_data`
  ADD PRIMARY KEY (`Data_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `facility_type`
--
ALTER TABLE `facility_type`
  ADD PRIMARY KEY (`Facility_Type_ID`);

--
-- Indexes for table `geographical_location`
--
ALTER TABLE `geographical_location`
  ADD PRIMARY KEY (`Location_ID`);

--
-- Indexes for table `health_facility`
--
ALTER TABLE `health_facility`
  ADD PRIMARY KEY (`Facility_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `interventions`
--
ALTER TABLE `interventions`
  ADD PRIMARY KEY (`Intervention_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `laboratory_tests`
--
ALTER TABLE `laboratory_tests`
  ADD PRIMARY KEY (`Test_ID`),
  ADD KEY `Case_ID` (`Case_ID`);

--
-- Indexes for table `malaria_cases`
--
ALTER TABLE `malaria_cases`
  ADD PRIMARY KEY (`Case_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`),
  ADD KEY `Treatment_ID` (`Treatment_ID`),
  ADD KEY `Outcome_ID` (`Outcome_ID`);

--
-- Indexes for table `malaria_type`
--
ALTER TABLE `malaria_type`
  ADD PRIMARY KEY (`Type_ID`);

--
-- Indexes for table `patient_data`
--
ALTER TABLE `patient_data`
  ADD PRIMARY KEY (`Patient_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`Referral_ID`),
  ADD KEY `Case_ID` (`Case_ID`),
  ADD KEY `Outcome_ID` (`Outcome_ID`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`Resource_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`);

--
-- Indexes for table `supply_chain`
--
ALTER TABLE `supply_chain`
  ADD PRIMARY KEY (`Supply_ID`),
  ADD KEY `Resource_ID` (`Resource_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`);

--
-- Indexes for table `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`Log_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`Training_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`Treatment_ID`);

--
-- Indexes for table `treatment_outcomes`
--
ALTER TABLE `treatment_outcomes`
  ADD PRIMARY KEY (`Outcome_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`),
  ADD KEY `Role_ID` (`Role_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`Role_ID`);

--
-- Indexes for table `visit_records`
--
ALTER TABLE `visit_records`
  ADD PRIMARY KEY (`Visit_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `epidemiological_data`
--
ALTER TABLE `epidemiological_data`
  ADD CONSTRAINT `epidemiological_data_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `geographical_location` (`Location_ID`);

--
-- Constraints for table `health_facility`
--
ALTER TABLE `health_facility`
  ADD CONSTRAINT `health_facility_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `geographical_location` (`Location_ID`);

--
-- Constraints for table `interventions`
--
ALTER TABLE `interventions`
  ADD CONSTRAINT `interventions_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `geographical_location` (`Location_ID`);

--
-- Constraints for table `laboratory_tests`
--
ALTER TABLE `laboratory_tests`
  ADD CONSTRAINT `laboratory_tests_ibfk_1` FOREIGN KEY (`Case_ID`) REFERENCES `malaria_cases` (`Case_ID`);

--
-- Constraints for table `malaria_cases`
--
ALTER TABLE `malaria_cases`
  ADD CONSTRAINT `malaria_cases_ibfk_1` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`),
  ADD CONSTRAINT `malaria_cases_ibfk_2` FOREIGN KEY (`Treatment_ID`) REFERENCES `treatment` (`Treatment_ID`),
  ADD CONSTRAINT `malaria_cases_ibfk_3` FOREIGN KEY (`Outcome_ID`) REFERENCES `treatment_outcomes` (`Outcome_ID`);

--
-- Constraints for table `patient_data`
--
ALTER TABLE `patient_data`
  ADD CONSTRAINT `patient_data_ibfk_1` FOREIGN KEY (`Location_ID`) REFERENCES `geographical_location` (`Location_ID`);

--
-- Constraints for table `referral`
--
ALTER TABLE `referral`
  ADD CONSTRAINT `referral_ibfk_1` FOREIGN KEY (`Case_ID`) REFERENCES `malaria_cases` (`Case_ID`),
  ADD CONSTRAINT `referral_ibfk_2` FOREIGN KEY (`Outcome_ID`) REFERENCES `treatment_outcomes` (`Outcome_ID`);

--
-- Constraints for table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`);

--
-- Constraints for table `supply_chain`
--
ALTER TABLE `supply_chain`
  ADD CONSTRAINT `supply_chain_ibfk_1` FOREIGN KEY (`Resource_ID`) REFERENCES `resource` (`Resource_ID`),
  ADD CONSTRAINT `supply_chain_ibfk_2` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`);

--
-- Constraints for table `system_log`
--
ALTER TABLE `system_log`
  ADD CONSTRAINT `system_log_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);

--
-- Constraints for table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `training_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `user_role` (`Role_ID`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`);

--
-- Constraints for table `visit_records`
--
ALTER TABLE `visit_records`
  ADD CONSTRAINT `visit_records_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient_data` (`Patient_ID`),
  ADD CONSTRAINT `visit_records_ibfk_2` FOREIGN KEY (`Facility_ID`) REFERENCES `health_facility` (`Facility_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
