USE Northwind;

SELECT FirstName + ' ' + LastName FROM Employees; --Strings verbinden mit +

SELECT TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS FullName FROM Employees;

SELECT CONCAT(FirstName, ' ', LastName) FROM Employees; --CONCAT: beliebig viele Strings zusammenbauen

SELECT CONCAT_WS(' ', TitleOfCourtesy, FirstName, LastName) FROM Employees; --CONCAT_WS: Concat with Seperator, baut beliebig viele Strings mit einem Seperator zusammen

SELECT TRIM(' Test '); --Alle Abstände links und rechts entfernen
SELECT LTRIM(' Test '); --Alle Abstände links entfernen
SELECT RTRIM(' Test '); --Alle Abstände rechts entfernen

SELECT LOWER('Test'); --Alle Zeichen klein
SELECT UPPER('Test'); --Alle Zeichen groß

SELECT LEN('Test'); --LEN: Länge von einem String zurückgeben
SELECT LEN(' Test '); --Len macht automatisch ein RTRIM (5 Zeichen)
SELECT DATALENGTH(' Test '); --DATALENGTH macht kein RTRIM (6 Zeichen)

SELECT REVERSE('Test'); --Dreht den String um

SELECT UPPER(FirstName), REVERSE(LastName) FROM Employees; --Funktionen auf Spalten anwenden

SELECT LEFT('Testtext', 4); --Von links X Zeichen nehmen (Test)
SELECT RIGHT('Testtext', 4); --Von rechts X Zeichen nehmen (text)
SELECT SUBSTRING('Testtext', 2, 4); --In der Mitte X Zeichen nehmen (von einem 1-basierten Index X Zeichen nehmen -> estt)

SELECT STUFF('Testtext', 2, 0, '_Hallo_'); --STUFF: an einer bestimmten Stelle einen String einbauen (T_Hallo_esttext)
SELECT STUFF('Testtexttest', 2, 7, '_Hallo_'); --Dritter Parameter dient zur Überschreibung (7 Zeichen überschreiben)

SELECT REPLICATE('xy', 4); --Gibt den String X mal aneinander gehängt zurück

SELECT REPLACE('Testtext', 'e', '_'); --In einem String alle Vorkommnisse von einer Zeichenkette ersetzen
SELECT REPLACE('Testtext', 'es', '_'); --Kann auch mehrere Zeichen ersetzen
SELECT REPLACE('Testtext', 't', '_'); --REPLACE ist nicht Case-Sensitive (ersetzt hier auch großen T)

SELECT CHARINDEX('s', 'Testtext', 0); --CHARINDEX: Erstes Vorkommen eines Zeichens ausgeben (mit Startindex als dritter Parameter)
SELECT CHARINDEX('t', 'Testtext', 0); --Auch Case-Insensitive
SELECT CHARINDEX('e', 'Testtext', 4); --Startindex angeben (starte zu Suchen bei Stelle 4 -> t)

SELECT REPLACE(CompanyName, 'A', 'B') FROM Customers;
SELECT LEFT(CompanyName, 4) FROM Customers;
SELECT UPPER(LEFT(CompanyName, 4)) FROM Customers;