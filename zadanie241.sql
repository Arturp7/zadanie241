-- 1.Tworzy tabelę pracownik(imie, nazwisko, wyplata, data urodzenia, stanowisko)
CREATE TABLE pracownik(
id BIGINT auto_increment PRIMARY KEY,
imie VARCHAR(50),
nazwisko VARCHAR(50),
wyplata BIGINT,
data_urodzenia DATE,
stanowisko VARCHAR(50)
);

-- 2.Wstawia do tabeli co najmniej 6 pracowników
INSERT INTO `zadanie241`.`pracownik` (`imie`, `nazwisko`, `wyplata`, `data_urodzenia`, `stanowisko`) VALUES ('Paweł', 'Nowak', '8000', '1975-02-01', 'developer');
INSERT INTO `zadanie241`.`pracownik` (`imie`, `nazwisko`, `wyplata`, `data_urodzenia`, `stanowisko`) VALUES ('Kasia', 'Kowalska', '5000', '2005-01-31', 'tester');
INSERT INTO `zadanie241`.`pracownik` (`imie`, `nazwisko`, `wyplata`, `data_urodzenia`, `stanowisko`) VALUES ('Tomasz', 'Kwiatkowski', '6000', '1990-03-25', 'analityk');
INSERT INTO `zadanie241`.`pracownik` (`imie`, `nazwisko`, `wyplata`, `data_urodzenia`, `stanowisko`) VALUES ('Dorota', 'Majchrzak', '5000', '1985-05-20', 'developer');
INSERT INTO `zadanie241`.`pracownik` (`imie`, `nazwisko`, `wyplata`, `data_urodzenia`, `stanowisko`) VALUES ('Olaf', 'Kowalski', '7000', '1985-08-20', 'tester automatyzujący');
INSERT INTO `zadanie241`.`pracownik` (`imie`, `nazwisko`, `wyplata`, `data_urodzenia`, `stanowisko`) VALUES ('Paweł', 'Nowak', '9500', '1980-06-25', 'kierownik projektu');

-- 3.Pobiera wszystkich pracowników i wyświetla ich w kolejności alfabetycznej po nazwisku
SELECT  *  from pracownik ORDER BY nazwisko ;

-- 4.Pobiera pracowników na wybranym stanowisku
SELECT * from pracownik WHERE stanowisko = 'developer'; 

-- 5.Pobiera pracowników, którzy mają co najmniej 30 lat
 -- SELECT * from pracownik WHERE DATEDIFF(EXTRACT(YEAR FROM CURDATE()), EXTRACT(YEAR FROM data_urodzenia)) >= 30 ; -- !!!!!!!! NIE działa
  SELECT * from pracownik WHERE DATEDIFF(CURDATE(), data_urodzenia) >= 30 ; -- !!!!!!!!

-- 6.Zwiększa wypłatę pracowników na wybranym stanowisku o 10%
UPDATE pracownik SET wyplata = wyplata*1.1
WHERE stanowisko  = 'developer';

-- 7.Usuwa najmłodszego pracownika 
Delete   FROM pracownik order by data_urodzenia DESC Limit 1;
	

-- 8.Usuwa tabelę pracownik
DROP TABLE pracownik;

-- 9.Tworzy tabelę stanowisko (nazwa stanowiska, opis, wypłata na danym stanowisku)
CREATE TABLE stanowisko(
id_stanowisko BIGINT auto_increment PRIMARY KEY,
nazwa VARCHAR(50),
opis VARCHAR(150),
wyplata BIGINT
);

-- 10.Tworzy tabelę adres (ulica+numer domu/mieszkania, kod pocztowy, miejscowość)
CREATE TABLE adres(
id_adres BIGINT auto_increment PRIMARY KEY,
ulica VARCHAR(50),
nr_domu VARCHAR(50),
kod_pocztowy VARCHAR(50),
miejscowosc VARCHAR(50)
);

-- 11.Tworzy tabelę pracownik (imię, nazwisko) + relacje do tabeli stanowisko i adres
CREATE TABLE pracownik(
id_pracownik BIGINT auto_increment PRIMARY KEY,
imie VARCHAR(50),
nazwisko VARCHAR(50),
id_adres BIGINT,
id_stanowisko BIGINT
);

-- 12.Dodaje dane testowe (w taki sposób, aby powstały pomiędzy nimi sensowne powiązania)
INSERT INTO `zadanie241`.`adres` (`ulica`, `nr_domu`, `kod_pocztowy`, `miejscowosc`) VALUES ('Marsa', '17', '59-220', 'Legnica');
INSERT INTO `zadanie241`.`adres` (`ulica`, `nr_domu`, `kod_pocztowy`, `miejscowosc`) VALUES ('Sunset', '15', '90210', 'California');
INSERT INTO `zadanie241`.`adres` (`ulica`, `nr_domu`, `kod_pocztowy`, `miejscowosc`) VALUES ('Janczarska', '3', '59-241', 'Jawor');

INSERT INTO `zadanie241`.`stanowisko` (`nazwa`, `opis`, `wyplata`) VALUES ('tester', 'testuje soft', '5000');
INSERT INTO `zadanie241`.`stanowisko` (`nazwa`, `opis`, `wyplata`) VALUES ('szef', 'liczy pieniądze ', '50000');
INSERT INTO `zadanie241`.`stanowisko` (`nazwa`, `opis`, `wyplata`) VALUES ('developer', 'pisze soft ', '9000');

INSERT INTO `zadanie241`.`pracownik` (`imie`, `nazwisko`, `id_adres`, `id_stanowisko`) VALUES ('Artur', 'Przyjemski', '1', '2');
INSERT INTO `zadanie241`.`pracownik` (`imie`, `nazwisko`, `id_adres`, `id_stanowisko`) VALUES ('Bill', 'Gates', '2', '3');
INSERT INTO `zadanie241`.`pracownik` (`imie`, `nazwisko`, `id_adres`, `id_stanowisko`) VALUES ('Adam ', 'Kowalski', '3', '1');

-- 13.Pobiera pełne informacje o pracowniku (imię, nazwisko, adres, stanowisko)
SELECT *  from pracownik p  JOIN stanowisko s JOIN adres a ON p.id_pracownik=s.id_stanowisko AND p.id_pracownik = a.id_adres;


-- 14.Oblicza sumę wypłat dla wszystkich pracowników w firmie, 
Select sum(wyplata)as suma_wyplat from stanowisko;


-- 15.Pobiera pracowników mieszkających w lokalizacji z kodem pocztowym 90210
Select * from pracownik p 
JOIN adres a on p.id_pracownik = a.id_adres
where kod_pocztowy = '90210';










