Zadanie 1

pkt 1
DELIMITER //
CREATE TRIGGER kreatura_before_insert
BEFORE INSERT ON kreatura
FOR EACH ROW
BEGIN
IF NEW.waga > 0
THEN
SET NEW.waga = 0;
END IF;
END
//
DELIMITER ;

Zadanie 2
pkt 1
CREATE TABLE archiwum_wypraw (
id_wyprawy INT(6) PRIMARY KEY AUTO_INCREMENT,
nazwa VARCHAR(45),
data_rozpoczecia DATE,
data_zakonczenia DATE,
kierownik VARCHAR(45)
)

pkt 2
DELIMITER //
CREATE TRIGGER wyprawa_before_delete
BEFORE DELETE ON wyprawa
FOR EACH ROW
BEGIN
INSERT INTO archiwum_wypraw
SELECT w.id_wyprawy,w.nazwa,w.data_rozpoczecia,w.data_zakonczenia,k.nazwa
FROM wyprawa AS w JOIN kreatura AS k ON w.kierownik=k.idKreatury
WHERE w.id_wyprawy=old.id_wyprawy;
END
//
DELIMITER ;

Zadanie 3
pkt 1
DELIMITER \\
CREATE PROCEDURE eliksir_sily(IN id int)
BEGIN
UPDATE kreatura SET udzwig = 1.2 * udzwig WHERE idKreatury = id;
END
\\
DELIMITER ;

pkt 2
DELIMITER $$
CREATE FUNCTION wielka(tekst varchar(100))
RETURNS varchar(100)
BEGIN
DECLARE duze VARCHAR(100);
SELECT UPPER(tekst) into @duze;
RETURN @duze;
END 
$$
DELIMITER ;

Zadanie 4
pkt 1
CREATE TABLE system_alarmowy (
id_wyprawy INT(6),
wiadomosc VARCHAR(45)
)

pkt 2
DELIMITER $$
CREATE TRIGGER sprawdz_tesciowa
AFTER INSERT ON wyprawa
FOR EACH ROW
BEGIN
DECLARE zmienna INT;
SELECT count(*) INTO zmienna
FROM etapy_wyprawy AS e, kreatura AS k, wyprawa AS w, uczestnicy AS u
WHERE e.idWyprawy=w.id_wyprawy AND k.idKreatury=u.id_uczestnika
AND u.id_wyprawy=w.id_wyprawy
AND k.nazwa='Tesciowa' AND e.sektor=7
AND w.id_wyprawy=NEW.id_wyprawy;
IF zmienna > 0
THEN
INSERT INTO system_alarmowy VALUES(DEFAULT, 'Tesciowa nadchodzi !!!');
END IF;
END
$$
DELIMITER;

Zadanie 5

pkt 1
DELIMITER $$

CREATE PROCEDURE srednia_itp(
OUT srednia FLOAT,
OUT suma FLOAT,
OUT maks FLOAT)
BEGIN
SELECT avg(udzwig), sum(udzwig), max(udzwig)
INTO srednia, suma, maks FROM kreatura;
END
$$

DELIMITER ;