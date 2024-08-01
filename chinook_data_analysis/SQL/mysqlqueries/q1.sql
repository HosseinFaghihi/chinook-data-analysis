/* Query 1 -  10آهنگ برتر که بیشترین درامد رو داشتن به همراه درامد ایجاد شده */

SELECT   
    t.Name AS song_name,  
    a.Name AS artist_name,  
    SUM(il.Quantity) AS total_quantity_sold,  
    SUM(il.UnitPrice * il.Quantity) AS total_sales_value  
FROM   
    chinook.invoiceline il  
JOIN   
    chinook.track t ON il.TrackId = t.TrackId  
JOIN   
    chinook.album al ON t.AlbumId = al.AlbumId  
JOIN   
    chinook.artist a ON al.ArtistId = a.ArtistId  
GROUP BY   
    t.TrackId, t.Name, a.Name  
ORDER BY   
    total_quantity_sold DESC  
LIMIT 10;