-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Nov 2012 um 20:28
-- Server Version: 5.5.27
-- PHP-Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `seapal_db`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `boot`
--

CREATE TABLE IF NOT EXISTS `boot` (
  `bootsname` varchar(100) COLLATE utf8_bin NOT NULL,
  `registernr` varchar(100) COLLATE utf8_bin NOT NULL,
  `segelzeichen` varchar(100) COLLATE utf8_bin NOT NULL,
  `heimathafen` varchar(100) COLLATE utf8_bin NOT NULL,
  `yachtclub` varchar(100) COLLATE utf8_bin NOT NULL,
  `eigner` varchar(100) COLLATE utf8_bin NOT NULL,
  `versicherung` varchar(100) COLLATE utf8_bin NOT NULL,
  `rufzeichen` varchar(100) COLLATE utf8_bin NOT NULL,
  `typ` varchar(100) COLLATE utf8_bin NOT NULL,
  `konstrukteur` varchar(100) COLLATE utf8_bin NOT NULL,
  `laenge` float NOT NULL,
  `breite` float NOT NULL,
  `tiefgang` float NOT NULL,
  `masthoehe` float NOT NULL,
  `verdraengung` float NOT NULL,
  `rigart` varchar(100) COLLATE utf8_bin NOT NULL,
  `baujahr` int(11) NOT NULL,
  `motor` varchar(100) COLLATE utf8_bin NOT NULL,
  `tankgroesse` float NOT NULL,
  `wassertankgroesse` float NOT NULL,
  `abwassertankgroesse` float NOT NULL,
  `grosssegelgroesse` float NOT NULL,
  `genuagroesse` float NOT NULL,
  `spigroesse` float NOT NULL,
  `trip` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`bootsname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `coordinate`
--

CREATE TABLE IF NOT EXISTS `coordinate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degree` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `hu_minute` int(11) NOT NULL,
  `orientation` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `entry`
--

CREATE TABLE IF NOT EXISTS `entry` (
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `position` int(11) NOT NULL,
  `cog` float NOT NULL,
  `sog` float NOT NULL,
  `btm` float NOT NULL,
  `dtm` float NOT NULL,
  `fahrt_nach` int(11) NOT NULL,
  `manoever` varchar(100) COLLATE utf8_bin NOT NULL,
  `vorsegel` varchar(100) COLLATE utf8_bin NOT NULL,
  `grosssegel` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fahrt_nach`
--

CREATE TABLE IF NOT EXISTS `fahrt_nach` (
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `grosssegel`
--

CREATE TABLE IF NOT EXISTS `grosssegel` (
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `grosssegel`
--

INSERT INTO `grosssegel` (`name`) VALUES
('full'),
('reef 1'),
('reef 2');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `manoever`
--

CREATE TABLE IF NOT EXISTS `manoever` (
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `manoever`
--

INSERT INTO `manoever` (`name`) VALUES
('Anker down'),
('Anker up'),
('Change Sails'),
('Jibe'),
('Lay to'),
('Reff'),
('Sails down'),
('Set Sails'),
('Tack');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitue` int(11) NOT NULL,
  `longitude` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `trip`
--

CREATE TABLE IF NOT EXISTS `trip` (
  `trip_title` varchar(100) COLLATE utf8_bin NOT NULL,
  `von` varchar(100) COLLATE utf8_bin NOT NULL,
  `nach` varchar(100) COLLATE utf8_bin NOT NULL,
  `skipper` varchar(100) COLLATE utf8_bin NOT NULL,
  `crew` varchar(100) COLLATE utf8_bin NOT NULL,
  `start` datetime NOT NULL,
  `ende` datetime NOT NULL,
  `motor` int(11) NOT NULL,
  `tank` tinyint(1) NOT NULL,
  `entry` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`trip_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vorsegel`
--

CREATE TABLE IF NOT EXISTS `vorsegel` (
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `vorsegel`
--

INSERT INTO `vorsegel` (`name`) VALUES
('Blister'),
('Fock'),
('Genua1'),
('Genua2'),
('Genua3'),
('Spinaker'),
('Storm Fock');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
