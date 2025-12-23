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

--3a.
SELECT ProductID, ProductName, UnitPrice,
IIF(UnitPrice<20, 'Ni¿sza cena',
	IIF (UnitPrice BETWEEN 20 AND 40,'Œrednia cena',
		IIF (UnitPrice>40, 'Wy¿sza cena','Nieznana cena'))) AS 'Poziom ceny'
FROM Products P ORDER BY 4 DESC

--3b. 
SELECT 
CASE
WHEN UnitPrice<20 THEN 'Ni¿sza cena'
WHEN UnitPrice BETWEEN 20 AND 40 THEN 'Œrednia cena'
WHEN UnitPrice>40 THEN 'Wy¿sza cena'
ELSE 'Nieznana cena'
END AS 'Poziom ceny',
COUNT(ProductID) AS 'Iloœæ producktów w kategorii'
FROM Products
GROUP BY 
CASE
WHEN UnitPrice<20 THEN 'Ni¿sza cena'
WHEN UnitPrice BETWEEN 20 AND 40 THEN 'Œrednia cena'
WHEN UnitPrice>40 THEN 'Wy¿sza cena'
ELSE 'Nieznana cena'
END
ORDER BY 2 

--4.
SELECT CompanyName, Country, Phone,
CASE
WHEN Country LIKE 'Germany' THEN '0049'+' '+Phone
ELSE Phone
END AS 'Numer z prefiksem'
FROM Customers 

SELECT CompanyName, Country, Phone,
IIF (Country LIKE 'Germany','0049'+' '+Phone, Phone)
AS 'Numer z prefiksem'
FROM Customers

--5.
SELECT CompanyName, Country, 
CASE Country
WHEN 'Italy' THEN 'Pizza ' + Country
WHEN 'Mexico' THEN 'Tequilla '+ Country
WHEN 'UK' THEN 'Big Ben ' + Country
WHEN 'Germany' THEN 'VW ' + Country
ELSE Country
END AS 'Kraj'
FROM Customers

--6.
SELECT * FROM Employees

SELECT LastName, FirstName, TitleOfCourtesy,
CASE TitleOfCourtesy
WHEN 'Ms.' THEN 'Panna'
WHEN 'Mrs.' THEN 'Pani'
WHEN 'Mr.' THEN 'Pan'
WHEN 'Dr.' THEN 'Doktor'
ELSE 'Bez tytu³u'
END AS 'Tytu³'
FROM Employees

--7.
SELECT OrderID, RequiredDate,ShippedDate,
CASE
WHEN CAST(ShippedDate-RequiredDate AS INT)<0 THEN 'Przed terminem'
WHEN  CAST(ShippedDate-RequiredDate AS INT)>0 THEN 'SpóŸnione'
WHEN  CAST(ShippedDate-RequiredDate AS INT)=0 THEN 'W dniu terminu'
WHEN  ShippedDate IS NULL THEN 'Niezrealizowane'
ELSE 'Nieokreœlne'
END AS 'Wysy³ka'
FROM Orders ORDER BY 4 DESC

--7a.
SELECT
CASE
WHEN CAST(ShippedDate-RequiredDate AS INT)<0 THEN 'Przed terminem'
WHEN  CAST(ShippedDate-RequiredDate AS INT)>0 THEN 'SpóŸnione'
WHEN  CAST(ShippedDate-RequiredDate AS INT)=0 THEN 'W dniu terminu'
WHEN  ShippedDate IS NULL THEN 'Niezrealizowane'
ELSE 'Nieokreœlne'
END AS 'Wysy³ka',
COUNT(OrderID) AS 'Iloœæ'
FROM Orders
GROUP BY
CASE
WHEN CAST(ShippedDate-RequiredDate AS INT)<0 THEN 'Przed terminem'
WHEN  CAST(ShippedDate-RequiredDate AS INT)>0 THEN 'SpóŸnione'
WHEN  CAST(ShippedDate-RequiredDate AS INT)=0 THEN 'W dniu terminu'
WHEN  ShippedDate IS NULL THEN 'Niezrealizowane'
ELSE 'Nieokreœlne'
END 
ORDER BY 2 DESC

--8.
SELECT EmployeeID, COUNT(OrderID) AS 'Ilosc zrealizowanych zamówieñ',
CASE
WHEN COUNT(OrderID)<50 THEN 'mniej ni¿ 50'
WHEN COUNT(OrderID) BETWEEN 50 AND 100 THEN 'miêdzy 50 a 100'
WHEN COUNT(OrderID)>100 THEN 'wiêcej ni¿ 100'
ELSE 'nie wiadomo'
END AS 'Wynik'
FROM Orders
GROUP BY EmployeeID
