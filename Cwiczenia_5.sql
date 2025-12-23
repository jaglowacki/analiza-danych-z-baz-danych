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

--3. 
SELECT ProductID, ProductName, UnitPrice,
CASE
WHEN UnitPrice<20 THEN 'Ni¿sza cena'
WHEN UnitPrice BETWEEN 20 AND 40 THEN 'Œrednia cena'
WHEN UnitPrice>40 THEN 'Wy¿sza cena'
ELSE 'Nieznana cena'
END AS 'Poziom ceny'
FROM Products

--3b.
SELECT ProductID, ProductName, UnitPrice,
IIF(UnitPrice<20, 'Ni¿sza cena',
	IIF (UnitPrice BETWEEN 20 AND 40,'Œrednia cena',
		IIF (UnitPrice>40, 'Wy¿sza cena','Nieznana cena'))) AS 'Poziom ceny'
FROM Products P

SELECT ProductName  FROM Products
