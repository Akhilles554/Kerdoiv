-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1:3306
-- Létrehozás ideje: 2022. Nov 29. 19:06
-- Kiszolgáló verziója: 5.7.36
-- PHP verzió: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;

--
-- Adatbázis: `questonairesite`
--
CREATE DATABASE IF NOT EXISTS `questonairesite` DEFAULT CHARACTER SET latin2 COLLATE latin2_hungarian_ci;
USE `questonairesite`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `ID` int(11) NOT NULL,
  `Email` varchar(255) COLLATE latin2_hungarian_ci NOT NULL,
  `CatName` varchar(100) COLLATE latin2_hungarian_ci DEFAULT NULL,
  `ZipCode` int(11) DEFAULT NULL,
  `City` varchar(255) COLLATE latin2_hungarian_ci DEFAULT NULL,
  `Street` varchar(255) COLLATE latin2_hungarian_ci DEFAULT NULL,
  `StreetNumber` varchar(100) COLLATE latin2_hungarian_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UQ_Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `questionaire`
--

DROP TABLE IF EXISTS `questionaire`;
CREATE TABLE IF NOT EXISTS `questionaire` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionaireHeadID` int(11) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `SubmitDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CompanyOpinion` int(11) NOT NULL,
  `CompanyDescription` varchar(1000) COLLATE latin2_hungarian_ci DEFAULT NULL,
  `IsOnFoot` tinyint(1) NOT NULL DEFAULT '0',
  `IsRoller` tinyint(1) NOT NULL DEFAULT '0',
  `IsTrain` tinyint(1) NOT NULL DEFAULT '0',
  `IsPlane` tinyint(1) NOT NULL DEFAULT '0',
  `IsRocket` tinyint(1) NOT NULL DEFAULT '0',
  `IsVicinal` tinyint(1) DEFAULT '0',
  `IsIC` tinyint(1) DEFAULT '0',
  `IsShinkansen` tinyint(1) DEFAULT '0',
  `FootSize` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Questionare_PersonID_Person` (`PersonID`),
  KEY `FK_Questionaire_QuestionaireHeadID_QuestionaireHead` (`QuestionaireHeadID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `questionairehead`
--

DROP TABLE IF EXISTS `questionairehead`;
CREATE TABLE IF NOT EXISTS `questionairehead` (
  `ID` int(11) NOT NULL,
  `DeadLine` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_hungarian_ci;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `questionaire`
--
ALTER TABLE `questionaire`
  ADD CONSTRAINT `FK_Questionaire_QuestionaireHeadID_QuestionaireHead` FOREIGN KEY (`QuestionaireHeadID`) REFERENCES `questionairehead` (`ID`),
  ADD CONSTRAINT `FK_Questionare_PersonID_Person` FOREIGN KEY (`PersonID`) REFERENCES `person` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
