USE Northwind;

SELECT 'Test1', 'Test2'; --Zwei Spalten

SELECT 'Test1'
UNION
SELECT 'Test2'; --Einzelne Spalte durch UNION

SELECT * FROM Customers;
SELECT * FROM Suppliers;

SELECT CompanyName FROM Customers --Alle Felder den selben Typ haben, Anzahl Felder muss auch gleich sein
UNION
SELECT CompanyName FROM Suppliers; --Alle CompanyNames in einer Ausgabe

SELECT CompanyName FROM Customers
UNION
SELECT Address FROM Suppliers; --Selber Typ auch möglich obwohl unterschiedliche Spalten

SELECT CompanyName, ContactName FROM Customers
UNION
SELECT CompanyName FROM Suppliers;  --Unterschiedlich viele Spalten sind nicht möglich

SELECT CompanyName, ContactName FROM Customers
UNION
SELECT CompanyName, NULL FROM Suppliers; --Mit NULL oder '' fehlende Spalten ergänzen

SELECT CustomerID FROM Customers
UNION
SELECT SupplierID FROM Suppliers; --Unterschiedliche Typen sind nicht möglich

SELECT CustomerID FROM Customers
UNION
SELECT CONVERT(VARCHAR, SupplierID) FROM Suppliers; --Einzelne Spalten konvertieren ermöglicht UNION

SELECT CompanyName, ContactName, Phone, Address FROM Customers
UNION
SELECT CompanyName, ContactName, Phone, Address FROM Suppliers; --Sinnvolle Spalten auswählen

SELECT Phone FROM Customers
UNION
SELECT Phone FROM Suppliers
UNION
SELECT HomePhone FROM Employees; --Mehr als 2 Tabellen fusionieren

SELECT * FROM Umsatz2019
UNION ALL --Hier UNION ALL verwenden um keine Duplikate zu filtern
SELECT * FROM Umsatz2020
UNION ALL --UNION: 5 Sekunden, UNION ALL: 2.901 Sekunden
SELECT * FROM Umsatz2021;
GO

CREATE VIEW Umsätze2019bis2021
AS
SELECT * FROM Umsatz2019
UNION ALL --Hier UNION ALL verwenden um keine Duplikate zu filtern
SELECT * FROM Umsatz2020
UNION ALL --UNION: 5 Sekunden, UNION ALL: 2.901 Sekunden
SELECT * FROM Umsatz2021;
GO --View erstellen aus UNION ALL Tabellen

SELECT * FROM Umsätze2019bis2021
EXCEPT
SELECT * FROM Umsatz2019; --Alle Datensätze aus der ersten Tabelle außer alle Datensätze aus der zweiten Tabelle

SELECT * FROM Umsätze2019bis2021
INTERSECT
SELECT * FROM Umsatz2019; --Schnittmenge zwischen beiden Tabellen (alle Datensätze die in beiden Tabellen enthalten sind)