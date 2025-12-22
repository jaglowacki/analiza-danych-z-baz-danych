SELECT CategoryID, CategoryName
,CASE CategoryID
when '1' then 'Napoje'
when '2' then 'Przyprawy'
when '3' then 'S³odycze'
when '4' then 'Nabia³'
else 'Inny'
END AS NAZWA_POLSKA
FROM Categories

SELECT CategoryID, CategoryName
,CASE
when CategoryID = 1 or CategoryID = 3 then 'Napoje lub s³odycze'
when CategoryID = 2 then 'Przyprawy'
-- when CategoryID = 3 then 'S³odycze'
when CategoryID = 4 then 'Nabia³'
else 'Inny'
END AS NAZWA_POLSKA
FROM Categories;