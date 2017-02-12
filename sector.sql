-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Veebr 12, 2017 kell 09:57 EL
-- Serveri versioon: 10.1.21-MariaDB
-- PHP versioon: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `sector`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `categories`
--

CREATE TABLE `categories` (
  `ID` int(11) NOT NULL,
  `parentID` int(11) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `closed_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Andmete tõmmistamine tabelile `categories`
--

INSERT INTO `categories` (`ID`, `parentID`, `name`, `created_on`, `modified_on`, `closed_on`) VALUES
(1, NULL, 'Manufacturing', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(2, NULL, 'Service', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(3, NULL, 'Other', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(5, 1, 'Printing', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(6, 1, 'Food and Beverage', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(7, 1, 'Textile and Clothing', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(8, 1, 'Wood', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(9, 1, 'Plastic and Rubber', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(11, 1, 'Metalworking', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(12, 1, 'Machinery', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(13, 1, 'Furniture', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(18, 1, 'Electronics and Optics', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(19, 1, 'Construction materials', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(21, 2, 'Transport and Logistics', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(22, 2, 'Tourism', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(25, 2, 'Business services', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(28, 2, 'Information Technology and Telecommunications', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(29, 3, 'Energy technology', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(33, 3, 'Environment', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(35, 2, 'Engineering', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(37, 3, 'Creative industries', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(39, 6, 'Milk & dairy products', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(40, 6, 'Meat & meat products', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(42, 6, 'Fish & fish products', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(43, 6, 'Beverages', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(44, 7, 'Clothing', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(45, 7, 'Textile', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(47, 8, 'Wooden houses', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(51, 8, 'Wooden building materials', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(53, 9, 'Plastics welding and processing', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(54, 9, 'Packaging', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(55, 9, 'Blowing', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(57, 9, 'Moulding', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(62, 11, 'Forgings, Fasteners', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(66, 11, 'MIG, TIG, Aluminum welding', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(67, 11, 'Construction of metal structures', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(69, 11, 'Gas, Plasma, Laser cutting', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(75, 11, 'CNC-machining', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(91, 12, 'Machinery equipment/tools', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(93, 12, 'Metal structures', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(94, 12, 'Machinery components', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(97, 12, 'Maritime', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(98, 13, 'Kitchen', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(99, 13, 'Project furniture', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(101, 13, 'Living room', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(111, 21, 'Air', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(112, 21, 'Road', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(113, 21, 'Water', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(114, 21, 'Rail', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(121, 28, 'Software, Hardware', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(122, 28, 'Telecommunications', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(141, 2, 'Translation services', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(145, 5, 'Labelling and packaging printing', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(148, 5, 'Advertising', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(150, 5, 'Book/Periodicals printing', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(224, 12, 'Manufacture of machinery', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(227, 12, 'Repair and maintenance service', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(230, 12, 'Ship repair and conversion', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(263, 11, 'Houses and buildings', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(267, 11, 'Metal products', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(269, 12, 'Boat/Yacht building', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(271, 12, 'Aluminium and steel workboats', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(337, 8, 'Other (Wood)', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(341, 13, 'Outdoor', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(342, 6, 'Bakery & confectionery products', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(378, 6, 'Sweets & snack food', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(385, 13, 'Bedroom', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(389, 13, 'Bathroom/sauna', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(390, 13, 'Children’s room', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(392, 13, 'Office', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(394, 13, 'Other (Furniture)', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(437, 6, 'Other', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(508, 12, 'Other', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(542, 11, 'Metal works', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(556, 9, 'Plastic goods', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(559, 9, 'Plastic processing technology', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(560, 9, 'Plastic profiles', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(576, 28, 'Programming, Consultancy', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL),
(581, 28, 'Data processing, Web portals, E-marketing', '2017-02-11 19:43:53', '2017-02-11 19:43:53', NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `agreed` tinyint(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `closed_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Andmete tõmmistamine tabelile `users`
--

INSERT INTO `users` (`ID`, `agreed`, `name`, `created_on`, `modified_on`, `closed_on`) VALUES
(1, 1, 'Ain', '2017-02-12 00:15:24', '2017-02-12 00:15:24', NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `user_categories`
--

CREATE TABLE `user_categories` (
  `ID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `closed_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Andmete tõmmistamine tabelile `user_categories`
--

INSERT INTO `user_categories` (`ID`, `userID`, `categoryID`, `created_on`, `modified_on`, `closed_on`) VALUES
(11, 1, 66, '2017-02-12 00:16:51', '2017-02-12 00:16:51', NULL),
(21, 1, 18, '2017-02-12 10:16:37', '2017-02-12 10:16:37', NULL),
(22, 1, 342, '2017-02-12 10:16:37', '2017-02-12 10:16:37', NULL),
(23, 1, 271, '2017-02-12 10:16:37', '2017-02-12 10:16:37', NULL);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `parentID` (`parentID`);

--
-- Indeksid tabelile `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksid tabelile `user_categories`
--
ALTER TABLE `user_categories`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=582;
--
-- AUTO_INCREMENT tabelile `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT tabelile `user_categories`
--
ALTER TABLE `user_categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
