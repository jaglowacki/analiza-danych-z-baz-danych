--1.
SELECT * FROM Orders ORDER BY CustomerID
SELECT CustomerID, COUNT(CustomerID) AS 'Ile zamówieñ' 
FROM Orders GROUP BY CustomerID ORDER BY 2 DESC

--2.
SELECT * FROM Customers
SELECT * FROM Orders ORDER BY CustomerID

SELECT CustomerID, COUNT(CustomerID) AS 'Ile zamówieñ' 
FROM Orders GROUP BY CustomerID ORDER BY 2 DESC

SELECT C.CompanyName, COUNT(O.CustomerID), O.CustomerID AS 'Ile zamówieñ' 
FROM Orders O JOIN Customers C ON O.CustomerID=C.CustomerID 
GROUP BY O.CustomerID, C.CompanyName ORDER BY 2 DESC

--3.
SELECT * FROM Orders ORDER BY CustomerID
SELECT * FROM Customers ORDER BY Country

SELECT C.Country, COUNT(O.OrderId) AS 'Ila zamówieñ z kraju:' FROM Customers C
JOIN Orders O ON C.CustomerID=O.CustomerID GROUP BY C.Country ORDER BY 2 DESC

--4. 
SELECT * FROM Products ORDER BY CategoryID
SELECT * FROM Categories

SELECT P.ProductName, C.CategoryName FROM Products P
JOIN Categories C ON P.CategoryID=C.CategoryID ORDER BY 2

SELECT C.CategoryName, P.ProductName FROM Products P
JOIN Categories C ON P.CategoryID=C.CategoryID ORDER BY 1

--5.
SELECT C.CategoryName, COUNT(P.ProductID) AS 'Ile produktów w kategorii:'
FROM Products P JOIN Categories C ON P.CategoryID=C.CategoryID 
GROUP BY C.CategoryName ORDER BY 1