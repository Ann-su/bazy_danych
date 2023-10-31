--5
SELECT nazwisko, adres
FROM rozliczenia.pracownicy;
--6
SELECT
    DATE_PART('dow', data) AS dzien_tygodnia,
    DATE_PART('month', data) AS miesiac
FROM rozliczenia.godziny;

--7
ALTER TABLE rozliczenia.pensje
RENAME COLUMN kwota TO kwota_brutto;
ALTER TABLE rozliczenia.pensje
ADD COLUMN kwota_netto double precision;
UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto * 0.785;


