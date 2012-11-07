-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Nov 2012 um 22:28
-- Server Version: 5.5.27
-- PHP-Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `web_tech`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `trip_infp`
--

CREATE TABLE IF NOT EXISTS `trip_infp` (
  `Trip` varchar(50) NOT NULL,
  `Von` varchar(50) NOT NULL,
  `Nach` varchar(50) NOT NULL,
  `Skipper` varchar(50) NOT NULL,
  `Crew` varchar(50) NOT NULL,
  `Start` datetime NOT NULL,
  `Ende` datetime NOT NULL,
  `Dauer` double NOT NULL,
  `Motor` int(11) NOT NULL,
  `Tank` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `trip_infp`
--

INSERT INTO `trip_infp` (`Trip`, `Von`, `Nach`, `Skipper`, `Crew`, `Start`, `Ende`, `Dauer`, `Motor`, `Tank`) VALUES
('', 'test', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
('', 'hallo', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0),
('', 'test23', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
