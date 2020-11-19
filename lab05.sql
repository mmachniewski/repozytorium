Zadanie 1

pkt 1
CREATE TABLE kreatura SELECT * FROM wikingowie.kreatura;
CREATE TABLE zasob SELECT * FROM wikingowie.zasob;
CREATE TABLE ekwipunek SELECT * FROM wikingowie.ekwipunek;

pkt 2
SELECT * FROM zasob;

pkt 3
SELECT * FROM zasob WHERE rodzaj='jedzenie';

pkt 4
SELECT idZasobu, ilosc FROM ekwipunek WHERE idKreatury IN (1,3,5);


Zadanie 2

pkt 1
SELECT * FROM kreatura WHERE rodzaj!='wiedzma' AND udzwig>=50;

pkt 2
SELECT * FROM zasob WHERE waga BETWEEN 2 AND 5;

pkt 3
SELECT * FROM kreatura where nazwa like "%or%" AND udzwig between 30 AND 70;


Zadanie 3

pkt 1
SELECT * FROM zasob WHERE month (dataPozyskania) IN (7,8);

pkt 2
SELECT * FROM zasob WHERE rodzaj != '' ORDER BY waga ASC;

pkt 3
SELECT * FROM kreatura ORDER BY dataUr limit 5;


Zadanie 4

pkt 1
SELECT DISTINCT rodzaj from zasob;

pkt 2
SELECT CONCAT(nazwa," - ",rodzaj) AS nazwa_rodzaj from kreatura WHERE rodzaj LIKE "wi%";

pkt 3
SELECT nazwa, ilosc*waga AS waga FROM zasob WHERE YEAR(dataPozyskania) BETWEEN 2000 AND 2007;


Zadanie 5

pkt 1
SELECT nazwa, (ilosc * waga)*0.7 as waga FROM zasob WHERE rodzaj='jedzenie';

pkt 2
SELECT * FROM zasob WHERE rodzaj IS NULL;

pkt 3
Raczej tak: SELECT distinct rodzaj, nazwa FROM zasob WHERE nazwa LIKE 'Ba%' OR nazwa LIKE '%os' ORDER BY rodzaj;