USE Northwind;

--Alle Order die teurer als der Durchschnitt sind
SELECT * FROM Orders
WHERE Freight >= AVG(Freight); --Keine Aggregatsfunktion im WHERE möglich

--Abfrage funktioniert mit Subselect
SELECT * FROM Orders
WHERE Freight >= (SELECT AVG(Freight) FROM Orders) --Wichtig: ein einzelner Wert als Ergebnis (bei WHERE ohne IN)
ORDER BY Freight;

--Abfrage funktioniert auch mit Subselect
SELECT * FROM Orders
WHERE Freight >= (SELECT TOP 1 Freight FROM Orders) --Auch durch TOP 1 kommt genau ein Wert heraus
ORDER BY Freight;

--Subselect in IN
SELECT * FROM Customers
WHERE Country IN(SELECT DISTINCT Country FROM Suppliers); --Ergebnis von Subselect in IN (16 Länder in Suppliers)

--Subselect im SELECT
SELECT Freight, (SELECT AVG(Freight) FROM Orders) AS Durchschnitt
FROM Orders ORDER BY Freight;

--Subselect im FROM
SELECT *
FROM
(
	SELECT
	Orders.EmployeeID,
	Orders.Freight,
	Employees.FirstName + ' ' + Employees.LastName AS FullName --Alle inneren Spalten müssen einen Namen haben
	FROM Orders
	INNER JOIN Employees
	ON Orders.EmployeeID = Employees.EmployeeID
) AS Ergebnis --FROM muss einen Alias haben
WHERE Ergebnis.Freight > 50 --Inneres SELECT filtern
ORDER BY Ergebnis.EmployeeID; --Inneres SELECT sortieren

SELECT * FROM Customers
WHERE EXISTS (SELECT Country FROM Customers WHERE Country LIKE 'X%') --EXISTS gibt nur true/false zurück

SELECT * FROM Customers
WHERE EXISTS (SELECT Country FROM Customers WHERE Country LIKE 'A%') --Wenn true -> alle Zeilen sonst keine Zeilen