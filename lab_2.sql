pkt 1
SELECT pracownik.imie,pracownik.nazwisko,dzial.nazwa 
FROM pracownik 
INNER JOIN dzial ON pracownik.dzial=dzial.id_dzialu;

pkt 2
SELECT towar.nazwa_towaru,kategoria.nazwa_kategori,stan_magazynowy.ilosc FROM towar 
INNER JOIN kategoria ON towar.kategoria=kategoria.id_kategori 
INNER JOIN stan_magazynowy ON towar.id_towaru=stan_magazynowy.towar 
ORDER BY stan_magazynowy.ilosc DESC;

pkt 3
SELECT zamowienie.id_zamowienia, zamowienie.status_zamowienia, status_zamowienia.nazwa_statusu_zamowienia 
FROM zamowienie, status_zamowienia 
WHERE zamowienie.status_zamowienia=status_zamowienia.id_statusu_zamowienia  
AND zamowienie.status_zamowienia=6;

pkt 4
SELECT * FROM klient as k
Join adres_klienta as ak ON k.id_klienta=ak.klient
JOIN typ_adresu as ta ON ak.typ_adresu=ta.id_typu
WHERE miejscowosc="Olsztyn" and ta.nazwa="podstawowy";

pkt 5
SELECT nazwa FROM jednostka_miary as j
LEFT JOIN stan_magazynowy as sm ON j.id_jednostki=sm.jm
WHERE sm.jm is null;

pkt 6
SELECT zamowienie.numer_zamowienia,pozycja_zamowienia.cena,kategoria.nazwa_kategori,pozycja_zamowienia.ilosc 
FROM zamowienie 
INNER JOIN pozycja_zamowienia ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia 
INNER JOIN towar ON towar.id_towaru=pozycja_zamowienia.towar INNER JOIN kategoria ON towar.kategoria=kategoria.id_kategori  
WHERE year(zamowienie.data_zamowienia)=2018; 

pkt 8
SELECT id_zamowienia,data_zamowienia 
FROM zamowienie ORDER BY data_zamowienia Limit 5;

pkt 9
SELECT * FROM zamowienie as z
LEFT JOIN status_zamowienia as sz ON z.status_zamowienia=sz.id_statusu_zamowienia
WHERE nazwa_statusu_zamowienia != "zrealizowane";

pkt 10
SELECT * from adres_klienta WHERE kod NOT LIKE "__-___";


