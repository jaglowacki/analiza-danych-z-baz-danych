--1.
SELECT CompanyName, Address FROM Customers
--2.
SELECT LastName, HomePhone FROM Employees
--3.
SELECT ProductName, UnitPrice FROM Products
--4.
SELECT CategoryName, Description FROM Categories
--5.
SELECT CompanyName, HomePage FROM Suppliers WHERE (HomePage NOT LIKE '%http://www%') OR HomePage IS NULL
--6.
SELECT CompanyName, Address FROM Customers WHERE City='London'
SELECT CompanyName, Address FROM Customers WHERE City LIKE 'London'
--7.
SELECT CompanyName, Address FROM Customers WHERE Country='France' OR Country='Spain'
SELECT CompanyName, Address FROM Customers WHERE Country LIKE 'France' OR Country LIKE 'Spain'
--8.
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice BETWEEN 20 AND 30
--9.
SELECT ProductName, UnitPrice FROM Products 
WHERE CategoryID=(SELECT CategoryID FROM Categories WHERE CategoryName LIKE 'Seafood')
--10.
SELECT ProductName, UnitsInStock FROM Products 
WHERE SupplierID=(SELECT SupplierID FROM Suppliers WHERE CompanyName LIKE 'Tokyo Traders')
--11.
SELECT ProductName FROM Products WHERE UnitsInStock=0
--12.
SELECT * FROM Products WHERE QuantityPerUnit LIKE '%bottle%'
--13.
SELECT * FROM Employees WHERE LastName LIKE 'B-L%'
--14.
SELECT * FROM Employees WHERE LastName LIKE 'B%' OR LastName LIKE 'L%'
--15.
SELECT CategoryName FROM Categories WHERE Description LIKE '%,%'
--16.
SELECT CompanyName FROM Customers WHERE CompanyName LIKE '%Store%'
--17.
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice NOT BETWEEN 10 AND 20
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice<10 OR UnitPrice>20
--18. 
SELECT CompanyName, Country FROM Customers ORDER BY Country DESC, CompanyName ASC
--19. 
SELECT ProductID,CategoryID, ProductName, UnitPrice FROM Products ORDER BY CategoryID, UnitPrice DESC
SELECT ProductID,CategoryID, ProductName, UnitPrice FROM Products ORDER BY 2,4 DESC
--20.
SELECT * FROM Customers
SELECT CompanyName, Country FROM Customers 
WHERE Country LIKE 'Germany' OR Country LIKE 'Italy'
ORDER BY Country, CompanyName

SELECT CompanyName, Country FROM Customers 
WHERE Country='Germany' OR Country='Italy'
ORDER BY Country, CompanyName

SELECT CompanyName, Country FROM Customers
WHERE Country IN ('Germany','Italy') 
ORDER BY Country, CompanyName
--21.
SELECT LastName+' '+FirstName AS 'LastName FirstName', BirthDate FROM Employees ORDER BY LastName
--22.
SELECT * FROM Orders
SELECT * FROM Shippers
SELECT * FROM Orders WHERE ShipVia IN (1,3) ORDER BY ShipVia

SELECT * FROM Orders 
WHERE ShipVia=(SELECT ShipperID FROM Shippers WHERE CompanyName LIKE 'Speedy Express')
OR ShipVia=(SELECT ShipperID FROM Shippers WHERE CompanyName LIKE 'Federal Shipping')
ORDER BY ShipVia

SELECT * FROM Orders
WHERE ShipVia IN (SELECT ShipperID FROM Shippers WHERE CompanyName LIKE 'Speedy Express' OR CompanyName LIKE 'Federal Shipping')
ORDER BY ShipVia
--23.
SELECT TOP 10 (SELECT LastName+' '+FirstName FROM Employees WHERE EmployeeID=3) AS 'Nawisko i Imiê',* FROM Orders 
WHERE EmployeeID=3 
--24.
SELECT DISTINCT Country FROM Customers
--25.
SELECT * FROM Orders WHERE ShippedDate IS NULL
--26.
SELECT * FROM Products
SELECT ProductName, Discontinued FROM Products WHERE Discontinued=1
SELECT ProductName, Discontinued FROM Products WHERE Discontinued='TRUE'
--27.
SELECT * FROM Products WHERE ProductName LIKE '%Tofu%'
SELECT * FROM Suppliers 

SELECT * FROM Suppliers 
WHERE SupplierID IN (SELECT SupplierID FROM Products WHERE ProductName LIKE '%Tofu%')
--28.
SELECT * FROM Products WHERE ProductName LIKE '%Choco%' OR ProductName LIKE '%Schoko%'

SELECT * FROM Suppliers 
WHERE SupplierID IN (SELECT SupplierID FROM Products WHERE ProductName LIKE '%Choco%' OR ProductName LIKE '%Schoko%')
--29.
SELECT * FROM Products

SELECT ProductName, QuantityPerUnit, UnitPrice FROM Products 
WHERE (QuantityPerUnit LIKE '%Bottle%' OR QuantityPerUnit LIKE '%jar%') AND UnitPrice NOT BETWEEN 10 AND 20
