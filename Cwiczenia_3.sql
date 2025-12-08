--1.
SELECT * FROM Orders
SELECT COUNT(ShipVia) AS 'Liczba wszystkich wierszy' FROM Orders
SELECT COUNT(DISTINCT ShipVia) AS 'Iloœæ wszystkich przewozników'  FROM Orders
SELECT * FROM Orders ORDER BY Freight DESC
SELECT COUNT(*) 'Zliczone wszystkie wiersze tabli' FROM Orders
SELECT COUNT(*) AS 'Ile zamówieñ z cen¹ powy¿ej 400:' FROM Orders WHERE Freight>400
SELECT COUNT(CASE WHEN Freight>400 THEN OrderId END) AS 'Ile zamówieñ z cen¹ powy¿ej 400:' FROM Orders
SELECT * FROM Orders ORDER BY ShipRegion DESC
SELECT COUNT(*) AS 'Liczba nie pustych regionów' FROM Orders WHERE ShipRegion IS NOT NULL
SELECT COUNT(DISTINCT ShipRegion) AS 'Iloœæ unikalnych regionów' FROM Orders WHERE ShipRegion IS NOT NULL
SELECT COUNT(*), COUNT(ShipRegion), COUNT(DISTINCT ShipRegion) FROM Orders
--2.
SELECT * FROM Categories
SELECT COUNT(*) AS 'Liczba wszystkich kategorii', COUNT(CategoryName) FROM Categories
--3.
SELECT * FROM Products
SELECT COUNT(*) AS 'Wszystkich produktów jest' FROM Products
SELECT COUNT(ProductID) AS 'Wszystkich produktów jest bez NULL' FROM Products
--4.
SELECT CategoryID, COUNT(ProductID) AS 'Liczba produktów w ka¿dej grupie' FROM Products GROUP BY CategoryID
SELECT CategoryID, COUNT(ProductID) AS 'Liczba produktów w grupie 4' FROM Products WHERE CategoryID=4 GROUP BY CategoryID 
SELECT CategoryID, COUNT(ProductID) AS 'Liczba produktów w grupie 4 i 7' FROM Products WHERE CategoryID IN (4,7) GROUP BY CategoryID 
--5.
SELECT * FROM ORDERS ORDER BY OrderDate
SELECT * FROM ORDERS WHERE YEAR(OrderDate)=1998
SELECT YEAR(OrderDate) AS 'Rok zamówienia', COUNT(OrderID) AS 'Liczba zmówieñ' 
FROM Orders GROUP BY YEAR(OrderDate) ORDER BY 1
--6.
SELECT * FROM Products
SELECT MAX(UnitPrice) AS 'Najdor¿szy produkt' FROM Products
SELECT TOP 1 * FROM Products ORDER BY UnitPrice DESC
SELECT TOP 1 ProductName, MAX(UnitPrice) FROM Products GROUP BY ProductName ORDER BY 2 DESC
--7. 
SELECT * FROM Products WHERE CategoryID=3 ORDER BY CategoryID, UnitPrice
SELECT CategoryID, MIN(UnitPrice) AS 'Cena minimum', MAX(UnitPrice) AS 'Cena Maksimum' FROM Products GROUP BY CategoryID

SELECT CategoryID, MIN(UnitPrice) AS 'Cena minimum', MAX(UnitPrice) AS 'Cena Maksimum' 
FROM Products GROUP BY CategoryID HAVING CategoryID=3

SELECT CategoryID, MIN(UnitPrice) AS 'Cena minimum', MAX(UnitPrice) AS 'Cena Maksimum' 
FROM Products WHERE CategoryID=3 GROUP BY CategoryID 

SELECT MIN(UnitPrice) AS 'Cena minimum', MAX(UnitPrice) AS 'Cena Maksimum' FROM Products WHERE CategoryID=3
--8.
SELECT CategoryID, MIN(UnitPrice) AS 'Cena minimum', MAX(UnitPrice) AS 'Cana maksimum' FROM Products GROUP BY CategoryID
--9.
SELECT * FROM Customers
SELECT Country, COUNT(CompanyName) AS 'Ile klientów' FROM Customers GROUP BY Country ORDER BY 2 DESC
--10. 
SELECT * FROM Products ORDER BY CategoryID
SELECT CategoryID, COUNT(ProductName) AS 'Iloœæ Produktów' FROM Products GROUP BY CategoryID
SELECT CategoryID, COUNT(ProductName) AS 'Iloœæ Produktów' FROM Products GROUP BY CategoryID HAVING COUNT(ProductName)>10
--11.
SELECT * FROM Products
SELECT SUM(UnitPrice*UnitsInStock) AS 'Warotœæ stanu magazynowego' FROM Products
--12.
SELECT * FROM [Order Details]
SELECT SUM(UnitPrice*Quantity) AS 'Ca³kowita wartoœæ wszystkich transakcji' FROM [Order Details]
--13.
SELECT OrderID, SUM(UnitPrice*Quantity) AS 'Ca³kowita wartoœæ zamówienia' FROM [Order Details] GROUP BY OrderID
--14.
SELECT * FROM [Order Details]
SELECT OrderID, COUNT(OrderID) AS 'Liczba pozycji w zamówieniu' FROM [Order Details] GROUP BY OrderID
SELECT OrderID, COUNT(OrderID) AS 'Liczba pozycji w zamówieniu' FROM [Order Details] 
	GROUP BY OrderID HAVING COUNT(OrderID)>4 ORDER BY 2 DESC
SELECT OrderID, COUNT(OrderID) AS 'Liczba pozycji w zamówieniu' FROM [Order Details] 
	GROUP BY OrderID HAVING COUNT(OrderID)>4 ORDER BY 'Liczba pozycji w zamówieniu' DESC
SELECT OrderID, COUNT(*) AS 'Liczba pozycji w zamówieniu' FROM [Order Details] 
	GROUP BY OrderID HAVING COUNT(*)>4 ORDER BY 'Liczba pozycji w zamówieniu' DESC
--15.
SELECT * FROM [Order Details]
SELECT OrderID, AVG(UnitPrice*Quantity) AS 'Œrednia wartoœæ transakcji' FROM [Order Details]
	GROUP BY OrderID
--15a.
SELECT SUM(UnitPrice*Quantity) AS 'Ca³kowita wartoœæ wszystkich transakcji' FROM [Order Details]
SELECT COUNT(*) AS 'Iloœæ wszystkich transakcji' FROM [Order Details]

SELECT (SELECT SUM(UnitPrice*Quantity) AS 'Ca³kowita wartoœæ wszystkich transakcji' FROM [Order Details])/
	(SELECT COUNT(*) AS 'Iloœæ wszystkich transakcji' FROM [Order Details]) AS 'Wartoœæ transakcji/liczbê transakcji'
--16.
SELECT * FROM Products ORDER BY CategoryID
SELECT CategoryID, COUNT(ProductID) AS 'Iloœæ produktów', SUM(UnitPrice*UnitsInStock) AS '£¹czna wartoœæ w magazynie'
	FROM Products GROUP BY CategoryID
--17.
SELECT * FROM Orders
SELECT YEAR(OrderDate) AS 'Rok zamówienia', COUNT(OrderID) AS 'Iloœæ zamówieñ' FROM Orders
	GROUP BY YEAR(OrderDate) ORDER BY 1 DESC
--18.
SELECT * FROM Orders
SELECT YEAR(OrderDate) AS 'Rok', MONTH(OrderDate) AS 'Miesi¹c',
	COUNT(OrderID) AS 'Liczba zamówieñ' 
	FROM Orders GROUP BY YEAR(OrderDate), MONTH(OrderDate) ORDER BY 1,2