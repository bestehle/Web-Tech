-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Nov 2012 um 20:21
-- Server Version: 5.5.27
-- PHP-Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `logbuch` (
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
