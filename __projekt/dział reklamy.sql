CREATE TABLE `Reklama` (
  `idReklamy` int NOT NULL,
  `rodzaj_reklamy` varchar(45) DEFAULT NULL,
  `data_emisji` date DEFAULT NULL,
  `idklient` int DEFAULT NULL,
  `idpoprawki` int DEFAULT NULL,
  `idpracownika` int DEFAULT NULL,
  PRIMARY KEY (`idReklamy`),
  KEY `zleca` (`idklient`),
  KEY `sa` (`idpoprawki`),
  KEY `tworza` (`idpracownika`),
  CONSTRAINT `sa` FOREIGN KEY (`idpoprawki`) REFERENCES `poprawki` (`idpoprawki`),
  CONSTRAINT `tworza` FOREIGN KEY (`idpracownika`) REFERENCES `pracownicy` (`idpracownika`),
  CONSTRAINT `zleca` FOREIGN KEY (`idklient`) REFERENCES `klient` (`idklient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `pracownicy` (
  `idpracownika` int NOT NULL,
  `Imie` varchar(45) DEFAULT NULL,
  `Nazwisko` varchar(45) DEFAULT NULL,
  `Pesel` varchar(11) DEFAULT NULL,
  `Adres` varchar(45) DEFAULT NULL,
  `wynagrodzenie` decimal(10,2) DEFAULT NULL,
  `data_zatrudnienia` datetime DEFAULT NULL,
  `idKierownik` int DEFAULT NULL,
  PRIMARY KEY (`idpracownika`),
  KEY `zarzadza` (`idKierownik`),
  CONSTRAINT `zarzadza` FOREIGN KEY (`idKierownik`) REFERENCES `Kierownik` (`idKierownik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `klient` (
  `idklient` int NOT NULL,
  `imie` varchar(45) DEFAULT NULL,
  `nazwisko` varchar(45) DEFAULT NULL,
  `nr_telefonu` char(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `adres` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idklient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `poprawki` (
  `idpoprawki` int NOT NULL,
  `data_zgloszenia` date DEFAULT NULL,
  `ilosc_poprawek` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpoprawki`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



CREATE TABLE `Kierownik` (
  `idKierownik` int NOT NULL,
  `Imie` varchar(45) DEFAULT NULL,
  `Nazwisko` varchar(45) DEFAULT NULL,
  `Pesel` varchar(11) DEFAULT NULL,
  `nr_telefonu` char(11) DEFAULT NULL,
  `adres` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idKierownik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


DELIMITER //
CREATE DEFINER=`machniewskim`@`localhost` TRIGGER `data_zatrudnienia` BEFORE INSERT ON `pracownicy`
FOR EACH ROW 
BEGIN
	SET NEW.data_zatrudnienia = now();
END
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`machniewskim`@`localhost` TRIGGER `placa_min` AFTER INSERT ON `pracownicy` 
FOR EACH ROW 
BEGIN
IF pracownicy.wynagrodzenie<3500 THEN
UPDATE pracownicy SET wynagrodzenie=3700;
END IF;
END
//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`machniewskim`@`localhost` FUNCTION `ilosc_pracownikow`()
 RETURNS int
BEGIN 
	DECLARE ilosc INT;
	SELECT COUNT(*) INTO @ilosc FROM pracownicy;
	RETURN @ilosc;
END
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`machniewskim`@`localhost` PROCEDURE `podwyzka`(IN id int)
BEGIN
Update pracownicy set wynagrodzenie = 1.3 * wynagrodzenie where id_pracownika = id;
END
//
DELIMITER ;