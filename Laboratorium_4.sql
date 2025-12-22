-- Iloczyn kartezjañski tabel
SELECT * FROM [Products]
SELECT * FROM [Categories]
SELECT * FROM [Products], [Categories] ORDER BY Products.ProductID

SELECT * FROM [Products] JOIN [Categories] ON Products.CategoryID=Categories.CategoryID
SELECT ProductName, CategoryName FROM [Products] 
INNER JOIN [Categories] ON Products.CategoryID=Categories.CategoryID --INNER jest domyœlny i mo¿na go pomin¹æ
SELECT ProductName, CategoryName FROM [Products] 
JOIN [Categories] ON Products.CategoryID=Categories.CategoryID

--9. Wyznacz wiek pracowników.
--Który z nich jest najstarszy, a który najm³odszy?
-- wybór tylko pracownika najstarszego i najm³odszego
select * from (SELECT top 1 'tabela 1' as typ, FirstName, LastName, BirthDate,
DATEDIFF (yy, BirthDate, GETDATE() ) AS Wiek
FROM Employees
order by Wiek) as najmlodszy
UNION all
select * from (SELECT  top 1 'tabela 2' as typ, FirstName, LastName, BirthDate,
DATEDIFF (yy, BirthDate, GETDATE() ) AS Wiek
FROM Employees
order by Wiek desc) as najstarszy
