--a)
UPDATE pracownicy
SET telefon = CONCAT('(+48) ', telefon)
WHERE telefon IS NOT NULL;
--b)
UPDATE pracownicy
SET telefon = CONCAT(
    SUBSTRING(telefon, 1, 6),
    ' ',
    SUBSTRING(telefon, 7, 3),
    '-',
    SUBSTRING(telefon, 10, 3),
    '-',
    SUBSTRING(telefon, 13, 3)
)
WHERE telefon IS NOT NULL AND LENGTH(telefon) = 15;
--c)
SELECT 
    id_pracownika, 
    UPPER(imie) AS imie, 
    UPPER(nazwisko) AS nazwisko, 
    UPPER(adres) AS adres, 
    telefon
FROM pracownicy
ORDER BY LENGTH(nazwisko) DESC
LIMIT 1;
--d)
SELECT 
    p.id_pracownika, 
    p.imie, 
    p.nazwisko, 
    MD5(CONCAT(p.imie, p.nazwisko, pe.kwota)) AS zakodowana_pensja
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensje pe ON w.id_pensji = pe.id_pensji

SELECT
    p.id_pracownika, 
    p.imie, 
    p.nazwisko, 
    pe.kwota AS pensja, 
    pr.kwota AS premia
FROM ksiegowosc.pracownicy p
LEFT JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.pensje pe ON w.id_pensji = pe.id_pensji
LEFT JOIN ksiegowosc.premie pr ON w.id_premii = pr.id_premii
