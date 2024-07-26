/* Query 4 -  میانگین زمان آهنگ ها در در هر آلبوم */

SELECT   
    a.Title AS AlbumTitle,  
    AVG(t.Milliseconds) / 1000 AS AverageDurationInSeconds  
FROM   
    chinook.album a  
JOIN   
    chinook.track t ON a.AlbumId = t.AlbumId  
GROUP BY   
    a.AlbumId, a.Title;