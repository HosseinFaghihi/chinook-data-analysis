/* Query 8 - تعداد آهنگهای فروخته شده به صورت تجمعی در هر سال به صورت جداگانه */

SELECT   
    YEAR(i.InvoiceDate) AS Year,  
    SUM(il.Quantity) AS Total_Sold,  
    SUM(SUM(il.Quantity)) OVER (ORDER BY YEAR(i.InvoiceDate)) AS Cumulative_Sold  
FROM   
    chinook.InvoiceLine il  
JOIN   
    chinook.Invoice i ON il.InvoiceId = i.InvoiceId  
GROUP BY   
    Year  
ORDER BY   
    Year;