SELECT	SYSDATETIME() AS 'Data i czas',
		SYSDATETIMEOFFSET() AS 'Data i czas oraz strefa (offset)',
		GETDATE() AS 'Data i czas',
		GETUTCDATE() AS 'Data i czas UTC'

SELECT	DAY(GETDATE()) AS 'Dzisiejszy dzieñ',
		MONTH(GETDATE()) AS 'Aktualny miesi¹c',
		YEAR(GETDATE()) AS 'Aktualny rok'

SELECT * FROM Orders
SELECT OrderID, YEAR(OrderDate) AS 'Rok', MONTH(OrderDate) AS 'Miesi¹c', DAY(OrderDate) AS 'Dzieñ' FROM Orders

SELECT DATEPART(hh,GETDATE()) AS 'Aktualna godzina', DATEPART(mi,GETDATE()) AS 'Aktualna minuta'

SELECT	DATEADD(ww,1,GETDATE()) AS 'Data za tydzieñ',
		DATEADD(ww,-2,GETDATE()) AS 'Data dwa tygodnie temu od dzisiaj'

SELECT GETDATE()-1
--podaj pierwszy dzieñ aktualnego miesi¹ca
SELECT DATEADD(dd,-DAY(GETDATE()-1),GETDATE()) AS 'Pierwszy dzieñ miesi¹ca'
--podaj ostatni dzieñ poprzedniego miesi¹ca
SELECT DATEADD(dd,-DAY(GETDATE()),GETDATE()) AS 'Ostani dzieñ poprzedniego miesi¹ca'

SELECT CAST(GETDATE() AS DATE) AS 'Sama data', CAST(GETDATE() AS TIME) AS 'Sam czas'
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd') AS 'Sama data', FORMAT(GETDATE(), 'HH:mm:ss') AS 'Sam czas'

