/* Query 6 -  کاربرانی که از بیش از یک ژانر خرید کردند*/

SELECT   
    c.CustomerId,   
    c.FirstName,   
    c.LastName,   
    COUNT(DISTINCT g.GenreId) AS GenreCount  
FROM   
    chinook.customer c  
JOIN   
    chinook.invoice i ON c.CustomerId = i.CustomerId  
JOIN   
    chinook.invoiceline il ON i.InvoiceId = il.InvoiceId  
JOIN   
    chinook.track t ON il.TrackId = t.TrackId  
JOIN   
    chinook.genre g ON t.GenreId = g.GenreId  
GROUP BY   
    c.CustomerId, c.FirstName, c.LastName  
HAVING   
    COUNT(DISTINCT g.GenreId) > 1  
ORDER BY   
   GenreCount desc; 
    
