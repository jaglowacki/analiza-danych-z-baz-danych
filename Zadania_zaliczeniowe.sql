--Zad. 1
--Nale¿y wybraæ produkty sprzedawane w pude³kach (ang. box), gdzie zapas magazynowy jest w zakresie od 20 do 35, 
--a identyfikator kategorii produktu to 2 lub 3, u³o¿one w kolejnoœci od najdro¿szych.
--Wyœwietl nazwy produktów oraz wszystkie szczegó³y zwi¹zane z podanymi warunkami.

SELECT ProductName, QuantityPerUnit, UnitsInStock, CategoryID, UnitPrice FROM Products
WHERE (QuantityPerUnit LIKE '%box%') AND (UnitsInStock BETWEEN 20 AND 35) AND CategoryID IN (2,3)
ORDER BY UnitPrice DESC

--Zad. 2
--Nale¿y wybraæ zamówienia, gdzie kraj dostawy to Francja lub Niemcy, nazwa miasta zaczyna siê na literê B, K lub P, 
--zamówienie zosta³o dostarczone, w kolejnoœci sk³adania zamówieñ.
--Wyœwietl numery zamówieñ oraz wszystkie szczegó³y zwi¹zane z podanymi warunkami.

SELECT OrderID, ShipCountry, ShipCity, ShippedDate, OrderDate FROM Orders
WHERE ShipCountry IN ('France','Germany') 
AND (ShipCity LIKE 'B%' OR ShipCity LIKE 'K%' OR ShipCity LIKE 'P%')
AND ShippedDate IS NOT NULL
ORDER BY OrderDate

--Zad. 3
--Podaj klientów, którzy z³o¿yli zamówienia w pierwszych 5 dniach ka¿dego miesi¹ca.

--Z wyœwietleniem ka¿dej daty zamówienia pomiêdzy 1 a 5 dniem miesi¹ca
SELECT CustomerID, OrderDate, DAY(OrderDate) AS 'Dzieñ miesi¹ca zamówienia' FROM Orders
WHERE DAY(OrderDate) BETWEEN 1 AND 5 ORDER BY 1

--Z wyœwietleniem ka¿dej daty zamówienia pomiêdzy 1 a 5 dniem miesi¹ca oraz wyœwietleniem nazwy klienta
SELECT O.CustomerID, C.CompanyName, O.OrderDate, DAY(O.OrderDate) AS 'Dzieñ miesi¹ca zamówienia' FROM Orders O
JOIN Customers C ON O.CustomerID=C.CustomerID
WHERE DAY(O.OrderDate) BETWEEN 1 AND 5

-- Lista klientów którzy w ogóle za³o¿yli zamówienie pomiêdzy 1 a 5 dniem miesi¹ca wraz z nazw¹ klienta
SELECT DISTINCT O.CustomerID, C.CompanyName FROM Orders O
JOIN Customers C ON O.CustomerID=C.CustomerID
WHERE DAY(O.OrderDate) BETWEEN 1 AND 5

--Zad. 4
--Jaki jest œredni czas (w dniach) realizacji zamówienia (od z³o¿enia do wys³ania) przez poszczególnych pracowników.
--Wyœwietl dwie kolumny: identyfikator pracownika, œredni czas dostawy.
--Œrednia powinna byæ przedstawiona jako u³amek (liczba z przecinkiem).

--Dodatkowo posortowane po prcowniku, który œrednio najd³u¿ej realizuje zamówienie
SELECT EmployeeID, AVG(CAST(ShippedDate-OrderDate AS float)) AS 'Œredni czas realizacji zamówienia' FROM Orders
WHERE ShippedDate IS NOT NULL
GROUP BY EmployeeID ORDER BY 2 DESC

--Z wyszczególnieniem nazwiska i imienia pracownika
SELECT O.EmployeeID, E.LastName+' '+E.FirstName AS 'Nazwisko i imiê pracownika', 
AVG(CAST(O.ShippedDate-O.OrderDate AS float)) AS 'Œredni czas realizacji zamówienia' 
FROM Orders O
JOIN Employees E ON O.EmployeeID=E.EmployeeID
WHERE O.ShippedDate IS NOT NULL
GROUP BY O.EmployeeID, E.LastName+' '+E.FirstName ORDER BY 3 DESC

--Zad. 5
--Jaka jest liczba pracowników urodzonych w poszczególnych latach.
--Wyœwietl dwie kolumny: rok urodzenia, liczba pracowników.

SELECT YEAR(BirthDate) AS 'Rok urodzenia', COUNT(EmployeeID) AS 'Liczba pracowników' FROM Employees
GROUP BY YEAR(BirthDate)

--Zad. 6
--Poka¿ pracowników, którzy w III kwartale 1996 roku przyjêli
--wiêcej ni¿ 5 zamówieñ.
--Wyœwietl identyfikator pracownika, liczbê zamówieñ.

--Posortowane dodatkowo od pracowników z najwiêksz¹ liczb¹ zamówieñ w tym okresie
SELECT EmployeeID, COUNT(EmployeeID) AS 'Liczba zamówieñ' FROM Orders
WHERE YEAR(OrderDate)=1996 AND DATEPART(qq,OrderDate)=3
GROUP BY EmployeeID HAVING COUNT(EmployeeID)>5 ORDER BY 2 DESC

--Dodatkowo uzupe³nione o imiê i nazwisko pracownika
SELECT O.EmployeeID,E.LastName+' '+E.FirstName AS 'Nazwisko i imiê',
COUNT(O.EmployeeID) AS 'Liczba zamówieñ'
FROM Orders O
JOIN Employees E ON O.EmployeeID=E.EmployeeID
WHERE YEAR(O.OrderDate)=1996 AND DATEPART(qq,O.OrderDate)=3
GROUP BY O.EmployeeID,E.LastName+' '+E.FirstName HAVING COUNT(O.EmployeeID)>5 ORDER BY 3 DESC

--Zad. 7
--Ile zamówieñ zrealizowali poszczególni przewoŸnicy i ile ³¹cznie za nie dostali w roku 1997.
--Wyœwietl trzy kolumny: identyfikator przewoŸnika (ShipVia), liczba zamówieñ, koszt przewozu (Freight)

--Zak³adam ¿e przewoŸnik zrealizowa³ zamówienie, gdy zasta³o ono wys³ane (ShippedDate is Not Null)
SELECT ShipVia, COUNT(OrderID) AS 'Liczba zmamówieñ', SUM(Freight) AS 'Koszt przewozu' FROM Orders
WHERE YEAR(ShippedDate)=1997 AND ShippedDate IS NOT NULL
GROUP BY ShipVia

--Dodatkowo z nazw¹ dostawcy
SELECT O.ShipVia, S.CompanyName, 
COUNT(O.OrderID) AS 'Liczba zmamówieñ', SUM(O.Freight) AS 'Koszt przewozu' FROM Orders O
JOIN Shippers S ON O.ShipVia=S.ShipperID
WHERE YEAR(ShippedDate)=1997 AND ShippedDate IS NOT NULL
GROUP BY ShipVia, S.CompanyName