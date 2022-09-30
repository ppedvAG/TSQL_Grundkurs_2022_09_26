USE Northwind;

--CREATE TABLE <Name> (<Spalte1> <Typ>, ...)
CREATE TABLE Test
(
	--primary key: Primärschlüssel, eindeutige Spalte, kann nicht null sein, häufig IDs, mehrere Primärschlüssel möglich (kombinierter Schlüssel)
	--identity: Erhöht die Spalte automatisch um 1 wenn ein neuer Wert geschrieben wird
	--identity(<Startwert>, <Inkrement>): Starte bei <Startwert>, erhöhe um <Inkrement>, identity(5, 3) -> 5, 8, 11, 14, 17, ...
	ID int primary key identity, --(5, 3)
	Vorname nvarchar(20),
	Nachname nvarchar(20) not null --Es muss bei jedem Datensatz ein Wert enthalten sein
);

--------------------------------------------------------------------------------------------

--INSERT INTO <Tabelle> VALUES (<Wert1>, <Wert2>, ...), (<Wert1>, <Wert2>, ...)
INSERT INTO Test VALUES
('Max', 'Muster')

--Mehrere Datensätze gleichzeitig einfügen
INSERT INTO Test VALUES
('Max', 'Muster'),
('Test', 'Test')

--Nur bestimmte Spalten in die Tabelle schreiben
INSERT INTO Customers (CustomerID, CompanyName, ContactName) VALUES
('PPEDV', 'PPEDV', 'Eine Person')

--Nicht möglich, da Nachname NOT NULL
INSERT INTO Test VALUES
('Max', NULL)
GO

CREATE PROC p_Test
AS
	SELECT FirstName, LastName FROM Employees;
GO

--Ergebnisse einer Prozedur in eine Tabelle schreiben
INSERT INTO Test
EXEC p_Test;

--Ergebnisse von SELECT direkt in eine Tabelle schreiben
INSERT INTO Test
SELECT FirstName, LastName FROM Employees;

--SELECT INTO: Ergebnis einer SELECT Abfrage in eine NEUE Tabelle schreiben
SELECT FirstName, LastName INTO Test
FROM Employees; --funktioniert nicht, da Test bereits existiert

--------------------------------------------------------------------------------------------

--UPDATE <Name> SET <Spaltenname> = <Wert>
UPDATE Test SET Nachname = 'Test';

--WHERE unbedingt verwenden um nicht alle Daten zu verändern
UPDATE Test SET Nachname = 'Test2'
WHERE ID BETWEEN 5 AND 10;

--Spalte kann nach dem = verwendet werden
UPDATE Test SET Nachname = REPLICATE(Nachname, 5);

--------------------------------------------------------------------------------------------

--CREATE SEQUENCE <Name> AS <Typ>
--Standardmäßig (1, 1)
CREATE SEQUENCE TestSeq AS INT;

--CREATE SEQUENCE <Name> AS <Typ>
--START WITH <Start> INCREMENT BY <Increment>
CREATE SEQUENCE TestSeq AS INT
START WITH 230000
INCREMENT BY 1;

--Nächsten Wert aus der Sequenz entnehmen
SELECT NEXT VALUE FOR TestSeq;

--Bei INSERT nächsten Wert abrufen
INSERT INTO Test VALUES
(CONVERT(varchar(20), NEXT VALUE FOR TestSeq), 'Test');

--Sequenz zurücksetzen
ALTER SEQUENCE TestSeq RESTART WITH 230000;

--------------------------------------------------------------------------------------------

--DELETE FROM <Tabelle>
--Löscht alle Daten ohne WHERE
DELETE FROM Test;

--WHERE zum Einschränken
DELETE FROM Test WHERE ID > 20;

--TRUNCATE löscht alle Daten aus der Tabelle genauso wie DELETE ohne WHERE
--WHERE nicht möglich bei TRUNCATE
--Programmiere wollte explizit alle Daten löschen und hat kein WHERE vergessen
TRUNCATE TABLE Test;

--------------------------------------------------------------------------------------------

--ALTER TABLE <Name> ADD <Name> <Typ>
--Spalte hinzufügen
ALTER TABLE Test ADD Seq INT;

--Spalte entfernen
ALTER TABLE Test DROP COLUMN Seq;

--------------------------------------------------------------------------------------------

SELECT * FROM INFORMATION_SCHEMA.TABLES; --Alle Tabellen und Views anzeigen
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'; --Alle Tabellen anzeigen

SELECT * FROM INFORMATION_SCHEMA.COLUMNS; --Alle Spalten aller Tabellen in der Datenbank anzeigen
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Test'; --Eine Tabelle auswählen zum anzeigen

--------------------------------------------------------------------------------------------

CREATE TABLE FKTest
(
	TestID int primary key identity,
	Name varchar(20)
);

CREATE TABLE PKTest
(
	ID int identity,
	Vorname varchar(20),
	Nachname varchar(20),
	FKID int, --Muss den selben Typen haben wie der Schlüssel in der anderen Tabelle
	Geburtsdatum date,

	--CONSTRAINT <Name> PRIMARY KEY(<Spalte>)
	CONSTRAINT PK_ID PRIMARY KEY(ID),

	--CONSTRAINT <Name> FOREIGN KEY(<Spalte in dieser Tabelle>) REFERENCES <Andere Tabelle>(<Spalte von anderer Tabelle>)
	CONSTRAINT FK_PKTest_FKTest
	FOREIGN KEY(FKID)
	REFERENCES FKTest(TestID),

	--CONSTRAINT <Name> CHECK <Bedingung>
	CONSTRAINT CHK_GebDatMin CHECK (YEAR(Geburtsdatum) >= 1900)
);

--funktioniert nicht, da ID 1 in der anderen Tabelle nicht existiert
INSERT INTO PKTest
VALUES('Test', 'Test', 1, '20000101');

--Jetzt ist obiges INSERT möglich, da Datensatz mit ID 1 jetzt existiert
INSERT INTO FKTest
VALUES('Test')

--Check Constraint verletzt
INSERT INTO PKTest
VALUES('Test', 'Test', 1, '18000101');