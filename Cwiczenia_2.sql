--1.
SELECT DATEDIFF(dd, '1974-06-25', GETDATE()) AS '¯yjê dni',
		DATEDIFF(ww, '1974-06-25', GETDATE()) AS '¯yjê tygodni',
		DATEDIFF(mm, '1974-06-25', GETDATE()) AS '¯yjê miesiêcy',
		DATEDIFF(hh, '1974-06-25', GETDATE()) AS '¯yjê godzin'
--2.
SELECT DATEDIFF(dd, GETDATE(), '2026-06-15') AS 'Dni do sesji',
		DATEDIFF(ww,GETDATE(), '2026-06-15') AS 'Tygodni do sesji',
		DATEDIFF(mm,GETDATE(), '2026-06-15') AS 'Miesiêcy do sesji',
		DATEDIFF(hh,GETDATE(), '2026-06-15') AS 'Godzin do sesji'
--3.
SELECT DATEDIFF(dd, '1974-01-01', '1974-06-25')+1 AS 'Urodzony w dniu roku',
		DATEPART(dy, '1974-06-25') AS 'Urodzony w dniu roku'
--4.
SELECT DATEPART(dw, '1974-06-25') AS 'Urodzony w dniu tegodnia',--pierwszy dzieñ tygodnia to niedziela
		DATENAME(dw, '1974-06-25') AS 'Nazwa dnia tygodnia',
		DATEPART(mm, '1974-06-25') AS 'Miesi¹c urodzenia',
		MONTH('1974-06-25') AS 'Miesi¹c urodzenia',
		DATENAME(mm,'1974-06-25') AS 'Nazwa miesi¹ca urodzenia'
--5.
SELECT * FROM Orders
SELECT * FROM Orders WHERE DATEDIFF(dd,RequiredDate,ShippedDate)>0
SELECT * FROM Orders WHERE ShippedDate>RequiredDate
--6.
SELECT DATEDIFF(dd,RequiredDate, ShippedDate) AS 'Spoznione dni:', 
		CAST(ShippedDate-RequiredDate AS INT) AS 'SpóŸnione dni:(2)', *
FROM Orders WHERE ShippedDate>RequiredDate ORDER BY 1 DESC
--7.
SELECT * FROM Orders
SELECT DATEDIFF(dd,OrderDate, ShippedDate) AS 'Ile dni-realizacja', 
		CAST(ShippedDate-OrderDate AS INT) AS 'Ile (2):', *
FROM Orders WHERE ShippedDate IS NOT NULL ORDER BY 1 DESC
--8.
SELECT DATENAME(dw,OrderDate) AS 'Nazwa dnia z³o¿enia:', DATENAME(dw, ShippedDate) AS 'Nazwa dnia wys³ania',
		DATEDIFF(dd, OrderDate, ShippedDate) AS 'Ile dni trwa³o:', 
		CAST(ShippedDate-OrderDate AS INT) AS 'Ile dni CAST',*
FROM Orders WHERE ShippedDate IS NOT NULL ORDER BY 3 DESC
--9. 
SELECT * FROM Employees
SELECT DATEDIFF(yy,BirthDate, GETDATE()) AS 'Wiek pracownika', 
		CAST(YEAR(GETDATE())-YEAR(BirthDate) AS INT) AS 'Wiek CAST',*
FROM Employees ORDER BY 1 DESC
SELECT DATEDIFF(yy,BirthDate, GETDATE()) AS 'Najstarszy pracownik', *
FROM Employees WHERE BirthDate=(SELECT MIN(BirthDate) FROM Employees)
SELECT DATEDIFF(yy,BirthDate, GETDATE()) AS 'Najm³odszy pracownik', *
FROM Employees WHERE BirthDate=(SELECT MAX(BirthDate) FROM Employees)
--10.
SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM Customers WHERE CustomerID IN (SELECT DISTINCT CustomerID 
FROM Orders WHERE DATENAME(dw, OrderDate) LIKE 'Friday')

SELECT CustomerID FROM Orders WHERE DATENAME(dw, OrderDate) LIKE 'Friday' ORDER BY 1
SELECT CustomerID FROM Orders WHERE DATEPART(dw, OrderDate)=6
SELECT DISTINCT CustomerID, DATENAME(dw,OrderDate) AS 'Dzieñ Tygodnia' FROM Orders WHERE DATEPART(dw, OrderDate)=6 