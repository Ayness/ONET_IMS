-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 06 Juin 2017 à 03:05
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `onet`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE `adherent` (
  `adhID` int(11) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `locOfficeID` int(11) DEFAULT NULL,
  `nationalIDcard` int(11) DEFAULT NULL,
  `legitimate` tinyint(1) NOT NULL,
  `registration` timestamp NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `hasCin` tinyint(1) NOT NULL DEFAULT '0',
  `cinExt` varchar(5) NOT NULL DEFAULT '.jpg',
  `governorate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `adherent`
--

INSERT INTO `adherent` (`adhID`, `password`, `firstName`, `lastName`, `birthDate`, `email`, `address`, `paid`, `locOfficeID`, `nationalIDcard`, `legitimate`, `registration`, `gender`, `tel`, `hasCin`, `cinExt`, `governorate`) VALUES
(1158, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Peria', 'Fosten', '1969-06-09', 'pfosten4@weather.com', '45564 Vermont Alley', 1, 19, 5, 1, '2013-10-04 23:00:00', 1, '12345678', 1, '.jpg', ''),
(1165, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Idell', 'Danilin', '1987-04-05', 'idanilinb@wired.com', '32682 Scofield Plaza', 1, 18, 12, 1, '2012-01-09 23:00:00', 0, '12345678', 1, '.jpg', ''),
(1166, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Cyril', 'Brittian', '1954-09-04', 'cbrittianc@jalbum.net', '34339 Norway Maple Lane', 1, 21, 13, 1, '2011-08-17 23:00:00', 0, '12345678', 1, '.jpg', ''),
(1177, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Andre', 'Odlin', '1986-07-15', 'aodlinn@gov.uk', '73335 Golf Drive', 1, 18, 9462021, 1, '2014-02-05 23:00:00', 0, '12345678', 0, '.jpg', ''),
(1180, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Bobbette', 'Rape', '1961-10-19', 'brapeq@fda.gov', '7 Prentice Point', 0, 22, 27, 1, '2016-10-15 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1181, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Reggis', 'Ruperto', '1998-04-26', 'rrupertor@chronoengine.com', '683 Melvin Road', 1, 18, 28, 0, '2016-10-23 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1186, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Kayley', 'Dyball', '1961-03-26', 'kdyballw@blogtalkradio.com', '6505 Rowland Lane', 0, 15, 33, 0, '2015-04-16 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1187, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Ruperto', 'Prescote', '1955-02-01', 'rprescotex@pinterest.com', '0 Goodland Center', 1, 24, 34, 1, '2016-02-06 23:00:00', 0, '12345678', 0, '.jpg', ''),
(1191, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Catharine', 'Haslam', '1983-09-30', 'chaslam11@redcross.org', '11 Hollow Ridge Hill', 0, 20, 38, 1, '2015-07-14 23:00:00', 0, '12345678', 0, '.jpg', ''),
(1192, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Ashlee', 'Plewman', '1982-06-10', 'aplewman12@storify.com', '28653 Pawling Drive', 0, 20, 39, 1, '2013-10-04 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1193, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Carlo', 'Crotty', '1989-01-12', 'ccrotty13@cocolog-nifty.com', '4 Stoughton Hill', 0, 16, 40, 1, '2011-03-06 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1201, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Micah', 'Dohmer', '1994-08-05', 'mdohmer1b@bizjournals.com', '258 Arkansas Avenue', 1, 21, 48, 0, '2013-06-13 23:00:00', 0, '12345678', 0, '.jpg', ''),
(1202, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Marketa', 'Betje', '1994-01-25', 'mbetje1c@sourceforge.net', '318 Haas Court', 0, 22, 49, 0, '2010-08-21 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1208, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Merrie', 'Lehrmann', '1966-11-20', 'mlehrmann1i@linkedin.com', '9255 Carpenter Lane', 1, 17, 55, 0, '2016-06-15 23:00:00', 0, '12345678', 0, '.jpg', ''),
(1211, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Granville', 'Downes', '1990-07-06', 'gdownes1l@wordpress.com', '974 Lakewood Hill', 0, 18, 58, 1, '2015-11-02 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1212, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Lorry', 'Thynn', '1977-04-11', 'lthynn1m@goo.gl', '22946 Summit Pass', 1, 14, 59, 0, '2012-10-10 23:00:00', 0, '12345678', 0, '.jpg', ''),
(1214, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Gilbertina', 'Le Quesne', '1978-05-27', 'glequesne1o@tuttocitta.it', '8 Killdeer Drive', 0, 24, 61, 0, '2012-09-24 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1216, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Paxton', 'Antoniak', '1996-07-20', 'pantoniak1q@rambler.ru', '94 Mariners Cove Junction', 1, 15, 63, 0, '2013-05-30 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1217, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Virginie', 'Trebbett', '1956-12-13', 'vtrebbett1r@youtu.be', '7 Prairie Rose Street', 1, 15, 64, 0, '2012-06-04 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1219, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Bord', 'Dunne', '1952-02-14', 'bdunne1t@slashdot.org', '18156 Lotheville Plaza', 0, 23, 66, 0, '2013-11-23 23:00:00', 0, '12345678', 0, '.jpg', ''),
(1220, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Bartlet', 'MacGall', '1955-09-18', 'bmacgall1u@yolasite.com', '0637 Arkansas Trail', 0, 18, 67, 0, '2014-06-16 23:00:00', 0, '12345678', 0, '.jpg', ''),
(1221, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Jaimie', 'Vian', '1998-03-08', 'jvian1v@yellowbook.com', '486 Butternut Center', 1, 14, 68, 0, '2015-10-21 23:00:00', 0, '12345678', 0, '.jpg', ''),
(1222, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Tatum', 'Chrishop', '1987-03-02', 'tchrishop1w@free.fr', '007 Harbort Alley', 1, 20, 69, 0, '2013-08-21 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1223, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Barbe', 'Barton', '1982-03-22', 'bbarton1x@macromedia.com', '061 Melrose Plaza', 1, 24, 70, 0, '2015-01-01 23:00:00', 0, '12345678', 0, '.jpg', ''),
(1224, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Bethina', 'Brittlebank', '1984-10-21', 'bbrittlebank1y@mediafire.com', '32 Maywood Junction', 0, 14, 71, 0, '2011-12-23 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1226, '$2a$10$FeoZ7E/rI44WNdR3l38s4.QExjd6dalO9aPFiHTGB4O5RxaMheI5O', 'Grenville', 'Guerre', '1988-02-17', 'gguerre20@about.com', '37 Bartillon Avenue', 0, 14, 73, 0, '2011-06-04 23:00:00', 1, '12345678', 0, '.jpg', ''),
(1227, '$2a$10$CgEIq5C4PjV3N/ELnY.f2e86bqZCecLo8OxPdcHYR34oQw0TDfJfW', 'Ramzi', 'sabkhi', '2017-05-10', 'rmszokjl600@gmaijll.com', 'av habib bourguiba', 0, 15, 9485214, 0, '2017-05-31 02:18:56', 0, '11111111', 0, '.jpg', ''),
(1228, '$2a$10$LdSpGV4VFk/qPmtZCgMJ0.87lJHzFcz0XqrgL6eyTtujMbSAlBUZu', 'aaaaa', 'bbbbbe', '2010-06-10', 'zz@hdhzhd.com', 'ezrzr', 0, 18, 121123, 1, '2017-06-03 12:01:33', 1, '12334568', 1, '.jpg', ''),
(1229, '$2a$10$4vk/lC4LZgpEwV2NIEpQQ.7PWHzmSkHZCC4dSg26ATqgYBy72W50m', 'Ramzi', 'sabkhi', '2017-06-14', 'rmsz600@gdmail.comde', 'av habib bourguiba', 0, 20, 22119960, 0, '2017-06-06 00:36:05', 0, '24888525', 0, '.jpg', 'Nabeul'),
(1230, '$2a$10$x8SdlsO4ipMJBwRe4C8Vmuyt1k1ehwggi0mkxmbCwAQVlmpqt1sga', 'Ramzi', 'sabkhi', '2017-06-14', 'rmsz600@gmail.com', 'av habib bourguiba', 0, 23, 9448463, 0, '2017-06-06 02:51:45', 0, '54986555', 0, '.jpg', 'Mahdia');

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `birthDate` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`adminID`, `login`, `password`, `firstName`, `lastName`, `birthDate`, `email`, `address`) VALUES
(2, 'kais', '2211', 'Kais', 'Zekri', '1984-06-15', 'Kais@gmail.com', 'Tunis 4500'),
(3, 'ines@gmail.com', '2211', 'ines', 'nebily', '2017-05-02', 'ines@gmail.com', 'Mahdia');

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE `event` (
  `eventID` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `adminID` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL,
  `about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `event`
--

INSERT INTO `event` (`eventID`, `title`, `time`, `date`, `address`, `adminID`, `timestamp`, `about`) VALUES
(1, '14 Janvier Reunion', '09:00:00', '2017-04-30', 'Tunis, Cité Sportif', 2, '2017-05-03 23:14:16', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(5, 'bla bla bb', '09:00:00', '2017-02-02', 'frfrfrfr', 2, '2017-05-03 23:14:16', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(8, 'Negative rating', '23:00:00', '2017-12-01', 'jbn;', NULL, '2017-05-03 23:14:16', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(9, 'gh', '00:58:00', '2016-12-31', 'fhgjkl', NULL, '2017-05-03 23:14:16', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(10, 'aaaaaaaa', '23:59:00', '2016-03-30', 'kj', NULL, '2017-05-03 23:14:16', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(11, 'aaaaaaaa', '23:59:00', '2016-03-30', 'kj', NULL, '2017-05-03 23:14:16', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(12, 'Negative rating', '00:59:00', '2017-01-31', 'dfghjk', NULL, '2017-05-03 23:14:16', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(13, 'ujj', '01:01:00', '2017-02-02', '4444', NULL, '2017-05-03 23:14:16', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(14, 'aaaaaaaa', '01:01:00', '2017-02-02', '2222', NULL, '2017-05-03 23:14:16', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(15, 'bgfhj²', '00:59:00', '2017-12-01', '^poiuhf', NULL, '2017-05-03 23:14:16', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(16, 'kjhgf', '00:59:00', '2017-12-01', 'kjhk', NULL, '2017-05-03 23:14:17', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(17, 'aaaaaaaa', '23:58:00', '2016-12-31', 'grfh,', NULL, '2017-05-03 23:14:17', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(20, 'new event', '02:02:00', '2017-02-02', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', NULL, '2017-05-03 23:14:17', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(23, 'wwwwwwwwwwwwwwwww', '02:01:00', '2017-05-20', 'skksksk', NULL, '2017-05-03 23:14:17', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(24, 'jjjjjjj', '22:58:00', '2017-05-27', 'kjklj', NULL, '2017-05-03 23:14:17', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(25, 'dee', '06:00:00', '2017-05-18', 'dede', NULL, '2017-05-03 23:14:17', 'Lesley Chilcott is an award winning filmmaker, documentarian, and producer. She will be in Tunisia from May 2 to 6 with her thrilling and heartfelt documentary, CodeGirl Movie, to interact with Tunisian Computer Science and film enthusiasts. The documentary follows Technovation Challenge teams of high school girls in Moldova, Brazil and the United States as they try to better their community through technology and collaboration. Screenings and Q&As with the director will be held in Sousse, Sfax and Tunis as detailed below. These events will also be an opportunity to learn more about the international co'),
(26, 'zdzdz', '23:58:00', '2017-05-04', 'zzzdzd', NULL, '2017-05-09 16:03:07', 'undefined'),
(27, 'aazezee', '01:02:00', '2017-05-19', 'zdzd', NULL, '2017-05-09 16:10:54', 'zdzdz'),
(28, 'Mandatory stable throughput', '10:18:54', '2017-09-03', '6735 Anzinger Parkway', NULL, '2017-05-16 23:00:00', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(29, 'Focused multimedia moderator', '16:11:47', '2017-05-25', '0 Laurel Drive', NULL, '2017-04-03 23:00:00', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\r\n\r\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.'),
(30, 'Inverse user-facing paradigm', '12:08:34', '2017-05-31', '93694 Jenifer Crossing', NULL, '2017-04-25 23:00:00', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\r\n\r\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\r\n\r\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'),
(31, 'Right-sized tangible firmware', '09:17:47', '2017-06-29', '17718 Morrow Avenue', NULL, '2017-02-19 23:00:00', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(32, 'Realigned real-time productivity', '17:27:51', '2017-11-18', '9 Golf Alley', NULL, '2017-04-06 23:00:00', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'),
(33, 'Monitored didactic emulation', '14:35:02', '2017-06-06', '7 Sutherland Pass', NULL, '2017-04-19 23:00:00', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\r\n\r\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.\r\n\r\nProin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.'),
(34, 'Reverse-engineered background access', '12:45:56', '2017-10-13', '408 Carberry Crossing', NULL, '2017-02-15 23:00:00', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(35, 'Networked optimal initiative', '11:41:25', '2017-10-20', '05 Hanover Terrace', NULL, '2017-01-30 23:00:00', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\r\n\r\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(36, 'Open-source empowering access', '13:52:20', '2017-08-20', '64 Kensington Plaza', NULL, '2017-03-10 23:00:00', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\r\n\r\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(37, 'Up-sized uniform neural-net', '08:05:37', '2017-10-07', '745 Melby Plaza', NULL, '2017-04-07 23:00:00', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.'),
(38, 'Integrated zero defect synergy', '16:36:19', '2017-12-05', '02 Jay Center', NULL, '2017-01-30 23:00:00', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.'),
(39, 'Object-based tangible benchmark', '12:13:36', '2017-07-24', '597 Golden Leaf Hill', NULL, '2017-03-13 23:00:00', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\r\n\r\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(40, 'Optimized encompassing approach', '10:24:46', '2017-07-21', '39 Browning Pass', NULL, '2017-05-05 23:00:00', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.'),
(41, 'Fundamental tangible solution', '09:56:44', '2017-08-14', '582 Prentice Parkway', NULL, '2017-05-07 23:00:00', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\r\n\r\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(42, 'Assimilated static benchmark', '08:21:15', '2017-09-15', '1 Tennessee Drive', NULL, '2017-01-19 23:00:00', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.'),
(43, 'Operative neutral emulation', '10:28:35', '2017-09-14', '235 North Trail', NULL, '2017-02-16 23:00:00', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\r\n\r\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.'),
(44, 'Multi-channelled impactful pricing structure', '08:39:46', '2017-12-25', '44543 Elmside Road', NULL, '2017-03-10 23:00:00', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'),
(45, 'Fundamental tangible synergy', '16:34:03', '2017-07-23', '3768 Sugar Parkway', NULL, '2017-04-11 23:00:00', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.'),
(46, 'Secured multi-tasking leverage', '12:14:15', '2017-06-12', '8585 Hudson Street', NULL, '2017-04-18 23:00:00', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'),
(47, 'Virtual multi-state knowledge user', '11:05:03', '2017-06-16', '9429 Mariners Cove Lane', NULL, '2017-05-09 23:00:00', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.\r\n\r\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\r\n\r\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.'),
(48, 'Negative rating', '23:59:00', '2017-12-30', 'av habib bourguiba', 3, '2017-05-28 22:15:48', '452');

-- --------------------------------------------------------

--
-- Structure de la table `internship`
--

CREATE TABLE `internship` (
  `internshipID` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `supervisorID` int(11) NOT NULL,
  `adminID` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `beginDate` date NOT NULL,
  `endDate` date NOT NULL,
  `timestamp` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `internship`
--

INSERT INTO `internship` (`internshipID`, `price`, `supervisorID`, `adminID`, `address`, `type`, `beginDate`, `endDate`, `timestamp`) VALUES
(53, '20', 1165, 2, 'zazazdd', 6, '2016-05-18', '2017-06-15', '2017-05-31 17:08:35'),
(54, '185', 1158, NULL, 'av habib bourguiba', 3, '2018-12-29', '2019-12-31', '2017-06-06 01:18:29');

-- --------------------------------------------------------

--
-- Structure de la table `locoffice`
--

CREATE TABLE `locoffice` (
  `locOfficeID` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `regOfficeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `locoffice`
--

INSERT INTO `locoffice` (`locOfficeID`, `address`, `city`, `regOfficeID`) VALUES
(14, 'Zwila 5100', 'Mahdia', 1),
(15, 'Hiboun 5100', 'Mahdia', 1),
(16, 'Rue Fleurtex 1400', 'Sfax', 4),
(17, 'Alaarem 5120', 'Sfax', 5),
(18, 'Enour City', 'Gafsa', 6),
(19, 'Passage 1420', 'Tunis', 7),
(20, 'infront of Materna lac 1', 'Tunis', 8),
(21, 'tatayyauajaa', 'Mahdia', 4),
(22, 'hthtrhrt', 'Mahdia', 4),
(23, 'av habib bourguiba', 'mahdia', 2),
(24, 'aaaaaaaaaazz', 'mahdia', 1),
(25, 'zdz', 'd', 1);

-- --------------------------------------------------------

--
-- Structure de la table `natoffice`
--

CREATE TABLE `natoffice` (
  `natOfficeID` int(11) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `natoffice`
--

INSERT INTO `natoffice` (`natOfficeID`, `address`) VALUES
(1, 'Mahdia, Borj Erras 5100'),
(2, 'Ariana, av Taib Mhiri 5420'),
(3, 'Sfax, Rue Tanyour 1500'),
(4, 'Gafsa, Nord de gafsa 1450'),
(5, 'Tunis, lac 2 rue du lac Malaren 450'),
(7, 'Ariana, Terminus Metro 2'),
(8, 'central');

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE `news` (
  `newsID` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `adminID` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `news`
--

INSERT INTO `news` (`newsID`, `title`, `content`, `adminID`, `timestamp`) VALUES
(1, 'A propos Les cadres', 'Deplacement des cadres  Deplacement des cadres \r\nDeplacement des cadresDeplacement des cadres\r\nDeplacement des cadresDeplacement des cadresDeplacement des cadresDeplacement des cadresDeplacement des cadres\r\nDeplacement des cadresDeplacement des cadresDeplacement des cadresDeplacement des cadres\r\n\r\nDeplacement des cadresDeplacement des cadresDeplacement des cadresDeplacement des cadres', NULL, '2017-05-03 22:11:36'),
(2, 'New Mollit Anima', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, '2017-05-04 19:24:13'),
(3, 'Inscription de 2018', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, '2017-05-04 19:24:13'),
(4, 'Regina pariatur', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, '2017-05-04 19:24:13'),
(5, 'The commodo consequat', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, '2017-05-04 19:24:13'),
(6, 'Laborum laboris ', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, '2017-05-04 19:24:13'),
(24, 'Sales', 'In congue. Etiam justo. Etiam pretium iaculis justo.\r\n\r\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\r\n\r\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', NULL, '2017-03-31 23:00:00'),
(25, 'Business Development', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\r\n\r\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', NULL, '2017-04-10 23:00:00'),
(26, 'Product Management', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', NULL, '2017-04-22 23:00:00'),
(27, 'Support', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\r\n\r\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', NULL, '2017-02-10 23:00:00'),
(28, 'Product Management', 'Fusce consequat. Nulla nisl. Nunc nisl.\r\n\r\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', NULL, '2017-04-28 23:00:00'),
(29, 'Services', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', NULL, '2017-05-10 23:00:00'),
(30, 'Business Development', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\r\n\r\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', NULL, '2017-04-26 23:00:00'),
(31, 'Sales', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\r\n\r\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.\r\n\r\nMorbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', NULL, '2017-02-18 23:00:00'),
(32, 'Services', 'Fusce consequat. Nulla nisl. Nunc nisl.\r\n\r\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', NULL, '2017-02-02 23:00:00'),
(33, 'Engineering', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\r\n\r\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', NULL, '2017-02-25 23:00:00'),
(34, 'Training', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.\r\n\r\nIn sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\r\n\r\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', NULL, '2017-03-21 23:00:00'),
(35, 'Services', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\r\n\r\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', NULL, '2017-04-30 23:00:00'),
(36, 'Sales', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', NULL, '2017-01-19 23:00:00'),
(37, 'Services', 'Fusce consequat. Nulla nisl. Nunc nisl.', NULL, '2017-04-23 23:00:00'),
(38, 'Training', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', NULL, '2017-04-25 23:00:00'),
(40, '', '', 3, '2017-06-06 02:22:14'),
(41, '', '', 3, '2017-06-06 02:22:41'),
(42, '', '', 3, '2017-06-06 02:22:51'),
(43, '', '', 3, '2017-06-06 02:23:46'),
(44, '', '', 3, '2017-06-06 02:23:59'),
(45, '', '', 3, '2017-06-06 02:24:15');

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

CREATE TABLE `participation` (
  `adhID` int(11) NOT NULL,
  `internshipID` int(11) NOT NULL,
  `validation` tinyint(1) NOT NULL,
  `payment` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `participation`
--

INSERT INTO `participation` (`adhID`, `internshipID`, `validation`, `payment`) VALUES
(1158, 53, 1, 1),
(1165, 53, 0, 0),
(1177, 53, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `regoffice`
--

CREATE TABLE `regoffice` (
  `regOfficeID` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `natOfficeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `regoffice`
--

INSERT INTO `regoffice` (`regOfficeID`, `address`, `city`, `natOfficeID`) VALUES
(1, 'Mahdia, av Habib Borguiba 5100', 'Mahdia', 1),
(2, 'Mahdia, Raoudha 5100', 'Mahdia', 1),
(3, 'Ariana, Terminus Metro 2', 'Mahdia', 2),
(4, 'Sfax, Chihia 5420', 'Mahdia', 3),
(5, 'Sfax, Lafran 5440', 'Mahdia', 3),
(6, 'Gafsa, Gafsa Center 6001', 'Mahdia', 4),
(7, 'Tunis, Lafayette 1200', 'Mahdia', 5),
(8, 'Tunis, lac 1 Rue de lac du Biwa', 'Mahdia', 5),
(11, 'hthtrhrtdede', 'Mahdia', 2),
(12, 'ezezezdez', 'Mahdia', NULL),
(13, 'eezhefzkfez ', 'Mahdia', NULL),
(14, 'aaaaaaaaaa', 'aaaa', NULL),
(15, 'wwww', 'www', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('FoTlVRxvNNl5CsgXw_2u5ld-GjLH34gY', 1492784119, '{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":".mydomain.com","path":"/"}}'),
('H0AGFMUMMPMUYPfjbgV5jzjVP71WqvrF', 1492784133, '{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":".mydomain.com","path":"/"}}'),
('LObp04xTcmxE0GEVSAWAkgYHC8QTRVGx', 1492784149, '{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":".mydomain.com","path":"/"}}'),
('dWaJaa03vihFnMIDEtlkpJD6BG-rGJBX', 1492784133, '{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"domain":".mydomain.com","path":"/"}}');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`adhID`),
  ADD UNIQUE KEY `nationalIDcard` (`nationalIDcard`),
  ADD KEY `locOfficeID` (`locOfficeID`);

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventID`),
  ADD KEY `adminID` (`adminID`);

--
-- Index pour la table `internship`
--
ALTER TABLE `internship`
  ADD PRIMARY KEY (`internshipID`),
  ADD KEY `supervisorID` (`supervisorID`),
  ADD KEY `adminID` (`adminID`);

--
-- Index pour la table `locoffice`
--
ALTER TABLE `locoffice`
  ADD PRIMARY KEY (`locOfficeID`),
  ADD KEY `regOfficeID` (`regOfficeID`);

--
-- Index pour la table `natoffice`
--
ALTER TABLE `natoffice`
  ADD PRIMARY KEY (`natOfficeID`);

--
-- Index pour la table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`newsID`),
  ADD KEY `adminID` (`adminID`);

--
-- Index pour la table `participation`
--
ALTER TABLE `participation`
  ADD KEY `adhID` (`adhID`),
  ADD KEY `internID` (`internshipID`);

--
-- Index pour la table `regoffice`
--
ALTER TABLE `regoffice`
  ADD PRIMARY KEY (`regOfficeID`),
  ADD KEY `natOfficeID` (`natOfficeID`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `adherent`
--
ALTER TABLE `adherent`
  MODIFY `adhID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1231;
--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `event`
--
ALTER TABLE `event`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT pour la table `internship`
--
ALTER TABLE `internship`
  MODIFY `internshipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT pour la table `locoffice`
--
ALTER TABLE `locoffice`
  MODIFY `locOfficeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `natoffice`
--
ALTER TABLE `natoffice`
  MODIFY `natOfficeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `news`
--
ALTER TABLE `news`
  MODIFY `newsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT pour la table `regoffice`
--
ALTER TABLE `regoffice`
  MODIFY `regOfficeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD CONSTRAINT `adherent_ibfk_1` FOREIGN KEY (`locOfficeID`) REFERENCES `locoffice` (`locOfficeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `internship`
--
ALTER TABLE `internship`
  ADD CONSTRAINT `internship_ibfk_1` FOREIGN KEY (`supervisorID`) REFERENCES `adherent` (`adhID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `internship_ibfk_2` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `locoffice`
--
ALTER TABLE `locoffice`
  ADD CONSTRAINT `localOffice_ibfk_1` FOREIGN KEY (`regOfficeID`) REFERENCES `regoffice` (`regOfficeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`adhID`) REFERENCES `adherent` (`adhID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`internshipID`) REFERENCES `internship` (`internshipID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `regoffice`
--
ALTER TABLE `regoffice`
  ADD CONSTRAINT `regOffice_ibfk_1` FOREIGN KEY (`natOfficeID`) REFERENCES `natoffice` (`natOfficeID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
