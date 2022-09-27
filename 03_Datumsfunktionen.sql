USE Northwind;

SELECT GETDATE(); --Jetztiges Datum, Millisekundengenau

SELECT SYSDATETIME(); --Jetztiges Datum, Nanosekundengenau

/*
	Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, m = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

--YEAR/MONTH/DAY
SELECT YEAR(GETDATE()); --Jahr vom Datum zurückgeben
SELECT MONTH(GETDATE()); --Monat vom Datum zurückgeben
SELECT DAY(GETDATE()); --Tag vom Datum zurückgeben

SELECT YEAR(HireDate) AS Jahr, * FROM Employees; --Datumsfunktion auf Spalte anwenden

SELECT DATEPART(MINUTE, GETDATE()); --Teil von einem Datum holen (selbe Funktionsweise wie YEAR(...), MONTH(...) und DAY(...))

SELECT DATEPART(DAYOFYEAR, GETDATE()); --Heutigen Tag finden (1-366)
SELECT DATEPART(QUARTER, GETDATE()); --Heutiges Quartal finden (1-4)
SELECT DATEPART(WEEKDAY, GETDATE()); --Heutigen Wochentag finden (1-7)

SELECT DATEPART(QUARTER, HireDate) AS Quartal, * FROM Employees; --Quartal von allen HireDates herausfinden

SELECT DATEDIFF(YEAR, 2000, GETDATE()); --2000 wird als Tage interpretiert seit 01.01.1900 -> 24.06.1905

SELECT DATEDIFF(YEAR, '2000', GETDATE()); --Hier unbedingt string benutzen
SELECT DATEDIFF(YEAR, '2000-01-01', GETDATE());

--Bei Datumswerten am besten immer ISO-Datumsformatierung benutzen (yyyy-MM-dd)

SELECT DATEDIFF(YEAR, '01.01.2000', GETDATE()); --Funktioniert auch
SELECT DATEDIFF(YEAR, '01/01/2000', GETDATE()); --Funktioniert auch

SELECT DATENAME(MONTH, GETDATE()); --Gibt den deutschen Namen von einem Monat/Tag aus
SELECT DATENAME(WEEKDAY, GETDATE()); --Hier Weekday statt Day benutzen

SELECT DATENAME(WEEKDAY, HireDate) FROM Employees; --Schönen Wochentag von Einstellungsdaten

SELECT DATEADD(YEAR, 2, GETDATE()); --Auf das heutige Datum 2 Jahre herauf addieren

SELECT DATEADD(DAY, 10, GETDATE()); --Überschläge werden hier berücksichtigt (27.09. -> 07.10.)

SELECT DATEADD(HOUR, 20, GETDATE()); --Überschläge werden bei Stunden auch berücksichtigt

SELECT DATEADD(DAY, 730, GETDATE()); --Schaltjahre werden auch berücksichtigt

SELECT DATEADD(YEAR, -2, GETDATE()); --Statt DATESUB gibt es nur die Möglichkeit negative Zahlen einzugeben

SELECT DATEADD(QUARTER, 3, GETDATE()); --Drei Quartale addieren