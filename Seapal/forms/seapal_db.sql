-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Jan 2013 um 22:24
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
  PRIMARY KEY (`bootsname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `boot`
--

INSERT INTO `boot` (`bootsname`, `registernr`, `segelzeichen`, `heimathafen`, `yachtclub`, `eigner`, `versicherung`, `rufzeichen`, `typ`, `konstrukteur`, `laenge`, `breite`, `tiefgang`, `masthoehe`, `verdraengung`, `rigart`, `baujahr`, `motor`, `tankgroesse`, `wassertankgroesse`, `abwassertankgroesse`, `grosssegelgroesse`, `genuagroesse`, `spigroesse`) VALUES
('ab', '', '', '', '', '', '', '', 'wolowitzi', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('abc', '', '', '', '', '', '', '', 'wolowitz', '', 3, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('abcdq', '', '', '', '', '', '', '', 'wolowitz', '', 0, 0, 0, 0, 0, '', 123, '', 0, 0, 0, 0, 0, 0),
('abcdqq', '', '', '', '', '', '', '', 'wolowitz', '', 0, 0, 0, 0, 0, '', 123, '', 0, 0, 0, 0, 0, 0),
('abcdqqa', '', '', '', '', '', '', '', 'wolowitz', '', 0, 0, 0, 0, 0, '', 123, '', 0, 0, 0, 0, 0, 0),
('ai', '', '', '', '', '', '', '', 'wolowitz', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('grippi', 'dfg', 'dfg', 'xcv', 'ert', '', '', '', 'dgs', 'dsfg', 0, 0, 0, 0, 0, '', 2, '', 0, 0, 0, 0, 0, 0),
('grippi reloaded', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('grippi2', 'dfg', 'dfg', 'xcv', 'ert', '', '', '', 'dgs', 'dsfg', 0, 0, 0, 0, 0, '', 2, '', 0, 0, 0, 0, 0, 0),
('grippi3', 'dfg', 'dfg', 'xcv', 'ert', '', '', '', 'dgs', 'dsfg', 0, 0, 0, 0, 0, '', 2, '', 0, 0, 0, 0, 0, 0),
('grippitest', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('grippitest2', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('grippitest3', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('grippitest4', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('grippitest5', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('grippitest7', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('grippitest8', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('grippitest9', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('howard', '', '', '', '', '', '', '', 'wolowitz', '', 0, 0, 0, 0, 0, '', 123, '', 0, 0, 0, 0, 0, 0),
('howardwe', '', '', '', '', '', '', '', 'wolowitz', '', 0, 0, 0, 0, 0, '', 123, '', 0, 0, 0, 0, 0, 0),
('howardwedf', '', '', '', '', '', '', '', 'wolowitz', '', 0, 0, 0, 0, 0, '', 123, '', 0, 0, 0, 0, 0, 0),
('howardwedfd', '', '', '', '', '', '', '', 'wolowitz', '', 0, 0, 0, 0, 0, '', 123, '', 0, 0, 0, 0, 0, 0),
('takkk', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('takkkk', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0),
('taktok', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0);

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
  `zeitpunkt` varchar(10) COLLATE utf8_bin NOT NULL,
  `position` int(11) NOT NULL,
  `cog` float NOT NULL,
  `sog` float NOT NULL,
  `btm` float NOT NULL,
  `dtm` float NOT NULL,
  `fahrt_nach` int(11) NOT NULL,
  `manoever` varchar(100) COLLATE utf8_bin NOT NULL,
  `vorsegel` varchar(100) COLLATE utf8_bin NOT NULL,
  `grosssegel` varchar(100) COLLATE utf8_bin NOT NULL,
  `trip` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `entry`
--

INSERT INTO `entry` (`name`, `zeitpunkt`, `position`, `cog`, `sog`, `btm`, `dtm`, `fahrt_nach`, `manoever`, `vorsegel`, `grosssegel`, `trip`) VALUES
('Wegpunkt2', '1:50', 2, 140, 1554.5, 0, 0, 0, 'Change Sails', 'Genua1', 'reef 2', 'rockamring'),
('Wegpunkt3', '2:30', 3, 161, 1600.1, 0, 0, 0, 'Jibe', 'Blister', 'full', 'rockamring');

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
  `von` varchar(100) COLLATE utf8_bin NOT NULL,
  `nach` varchar(100) COLLATE utf8_bin NOT NULL,
  `skipper` varchar(100) COLLATE utf8_bin NOT NULL,
  `crew` varchar(100) COLLATE utf8_bin NOT NULL,
  `start` datetime NOT NULL,
  `ende` datetime NOT NULL,
  `motor` int(11) NOT NULL,
  `tank` int(11) NOT NULL,
  `bootsname` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`trip_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `trip`
--

INSERT INTO `trip` (`trip_title`, `von`, `nach`, `skipper`, `crew`, `start`, `ende`, `motor`, `tank`, `bootsname`) VALUES
('rockamring', 'geislingen', 'nuerburg', 'campino', 'andi, kuddel, wom ritchi', '2013-01-01 00:15:20', '2013-01-01 02:14:22', 25, 70, 'grippi reloaded'),
('southside', 'geislingen', 'neuhausen', 'fefe', 'chritte, benni', '2013-01-04 12:12:00', '2013-01-03 23:59:59', 120, 80, 'grippi reloaded'),
('test', '', '', '', '', '2013-01-01 12:12:12', '2013-01-02 12:12:12', 0, 0, 'grippi reloaded'),
('test2', '', '', '', '', '2013-01-01 12:12:12', '2013-01-02 12:12:12', 0, 0, 'grippi reloaded'),
('test3', '', '', '', '', '2013-01-01 12:12:12', '2013-01-02 12:12:12', 0, 0, 'grippi reloaded'),
('test4', '', '', '', '', '2013-01-01 12:12:12', '2013-01-02 12:12:12', 0, 0, 'grippi reloaded');

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
