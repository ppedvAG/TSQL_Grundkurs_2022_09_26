--Kommentar, wird nicht ausgef�hrt

/*
Mehrzeiliger
Kommentar
*/

USE Northwind; --Datenbank ausw�hlen

SELECT 100; --Einzelnen Wert ausgeben

SELECT 'Test'; --Markieren, Strg + E: einzelnes Statement ausf�hren

SELECT 100 * 3; --Berechnung

SELECT '100 * 3'; --Interpretiert als Text durch Hochkommas

--Strg + R: Ergebnisansicht schlie�en

SELECT 'Test' AS Text; --AS: Spalte einen Namen geben

SELECT 10 AS Zahl, 'Test' AS Text; --Mehrere Werte ausw�hlen mit Beistrich getrennt

SELECT 10.5; --Kommazahlen mit Punkt statt mit Beistrich

--Strg + K, C: Ausgew�hlte Zeilen auskommentieren
--Strg + K, U: Ausgew�hlte Zeilen einkommentieren
--Alt + Pfeiltaste (Hoch, Hinunter): Derzeitige Zeile(n) bewegen

SELECT * FROM Customers; --*: Alles

SELECT CompanyName FROM Customers; --Bestimmte Spalte(n) ausw�hlen

SELECT CompanyName, ContactName FROM Customers; --Mehrere Spalten ausw�hlen

SELECT Freight * 2 FROM Orders; --Auf Spalten berechnungen durchf�hren

SELECT Freight % 5 AS Mod5 FROM Orders; --Modulo Operator (%): Rest einer Division

SELECT CompanyName + Address + City + PostalCode + Country FROM Customers; --Strings verbinden (unsch�n)

SELECT CompanyName + ' ' +  Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS [Volle Adresse] FROM Customers; --Strings verbinden mit Leerzeichen dazwischen, Namen mit Abstand drinnen mit [] oder "" angeben

SELECT cd.CustomerDesc FROM CustomerDemographics AS cd; --Tabellenalias (cd)
