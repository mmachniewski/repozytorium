lab 07

pkt 1
CREATE TABLE uczestnicy SELECT * FROM wikingowie.uczestnicy;
CREATE TABLE etapy_wyprawy SELECT * FROM wikingowie.etapy_wyprawy;
CREATE TABLE wyprawa SELECT * FROM wikingowie.wyprawa;

pkt 2
SELECT kreatura.nazwa ,uczestnicy.id_uczestnika 
FROM kreatura LEFT JOIN uczestnicy ON uczestnicy.id_uczestnika=kreatura.Idkreatury 
WHERE uczestnicy.id_uczestnika IS NULL;

pkt 3
SELECT w.nazwa, SUM(k.udzwig) FROM wyprawa AS w
INNER JOIN uczestnicy AS u ON u.id_wyprawy=w.id_wyprawy
INNER JOIN kreatura AS k ON u.id_uczestnika=k.Idkreatury
GROUP BY w.nazwa;

Zadanie 2
use wikingowie;
select rodzaj, group_concat(nazwa) from kreatura group by rodzaj;
select rodzaj, group_concat(nazwa SEPARATOR "--") from kreatura groupby rodzaj;

pkt 1
SELECT wyprawa.nazwa, COUNT(uczestnicy.id_uczestnika), GROUP_CONCAT(kreatura.nazwa) FROM kreatura, wyprawa, uczestnicy WHERE kreatura.Idkreatury = uczestnicy.id_uczestnika AND wyprawa.id_wyprawy = uczestnicy.id_wyprawy GROUP BY wyprawa.nazwa;

pkt 2
SELECT sektor.nazwa, COUNT(etapy_wyprawy.idWyprawy) FROM sektor LEFT JOIN etapy_wyprawy ON etapy_wyprawy.sektor=sektor.id_sektora GROUP BY sektor.nazwa;

Zadanie 3

pkt 1
SELECT sektor.nazwa,COUNT(etapy_wyprawy.sektor) AS ilosc_odwiedzin FROM sektor LEFT JOIN etapy_wyprawy ON sektor.id_sektora=etapy_wyprawy.sektor GROUP BY sektor.nazwa ;

pkt 2
SELECT DISTINCT(kreatura.nazwa),IF(uczestnicy.id_wyprawy IS NULL,"Nie bral udzialu w wyprawie","bral udzialu w wyprawie") FROM kreatura LEFT JOIN uczestnicy ON kreatura.Idkreatury=uczestnicy.id_uczestnika   ORDER BY kreatura.nazwa;