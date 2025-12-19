-- Iloczyn kartezjañski tabel
SELECT * FROM [Products]
SELECT * FROM [Categories]
SELECT * FROM [Products], [Categories] ORDER BY Products.ProductID

SELECT * FROM [Products] JOIN [Categories] ON Products.CategoryID=Categories.CategoryID
SELECT ProductName, CategoryName FROM [Products] 
INNER JOIN [Categories] ON Products.CategoryID=Categories.CategoryID --INNER jest domyœlny i mo¿na go pomin¹æ
SELECT ProductName, CategoryName FROM [Products] 
JOIN [Categories] ON Products.CategoryID=Categories.CategoryID


