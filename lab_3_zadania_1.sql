
pkt 1
SELECT imie, nazwisko, data_urodzenia FROM pracownik;

pkt 2
SELECT imie, nazwisko, TIMESTAMPDIFF(YEAR, data_urodzenia, CURDATE()) 
AS wiek FROM pracownik;

pkt 3
SELECT d.nazwa, COUNT(p.id_pracownika) FROM dzial AS d
JOIN pracownik AS p ON p.dzial=d.id_dzialu
GROUP BY d.nazwa;

pkt 4 
SELECT kategoria.nazwa_kategori,COUNT(DISTINCT(towar.nazwa_towaru)) FROM kategoria 
 JOIN towar ON towar.kategoria=kategoria.id_kategori INNER JOIN stan_magazynowy
 WHERE towar.kategoria=id_kategori Group by id_kategori ;

pkt 5
SELECT CONCAT(kategoria.nazwa_kategori,'-',towar.nazwa_towaru) FROM kategoria 
INNER JOIN towar ON towar.kategoria=kategoria.id_kategori  
WHERE towar.kategoria=id_kategori  ;

pkt 6
SELECT ROUND( AVG(pensja),2 ) FROM pracownik;

pkt 7
SELECT id_pracownika, AVG(pensja), TIMESTAMPDIFF(YEAR, data_zatrudnienia, CURDATE()) 
AS staz 
FROM pracownik
WHERE TIMESTAMPDIFF(YEAR, data_zatrudnienia, CURDATE()) > 5
GROUP BY id_pracownika;

pkt 8
SELECT towar.nazwa_towaru,COUNT(pozycja_zamowienia.towar)
FROM pozycja_zamowienia inner JOIN towar on pozycja_zamowienia.towar=towar.id_towaru 
GROUP BY towar.id_towaru
ORDER BY COUNT(pozycja_zamowienia.towar) DESC LIMIT 10;

pkt 9
SELECT z.numer_zamowienia, sum(pz.ilosc*pz.cena) as wartosc
from zamowienie z, pozycja_zamowienia pz
where z.id_zamowienia=pz.zamowienie
and year(z.data_zamowienia)=2017 and quarter(z.data_zamowienia)=1
group by z.numer_zamowienia;

pkt 10
SELECT p.imie, p.nazwisko, sum(pz.ilosc*pz.cena) as Suma
from zamowienie z, pozycja_zamowienia pz, pracownik p
where z.id_zamowienia=pz.zamowienie
and p.id_pracownika = z.pracownik_id_pracownika
group by p.id_pracownika
order by Suma desc;