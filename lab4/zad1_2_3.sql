CREATE SCHEMA IF NOT EXISTS ksiegowosc;

CREATE TABLE IF NOT EXISTS ksiegowosc.pracownicy (
    id_pracownika SERIAL PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    adres VARCHAR(100),
    telefon VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS ksiegowosc.godziny (
    id_godziny SERIAL PRIMARY KEY,
    data DATE,
    liczba_godzin INTEGER,
    id_pracownika INTEGER REFERENCES ksiegowosc.pracownicy(id_pracownika)
);

CREATE TABLE IF NOT EXISTS ksiegowosc.pensje (
    id_pensji SERIAL PRIMARY KEY,
    stanowisko VARCHAR(50),
    kwota DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS ksiegowosc.premie (
    id_premii SERIAL PRIMARY KEY,
    rodzaj VARCHAR(50),
    kwota DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS ksiegowosc.wynagrodzenie (
    id_wynagrodzenia SERIAL PRIMARY KEY,
    data DATE,
    id_pracownika INTEGER REFERENCES ksiegowosc.pracownicy(id_pracownika),
    id_godziny INTEGER REFERENCES ksiegowosc.godziny(id_godziny),
    id_pensji INTEGER REFERENCES ksiegowosc.pensje(id_pensji),
    id_premii INTEGER REFERENCES ksiegowosc.premie(id_premii)
);