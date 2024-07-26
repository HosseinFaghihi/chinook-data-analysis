/* Query 7 - سه آهنگ برتر از نظر درامد فروش برای هر ژانر */

WITH RankedTracks AS (  
    SELECT   
        t.TrackId,  
        t.Name AS TrackName,  
        g.Name AS GenreName,  
        SUM(il.UnitPrice * il.Quantity) AS TotalRevenue,  
        ROW_NUMBER() OVER (PARTITION BY g.GenreId ORDER BY SUM(il.UnitPrice * il.Quantity) DESC) AS RevenueRank  
    FROM   
        chinook.track t  
    JOIN   
        chinook.invoiceline il ON t.TrackId = il.TrackId  
    JOIN   
        chinook.genre g ON t.GenreId = g.GenreId  
    GROUP BY   
        t.TrackId, t.Name, g.Name  
)  
SELECT   
    TrackName,  
    GenreName,  
    TotalRevenue  
FROM   
    RankedTracks  
WHERE   
    RevenueRank <= 3  
ORDER BY   
    GenreName;