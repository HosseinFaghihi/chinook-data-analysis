/* Query 3 - کاربرانی که تا حاال خرید نداشتند */

SELECT   
    c.CustomerId,   
    c.FirstName,   
    c.LastName,   
    c.Email  
FROM   
    chinook.customer c  
LEFT JOIN   
    chinook.invoice i ON c.CustomerId = i.CustomerId  
WHERE   
    i.InvoiceId IS NULL;