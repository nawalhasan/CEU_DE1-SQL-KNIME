
# ---------------------------------------------------------------------- #
#                          SUPPORTING CODES                              #
# ---------------------------------------------------------------------- #


-- Used some simple codes to understand my dataset better


USE Chinook;

SHOW TABLES;
DESCRIBE `Customer`;
DESCRIBE `Invoice`;

SELECT DISTINCT FirstName, LastName FROM Employee; -- there are a total of 8 employees
SELECT DISTINCT BillingCountry FROM Invoice; -- there are a total of 24 Billing countries
SELECT DISTINCT AlbumId, Title FROM Album; -- there are a total of 347 Albums
SELECT DISTINCT TrackId, Name FROM Track; -- there are a total of 1000 tracks


-- create a table using join to see who reports to whom
SELECT
  CONCAT(Employee.FirstName, ' ', Employee.LastName) AS `Employees`,
  employee.Title,
  CONCAT(Managers.FirstName, ' ', Managers.LastName) AS `Managers` 
FROM Employee 
LEFT JOIN Employee AS Managers 
  ON Employee.ReportsTo = Managers.EmployeeId
ORDER BY
  Managers.EmployeeId;
  
  
-- Find the 10 most expensive albums sold
SELECT  AlbumId, Name, InvoiceLine.UnitPrice FROM InvoiceLine
LEFT JOIN Track
USING (TrackId)
ORDER BY UnitPrice DESC
LIMIT 10;



-- Top 3 billing countries with most orders
SELECT DISTINCT BillingCountry, count(BillingCountry) 
FROM Invoice GROUP BY BillingCountry
LIMIT 3;


-- Understand the unit price, quantity, revenue by each order place
SELECT InvoiceLineId, ROUND(AVG(UnitPrice), 2), SUM(Quantity), ROUND(SUM(UnitPrice*Quantity), 2) AS Revenue
FROM `InvoiceLine`
GROUP BY InvoiceLineId
ORDER BY Revenue DESC;