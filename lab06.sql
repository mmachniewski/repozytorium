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


Zadanie 4
select  * from ekwipunek natural join zasob;
select * from kreatura natural join ekwipunek;
select *, ekwipunek.idKreatury from kreatura natural join ekwipunek;

pkt 1
SELECT kreatura.nazwa,zasob.nazwa FROM kreatura
NATURAL JOIN ekwipunek
INNER join zasob ON zasob.idzasobu = ekwipunek.idzasobu
WHERE YEAR(kreatura.dataUr) BETWEEN 1670 AND 1679 AND kreatura.rodzaj = 'wiking';


pkt 2
SELECT k.nazwa, e.idZasobu, z.nazwa, k.dataUr FROM kreatura AS k
NATURAL JOIN ekwipunek AS e
JOIN zasob z ON e.idZasobu=z.idZasobu
WHERE z.rodzaj = 'jedzenie'
ORDER BY dataUr DESC
LIMIT 5;

pkt 3
SELECT CONCAT(tabk1.nazwa, " - ", tabk2.nazwa) FROM kreatura AS tabk1, kreatura AS tabk2
WHERE tabk1.idKreatury - tabk2.idKreatury=5;


Zadanie 5
pkt 1
SELECT k.rodzaj, AVG(e.ilosc*z.waga), SUM(e.ilosc) FROM kreatura AS k, ekwipunek AS e, zasob AS z
WHERE k.idKreatury=e.idKreatury AND e.idZasobu=z.idZasobu AND k.rodzaj NOT IN ('malpa','waz')
GROUP BY rodzaj HAVING SUM(e.ilosc) < 30;

pkt 2
SELECT a.nazwa, a.rodzaj, a.dataUr FROM kreatura a, (SELECT MIN(dataUr) MIN, MAX(dataUr) MAX FROM kreatura GROUP BY rodzaj) b WHERE b.min = a.dataUr OR b.max=a.dataUr;


