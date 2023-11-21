INSERT INTO ksiegowosc.pracownicy (imie, nazwisko, adres, telefon) VALUES
    ('Jan', 'Kowalski', 'ul. Kwiatowa 1', '123-456-7890'),
    ('Anna', 'Nowak', 'ul. Ogrodowa 2', '987-654-3210'),
    ('Piotr', 'Lis', 'ul. Leśna 3', '111-222-3333'),
    ('Katarzyna', 'Zając', 'ul. Polna 4', '444-555-6666'),
    ('Marek', 'Sowa', 'ul. Słowiańska 5', '777-888-9999'),
    ('Ewa', 'Wilk', 'ul. Wilcza 6', '222-333-4444'),
    ('Grzegorz', 'Orzeł', 'ul. Orężna 7', '555-666-7777'),
    ('Alicja', 'Rybka', 'ul. Rybna 8', '888-999-0000'),
    ('Tomasz', 'Jeleń', 'ul. Jelenia 9', '333-444-5555'),
    ('Karolina', 'Kruk', 'ul. Kruka 10', '000-111-2222');

INSERT INTO ksiegowosc.godziny (data, liczba_godzin, id_pracownika) VALUES
    ('2023-01-01', 8, 1),
    ('2023-01-02', 7, 2),
    ('2023-01-03', 6, 3),
    ('2023-01-04', 8, 4),
    ('2023-01-05', 9, 5),
    ('2023-01-06', 7, 6),
    ('2023-01-07', 8, 7),
    ('2023-01-08', 6, 8),
    ('2023-01-09', 9, 9),
    ('2023-01-10', 7, 10);

INSERT INTO ksiegowosc.pensje (stanowisko, kwota) VALUES
    ('Manager', 10000.00),
    ('Programista', 8000.00),
    ('Księgowy', 7000.00),
    ('Specjalista ds. marketingu', 9000.00),
    ('Analityk', 8500.00),
    ('Doradca klienta', 7500.00),
    ('Projektant', 8200.00),
    ('Administrator sieci', 8800.00),
    ('Tester', 7800.00),
    ('Asystent', 7000.00);

INSERT INTO ksiegowosc.premie (rodzaj, kwota) VALUES
    ('Premia roczna', 2000.00),
    ('Premia za wyniki', 1500.00),
    ('Premia świąteczna', 1000.00),
    ('Premia specjalna', 1200.00),
    ('Premia za efektywność', 1800.00),
    ('Premia jubileuszowa', 2500.00),
    ('Premia motywacyjna', 1600.00),
    ('Premia za staż', 1300.00),
    ('Premia uznaniowa', 1100.00),
    ('Premia dodatkowa', 1400.00);

-- Wypełnij tabelę wynagrodzenie
INSERT INTO ksiegowosc.wynagrodzenie (data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES
    ('2023-01-01', 1, 1, 1, 2),
    ('2023-01-02', 2, 2, 2, 3),
    ('2023-01-03', 3, 3, 3, 4),
    ('2023-01-04', 4, 4, 4, 5),
    ('2023-01-05', 5, 5, 5, 6),
    ('2023-01-06', 6, 6, 6, 7),
    ('2023-01-07', 7, 7, 7, 8),
    ('2023-01-08', 8, 8, 8, 9),
    ('2023-01-09', 9, 9, 9, 10),
    ('2023-01-10', 10, 10, 10, 1);
