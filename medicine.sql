-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 13, 2022 at 02:43 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medicine`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `idShop` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `idShop`, `idUser`, `status`) VALUES
(1, 1, 2, NULL),
(3, 1, 2, NULL),
(10, 1, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `detailBill`
--

CREATE TABLE `detailBill` (
  `id` int(11) NOT NULL,
  `idBill` int(11) DEFAULT NULL,
  `idDrug` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailBill`
--

INSERT INTO `detailBill` (`id`, `idBill`, `idDrug`, `quantity`) VALUES
(1, 1, 1, 3),
(2, 3, 2, 1),
(5, 10, 3, 3),
(6, 10, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `detailedWarehouse`
--

CREATE TABLE `detailedWarehouse` (
  `id` int(11) NOT NULL,
  `idDrug` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `DateAdded` date DEFAULT NULL,
  `DateEnd` date DEFAULT NULL,
  `idWarehouse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailedWarehouse`
--

INSERT INTO `detailedWarehouse` (`id`, `idDrug`, `quantity`, `DateAdded`, `DateEnd`, `idWarehouse`) VALUES
(1, 1, 10, '2022-05-12', '2022-05-27', 1),
(2, 2, 11, '2022-05-12', '2022-05-29', 1),
(24, 3, 1, '2022-05-12', '2022-05-29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `detailPlan`
--

CREATE TABLE `detailPlan` (
  `id` int(11) NOT NULL,
  `idPlan` int(11) DEFAULT NULL,
  `idDrug` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailPlan`
--

INSERT INTO `detailPlan` (`id`, `idPlan`, `idDrug`, `quantity`) VALUES
(10, 7, 1, 1),
(11, 7, 2, 1),
(12, 8, 3, 1),
(13, 8, 2, 1),
(14, 8, 1, 1),
(15, 9, 1, 1),
(16, 10, 1, 1),
(17, 10, 2, 1),
(18, 10, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE `drug` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `price` double DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drug`
--

INSERT INTO `drug` (`id`, `name`, `price`, `term`, `status`, `type_id`, `form_id`) VALUES
(1, 'Thuốc sổ', 15000, 15, 1, 1, 1),
(2, 'Thuốc trừ sâu', 500000, 17, 1, 2, 4),
(3, 'Iu em', 22300, 17, 1, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `idCuaHang` int(11) DEFAULT NULL,
  `content` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `name`, `idCuaHang`, `content`, `status`) VALUES
(7, 'Phạm Đức Mạnh 2', 1, 'thanh', 2),
(8, 'Trằn Văn Thành', 1, 'KH2', 3),
(9, 'Phạm Đức Mạnh 2', 1, 'hi', 2),
(10, 'Phạm Đức Mạnh', 1, 'dfgdsg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `idChuCH` int(11) DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`id`, `name`, `idChuCH`, `address`, `status`) VALUES
(1, 'Thuốc pro', 2, 'So 1 trinh van bo', 1),
(2, 'CH1', 5, 'Quảng Ninh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `sex` tinyint(1) DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `sdt` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `isAdmin` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `userAdd` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `name`, `email`, `password`, `sex`, `birthday`, `sdt`, `isAdmin`, `status`, `userAdd`) VALUES
(1, 'Trằn Văn Thành', 'thanhtvph15015@gmail.com', '$2a$10$yApxEAnhdT.XupOF2pXt0umATH5QBRQuHU4Ai7kCSOyKnXqQ2ONoW', 1, '2022-05-04', '0385613085', 0, 1, NULL),
(2, 'Trằn Văn Thành2', 'vanthanh10012k@gmail.com', '$2a$10$EqsndFl3oTAdBGjUJCh0j.5qJtMLZmiycej.Nr7vw6fA254AdQbY2', 1, '2022-05-12', '131231241241414', 1, 1, NULL),
(3, 'thanh', 'thanhtvph15014@gmail.com', '$2a$10$XH1D45lJ.2wGp7LudUemy.iMHaSNFHfpQcn5z8hS1pwxo3YYLheDW', 1, '2022-05-14', '131231241241', 2, 1, 2),
(4, 'Phạm Đức Mạnh 2', 'thanhtvph15013@gmail.com', '$2a$10$6czgYIjre5RLTb9C59msaOGq9dLy.QH.pkzqiaWYGUrqL6CYQdMMu', 1, '2022-05-11', '03856130855', 2, 1, 2),
(5, 'Trằn', 'vanthanh10011k@gmail.com', '$2a$10$I7wDmoy9ESxoQd2cujFZ7.QCAa.IqJjNoqOSdY.yvAoP/GXTXag/O', 1, '2022-05-26', '0385613', 1, 1, NULL),
(6, 'Sang', 'thanhtvph15016@fpt.edu.vn', '$2a$10$V8vUFftU1ZiFIw0slU/EceOE1eAcwo4IA4lULhwtgFMKetqX4FEtK', 1, '2022-05-04', '038561', 1, 1, NULL),
(7, 'Tú', 'thanhtvph1501@fpt.edu.vn', '$2a$10$1xWZuStBbkmRHI9DbDRJ0OWWibI2MTZGCyrTPZXumJTo64TBdJzbe', 0, '2022-05-20', '13123121222', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `idShop` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `idShop`, `status`) VALUES
(1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_Users_id_fk` (`idUser`),
  ADD KEY `bill_shop_id_fk` (`idShop`);

--
-- Indexes for table `detailBill`
--
ALTER TABLE `detailBill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detailBill_bill_id_fk` (`idBill`),
  ADD KEY `detailBill_drug_id_fk` (`idDrug`);

--
-- Indexes for table `detailedWarehouse`
--
ALTER TABLE `detailedWarehouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detailedWarehouse_drug_id_fk` (`idDrug`),
  ADD KEY `detailedWarehouse_warehouse_id_fk_2` (`idWarehouse`);

--
-- Indexes for table `detailPlan`
--
ALTER TABLE `detailPlan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detailPlan_drug_id_fk` (`idDrug`),
  ADD KEY `detailPlan_plan_id_fk` (`idPlan`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkejp72b6ler1qqarkx09g9af6` (`form_id`),
  ADD KEY `FKkjiptvdxfgtlck06hq938axdo` (`type_id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_shop_id_fk` (`idCuaHang`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_Users_id_fk` (`idChuCH`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_shop_id_fk` (`idShop`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `detailBill`
--
ALTER TABLE `detailBill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `detailedWarehouse`
--
ALTER TABLE `detailedWarehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `detailPlan`
--
ALTER TABLE `detailPlan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `drug`
--
ALTER TABLE `drug`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_Users_id_fk` FOREIGN KEY (`idUser`) REFERENCES `Users` (`id`),
  ADD CONSTRAINT `bill_shop_id_fk` FOREIGN KEY (`idShop`) REFERENCES `shop` (`id`);

--
-- Constraints for table `detailBill`
--
ALTER TABLE `detailBill`
  ADD CONSTRAINT `detailBill_bill_id_fk` FOREIGN KEY (`idBill`) REFERENCES `bill` (`id`),
  ADD CONSTRAINT `detailBill_drug_id_fk` FOREIGN KEY (`idDrug`) REFERENCES `drug` (`id`);

--
-- Constraints for table `detailedWarehouse`
--
ALTER TABLE `detailedWarehouse`
  ADD CONSTRAINT `detailedWarehouse_drug_id_fk` FOREIGN KEY (`idDrug`) REFERENCES `drug` (`id`),
  ADD CONSTRAINT `detailedWarehouse_warehouse_id_fk_2` FOREIGN KEY (`idWarehouse`) REFERENCES `warehouse` (`id`);

--
-- Constraints for table `detailPlan`
--
ALTER TABLE `detailPlan`
  ADD CONSTRAINT `detailPlan_drug_id_fk` FOREIGN KEY (`idDrug`) REFERENCES `drug` (`id`),
  ADD CONSTRAINT `detailPlan_plan_id_fk` FOREIGN KEY (`idPlan`) REFERENCES `plan` (`id`);

--
-- Constraints for table `drug`
--
ALTER TABLE `drug`
  ADD CONSTRAINT `FKkejp72b6ler1qqarkx09g9af6` FOREIGN KEY (`form_id`) REFERENCES `formDrug` (`id`),
  ADD CONSTRAINT `FKkjiptvdxfgtlck06hq938axdo` FOREIGN KEY (`type_id`) REFERENCES `typeDrug` (`id`);

--
-- Constraints for table `plan`
--
ALTER TABLE `plan`
  ADD CONSTRAINT `plan_shop_id_fk` FOREIGN KEY (`idCuaHang`) REFERENCES `shop` (`id`);

--
-- Constraints for table `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `shop_Users_id_fk` FOREIGN KEY (`idChuCH`) REFERENCES `Users` (`id`);

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_shop_id_fk` FOREIGN KEY (`idShop`) REFERENCES `shop` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
