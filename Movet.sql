-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 27, 2024 at 10:23 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Movet`
--

-- --------------------------------------------------------

--
-- Table structure for table `Assegnazione`
--

CREATE TABLE `Assegnazione` (
  `targaAutobus` varchar(10) NOT NULL,
  `numCorsa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Assegnazione`
--

INSERT INTO `Assegnazione` (`targaAutobus`, `numCorsa`) VALUES
('AB123CD', 1),
('EF456GH', 2),
('IJ789KL', 3),
('MN012OP', 4),
('QR345ST', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Autobus`
--

CREATE TABLE `Autobus` (
  `targa` varchar(10) NOT NULL,
  `modello` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `nPostiPiedi` int(11) DEFAULT NULL,
  `nPostiSedere` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Autobus`
--

INSERT INTO `Autobus` (`targa`, `modello`, `marca`, `nPostiPiedi`, `nPostiSedere`) VALUES
('AB123CD', 'Model X', 'Marca A', 10, 40),
('EF456GH', 'Model Y', 'Marca B', 8, 35),
('IJ789KL', 'Model Z', 'Marca C', 12, 45),
('MN012OP', 'Model A', 'Marca D', 10, 42),
('QR345ST', 'Model B', 'Marca E', 9, 38);

-- --------------------------------------------------------

--
-- Table structure for table `Biglietto`
--

CREATE TABLE `Biglietto` (
  `cod` int(11) NOT NULL,
  `costo` decimal(5,2) DEFAULT NULL,
  `validità` date DEFAULT NULL,
  `dObliterazione` date DEFAULT NULL,
  `oObliterazione` time DEFAULT NULL,
  `numCorsa` int(11) DEFAULT NULL,
  `cfPasseggero` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Biglietto`
--

INSERT INTO `Biglietto` (`cod`, `costo`, `validità`, `dObliterazione`, `oObliterazione`, `numCorsa`, `cfPasseggero`) VALUES
(1, 1.50, '2024-06-01', '2024-06-01', '07:05:00', 1, 'ABC123DEF45'),
(2, 1.50, '2024-06-01', '2024-06-01', '07:20:00', 2, 'DEF456GHI78'),
(3, 1.50, '2024-06-01', '2024-06-01', '07:35:00', 3, 'GHI789JKL01'),
(4, 1.50, '2024-06-01', '2024-06-01', '07:50:00', 4, 'JKL012MNO34'),
(5, 1.50, '2024-06-01', '2024-06-01', '08:05:00', 5, 'MNO345PQR67'),
(6, 1.50, '2024-06-01', '2024-06-01', '06:50:00', 6, 'PQR678STU90'),
(7, 1.50, '2024-06-01', '2024-06-01', '07:10:00', 7, 'STU901VWX23'),
(8, 1.50, '2024-06-01', '2024-06-01', '07:20:00', 8, 'VWX234YZA56'),
(9, 1.50, '2024-06-01', '2024-06-01', '07:35:00', 9, 'YZA567BCD89'),
(10, 1.50, '2024-06-01', '2024-06-01', '07:50:00', 10, 'BCD890EFG12'),
(11, 1.50, '2024-06-01', '2024-06-01', '06:55:00', 11, 'EFG123HIJ45'),
(12, 1.50, '2024-06-01', '2024-06-01', '07:05:00', 12, 'HIJ456KLM78'),
(13, 1.50, '2024-06-01', '2024-06-01', '07:25:00', 13, 'KLM789NOP01'),
(14, 1.50, '2024-06-01', '2024-06-01', '07:40:00', 14, 'NOP012QRS34'),
(15, 1.50, '2024-06-01', '2024-06-01', '07:55:00', 15, 'QRS345TUV67'),
(16, 1.50, '2024-06-01', '2024-06-01', '08:05:00', 16, 'TUV678WXY90'),
(17, 1.50, '2024-06-01', '2024-06-01', '06:50:00', 17, 'WXY901ABC23'),
(18, 1.50, '2024-06-01', '2024-06-01', '07:00:00', 18, 'ABC234DEF56'),
(19, 1.50, '2024-06-01', '2024-06-01', '07:15:00', 19, 'DEF567GHI89'),
(20, 1.50, '2024-06-01', '2024-06-01', '07:30:00', 20, 'GHI890JKL12'),
(21, 1.50, '2024-06-01', '2024-06-01', '07:45:00', 21, 'JKL123MNO45'),
(22, 1.50, '2024-06-01', '2024-06-01', '08:00:00', 22, 'MNO456PQR78'),
(23, 1.50, '2024-06-01', '2024-06-01', '06:40:00', 23, 'PQR789STU01'),
(24, 1.50, '2024-06-01', '2024-06-01', '07:10:00', 24, 'STU012VWX34'),
(25, 1.50, '2024-06-01', '2024-06-01', '07:25:00', 25, 'VWX345YZA67'),
(26, 1.50, '2024-06-01', '2024-06-01', '07:35:00', 26, 'YZA678BCD90'),
(27, 1.50, '2024-06-01', '2024-06-01', '07:50:00', 27, 'BCD901EFG23'),
(28, 1.50, '2024-06-01', '2024-06-01', '08:05:00', 28, 'EFG234HIJ56'),
(29, 1.50, '2024-06-01', '2024-06-01', '08:15:00', 29, 'HIJ567KLM89'),
(30, 1.50, '2024-06-01', '2024-06-01', '08:30:00', 30, 'KLM890NOP12');

-- --------------------------------------------------------

--
-- Table structure for table `Corsa`
--

CREATE TABLE `Corsa` (
  `num` int(11) NOT NULL,
  `oraP` time DEFAULT NULL,
  `oraA` time DEFAULT NULL,
  `luogoP` varchar(100) DEFAULT NULL,
  `luogoA` varchar(100) DEFAULT NULL,
  `nFermate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Corsa`
--

INSERT INTO `Corsa` (`num`, `oraP`, `oraA`, `luogoP`, `luogoA`, `nFermate`) VALUES
(1, '07:00:00', '08:00:00', 'Piazza A', 'Scuola B', 3),
(2, '07:15:00', '08:15:00', 'Piazza C', 'Scuola D', 2),
(3, '07:30:00', '08:30:00', 'Piazza E', 'Scuola F', 4),
(4, '07:45:00', '08:45:00', 'Piazza G', 'Scuola H', 5),
(5, '08:00:00', '09:00:00', 'Piazza I', 'Scuola J', 3),
(6, '06:45:00', '07:45:00', 'Via Roma', 'Scuola Primaria Leopardi', 2),
(7, '07:10:00', '08:10:00', 'Via Milano', 'Scuola Media Foscolo', 3),
(8, '07:20:00', '08:20:00', 'Via Napoli', 'Liceo Linguistico Petrarca', 4),
(9, '07:35:00', '08:35:00', 'Via Torino', 'Istituto Tecnico Marconi', 5),
(10, '07:50:00', '08:50:00', 'Via Firenze', 'Scuola Primaria Pascoli', 3),
(11, '06:55:00', '07:55:00', 'Via Venezia', 'Scuola Media Alfieri', 2),
(12, '07:05:00', '08:05:00', 'Via Genova', 'Liceo Artistico Modigliani', 4),
(13, '07:25:00', '08:25:00', 'Via Bologna', 'Istituto Tecnico Da Vinci', 5),
(14, '07:40:00', '08:40:00', 'Via Palermo', 'Liceo Classico Parini', 3),
(15, '07:55:00', '08:55:00', 'Via Bari', 'Scuola Media Carducci', 2),
(16, '08:05:00', '09:05:00', 'Via Salerno', 'Scuola Primaria Collodi', 4),
(17, '06:50:00', '07:50:00', 'Via Taranto', 'Liceo Scientifico Newton', 3),
(18, '07:00:00', '08:00:00', 'Via Padova', 'Scuola Media Montale', 5),
(19, '07:15:00', '08:15:00', 'Via Trieste', 'Liceo Linguistico D\'Annunzio', 4),
(20, '07:30:00', '08:30:00', 'Via Ancona', 'Istituto Tecnico Galvani', 3),
(21, '07:45:00', '08:45:00', 'Via Bari', 'Liceo Scientifico Copernico', 2),
(22, '08:00:00', '09:00:00', 'Via Catania', 'Scuola Media Ungaretti', 5),
(23, '06:40:00', '07:40:00', 'Via Perugia', 'Scuola Primaria Rodari', 4),
(24, '07:10:00', '08:10:00', 'Via Grosseto', 'Liceo Artistico Caravaggio', 3),
(25, '07:25:00', '08:25:00', 'Via Foggia', 'Istituto Tecnico Majorana', 2),
(26, '07:35:00', '08:35:00', 'Via Arezzo', 'Liceo Classico Leopardi', 5),
(27, '07:50:00', '08:50:00', 'Via Siena', 'Scuola Media Pirandello', 4),
(28, '08:05:00', '09:05:00', 'Via Livorno', 'Liceo Linguistico Montale', 3),
(29, '08:15:00', '09:15:00', 'Via Pisa', 'Istituto Tecnico Volta', 2),
(30, '08:30:00', '09:30:00', 'Via Trento', 'Liceo Scientifico Majorana', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Passeggero`
--

CREATE TABLE `Passeggero` (
  `cf` varchar(16) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `dataN` date DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `via` varchar(50) DEFAULT NULL,
  `civico` varchar(10) DEFAULT NULL,
  `città` varchar(50) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `Passeggero`
--

INSERT INTO `Passeggero` (`cf`, `nome`, `cognome`, `dataN`, `tel`, `email`, `via`, `civico`, `città`, `provincia`) VALUES
('ABC123DEF45', 'Mario', 'Rossi', '2005-04-12', '1234567890', 'mario.rossi@example.com', 'Via Roma', '10', 'Roma', 'RM'),
('ABC234DEF56', 'Arianna', 'Blu', '2005-02-02', '1718192021', 'arianna.blu@example.com', 'Via Collodi', '180', 'Livorno', 'LI'),
('BCD890EFG12', 'Chiara', 'Neri', '2005-06-25', '8899001122', 'chiara.neri@example.com', 'Via Marconi', '100', 'Bari', 'BA'),
('BCD901EFG23', 'Stefano', 'Verdi', '2006-02-26', '2627282930', 'stefano.verdi@example.com', 'Via Alfieri', '270', 'Cosenza', 'CS'),
('DEF456GHI78', 'Luigi', 'Bianchi', '2006-07-23', '0987654321', 'luigi.bianchi@example.com', 'Via Milano', '20', 'Milano', 'MI'),
('DEF567GHI89', 'Giorgio', 'Rossi', '2006-11-11', '1819202122', 'giorgio.rossi@example.com', 'Via Alfieri', '190', 'Ancona', 'AN'),
('EFG123HIJ45', 'Matteo', 'Gialli', '2006-04-05', '9900112233', 'matteo.gialli@example.com', 'Via Galvani', '110', 'Catania', 'CT'),
('EFG234HIJ56', 'Claudia', 'Neri', '2005-11-30', '2728293031', 'claudia.neri@example.com', 'Via Marconi', '280', 'Pescara', 'PE'),
('GHI789JKL01', 'Anna', 'Verdi', '2005-01-15', '1122334455', 'anna.verdi@example.com', 'Via Napoli', '30', 'Napoli', 'NA'),
('GHI890JKL12', 'Alice', 'Bianchi', '2005-03-28', '1920212223', 'alice.bianchi@example.com', 'Via Marconi', '200', 'Ravenna', 'RA'),
('HIJ456KLM78', 'Federica', 'Blu', '2005-12-20', '1011122334', 'federica.blu@example.com', 'Via Fermi', '120', 'Verona', 'VR'),
('HIJ567KLM89', 'Federico', 'Gialli', '2006-10-04', '2829303132', 'federico.gialli@example.com', 'Via Galvani', '290', 'Salerno', 'SA'),
('JKL012MNO34', 'Sara', 'Neri', '2006-10-30', '2233445566', 'sara.neri@example.com', 'Via Firenze', '40', 'Firenze', 'FI'),
('JKL123MNO45', 'Riccardo', 'Verdi', '2006-12-19', '2021222324', 'riccardo.verdi@example.com', 'Via Galvani', '210', 'Ferrara', 'FE'),
('KLM789NOP01', 'Luca', 'Rossi', '2006-09-15', '1213141516', 'luca.rossi@example.com', 'Via Petrarca', '130', 'Messina', 'ME'),
('KLM890NOP12', 'Chiara', 'Blu', '2005-06-15', '2920312233', 'chiara.blu@example.com', 'Via Fermi', '300', 'Trento', 'TN'),
('MNO345PQR67', 'Paolo', 'Gialli', '2005-05-20', '3344556677', 'paolo.gialli@example.com', 'Via Venezia', '50', 'Venezia', 'VE'),
('MNO456PQR78', 'Beatrice', 'Neri', '2005-04-08', '2122232425', 'beatrice.neri@example.com', 'Via Fermi', '220', 'Modena', 'MO'),
('NOP012QRS34', 'Marta', 'Bianchi', '2005-10-10', '1314151617', 'marta.bianchi@example.com', 'Via Montale', '140', 'Trieste', 'TS'),
('PQR678STU90', 'Elena', 'Blu', '2005-08-25', '4455667788', 'elena.blu@example.com', 'Via Pascoli', '60', 'Torino', 'TO'),
('PQR789STU01', 'Davide', 'Gialli', '2006-07-13', '2223242526', 'davide.gialli@example.com', 'Via Petrarca', '230', 'Pisa', 'PI'),
('QRS345TUV67', 'Alessandro', 'Verdi', '2006-01-30', '1415161718', 'alessandro.verdi@example.com', 'Via Tasso', '150', 'Padova', 'PD'),
('STU012VWX34', 'Silvia', 'Blu', '2005-09-17', '2324252627', 'silvia.blu@example.com', 'Via Tasso', '240', 'Siena', 'SI'),
('STU901VWX23', 'Carlo', 'Rossi', '2006-02-10', '5566778899', 'carlo.rossi@example.com', 'Via Leopardi', '70', 'Genova', 'GE'),
('TUV678WXY90', 'Valentina', 'Neri', '2005-07-07', '1516171819', 'valentina.neri@example.com', 'Via Foscolo', '160', 'Parma', 'PR'),
('VWX234YZA56', 'Giulia', 'Bianchi', '2005-11-05', '6677889900', 'giulia.bianchi@example.com', 'Via Collodi', '80', 'Bologna', 'BO'),
('VWX345YZA67', 'Andrea', 'Rossi', '2006-05-29', '2425262728', 'andrea.rossi@example.com', 'Via Foscolo', '250', 'Arezzo', 'AR'),
('WXY901ABC23', 'Francesco', 'Gialli', '2006-08-20', '1617181920', 'francesco.gialli@example.com', 'Via Leopardi', '170', 'Reggio Calabria', 'RC'),
('YZA567BCD89', 'Marco', 'Verdi', '2006-03-15', '7788990011', 'marco.verdi@example.com', 'Via Alfieri', '90', 'Palermo', 'PA'),
('YZA678BCD90', 'Martina', 'Bianchi', '2005-01-22', '2526272829', 'martina.bianchi@example.com', 'Via Collodi', '260', 'Perugia', 'PG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Assegnazione`
--
ALTER TABLE `Assegnazione`
  ADD PRIMARY KEY (`targaAutobus`,`numCorsa`),
  ADD KEY `numCorsa` (`numCorsa`);

--
-- Indexes for table `Autobus`
--
ALTER TABLE `Autobus`
  ADD PRIMARY KEY (`targa`);

--
-- Indexes for table `Biglietto`
--
ALTER TABLE `Biglietto`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `numCorsa` (`numCorsa`),
  ADD KEY `cfPasseggero` (`cfPasseggero`);

--
-- Indexes for table `Corsa`
--
ALTER TABLE `Corsa`
  ADD PRIMARY KEY (`num`);

--
-- Indexes for table `Passeggero`
--
ALTER TABLE `Passeggero`
  ADD PRIMARY KEY (`cf`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Assegnazione`
--
ALTER TABLE `Assegnazione`
  ADD CONSTRAINT `assegnazione_ibfk_1` FOREIGN KEY (`targaAutobus`) REFERENCES `Autobus` (`targa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assegnazione_ibfk_2` FOREIGN KEY (`numCorsa`) REFERENCES `Corsa` (`num`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Biglietto`
--
ALTER TABLE `Biglietto`
  ADD CONSTRAINT `biglietto_ibfk_1` FOREIGN KEY (`numCorsa`) REFERENCES `Corsa` (`num`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `biglietto_ibfk_2` FOREIGN KEY (`cfPasseggero`) REFERENCES `Passeggero` (`cf`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
