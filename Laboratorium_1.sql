SELECT * FROM Employees
SELECT LastName, FirstName FROM Employees
SELECT FirstName, LastName FROM Employees

SELECT 2+2*2
SELECT '2+2*2'
SELECT 2+2*2 AS 'Obliczenia'
SELECT SQRT(9) AS 'Pierwiastek'
SELECT 'Bazy Danych'
SELECT * FROM Products
SELECT UnitPrice, UnitPrice*2 FROM Products
SELECT UnitPrice, UnitPrice*2 AS 'UnitPrice x2' FROM Products
SELECT UnitPrice, UnitPrice*2 AS [UnitPrice x2] FROM Products
SELECT UnitPrice, UnitPrice*2 AS UnitPrice_x2 FROM Products

SELECT FirstName AS 'Imiê', LastName AS 'Nazwisko', BirthDate AS 'Data urodzenia' FROM Employees

SELECT * FROM Employees
SELECT FirstName, LastName
FROM Employees
WHERE FirstName LIKE '%e%'

SELECT FirstName, LastName FROM Employees WHERE FirstName NOT LIKE '%e%'
SELECT FirstName, LastName FROM Employees WHERE FirstName LIKE 'M%'
SELECT FirstName, LastName FROM Employees WHERE FirstName LIKE '%an%'
SELECT FirstName, LastName FROM Employees WHERE LastName LIKE '[a-d]%'
SELECT FirstName, LastName FROM Employees WHERE LastName LIKE '[^a-d]%'
SELECT FirstName, LastName FROM Employees WHERE LastName NOT LIKE '[a-d]%'
SELECT FirstName, LastName FROM Employees
SELECT FirstName, Lastname FROM Employees WHERE LastName LIKE '[a-d][a-d]%'

SELECT FirstName, LastName FROM Employees WHERE LastName LIKE 'Ki_g'
SELECT FirstName, LastName FROM Employees WHERE FirstName LIKE 'An%'

SELECT * FROM Products
SELECT * FROM Products WHERE UnitPrice BETWEEN 19 AND 22	-- 19 i 22 nale¿y do przedzia³u (przedzia³ ostry-³¹cznie)
SELECT * FROM Products WHERE UnitPrice>=19 AND UnitPrice<=22
SELECT * FROM Products WHERE UnitPrice NOT BETWEEN 19 AND 22
SELECT * FROM Products WHERE UnitPrice<19 OR UnitPrice>22
SELECT * FROM Products
SELECT * FROM Products WHERE UnitPrice IN (19,22)
SELECT * FROM Products WHERE UnitPrice=19 OR UnitPrice=22

SELECT MIN(UnitPrice) AS 'MinUnitPrice' FROM Products
-- SELECT * FROM Products WHERE UnitPrice IS MIN -> Tak jest Ÿle
SELECT * FROM Products WHERE UnitPrice=(SELECT MIN(UnitPrice) FROM Products)
SELECT * FROM Products

SELECT * FROM Suppliers
SELECT * FROM Suppliers WHERE Region=''
SELECT * FROM Suppliers WHERE Region IS NULL
SELECT * FROM Suppliers WHERE Region IS NOT NULL
SELECT CompanyName, Region FROM Suppliers WHERE REGION LIKE '%'

SELECT * FROM Employees 
SELECT * FROM Employees ORDER BY BirthDate -- Domyœlnie rosn¹co
SELECT * FROM Employees ORDER BY BirthDate ASC
SELECT * FROM Employees ORDER BY BirthDate DESC
SELECT * FROM Employees
SELECT * FROM Employees ORDER BY YEAR(HireDate), BirthDate
SELECT FirstName, LastName, BirthDate FROM Employees
SELECT FirstName, LastName, BirthDate FROM Employees ORDER BY 2,1
SELECT FirstName, LastName, BirthDate FROM Employees WHERE YEAR(BirthDate)<1950
SELECT FirstName, LastName, BirthDate FROM Employees WHERE YEAR(BirthDate)<1950 ORDER BY 3
SELECT * FROM Employees
