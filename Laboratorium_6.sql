CREATE VIEW KlienciUSA AS
SELECT * FROM Customers
WHERE Country='USA'

SELECT * FROM KlienciUSA
SELECT * FROM Customers
SELECT * FROM Orders

--bez widoku
SELECT DISTINCT  C.CompanyName, P.ProductName, C.Country FROM Products P
JOIN [Order Details] OD ON P.ProductID=OD.ProductID
JOIN Orders O ON OD.OrderID=O.OrderID
JOIN Customers C ON O.CustomerID=C.CustomerID
WHERE C.Country='USA'

--z widokiem 
SELECT DISTINCT C.CompanyName, P.ProductName, C.Country FROM Products P
JOIN [Order Details] OD ON P.ProductID=OD.ProductID
JOIN Orders O ON OD.OrderID=O.OrderID
JOIN KlienciUSA C ON O.CustomerID=C.CustomerID
