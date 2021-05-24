-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 24, 2021 alle 13:20
-- Versione del server: 10.4.14-MariaDB
-- Versione PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `motoweb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `dati_teams`
--

CREATE TABLE `dati_teams` (
  `id_team` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `logo` varchar(40) DEFAULT NULL,
  `piloti` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `dati_teams`
--

INSERT INTO `dati_teams` (`id_team`, `nome`, `logo`, `piloti`) VALUES
(1, 'Ducati Ufficiale', './images/ducati.png', 'Francesco Bagnaia (Italia), Jack Miller (Australia)'),
(2, 'Yamaha Factory', './images/yamaha.png', 'Fabio Quartararo (Francia), Maverick Viñales (Spagna)'),
(3, 'Honda HRC', './images/honda.jpeg', 'Marc Marquez (Spagna), Pol Espargarò (Spagna)'),
(4, 'Suzuki Ecstar', './images/suzuki.png', 'Alex Rins (Spagna), Joan Mir (Spagna)'),
(5, 'KTM Factory', './images/ktm.png', 'Miguel Oliveira (Portogallo), Brad Binder (Sudafrica)'),
(6, 'Ducati Pramac', './images/pramac.png', 'Jorge Martin (Spagna), Johann Zarco (Francia)'),
(7, 'Aprilia Racing', './images/aprilia.png', 'Aleix Espargarò (Spagna), Lorenzo Savadori (Italia)'),
(8, 'LCR Honda', './images/LCR.png', 'Alex Marquez (Spagna), Takaaki Nakagami (Giappone)'),
(9, 'Yamaha Petronas', './images/petronas.jpg', 'Valentino Rossi (Italia), Franco Morbidelli (Italia)'),
(10, 'KTM Tech3', './images/tech3.png', 'Iker Lecuona (Spagna), Danilo Petrucci (Italia)'),
(11, 'Avintia Racing', './images/esponsorama.png', 'Luca Marini (Italia), Enea Bastianini (Italia)');

-- --------------------------------------------------------

--
-- Struttura della tabella `favouriteteams`
--

CREATE TABLE `favouriteteams` (
  `id_user` int(11) NOT NULL,
  `id_team` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `favouriteteams`
--

INSERT INTO `favouriteteams` (`id_user`, `id_team`) VALUES
(14, 1),
(14, 5),
(29, 6),
(32, 2),
(32, 3),
(32, 5),
(32, 6),
(33, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `gran_premio`
--

CREATE TABLE `gran_premio` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `circuito` varchar(50) DEFAULT NULL,
  `data_gara` varchar(50) DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `gran_premio`
--

INSERT INTO `gran_premio` (`id`, `nome`, `circuito`, `data_gara`, `foto`) VALUES
(1, 'Gran Premio della Toscana', 'Autodromo Internazionale del Mugello', 'Domenica 30 Mag, 14:00', './images/gp/mugello.jpg'),
(2, 'Gran Premio di Catalogna', 'Circuito di Catalogna', 'Domenica 6 Giu, 15:00', './images/gp/catalunya.jpeg'),
(3, 'Gran Premio di Germania', 'Sachsenring', 'Domenica 20 Giu, 14:00', './images/gp/sachs.jpg'),
(4, 'Gran Premio d\'Olanda', 'TT Circuit Assen', 'Domenica 27 Giu, 14:00', './images/gp/assen.jpg'),
(5, 'Gran Premio d\'Austria', 'Red Bull Ring', 'Domenica 15 Ago, 14:00', './images/gp/austria.jpg'),
(6, 'Gran Premio di Gran Bretagna', 'Circuito di Silverstone', 'Domenica 29 Ago, 14:00', './images/gp/silverstone.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `likes`
--

CREATE TABLE `likes` (
  `id_user` int(11) NOT NULL,
  `id_notizia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `likes`
--

INSERT INTO `likes` (`id_user`, `id_notizia`) VALUES
(14, 1),
(14, 3),
(27, 3),
(27, 4),
(31, 1),
(31, 2),
(31, 3),
(31, 4),
(32, 1),
(32, 2),
(32, 3),
(33, 1),
(33, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `loghi_team_ufficiali`
--

CREATE TABLE `loghi_team_ufficiali` (
  `id` int(11) NOT NULL,
  `logo` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `loghi_team_ufficiali`
--

INSERT INTO `loghi_team_ufficiali` (`id`, `logo`) VALUES
(1, './images/aprilia.png'),
(2, './images/ducati.png'),
(3, './images/ktm.png'),
(4, './images/honda.jpeg'),
(5, './images/yamaha.png'),
(6, './images/suzuki.png');

-- --------------------------------------------------------

--
-- Struttura della tabella `login_spoiler`
--

CREATE TABLE `login_spoiler` (
  `id` int(11) NOT NULL,
  `titolo` varchar(10) DEFAULT NULL,
  `paragrafo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `login_spoiler`
--

INSERT INTO `login_spoiler` (`id`, `titolo`, `paragrafo`) VALUES
(1, 'News', 'Entra nel sito per leggere le ultime notizie sul campionato del mondo di MotoGP!'),
(2, 'Shop', 'Registrati subito per acquistare i biglietti dei prossimi GP');

-- --------------------------------------------------------

--
-- Struttura della tabella `notizie`
--

CREATE TABLE `notizie` (
  `id` int(11) NOT NULL,
  `titolo` varchar(100) DEFAULT NULL,
  `descrizione` varchar(400) DEFAULT NULL,
  `percorso_foto` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `notizie`
--

INSERT INTO `notizie` (`id`, `titolo`, `descrizione`, `percorso_foto`) VALUES
(1, 'È il momento della MotoGP', 'Dopo i test ufficiali in Qatar, i team della MotoGPT e i loro rispettivi piloti stanno facendo il conto alla rovescia per la prima gara.', './images/news/motogp.jpg'),
(2, 'Test MotoGP Qatar: Miller comanda', 'La classifica assoluta dei cinque giorni di test in Qatar vede svettare l\'australiano della Ducati.', './images/news/losail.jpg'),
(3, 'Tre coppie di fratelli: storico 2021', 'Rossi-Marini, i Marquez, gli Espargaro, i Binder: tra MotoGP e Moto2 nel 2021 tre coppie di fratelli, un fatto unico nella storia.', './images/news/rossi_marini.jpg'),
(4, 'Marquez correrà in Qatar?', 'Marc Marquez e il debutto in Qatar. La decisione finale è attesa ma ci sono tutte le ragioni perché il pilota spagnolo sia al via del Gran Premio.', './images/news/marquez.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine`
--

CREATE TABLE `ordine` (
  `id_ordine` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `qta_prodotti` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `ordine`
--

INSERT INTO `ordine` (`id_ordine`, `id_user`, `qta_prodotti`) VALUES
(0, 14, 15),
(1, 14, 13),
(2, 14, 8),
(3, 33, 19),
(4, 33, 1),
(5, 33, 7),
(6, 33, 3),
(7, 33, 5),
(8, 33, 1),
(9, 14, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `pilota`
--

CREATE TABLE `pilota` (
  `id_pilota` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `id_team` int(11) DEFAULT NULL,
  `punti` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `pilota`
--

INSERT INTO `pilota` (`id_pilota`, `nome`, `id_team`, `punti`) VALUES
(1, 'F.Bagnaia', 1, 79),
(2, 'J.Miller', 1, 64),
(3, 'F.Quartararo', 2, 80),
(4, 'M.Vinales', 2, 56),
(5, 'M.Marquez', 3, 16),
(6, 'P.Espargaro', 3, 25),
(7, 'J.Mir', 4, 49),
(8, 'A.Rins', 4, 23),
(9, 'B.Binder', 5, 24),
(10, 'M.Oliveira', 5, 9),
(11, 'J.Zarco', 6, 68),
(12, 'J.Martin', 6, 17),
(13, 'A.Espargaro', 7, 35),
(14, 'L.Savadori', 7, 2),
(15, 'T.Nakagami', 8, 28),
(16, 'A.Marquez', 8, 18),
(17, 'V.Rossi', 9, 9),
(18, 'F.Morbidelli', 9, 33),
(19, 'D.Petrucci', 10, 16),
(20, 'I.Lecuona', 10, 8),
(21, 'E.Bastianini', 11, 20),
(22, 'L.Marini', 11, 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `subordine`
--

CREATE TABLE `subordine` (
  `id_ordine` int(11) NOT NULL,
  `id_prodotto` int(11) NOT NULL,
  `nome_prodotto` varchar(40) DEFAULT NULL,
  `qta_prodotto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `subordine`
--

INSERT INTO `subordine` (`id_ordine`, `id_prodotto`, `nome_prodotto`, `qta_prodotto`) VALUES
(0, 1, 'Gran Premio della Toscana', 6),
(0, 2, 'Gran Premio di Catalogna', 3),
(0, 4, 'Gran Premio d\'Olanda', 2),
(0, 5, 'Gran Premio d\'Austria', 4),
(1, 1, 'Gran Premio della Toscana', 6),
(1, 2, 'Gran Premio di Catalogna', 4),
(1, 3, 'Gran Premio di Germania', 2),
(1, 4, 'Gran Premio d\'Olanda', 1),
(2, 1, 'Gran Premio della Toscana', 4),
(2, 4, 'Gran Premio d\'Olanda', 3),
(2, 5, 'Gran Premio d\'Austria', 1),
(3, 4, 'Gran Premio d\'Olanda', 16),
(3, 5, 'Gran Premio d\'Austria', 2),
(3, 6, 'Gran Premio di Gran Bretagna', 1),
(4, 2, 'Gran Premio di Catalogna', 1),
(5, 3, 'Gran Premio di Germania', 5),
(5, 4, 'Gran Premio d\'Olanda', 2),
(6, 1, 'Gran Premio della Toscana', 3),
(7, 1, 'Gran Premio della Toscana', 1),
(7, 2, 'Gran Premio di Catalogna', 1),
(7, 3, 'Gran Premio di Germania', 1),
(7, 4, 'Gran Premio d\'Olanda', 1),
(7, 5, 'Gran Premio d\'Austria', 1),
(8, 1, 'Gran Premio della Toscana', 1),
(9, 2, 'Gran Premio di Catalogna', 2),
(9, 3, 'Gran Premio di Germania', 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(14, 'pippo', 'YmFmZDM2OWNlYjA0Nzk3N2JlOTVhMTliNjgwZDg3M2Q0NGRhZTM1MDBhZjgzNDE3ZTcyNDJlYTJlYTQzZWI3YQ=='),
(15, 'aoaoao', 'OGZiMWEzMDFiODI5NDc3Y2ZhYzc3NDFjMTc1MzNkYmVlODVlYmEzZjAyMDY2NDVhMTU3YmZiMWJhY2NjNzE5Yw=='),
(16, 'ashua', 'ZWM0Yzg4Y2E3ZjY5NTM0ZjEwYzA2MTFjMWVjZDEzZTdjMmNkZjczZTFiOTE1ZTlmZDBjZjI3YWMxMGRhNDNmYQ=='),
(17, 'popo', 'ZTM1YmY1ZGIyYWY1YTg4MGZiM2UzODg3ZTE1NzRmMzBiMTEzOWEzNTQ3ZWM4MmY4MzUyZTAzZDNkNWJjZDMyZA=='),
(18, 'miao', 'ZjJjM2VlZmJkY2E2MDIyZDU5NWE2ODQ0ODEzM2Q5MDlkN2MyNDEyY2RkODhmZTBjYWY0YWY2NGY2NDJjZWU3Ng=='),
(19, 'miaomiao', 'OGZiMWEzMDFiODI5NDc3Y2ZhYzc3NDFjMTc1MzNkYmVlODVlYmEzZjAyMDY2NDVhMTU3YmZiMWJhY2NjNzE5Yw=='),
(20, 'papa', 'YmFmZDM2OWNlYjA0Nzk3N2JlOTVhMTliNjgwZDg3M2Q0NGRhZTM1MDBhZjgzNDE3ZTcyNDJlYTJlYTQzZWI3YQ=='),
(21, 'miaoao', 'ZTQ4OTFhMjUzNjM2NmE0ZmU0MWRmNDk2N2RiYmMxNGU2OWYxNmQxNjYzOTg4YTM2OTYzMzcxODVjODIyMjkzOQ=='),
(22, 'Panda', 'NjhiODBhNjMyODJlMzhhYWU5NWFmNTUzY2Y3ZjhkYWRhMDZkNjI3ZjllZWQzYjU5OTc2Yjc5NDAxMjA3YjI4Nw=='),
(23, 'dadsds', 'MjdmZWRjOWI4N2M0MjI0NDNiYzhjMjlmNmVmNDdhODZlMzgxZTQxNzFiYTI5Zjk5ZmIwNDU5ZWQzMDNkZjcxNw=='),
(24, 'aoao', 'OGZiMWEzMDFiODI5NDc3Y2ZhYzc3NDFjMTc1MzNkYmVlODVlYmEzZjAyMDY2NDVhMTU3YmZiMWJhY2NjNzE5Yw=='),
(25, 'sasa', 'M2IzOTI3ZTQwYzZlMmQ2ZGNkNGFlMDc0ZTcwNjYxMWM3NmI5MjBjZDZjZmJkMDAzMWU3MGMxMzAyOWEwYzdkMQ=='),
(27, 'alberto', 'M2IzOTI3ZTQwYzZlMmQ2ZGNkNGFlMDc0ZTcwNjYxMWM3NmI5MjBjZDZjZmJkMDAzMWU3MGMxMzAyOWEwYzdkMQ=='),
(28, 'aoaoaoa', 'ZTM1YmY1ZGIyYWY1YTg4MGZiM2UzODg3ZTE1NzRmMzBiMTEzOWEzNTQ3ZWM4MmY4MzUyZTAzZDNkNWJjZDMyZA=='),
(29, 'miaomiao1', 'OGZiMWEzMDFiODI5NDc3Y2ZhYzc3NDFjMTc1MzNkYmVlODVlYmEzZjAyMDY2NDVhMTU3YmZiMWJhY2NjNzE5Yw=='),
(30, 'miao000', 'OTY0MDIzNDY3OTkwOTU5MjIxMGIwOWQyOGNiOGU0YzA1MWIwYzJkZTkxMDlhMmUwZjk1ZWQwMTI2ZTg3MDIyNw=='),
(31, 'utente10', 'MjQ5N2FiZDdlMDUyZTExYjA1YWNjMzdmYzdiNjllOWYwMGM4NmI1Y2M0Mzk4Zjg5Y2JiZWQ3NDUxMzQ5NWE2OA=='),
(32, '1234', 'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg=='),
(33, 'jewels', 'YmFmZDM2OWNlYjA0Nzk3N2JlOTVhMTliNjgwZDg3M2Q0NGRhZTM1MDBhZjgzNDE3ZTcyNDJlYTJlYTQzZWI3YQ==');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `dati_teams`
--
ALTER TABLE `dati_teams`
  ADD PRIMARY KEY (`id_team`);

--
-- Indici per le tabelle `favouriteteams`
--
ALTER TABLE `favouriteteams`
  ADD PRIMARY KEY (`id_user`,`id_team`),
  ADD KEY `idx_user` (`id_user`);

--
-- Indici per le tabelle `gran_premio`
--
ALTER TABLE `gran_premio`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id_user`,`id_notizia`),
  ADD KEY `idx_user` (`id_user`),
  ADD KEY `idx_notizia` (`id_notizia`);

--
-- Indici per le tabelle `loghi_team_ufficiali`
--
ALTER TABLE `loghi_team_ufficiali`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `login_spoiler`
--
ALTER TABLE `login_spoiler`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `notizie`
--
ALTER TABLE `notizie`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `ordine`
--
ALTER TABLE `ordine`
  ADD PRIMARY KEY (`id_ordine`),
  ADD KEY `id_user` (`id_user`);

--
-- Indici per le tabelle `pilota`
--
ALTER TABLE `pilota`
  ADD PRIMARY KEY (`id_pilota`),
  ADD KEY `id_team` (`id_team`);

--
-- Indici per le tabelle `subordine`
--
ALTER TABLE `subordine`
  ADD PRIMARY KEY (`id_ordine`,`id_prodotto`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `dati_teams`
--
ALTER TABLE `dati_teams`
  MODIFY `id_team` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `notizie`
--
ALTER TABLE `notizie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `pilota`
--
ALTER TABLE `pilota`
  MODIFY `id_pilota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `favouriteteams`
--
ALTER TABLE `favouriteteams`
  ADD CONSTRAINT `favouriteteams_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Limiti per la tabella `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`id_notizia`) REFERENCES `notizie` (`id`);

--
-- Limiti per la tabella `ordine`
--
ALTER TABLE `ordine`
  ADD CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Limiti per la tabella `pilota`
--
ALTER TABLE `pilota`
  ADD CONSTRAINT `pilota_ibfk_1` FOREIGN KEY (`id_team`) REFERENCES `dati_teams` (`id_team`);

--
-- Limiti per la tabella `subordine`
--
ALTER TABLE `subordine`
  ADD CONSTRAINT `subordine_ibfk_1` FOREIGN KEY (`id_ordine`) REFERENCES `ordine` (`id_ordine`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
