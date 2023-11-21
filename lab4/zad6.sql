-- Active: 1700331533909@@127.0.0.1@5432@firma@ksiegowosc
--a)
/*SELECT id_pracownika, nazwisko
FROM ksiegowosc.pracownicy*/
--b)
/*SELECT p.id_pracownika
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensje pe ON w.id_pensji = pe.id_pensji
WHERE pe.kwota > 1000;*/
--c)
/*SELECT p.id_pracownika
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.premie pr ON w.id_premii = pr.id_premii
JOIN ksiegowosc.pensje pe ON w.id_pensji = pe.id_pensji
WHERE pr.id_premii IS NULL AND pe.kwota > 2000;*/
--d)
/*SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
WHERE p.imie LIKE 'J%';*/
--e)
/*SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
WHERE p.nazwisko LIKE 'n%' AND p.imie LIKE '%a';*/
--f)
/*SELECT p.imie, p.nazwisko, SUM(g.liczba_godzin - 160) AS nadgodziny
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.godziny g ON p.id_pracownika = g.id_pracownika
GROUP BY p.imie, p.nazwisko;*/
--g)
/*SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensje pe ON w.id_pensji = pe.id_pensji
WHERE pe.kwota BETWEEN 1500 AND 3000;*/
--h)
/*SELECT p.imie, p.nazwisko
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.godziny g ON p.id_pracownika = g.id_pracownika
LEFT JOIN ksiegowosc.premie pr ON w.id_premii = pr.id_premii
WHERE g.liczba_godzin > 160 AND pr.id_premii IS NULL;*/
--i)
SELECT p.imie, p.nazwisko, pe.kwota AS pensja
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensje pe ON w.id_pensji = pe.id_pensji
ORDER BY pe.kwota;
--j)
SELECT p.imie, p.nazwisko, pe.kwota AS pensja, pr.kwota AS premia
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensje pe ON w.id_pensji = pe.id_pensji
LEFT JOIN ksiegowosc.premie pr ON w.id_premii = pr.id_premii
ORDER BY pe.kwota DESC, pr.kwota DESC;
--k)
SELECT stanowisko, COUNT(*) AS liczba_pracownikow
FROM ksiegowosc.pensje
GROUP BY stanowisko;
--l)
SELECT
    AVG(kwota) AS srednia_placa,
    MIN(kwota) AS minimalna_placa,
    MAX(kwota) AS maksymalna_placa
FROM ksiegowosc.pensje
WHERE stanowisko = 'kierownik';
--m)
SELECT SUM(pensje.kwota) AS suma_wynagrodzen
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji;
--n)
SELECT stanowisko, SUM(kwota) AS suma_wynagrodzen
FROM ksiegowosc.pensje
GROUP BY stanowisko;
--o)
SELECT p.stanowisko, COUNT(pr.id_premii) AS liczba_premii
FROM pensje p
JOIN wynagrodzenie w ON p.id_pensji = w.id_pensji
LEFT JOIN premie pr ON w.id_premii = pr.id_premii
GROUP BY p.stanowisko;
--p)
DELETE FROM pracownicy
WHERE id_pracownika IN (
    SELECT w.id_pracownika
    FROM wynagrodzenie w
    JOIN pensje p ON w.id_pensji = p.id_pensji
    WHERE p.kwota < 1200
);