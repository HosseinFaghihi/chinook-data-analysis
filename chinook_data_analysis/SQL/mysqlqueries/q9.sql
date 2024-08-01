/* Query 9 - کاربرانی که مجموع خریدشان باالتر از میانگین مجموع خرید تمام کاربران است */

SELECT   
    c.CustomerId,  
    c.FirstName,  
    c.LastName,  
    SUM(il.Quantity * il.UnitPrice) AS Total_Purchase  
FROM   
    chinook.Customer c  
JOIN   
    chinook.Invoice i ON c.CustomerId = i.CustomerId  
JOIN   
    chinook.InvoiceLine il ON i.InvoiceId = il.InvoiceId  
GROUP BY   
    c.CustomerId  
HAVING   
    Total_Purchase > (SELECT AVG(Total)   
                       FROM (SELECT SUM(il.Quantity * il.UnitPrice) AS Total  
                             FROM chinook.Customer c  
                             JOIN chinook.Invoice i ON c.CustomerId = i.CustomerId  
                             JOIN chinook.InvoiceLine il ON i.InvoiceId = il.InvoiceId  
                             GROUP BY c.CustomerId) AS SubQuery)  
ORDER BY   
    Total_Purchase DESC;