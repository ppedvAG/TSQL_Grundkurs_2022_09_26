USE Northwind;

SELECT * FROM Customers ORDER BY Country; --ORDER BY: Ergebnis nach einer Spalte sortieren

SELECT * FROM Customers ORDER BY Country, City; --Sortierung nach mehreren Spalten (Primär: Country, Sekundär: City)

SELECT * FROM Customers ORDER BY Country DESC, City ASC; --ASC/DESC: Sortierrichtung vorgeben (DESC -> Absteigend, ASC -> Aufsteigend, Standard)

SELECT * FROM Customers ORDER BY 2; --Nach Spaltenindex sortieren (hier CompanyName)

SELECT CompanyName, ContactName, Address, Phone FROM Customers ORDER BY 2;

SELECT * FROM Customers ORDER BY 9, 6; --Sortierung nach mehreren Spalten mit Indizes

SELECT CONCAT_WS(' ', TitleOfCourtesy, FirstName, LastName) AS FullName FROM Employees ORDER BY FullName; --Nach Spaltenalias sortieren

SELECT CONCAT_WS(' ', TitleOfCourtesy, FirstName, LastName) AS [Full Name] FROM Employees ORDER BY [Full Name]; --Mit Abstand im Alias

------------------------------------------------------------------------------------------

SELECT Country FROM Customers ORDER BY 1; --Duplikate

SELECT DISTINCT Country
FROM Customers ORDER BY 1; --Keine Duplikate mehr (91 -> 22)

SELECT DISTINCT Country, City
FROM Customers; --Kombinationen von Duplikaten entfernen

SELECT COUNT(*) FROM Customers; --Anzahl der Customer

SELECT COUNT(DISTINCT Country) FROM Customers; --Wieviele Länder gibt es bei den Kunden?

------------------------------------------------------------------------------------------

SELECT TOP 10 * FROM Orders; --Obersten 10 Datensätze der Tabelle

SELECT TOP 10 * FROM Orders ORDER BY Freight; --TOP macht nur wirklich Sinn mit ORDER BY und/oder WHERE (10 billigsten Bestellungen)

SELECT TOP 10 * FROM Orders ORDER BY Freight DESC; --10 teuersten Bestellungen

SELECT TOP 2 PERCENT * FROM Orders ORDER BY Freight; --Top 2% der billigsten Bestellungen

SELECT TOP 2 PERCENT * FROM Orders ORDER BY Freight DESC; --Top 2% der teuersten Bestellungen

SELECT TOP 5 PERCENT
CustomerID,
CompanyName,
ContactName,
Phone,
City
FROM Customers
ORDER BY City; --Sinnvolle Spalten statt *

SELECT TOP 1 PERCENT *
FROM [Order Details]
ORDER BY Quantity; --Größte Bestellungen

SELECT * FROM [Order Details] WHERE Quantity = 2;

SELECT TOP 1 PERCENT WITH TIES *
FROM [Order Details]
ORDER BY Quantity; --Mit Unentschieden, ergänzt Datensätze die ohne WITH TIES exkludiert wurden