-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 15, 2024 at 11:49 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbSupermarket`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `completedorders`
-- (See below for the actual view)
--
CREATE TABLE `completedorders` (
`OrderID` int(11)
,`MemberID` int(11)
,`OrderDate` timestamp
,`Status` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `completedordersdetails`
-- (See below for the actual view)
--
CREATE TABLE `completedordersdetails` (
`OrderID` int(11)
,`OrderDate` timestamp
,`Status` varchar(50)
,`ProductID` int(11)
,`Quantity` int(11)
,`Price` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `CustomerOrders`
--

CREATE TABLE `CustomerOrders` (
  `CustomerID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `horizontalorderview`
-- (See below for the actual view)
--
CREATE TABLE `horizontalorderview` (
`OrderID` int(11)
,`OrderDate` timestamp
,`Status` varchar(50)
,`Username` varchar(50)
,`Email` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `Members`
--

CREATE TABLE `Members` (
  `MemberID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `ProfileID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Members`
--

INSERT INTO `Members` (`MemberID`, `Username`, `Password`, `Email`, `ProfileID`) VALUES
(1, 'gusagus', 'pwd1', 'agus@gmail.com', 1),
(2, 'bubud', 'pwd2', 'budi@gmail.com', 2),
(3, 'chantik', 'pwd3', 'chantika@gmail.com', 3),
(4, 'mastres', 'pwd4', 'dimas@gmail.com', 4),
(5, 'emak', 'pwd5', 'ema@gmail.com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `OrderDetails`
--

CREATE TABLE `OrderDetails` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `OrderDetails`
--

INSERT INTO `OrderDetails` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `Price`) VALUES
(1, 1, 5, 2, 150000.00),
(2, 2, 3, 5, 25000.00),
(3, 3, 1, 10, 4000.00),
(4, 4, 2, 2, 10000.00),
(5, 5, 4, 1, 80000.00);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` int(11) NOT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OrderID`, `MemberID`, `OrderDate`, `Status`) VALUES
(1, 1, '2023-06-01 03:00:00', 'Pending'),
(2, 2, '2023-06-02 04:00:00', 'Completed'),
(3, 3, '2023-06-03 05:00:00', 'Shipped'),
(4, 4, '2023-06-04 06:00:00', 'Cancelled'),
(5, 5, '2023-06-05 07:00:00', 'Processing'),
(6, 1, '2024-07-15 08:25:34', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `ProductLog`
--

CREATE TABLE `ProductLog` (
  `LogID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `OldStock` int(11) DEFAULT NULL,
  `NewStock` int(11) DEFAULT NULL,
  `ChangeType` varchar(10) DEFAULT NULL,
  `ChangeDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ProductLog`
--

INSERT INTO `ProductLog` (`LogID`, `ProductID`, `OldStock`, `NewStock`, `ChangeType`, `ChangeDate`) VALUES
(1, 0, 0, 50, 'INSERT', '2024-07-15 07:06:41'),
(2, 1, 120, 100, 'UPDATE', '2024-07-15 07:06:42'),
(3, 6, 50, 0, 'DELETE', '2024-07-15 07:07:46'),
(6, 2, 70, 60, 'UPDATE', '2024-07-15 08:29:23'),
(7, 2, 60, 60, 'UPDATE', '2024-07-15 08:39:17'),
(8, 2, 70, 60, 'UPDATE', '2024-07-15 08:39:17'),
(9, 1, 60, 100, 'UPDATE', '2024-07-15 09:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`ProductID`, `ProductName`, `Description`, `Price`, `Stock`) VALUES
(1, 'Kopi Kapal Api', 'Kopi bubuk instan murni', 4000.00, 100),
(2, 'Sprite', 'Minuman bersoda yang menyegarkan', 10000.00, 60),
(3, 'Chiki Balls', 'Cemilan penghilang bosan', 25000.00, 50),
(4, 'Monde Butter Cookies', 'Kue margarin yang lembut', 80000.00, 30),
(5, 'Susu Bebelac', 'Susu Formula untuk bayi', 150000.00, 10);

--
-- Triggers `Products`
--
DELIMITER $$
CREATE TRIGGER `AfterProductDelete` AFTER DELETE ON `Products` FOR EACH ROW BEGIN
    UPDATE ProductLog SET ChangeDate = CURRENT_TIMESTAMP WHERE ProductID = OLD.ProductID AND ChangeType = 'DELETE';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AfterProductInsert` AFTER INSERT ON `Products` FOR EACH ROW BEGIN
    UPDATE ProductLog SET ProductID = NEW.ProductID WHERE LogID = (SELECT LAST_INSERT_ID());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `AfterProductUpdate` AFTER UPDATE ON `Products` FOR EACH ROW BEGIN
    UPDATE ProductLog SET NewStock = NEW.Stock WHERE ProductID = NEW.ProductID AND ChangeType = 'UPDATE';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeProductDelete` BEFORE DELETE ON `Products` FOR EACH ROW BEGIN
    INSERT INTO ProductLog (ProductID, OldStock, NewStock, ChangeType)
    VALUES (OLD.ProductID, OLD.Stock, 0, 'DELETE');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeProductInsert` BEFORE INSERT ON `Products` FOR EACH ROW BEGIN
    INSERT INTO ProductLog (ProductID, OldStock, NewStock, ChangeType)
    VALUES (NEW.ProductID, 0, NEW.Stock, 'INSERT');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeProductUpdate` BEFORE UPDATE ON `Products` FOR EACH ROW BEGIN
    INSERT INTO ProductLog (ProductID, OldStock, NewStock, ChangeType)
    VALUES (OLD.ProductID, OLD.Stock, NEW.Stock, 'UPDATE');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Profiles`
--

CREATE TABLE `Profiles` (
  `ProfileID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Profiles`
--

INSERT INTO `Profiles` (`ProfileID`, `FirstName`, `LastName`, `DateOfBirth`, `Address`) VALUES
(1, 'Agus', 'Hartono', '1990-01-15', 'Jl.Mangga'),
(2, 'Budi', 'Kamil', '1992-02-21', 'Jl.Pisang'),
(3, 'Chantika', 'Bella', '1985-03-08', 'Jl.Semangka'),
(4, 'Dimas', 'Tresno', '1988-04-05', 'Jl.Jeruk'),
(5, 'Ema', 'Putri', '1991-05-30', 'Jl.Apel');

-- --------------------------------------------------------

--
-- Stand-in structure for view `verticalproductview`
-- (See below for the actual view)
--
CREATE TABLE `verticalproductview` (
`ProductName` varchar(100)
,`Price` decimal(10,2)
,`Stock` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `completedorders`
--
DROP TABLE IF EXISTS `completedorders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbsupermarket`.`completedorders`  AS SELECT `dbsupermarket`.`orders`.`OrderID` AS `OrderID`, `dbsupermarket`.`orders`.`MemberID` AS `MemberID`, `dbsupermarket`.`orders`.`OrderDate` AS `OrderDate`, `dbsupermarket`.`orders`.`Status` AS `Status` FROM `dbsupermarket`.`orders` WHERE `dbsupermarket`.`orders`.`Status` = 'Completed'WITH CASCADED CHECK OPTION  ;

-- --------------------------------------------------------

--
-- Structure for view `completedordersdetails`
--
DROP TABLE IF EXISTS `completedordersdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbsupermarket`.`completedordersdetails`  AS SELECT `co`.`OrderID` AS `OrderID`, `co`.`OrderDate` AS `OrderDate`, `co`.`Status` AS `Status`, `od`.`ProductID` AS `ProductID`, `od`.`Quantity` AS `Quantity`, `od`.`Price` AS `Price` FROM (`dbsupermarket`.`completedorders` `co` join `dbsupermarket`.`orderdetails` `od` on(`co`.`OrderID` = `od`.`OrderID`))WITH LOCAL CHECK OPTION  ;

-- --------------------------------------------------------

--
-- Structure for view `horizontalorderview`
--
DROP TABLE IF EXISTS `horizontalorderview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbsupermarket`.`horizontalorderview`  AS SELECT `o`.`OrderID` AS `OrderID`, `o`.`OrderDate` AS `OrderDate`, `o`.`Status` AS `Status`, `m`.`Username` AS `Username`, `m`.`Email` AS `Email` FROM (`dbsupermarket`.`orders` `o` join `dbsupermarket`.`members` `m` on(`o`.`MemberID` = `m`.`MemberID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `verticalproductview`
--
DROP TABLE IF EXISTS `verticalproductview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dbsupermarket`.`verticalproductview`  AS SELECT `dbsupermarket`.`products`.`ProductName` AS `ProductName`, `dbsupermarket`.`products`.`Price` AS `Price`, `dbsupermarket`.`products`.`Stock` AS `Stock` FROM `dbsupermarket`.`products` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CustomerOrders`
--
ALTER TABLE `CustomerOrders`
  ADD PRIMARY KEY (`CustomerID`,`OrderID`),
  ADD KEY `idx_customer_order` (`CustomerID`,`OrderID`);

--
-- Indexes for table `Members`
--
ALTER TABLE `Members`
  ADD PRIMARY KEY (`MemberID`),
  ADD UNIQUE KEY `ProfileID` (`ProfileID`),
  ADD KEY `idx_member_email` (`Username`,`Email`);

--
-- Indexes for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `idx_order_product` (`OrderID`,`ProductID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `ProductLog`
--
ALTER TABLE `ProductLog`
  ADD PRIMARY KEY (`LogID`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `Profiles`
--
ALTER TABLE `Profiles`
  ADD PRIMARY KEY (`ProfileID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Members`
--
ALTER TABLE `Members`
  MODIFY `MemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ProductLog`
--
ALTER TABLE `ProductLog`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Profiles`
--
ALTER TABLE `Profiles`
  MODIFY `ProfileID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Members`
--
ALTER TABLE `Members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`ProfileID`) REFERENCES `Profiles` (`ProfileID`);

--
-- Constraints for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Products` (`ProductID`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `Members` (`MemberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
