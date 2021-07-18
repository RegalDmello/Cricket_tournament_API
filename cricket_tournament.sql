-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2021 at 09:37 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cricket_tournament`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_token`
--

CREATE TABLE `api_token` (
  `id` int(11) NOT NULL,
  `token` varchar(1000) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `api_token`
--

INSERT INTO `api_token` (`id`, `token`, `status`) VALUES
(1, 'test1', 1),
(2, 'test2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `abb` varchar(100) NOT NULL,
  `language` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `Name`, `abb`, `language`) VALUES
(1, 'India', 'ind', 'hindi'),
(2, 'United States of America', 'US', 'english'),
(3, 'England', 'UK', 'english');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `teamA` int(100) NOT NULL,
  `teamB` int(11) NOT NULL,
  `date` date NOT NULL,
  `winner` int(11) NOT NULL,
  `looser` int(11) NOT NULL,
  `man_of_match` int(11) NOT NULL,
  `bowler_of_match` int(11) NOT NULL,
  `best_fielder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `title`, `teamA`, `teamB`, `date`, `winner`, `looser`, `man_of_match`, `bowler_of_match`, `best_fielder`) VALUES
(1, 'MI vs KKR', 1, 2, '2021-01-01', 1, 2, 1, 3, 1),
(2, 'MI VS DK', 1, 4, '2021-01-12', 1, 4, 2, 2, 8),
(3, 'MI VS EE', 1, 5, '2021-01-03', 5, 1, 9, 9, 10),
(4, 'KKR VS CR', 2, 3, '2021-01-04', 2, 3, 3, 5, 3),
(5, 'KKR VS LE', 2, 6, '2021-01-07', 6, 2, 11, 12, 11),
(6, 'CR VS DK', 3, 4, '2021-01-08', 4, 3, 8, 6, 8),
(7, 'CR VS LE', 3, 6, '2021-01-12', 6, 3, 12, 5, 12),
(8, 'DK VS EE', 4, 0, '2021-01-13', 5, 4, 9, 9, 9),
(9, 'EE VS LE', 5, 6, '2021-01-17', 6, 5, 12, 10, 12);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int(11) NOT NULL,
  `Name` varchar(1000) NOT NULL,
  `age` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `matches_played` int(11) NOT NULL,
  `wickets` int(11) NOT NULL,
  `runs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `Name`, `age`, `teamid`, `matches_played`, `wickets`, `runs`) VALUES
(1, 'Rohit Gurunath Sharma', 34, 1, 3, 4, 245),
(2, 'Jasprit Jasbirsingh Bumrah', 27, 1, 3, 12, 123),
(3, 'Eoin Joseph Gerard Morgan', 34, 2, 3, 6, 222),
(4, 'Harbhajan Singh', 40, 2, 3, 9, 212),
(5, 'Syed Abdullah', 33, 3, 3, 6, 143),
(6, 'Camilus Alexander', 36, 3, 3, 2, 98),
(7, 'Timroy Allen', 35, 4, 3, 0, 256),
(8, 'Alex Amsterdam', 39, 4, 3, 2, 333),
(9, 'Moeen Munir Ali', 34, 5, 3, 9, 98),
(10, 'James Michael Anderson', 34, 5, 3, 2, 78),
(11, 'Jofra Chioke Archer', 26, 6, 3, 0, 200),
(12, 'Jonathan Marc Bairstow', 31, 6, 3, 4, 167);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `abb` varchar(100) NOT NULL,
  `venueid` int(11) NOT NULL,
  `captain` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `Name`, `abb`, `venueid`, `captain`) VALUES
(1, 'Mumbai Indians', 'MI', 1, 1),
(2, 'Kolkata Knight Riders', 'KKR', 2, 3),
(3, 'Citi Rangers', 'CR', 3, 5),
(4, 'Dodger King', 'DK', 4, 7),
(5, 'eternal Edgbaston', 'EE', 5, 9),
(6, 'Lords elite', 'LE', 6, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tournament_score_table`
--

CREATE TABLE `tournament_score_table` (
  `id` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `won` int(11) NOT NULL,
  `lost` int(11) NOT NULL,
  `rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tournament_score_table`
--

INSERT INTO `tournament_score_table` (`id`, `teamid`, `points`, `won`, `lost`, `rank`) VALUES
(1, 1, 4, 2, 1, 2),
(2, 2, 2, 1, 2, 4),
(3, 3, 0, 0, 3, 6),
(4, 4, 2, 1, 2, 5),
(5, 5, 4, 2, 1, 3),
(6, 6, 6, 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `id` int(11) NOT NULL,
  `Name` varchar(1000) NOT NULL,
  `countryid` int(11) NOT NULL,
  `city` varchar(1000) NOT NULL,
  `state` varchar(1000) NOT NULL,
  `postcode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id`, `Name`, `countryid`, `city`, `state`, `postcode`) VALUES
(1, 'Wankhede Stadium', 1, 'Mumbai', 'Maharashtra', 401205),
(2, 'Eden Gardens', 1, 'Kolkata', 'West Bengal', 700345),
(3, 'Citi Field', 2, 'New York City', 'New York\r\n', 238448),
(4, 'Dodger Stadium', 2, 'Los Angeles', 'California', 575844),
(5, 'Edgbaston stadium', 3, 'Birmingham', 'Birmingham', 746373),
(6, 'Lords stadium', 3, 'SLondon', 'London', 3736465);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_token`
--
ALTER TABLE `api_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tournament_score_table`
--
ALTER TABLE `tournament_score_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_token`
--
ALTER TABLE `api_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tournament_score_table`
--
ALTER TABLE `tournament_score_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
