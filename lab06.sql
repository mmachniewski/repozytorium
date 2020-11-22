Zadanie 1

pkt 1
SELECT AVG(waga) FROM kreatura WHERE rodzaj='wiking';

pkt 2
SELECT rodzaj, count(nazwa) FROM kreatura GROUP BY rodzaj;

pkt 3
SELECT ROUND(2020-avg(YEAR(dataUr)),0) as wiek, rodzaj FROM kreatura GROUP BY rodzaj;


Zadanie 2
 
pkt 1
SELECT SUM(waga) from zasob group by rodzaj;

pkt 2
SELECT nazwa, AVG(waga) FROM zasob GROUP BY nazwa HAVING SUM(waga) > 10 AND SUM(ilosc) >= 4;

pkt 3
SELECT COUNT(DISTINCT(nazwa)),rodzaj FROM zasob where ilosc>1 GROUP BY rodzaj;



Zadanie 3

pkt 1 
SELECT kreatura.nazwa, SUM(ekwipunek.ilosc) FROM kreatura,ekwipunek WHERE kreatura.Idkreatury=ekwipunek.Idkreatury GROUP BY nazwa;
lub 
SELECT kreatura.nazwa, SUM(ekwipunek.ilosc) FROM kreatura INNER JOIN ekwipunek ON kreatura.Idkreatury=ekwipunek.Idkreatury GROUP BY nazwa;

pkt 2
SELECT kreatura.nazwa,zasob.nazwa FROM kreatura,ekwipunek,zasob WHERE kreatura.Idkreatury=ekwipunek.Idkreatury AND ekwipunek.idzasobu=zasob.idzasobu ORDER BY kreatura.nazwa;
lub
SELECT kreatura.nazwa,zasob.nazwa FROM kreatura INNER JOIN ekwipunek ON kreatura.Idkreatury=ekwipunek.Idkreatury  INNER JOIN zasob ON ekwipunek.idzasobu=zasob.idzasobu ORDER BY kreatura.nazwa;



