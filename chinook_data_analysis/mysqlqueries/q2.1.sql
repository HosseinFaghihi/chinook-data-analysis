/* Query 2.1 -  محبوب ترین ژانر، به تر تیب از نظر تعداد آهنگهای فروخته شده  */

SELECT   
    g.Name AS genre_name,  
    COUNT(il.TrackId) AS total_songs_sold   
FROM   
    chinook.invoiceline il  
JOIN   
    chinook.track t ON il.TrackId = t.TrackId  
JOIN   
    chinook.genre g ON t.GenreId = g.GenreId  
GROUP BY   
    g.GenreId, g.Name  
ORDER BY   
    total_songs_sold DESC