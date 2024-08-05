/* Query 2.2 -   محبوب ترین ژانر، به تر تیب از نظر  کل درامد */

SELECT   
    g.Name AS genre_name,  
    SUM(il.Quantity * il.UnitPrice) AS total_revenue  
FROM   
    chinook.invoiceline il  
JOIN   
    chinook.track t ON il.TrackId = t.TrackId  
JOIN   
    chinook.genre g ON t.GenreId = g.GenreId  
GROUP BY   
    g.GenreId, g.Name  
ORDER BY   
    total_revenue DESC