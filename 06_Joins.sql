USE Northwind;

SELECT * FROM Orders; --EmployeeID
SELECT * FROM Employees; --Datensätze kombinieren über EmployeeID

SELECT * FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID; --Spalten auswählen die in beiden Tabellen sind

SELECT
Orders.EmployeeID, --Ambiguous column name: Eine Tabelle auswählen aus der die Spalte genommen wird
Freight,
ShipName,
ShipAddress,
FirstName,
LastName
FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID; --Sinnvolle Spalten auswählen statt *

SELECT 
o.EmployeeID,
o.Freight,
o.ShipName,
o.ShipAddress,
e.FirstName + ' ' + e.LastName AS FullName
FROM Orders o
INNER JOIN Employees e
ON o.EmployeeID = e.EmployeeID; --Aliases: Tabelle einen Namen geben um weniger Code zu tippen

SELECT * FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --Orders und Customer joinen

SELECT 
o.OrderID,
o.OrderDate,
o.RequiredDate,
o.ShippedDate,
c.CompanyName,
c.ContactName,
CONCAT_WS(' ', c.Address, c.City, c.PostalCode, c.Country)
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --Nur Spalten auswählen die ich auch sehen möchte

SELECT * FROM Customers c
INNER JOIN Orders o
ON o.CustomerID = c.CustomerID; --Tabellen im FROM und im JOIN vertauschen um Ausgabe anzupassen (Customers links, Orders rechts)

SELECT * FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID; --JOIN mit mehr als 2 Tabellen

SELECT 
od.OrderID,
o.OrderDate,
o.RequiredDate,
o.ShippedDate,
o.ShipName,
o.ShipAddress,
p.ProductName,
od.UnitPrice,
od.Quantity
FROM [Order Details] od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID; --JOIN mit mehreren Tabellen und sinnvollen Spalten

SELECT * FROM Orders o --Sinnvolle Spalten fehlen noch
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID;

SELECT * FROM Orders o
RIGHT JOIN Customers c
ON o.CustomerID = c.CustomerID; --832 Rows (Zeile 189)

SELECT * FROM Orders o
RIGHT JOIN Customers c
ON o.CustomerID = c.CustomerID; --830 Rows (Customer ohne Order fallen weg)

SELECT * FROM Customers c
LEFT JOIN Orders o
ON o.CustomerID = c.CustomerID; --Customer und Order vertauschen damit Customer links sind

SELECT * FROM Customers c
LEFT JOIN Orders o
ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL; --Finde alle Customer die keine Orders getätigt haben bisher

SELECT * FROM Orders CROSS JOIN Customers; --Bildet ein Kreuzprodukt (alle Kombinationen) zwischen beiden Tabellen

SELECT 
e.EmployeeID,
e.FirstName + ' ' + e.LastName,
chef.EmployeeID,
chef.FirstName + ' ' + chef.LastName
FROM Employees e
INNER JOIN Employees chef
ON e.ReportsTo = chef.EmployeeID; --Self Join: Inner Join auf die selbe Tabelle

SELECT 
e.EmployeeID,
e.FirstName + ' ' + e.LastName,
chef.EmployeeID,
chef.FirstName + ' ' + chef.LastName
FROM Employees e
LEFT JOIN Employees chef
ON e.ReportsTo = chef.EmployeeID; --Durch Left Join auch den Chef Chef finden