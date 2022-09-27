USE Northwind;

SELECT CAST(GETDATE() AS DATE); --Heutiges Datum (mit Datum und Zeit) zu Datum (ohne Zeit) konvertieren

SELECT CAST(GETDATE() AS TIME); --Heutiges Datum (mit Datum und Zeit) zu Zeit (ohne Datum) konvertieren

SELECT HireDate, CAST(HireDate AS DATE) FROM Employees; --Cast auf Tabellenspalte anwenden

SELECT '123' + 3; --Implizite Konvertierung (VARCHAR -> INT), Berechnung funktioniert

SELECT '123.4' + 3; --Funktioniert nicht (nur int)

SELECT CAST('123.4' AS FLOAT) + 3; --Davor umwandeln (explizite Konvertierung)

SELECT CAST('123.4' AS DECIMAL(6, 2)) + 3; --DECIMAL: Dezimalzahl mit fixer Anzahl Vor- und Nachkommastellen (6 Gesamtkommastellen, davon 2 Nachkommastellen)

SELECT CAST(GETDATE() AS VARCHAR); --Etwas schönere Form von einem Datum

SELECT CAST(GETDATE() AS VARCHAR(11)); --Bei Konvertierung nur die ersten 11 Zeichen nehmen (nicht praktikabel)

SELECT CAST('2022-09-27' AS DATE); --String zu Datum konvertieren

SELECT CAST('2022-27-09' AS DATETIME); --Auch Zeit hinzufügen

SELECT CAST('27/09/2022' AS DATE); --Format beachten
SELECT CAST('27.09.2022' AS DATE); --Funktionieren beide

-----------------------------------------------------------------

SELECT CONVERT(DATE, GETDATE()); --CONVERT: selbiges wie Cast nur andere Schreibweise (Typ zuerst, dann Wert)

--https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#date-and-time-styles
SELECT CONVERT(VARCHAR, GETDATE(), 4);
SELECT CONVERT(VARCHAR, GETDATE(), 104);

-----------------------------------------------------------------

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, n = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT FORMAT(GETDATE(), 'yyyy-MM-dd'); --Datumsformat mit maximaler Präzision angeben

SELECT FORMAT(GETDATE(), 'yyyy MM dd');

SELECT FORMAT(GETDATE(), 'MMM ddd'); --Schöne Kurzform von Monat und Tag -> Sep Di

SELECT FORMAT(GETDATE(), 'MMMM dddd'); --Schöne lange Form von Monat und Tag -> September Dienstag

SELECT FORMAT(GETDATE(), 'd'); --27.09.2022 (kurzes deutsches Datum)

SELECT FORMAT(GETDATE(), 'D'); --Dienstag, 27. September 2022 (langes deutsches Datum)

SELECT FORMAT(GETDATE(), 'yyyy.MM.dd hh:mm:ss'); --Mit Zeit

SELECT FORMAT(GETDATE(), 'dddd, dd. MMMM yyyy hh:mm:ss'); --Schönstes deutsches Datum

SELECT FORMAT(12345, '#-#-#'); --Von rechts werden die Zeichen im String in die # eingebaut (123-4-5)

SELECT FORMAT(12345, '#_#/#?#');

SELECT FORMAT(1234, 'Die Zahl ist #'); --Anwendung von dieser Format Funktion

----------------------------------------------------------------------------

SELECT FORMAT(HireDate, 'd') FROM Employees;

SELECT FORMAT(HireDate, 'D') FROM Employees;

SELECT FORMAT(HireDate, 'yyyy-MM-dd') FROM Employees;