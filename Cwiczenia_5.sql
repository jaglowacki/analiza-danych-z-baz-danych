--1.
SELECT ProductName, Discontinued,
CASE Discontinued
WHEN 0 THEN 'Dostêpny'
WHEN 1 THEN 'Wycofany'
ELSE 'Brak danych'
END AS 'Dostêpnoœæ produktu'
FROM Products
ORDER BY 2 DESC

--2.
SELECT LastName,FirstName, DATEDIFF(yy,BirthDate, HireDate) AS 'Sta¿',
CASE 
WHEN DATEDIFF(yy,BirthDate, HireDate)<30 THEN 'Junior'
WHEN DATEDIFF(yy,BirthDate, HireDate)>30 THEN 'Senior'
WHEN DATEDIFF(yy,BirthDate, HireDate)=30 THEN 'Grupa 30'
ELSE 'Do weryfikacji'
END AS 'Stanowisko'
FROM Employees


