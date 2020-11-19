#Zadanie 1

a)
SELECT * FROM postac ORDER BY data_ur;

SELECT * FROM postac WHERE rodzaj='wiking' ORDER BY data_ur ASC;

DELETE FROM postac WHERE id_postaci=5;
DELETE FROM postac WHERE id_postaci=8;

b)
ALTER TABLE postac DROP PRIMARY KEY;
ALTER TABLE postac MODIFY id_postaci INT;

SHOW CREATE TABLE walizka;
ALTER TABLE walizka DROP FOREIGN KEY walizka_ibfk_1;

ALTER TABLE postac MODIFY id_postaci INT;
ALTER TABLE postac DROP PRIMARY KEY;
SHOW CREATE TABLE postac;


#Zadanie 2

a)
SELECT * FROM postac;
ALTER TABLE postac ADD COLUMN pesel VARCHAR(11);
UPDATE postac SET pesel='66654328908'+id_postaci;
ALTER TABLE postac ADD PRIMARY KEY(pesel)

b)
ALTER TABLE postac MODIFY rodzaj ENUM('wiking', 'ptak','kobieta', 'syrena');

c)
SELECT * FROM postac;
INSERT INTO postac(id_postaci, nazwa, rodzaj, data_ur, wiek, pesel) VALUES
(8,'Gertruda Nieszczera', 'syrena', '1866-02-24', 111, '66654328916');


#Zadanie 3

a)
UPDATE postac SET statek='Valkyria' WHERE nazwa LIKE '%a%';

b)
UPDATE statek SET max_ladownosc=max_ladownosc*0.7 WHERE data_wodowania >= '1901-01-01' AND data_wodowania <= '2000-12-31';

c)
ALTER TABLE postac ADD CHECK(wiek<=1000);


#Zadanie 4

a)
SELECT * FROM postac;
ALTER TABLE postac MODIFY rodzaj ENUM('wiking','kobieta','ptak','syrena','waz');
INSERT INTO postac(id_postaci,nazwa, rodzaj, data_ur, wiek, pesel) VALUES (10,'Loko', 'waz', '1879-07-18', 78, '66654328917');
SELECT * FROM postac;

b)
CREATE TABLE Marynarz SELECT * FROM postac;
CREATE TABLE Marynarz2 LIKE postac;


#Zadanie 5

a)
DELETE FROM postac WHERE nazwa='Njord';

b)
SELECT* FROM statek;
DELETE FROM statek WHERE nazwa_statku= 'Valkyria';
DELETE FROM statek WHERE nazwa_statku= 'Odyn';

c)
DROP TABLE statek;

d)
CREATE TABLE zwierz(id_zwierza INT PRIMARY KEY AUTO_INCREMENT,nazwa VARCHAR(45),wiek INT);

e)
SELECT id_postaci, nazwa, wiek FROM postac;
INSERT INTO zwierz(id_zwierza, nazwa, wiek) SELECT id_postaci, nazwa, wiek FROM postac WHERE rodzaj='ptak';

