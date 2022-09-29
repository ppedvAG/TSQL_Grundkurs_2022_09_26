USE Northwind;
GO

--CREATE VIEW <Name> AS <SQL-Statement> GO
--Statischer Snapshot eines Teils der Datenbank
--v_ um Views von restlichen Objekten der Datenbank zu Differenzieren
--kein ORDER BY

CREATE VIEW v_Countries
AS
	SELECT DISTINCT Country FROM Customers;
GO

SELECT * FROM v_Countries; --View ansprechen (hier WHERE, ORDER BY möglich)

SELECT * FROM v_Countries WHERE Country LIKE 'A%'; --View ansprechen mit WHERE

DROP VIEW v_Countries; --View löschen

DROP VIEW IF EXISTS v_Countries; --Vorher prüfen ob die View existiert
GO

CREATE VIEW v_Chefs
AS
	SELECT
	e.EmployeeID,
	e.FirstName + ' ' + e.LastName AS FullName,
	chef.EmployeeID AS ChefID,
	chef.FirstName + ' ' + chef.LastName AS ChefName
	FROM Employees e
	LEFT JOIN Employees chef
	ON e.ReportsTo = chef.EmployeeID;
GO

SELECT * FROM v_Chefs;
GO

----------------------------------------------------------------------

--Prozeduren: CREATE PROCEDURE <Name> AS <SQL-Statement(s)> GO
--Fixes Verhalten auf Datenbankebene speichern

CREATE PROCEDURE p_Test
AS
	SELECT DISTINCT Country FROM Customers;
	SELECT DISTINCT City FROM Customers;
GO

EXECUTE p_Test;
GO

--Prozedur mit Argument (@StartDate date -> @<Name> <Typ>)

CREATE PROC p_OrdersByDate @StartDate DATE, @EndDate DATE
AS
	SELECT * FROM Orders WHERE OrderDate BETWEEN @StartDate AND @EndDate ORDER BY ShippedDate;
GO

EXEC p_OrdersByDate @StartDate = '19970101', @EndDate = '19971231';
GO

p_Test;
GO

DROP PROC p_Test;
GO

--------------------------------------------------------------------------

--SELECT INTO: Ergebnis einer Abfrage in eine neue Tabelle schreiben
SELECT CustomerID, Freight
INTO Test
FROM Orders;

--Neue Tabelle angreifen
SELECT * FROM Test;

--Ergebnis in eine Temporäre Tabelle einfügen (mit # am Anfang)
SELECT CustomerID, Freight
INTO #Test
FROM Orders;

--Temporäre Tabelle bleibt bestehen bis die Session beendet wird + ein paar Minuten
SELECT * FROM #Test;

--Globale Temporäre Tabelle (mit zwei #), kann jeder Datenbankbenutzer angreifen, 
--bleibt bestehen bis alle Verbindungen getrennt sind die mit der Tabelle gearbeitet haben
SELECT CustomerID, Freight
INTO ##Test
FROM Orders;

SELECT * FROM ##Test;