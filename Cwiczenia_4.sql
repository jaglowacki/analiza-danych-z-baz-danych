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

--6. 
SELECT DISTINCT C.CompanyName, P.ProductName FROM Customers C
JOIN Orders O ON C.CustomerID=O.CustomerID 
JOIN [Order Details] OD ON O.OrderID=OD.OrderID
JOIN Products P ON OD.ProductID=P.ProductID ORDER BY 1,2

SELECT DISTINCT C.CompanyName, P.ProductName FROM Customers C
JOIN Orders O ON C.CustomerID=O.CustomerID 
JOIN [Order Details] OD ON O.OrderID=OD.OrderID
JOIN Products P ON OD.ProductID=P.ProductID 
GROUP BY C.CompanyName, P.ProductName ORDER BY 1,2

--7.
SELECT * FROM Employees
SELECT * FROM Orders
SELECT * FROM [Order Details]

SELECT E.EmployeeID, E.LastName+' '+E.FirstName AS 'Pracownik', 
SUM(OD.UnitPrice*OD.Quantity) AS 'WS bez rabatu',
SUM(OD.UnitPrice*OD.Quantity*OD.Discount) AS 'Rabaty', 
SUM(OD.UnitPrice*OD.Quantity*(1-OD.Discount)) AS 'WS z rabatem'
FROM Employees E
JOIN Orders O ON E.EmployeeID=O.EmployeeID
JOIN [Order Details] OD ON O.OrderID=OD.OrderID
GROUP BY E.EmployeeID, E.LastName,E.FirstName ORDER BY 3 DESC

SELECT E.EmployeeID, E.LastName+' '+E.FirstName AS 'Pracownik', 
SUM(OD.UnitPrice*OD.Quantity) AS 'WS bez rabatu',
CONVERT(DECIMAL(10,2), SUM(OD.UnitPrice*OD.Quantity*OD.Discount)) AS 'Rabaty', 
CONVERT(DECIMAL(10,2), SUM(OD.UnitPrice*OD.Quantity*(1-OD.Discount))) AS 'WS z rabatem'
FROM Employees E
JOIN Orders O ON E.EmployeeID=O.EmployeeID
JOIN [Order Details] OD ON O.OrderID=OD.OrderID
GROUP BY E.EmployeeID, E.LastName, E.FirstName ORDER BY 3 DESC

SELECT o.EmployeeID, E.LastName + ' ' + E.FirstName AS 'Pracownik'
, SUM(od.unitprice* od.quantity) AS 'WS'
, SUM(od.unitprice* od.quantity*od.discount) AS 'Rabat'
, SUM(od.unitprice* od.quantity) - SUM(od.unitprice* od.quantity*od.discount) AS 'Wartoœæ bez rabatu'
FROM Employees E JOIN Orders O on E.EmployeeID = O.EmployeeID
JOIN [Order Details] OD on OD.OrderID = O.OrderID
GROUP BY E.LastName, E.FirstName, O.EmployeeID
ORDER BY SUM(od.unitprice* od.quantity) desc