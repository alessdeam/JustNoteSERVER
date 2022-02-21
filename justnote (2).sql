-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Feb 21, 2022 alle 23:34
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `aree`
--

INSERT INTO `aree` (`id`, `nome`) VALUES
(1, 'Area prova'),
(2, 'Area prova'),
(3, 'Area di prrova');

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
(2, 3);

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `categorie`
--

INSERT INTO `categorie` (`id`, `nome`, `id_utente`, `id_area`) VALUES
(2, 'Spesa', 1, 0),
(3, 'Studio', 1, 0),
(4, 'Appunti', 1, 0),
(5, 'Lavoro', 1, 0),
(7, 'Svago', 1, 0),
(8, 'JustPlay', 1, 0),
(10, 'Alessandro', 1, 3);

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
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `note`
--

INSERT INTO `note` (`id`, `titolo`, `contenuto`, `colore`, `id_utente`, `id_categoria`, `id_area`) VALUES
(55, 'Nota area', 'Questa è una nota area nuova', 'Coral', 1, 2, 0),
(18, 'Conad 10/11', 'Carote, pane, salame, prosciutto', 'LightGreen', 1, 2, 0),
(29, 'Prova teams', 'angular', 'PaleTurquoise', 1, 9, 0),
(17, 'Appunti', '6 x 3 = 18', 'LightGreen', 1, 3, 0),
(56, 'Nuova nota AREAAA', 'AAA', 'Coral', 1, 2, 3),
(57, 'dwdqdwa', 'dewfeswf', 'LightYellow', 1, 4, 3);

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `note_condivise`
--

INSERT INTO `note_condivise` (`id_nota_parent`, `permesso_modifica`, `permesso_condivisione`, `permesso_cancellazione`, `id`, `titolo`, `contenuto`, `colore`, `id_utente`, `id_categoria`) VALUES
(1, 1, 0, 1, 1, 'Spesa', 'Carote', 'green', 0, 1),
(1, 1, 0, 1, 2, 'Spesa', 'Carote', 'green', 0, 1),
(1, 1, 0, 1, 3, 'Spesa', 'Carote', 'green', 0, 1),
(19, 0, 0, 0, 4, 'Progetto n.2', 'Implementare register', 'Violet', 0, 5),
(19, 0, 0, 0, 5, 'Progetto n.2', 'Implementare register', 'Violet', 0, 5),
(18, 0, 0, 0, 6, 'Conad 10/11', 'Carote, pane, salame, prosciutto', 'LightGreen', 0, 2),
(17, 0, 0, 0, 7, 'Appunti', '6 x 3 = 18', 'LightGreen', 0, 3),
(17, 0, 0, 0, 8, 'Appunti', '6 x 3 = 18', 'LightGreen', 0, 3),
(17, 0, 0, 0, 9, 'Appunti', '6 x 3 = 18', 'LightGreen', 0, 3),
(29, 1, 0, 0, 13, 'Prova teams', 'angular', 'PaleTurquoise', 2, 9),
(18, 1, 0, 0, 11, 'Conad 10/11', 'Carote, pane, salame, prosciutto', 'LightGreen', 2, 2),
(19, 0, 0, 1, 12, 'Progetto n.2', 'Implementare register', 'Violet', 2, 5);

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
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

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
(65, 'eyJhbGciOiJub25lIn0.eyJ1dGVudGUiOnsiaWQiOjEsIm5vbWUiOiJBbGVzc2FuZHJvIiwiY29nbm9tZSI6IkRlIEFtaWNpcyIsImVtYWlsIjoiYWxlLmRlLmFtaWNpc0Bob3RtYWlsLml0IiwicGFzc3dvcmQiOiJjaWFvbmUifX0.', 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `nome`, `cognome`, `email`, `password`) VALUES
(1, 'Alessandro', 'De Amicis', 'ale.de.amicis@hotmail.it', 'bde29bf5eb0f3ab8c34680d348f9b7dfbc4aded7a1e64c162d92cf8bd49027c7'),
(2, 'Alessandro', 'De Amicis', 'aledeamicis8@gmail.com', 'bde29bf5eb0f3ab8c34680d348f9b7dfbc4aded7a1e64c162d92cf8bd49027c7');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
