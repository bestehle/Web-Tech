-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Jan 2013 um 17:20
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
  `registernr` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `segelzeichen` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `heimathafen` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `yachtclub` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `eigner` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `versicherung` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rufzeichen` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `typ` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `konstrukteur` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `laenge` float NOT NULL DEFAULT '0',
  `breite` float NOT NULL DEFAULT '0',
  `tiefgang` float NOT NULL DEFAULT '0',
  `masthoehe` float NOT NULL DEFAULT '0',
  `verdraengung` float NOT NULL DEFAULT '0',
  `rigart` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `baujahr` int(11) NOT NULL DEFAULT '0',
  `motor` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `tankgroesse` float NOT NULL DEFAULT '0',
  `wassertankgroesse` float NOT NULL DEFAULT '0',
  `abwassertankgroesse` float NOT NULL DEFAULT '0',
  `grosssegelgroesse` float NOT NULL DEFAULT '0',
  `genuagroesse` float NOT NULL DEFAULT '0',
  `spigroesse` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`bootsname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `boot`
--

INSERT INTO `boot` (`bootsname`, `registernr`, `segelzeichen`, `heimathafen`, `yachtclub`, `eigner`, `versicherung`, `rufzeichen`, `typ`, `konstrukteur`, `laenge`, `breite`, `tiefgang`, `masthoehe`, `verdraengung`, `rigart`, `baujahr`, `motor`, `tankgroesse`, `wassertankgroesse`, `abwassertankgroesse`, `grosssegelgroesse`, `genuagroesse`, `spigroesse`) VALUES
('Black Pearl', '', '', '', '', 'Jack Sparrow', '', '', 'Segelschiff', 'Piraten', 20, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Flying Dutchman', '', '', '', '', 'Dave Jones', '', '', 'Segelschiff', 'Piraten', 25, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Titanic', '', '', '', '', 'Eisberg', '', '', 'Dampfer', 'Irland', 60, 0, 0, 0, 0, '', 1913, '', 0, 0, 0, 0, 0, 0),
('Titanic1', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Titanic10', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Titanic11', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Titanic12', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Titanic2', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Titanic3', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Titanic4', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Titanic5', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Titanic6', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Titanic7', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Titanic8', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('Titanic9', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0);

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
  `zeitpunkt` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '0',
  `cog` float NOT NULL DEFAULT '0',
  `sog` float NOT NULL DEFAULT '0',
  `btm` float NOT NULL DEFAULT '0',
  `dtm` float NOT NULL DEFAULT '0',
  `fahrt_nach` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `manoever` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `vorsegel` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `grosssegel` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `trip` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `entry`
--

INSERT INTO `entry` (`name`, `zeitpunkt`, `position`, `cog`, `sog`, `btm`, `dtm`, `fahrt_nach`, `manoever`, `vorsegel`, `grosssegel`, `trip`) VALUES
('Wegpunkt1', '1:50', 2, 141, 1500.2, 0, 0, 'mark1', 'Change Sails', 'Fock', 'reef2', 'Beringsee'),
('Wegpunkt2', '2:30', 3, 161, 1000.4, 0, 0, 'mark3', 'Tack', 'Genua1', 'full', 'Beringsee');

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
  `latitude` varchar(100) COLLATE utf8_bin NOT NULL,
  `longitude` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `position`
--

INSERT INTO `position` (`id`, `latitude`, `longitude`) VALUES
(1, '47 47 21', '009 4 12'),
(2, '47 48 22', '010 5 13'),
(3, '47 50 31', '011 5 17');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `trip`
--

CREATE TABLE IF NOT EXISTS `trip` (
  `trip_title` varchar(100) COLLATE utf8_bin NOT NULL,
  `von` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `nach` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `skipper` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `crew` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `start` datetime NOT NULL,
  `ende` datetime NOT NULL,
  `motor` int(11) NOT NULL DEFAULT '0',
  `tank` int(11) NOT NULL DEFAULT '0',
  `bootsname` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`trip_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `trip`
--

INSERT INTO `trip` (`trip_title`, `von`, `nach`, `skipper`, `crew`, `start`, `ende`, `motor`, `tank`, `bootsname`) VALUES
('Beringsee', 'Nordamerika', 'Asien', 'Jack Sparrow', 'Will Turner, Elisaeth Swan', '2013-01-01 00:15:20', '2013-01-01 02:14:22', 25, 30, 'Black Pearl'),
('Mittelmeer', 'Monaco', 'Ibiza', 'Dave Jones', 'Piraten', '2013-01-04 12:12:00', '2013-01-09 23:59:59', 80, 80, 'Flying Dutchman'),
('Suedsee', 'Hawai', 'Neuseeland', 'Jack Sparrow', 'Will Turner', '2013-01-01 12:12:12', '2013-01-02 14:12:12', 75, 75, 'Black Pearl');

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
