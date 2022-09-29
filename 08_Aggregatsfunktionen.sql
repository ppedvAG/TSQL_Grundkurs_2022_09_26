USE Northwind;

SELECT COUNT(*) FROM Customers; --Anzahl der Customer

SELECT COUNT(*) FROM Customers WHERE Country = 'UK'; --Anzahl Customer aus UK (7)

SELECT COUNT(DISTINCT Country) FROM Customers; --Anzahl einzigartiger Länder (22)

SELECT
MIN(Freight) AS BilligsteBestellung,
MAX(Freight) AS TeuersteBestellung,
AVG(Freight) AS Durchschnittskosten,
SUM(Freight) AS Gesamtkosten
FROM Orders;

SELECT TOP 1 Freight FROM Orders ORDER BY Freight;
SELECT TOP 1 Freight FROM Orders ORDER BY Freight DESC;

SELECT AVG(Freight) FROM Orders WHERE Freight > 50; --Mit WHERE Datenmenge noch weiter eingrenzen

-----------------------------------------------------------------

SELECT * FROM Orders ORDER BY EmployeeID; --1er Gruppe (10258, 10270, 10275, ...), 2er Gruppe (11073, 11070, 11060, ...), ...

SELECT * FROM Orders GROUP BY EmployeeID; --Nicht möglich

SELECT EmployeeID, COUNT(*) AS AnzOrders FROM Orders GROUP BY EmployeeID; --Anzahl aller Datensätze in jeder Gruppe

SELECT EmployeeID, COUNT(*) AS AnzOrders, AVG(Freight) AS Durchschnittskosten FROM Orders GROUP BY EmployeeID ORDER BY EmployeeID; --Durchschnittskosten pro Gruppe

SELECT EmployeeID,
COUNT(*) AS AnzOrders,
AVG(Freight) AS Durchschnittskosten,
SUM(Freight) AS Gesamtkosten,
MIN(Freight),
MAX(Freight)
FROM Orders
GROUP BY EmployeeID;

SELECT Country, City,
COUNT(*) AS AnzKunden
FROM Customers
GROUP BY Country, City; --Nach mehreren Spalten gruppieren

SELECT Country, City,
COUNT(*) AS AnzKunden
FROM Customers
GROUP BY Country, City
ORDER BY AnzKunden DESC; --Sortieren nach einer Spalte die eine Aggregatsfunktion beinhält

SELECT Country, City, COUNT(*)
FROM Customers
GROUP BY Country, City
ORDER BY COUNT(*) DESC; --Aggregatsfunktion im ORDER BY

-----------------------------------------------------------------

--WHERE vs GROUP BY + HAVING
--WHERE filtert alle Daten bevor sie geholt werden
--HAVING holt alle Daten (nach WHERE) und filtert danach nochmal

SELECT CustomerID, COUNT(*) AS AnzBestellungen
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 10 --Gruppen einschränken auf bestimmtes Kriterium
ORDER BY AnzBestellungen DESC;

SELECT CustomerID, COUNT(*) AS AnzBestellungen, SUM(Freight) AS Summe
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 1000 --SUM in HAVING
ORDER BY Summe DESC;

SELECT
c.CustomerID,
c.CompanyName, --Über JOIN CompanyName holen
COUNT(*) AS AnzBestellungen,
SUM(Freight) AS Summe
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CompanyName --Um ID und Name auszugeben müssen beide Spalten im GROUP BY stehen
ORDER BY AnzBestellungen DESC;