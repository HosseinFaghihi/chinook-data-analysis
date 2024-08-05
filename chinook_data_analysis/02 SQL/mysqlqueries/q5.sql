/* Query 5 - کارمندی که بیشترین تعداد فروش را داشته  */

SELECT  
  DATE_FORMAT(e.hiredate, '%Y-%m') AS hire_date,  
  CONCAT(e.firstname, ' ', e.lastname) AS name,  
  COUNT(i.invoiceid) AS number_of_sale,  
  ROUND(SUM(i.total), 2) AS value_of_sale  
FROM chinook.employee e  
JOIN chinook.customer c ON c.supportrepid = e.employeeid  
JOIN chinook.invoice i ON i.customerid = c.customerid  
WHERE e.title = 'Sales Support Agent'  
GROUP BY hire_date, name;