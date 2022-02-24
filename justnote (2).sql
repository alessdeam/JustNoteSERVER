-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Feb 24, 2022 alle 08:53
-- Versione del server: 5.7.36
-- Versione PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `justnote`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `aree`
--

DROP TABLE IF EXISTS `aree`;
CREATE TABLE IF NOT EXISTS `aree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `aree`
--

INSERT INTO `aree` (`id`, `nome`) VALUES
(1, 'Area prova'),
(9, 'Area di prova'),
(4, 'Prova area'),
(5, 'h5rhr');

-- --------------------------------------------------------

--
-- Struttura della tabella `aree_utenti`
--

DROP TABLE IF EXISTS `aree_utenti`;
CREATE TABLE IF NOT EXISTS `aree_utenti` (
  `id_utente` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  KEY `id_utente` (`id_utente`),
  KEY `id_area` (`id_area`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `aree_utenti`
--

INSERT INTO `aree_utenti` (`id_utente`, `id_area`) VALUES
(1, 2),
(1, 3),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(1, 6),
(2, 7),
(1, 7),
(2, 8),
(1, 8),
(1, 9),
(2, 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(300) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_utente` (`id_utente`),
  KEY `id_area` (`id_area`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `categorie`
--

INSERT INTO `categorie` (`id`, `nome`, `id_utente`, `id_area`) VALUES
(2, 'Spesa', 1, 0),
(3, 'Studio', 1, 0),
(4, 'Appunti', 1, 0),
(5, 'Lavoro', 1, 0),
(27, 'sfsfsre', 0, 9),
(25, 'tshtrhr', 0, 2),
(19, 'efefefe', 0, 3),
(18, 'wdwdw', 0, 3),
(30, 'shrthsr', 2, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(300) NOT NULL,
  `contenuto` varchar(900) NOT NULL,
  `colore` varchar(300) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_utente` (`id_utente`),
  KEY `id_area` (`id_area`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `note`
--

INSERT INTO `note` (`id`, `titolo`, `contenuto`, `colore`, `id_utente`, `id_categoria`, `id_area`) VALUES
(95, 'rhreh', 'erherh', 'Coral', 2, 30, 0),
(96, 'shth', 'hgsehstht', 'LightGreen', 0, 27, 9),
(94, 'whw', 'rsrhrshtre', 'LightGreen', 2, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `note_condivise`
--

DROP TABLE IF EXISTS `note_condivise`;
CREATE TABLE IF NOT EXISTS `note_condivise` (
  `id_nota_parent` int(11) NOT NULL,
  `permesso_modifica` tinyint(1) NOT NULL,
  `permesso_condivisione` tinyint(1) NOT NULL,
  `permesso_cancellazione` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(300) NOT NULL,
  `contenuto` varchar(900) NOT NULL,
  `colore` varchar(300) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_nota_parent` (`id_nota_parent`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_utente` (`id_utente`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(1000) NOT NULL,
  `id_utente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_utente` (`id_utente`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `sessions`
--

INSERT INTO `sessions` (`id`, `token`, `id_utente`) VALUES
(1, '782830999644723', 1),
(2, '248607452421882', 1),
(3, '160622986698238', 1),
(4, '383696417536445', 1),
(5, '307379175288600', 1),
(6, '178212962649755', 1),
(7, '699458528259989', 1),
(8, '835337068859552', 1),
(9, '823771254597108', 1),
(10, '460730965276103', 2),
(11, '571589496656814', 2),
(12, '415277159060167', 2),
(13, '725896851411752', 2),
(14, '200234406785773', 2),
(15, '295019093038506', 2),
(16, '881885014132604', 2),
(17, '607894410313799', 1),
(18, '255854243010124', 1),
(19, 'io.jsonwebtoken.impl.DefaultJwtBuilder@31864bbe', 1),
(20, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(21, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(22, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(23, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(24, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(25, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(26, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(27, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(28, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(29, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(30, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(31, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(32, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(33, '552170511268558', 1),
(34, '920474845911760', 1),
(35, '826163647729263', 1),
(36, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(37, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(38, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(39, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(40, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(41, 'eyJhbGciOiJub25lIn0.eyJpc3MiOiJTdG9ybXBhdGgiLCJzdWIiOiJtc2lsdmVybWFuIiwibmFtZSI6Ik1pY2FoIFNpbHZlcm1hbiIsInNjb3BlIjoiYWRtaW5zIiwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(42, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifSwiaWF0IjoxNDY2Nzk2ODIyLCJleHAiOjQ2MjI0NzA0MjJ9.', 1),
(43, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(44, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(45, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(46, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(47, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlZGVhbWljaXM4QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiY2lhb25lIn19.', 2),
(48, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(49, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlZGVhbWljaXM4QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiY2lhb25lIn19.', 2),
(50, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(51, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlZGVhbWljaXM4QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiY2lhb25lIn19.', 2),
(52, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(53, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlZGVhbWljaXM4QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiY2lhb25lIn19.', 2),
(54, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(55, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlZGVhbWljaXM4QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiY2lhb25lIn19.', 2),
(56, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(57, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlZGVhbWljaXM4QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiY2lhb25lIn19.', 2),
(58, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(59, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlZGVhbWljaXM4QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiY2lhb25lIn19.', 2),
(60, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(61, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlZGVhbWljaXM4QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiY2lhb25lIn19.', 2),
(62, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(63, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(64, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(65, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(66, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(67, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(68, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlZGVhbWljaXM4QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiY2lhb25lIn19.', 2),
(69, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(70, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(71, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(72, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(73, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(74, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(75, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(76, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(77, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(78, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(79, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(80, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(81, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(82, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(83, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(84, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(85, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(86, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(87, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(88, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(89, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(90, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(91, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(92, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(93, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(94, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(95, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(96, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(97, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(98, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(99, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(100, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(101, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(102, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(103, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(104, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(105, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(106, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(107, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(108, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(109, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(110, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(111, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(112, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(113, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(114, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2),
(115, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1),
(116, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjIsIm5vbWUiOiJTaW1vbmUiLCJjb2dub21lIjoiQ2FydXNvIiwiZW1haWwiOiJhbGVkZWFtaWNpczhAZ21haWwuY29tIiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

DROP TABLE IF EXISTS `utenti`;
CREATE TABLE IF NOT EXISTS `utenti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(300) NOT NULL,
  `cognome` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `nome`, `cognome`, `email`, `password`) VALUES
(1, 'Alessan', 'De Amicis', 'ale.de.amicis@hotmail.it', 'bde29bf5eb0f3ab8c34680d348f9b7dfbc4aded7a1e64c162d92cf8bd49027c7'),
(2, 'Simone', 'Caruso', 'aledeamicis8@gmail.com', 'bde29bf5eb0f3ab8c34680d348f9b7dfbc4aded7a1e64c162d92cf8bd49027c7'),
(3, 'sgsrgrsg', 'sgsr', 'hthft', 'e91347915e81731107c58a37b2dce7f230467f19faa945c7ad0f45453fd36589'),
(4, 'efeef', 'fefe', 'efef', 'd186704ffdc05865cb5b84686283672b5ebdea7dc41755e16f4c7f48f59f00e4'),
(5, 'Alessandro', 'De Amicis', 'ale.dicis@hotmail.it', '189f40034be7a199f1fa9891668ee3ab6049f82d38c68be70f596eab2e1857b7'),
(6, 'Alessandro', 'De Amicis', 'huob', '8254c329a92850f6d539dd376f4816ee2764517da5e0235514af433164480d7a'),
(7, 'fwqwe', 'fdwewe', 'FRANCESCO.ALLEGRETTI@FAMECCANICA.COM', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'),
(8, 'wdwwdw', 'wdwd', 'dwd', '56d017b3e365c86f210af0ca58f3e3268d4d0b6baa72eb201ee554e836c14f3a'),
(9, 's', 'ss', 'ss', '043a718774c572bd8a25adbeb1bfcd5c0256ae11cecf9f9c3f925d0e52beaf89'),
(10, 'sqss', 'wsw', 'sa', '130dccc993b767286f6e74c20401f0e6471d2e587899418abcb5521c87c62517'),
(11, 'Adjwo', 'jw0jd', 'a', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
