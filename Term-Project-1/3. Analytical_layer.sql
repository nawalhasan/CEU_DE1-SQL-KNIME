-- -- -- -- -- -- -- -- -- -- --  --  --  --  -- ANALYTICAL LAYER -- -- -- -- -- -- -- -- -- -- --  --  --  --  --  --
 
                           # ------------------------------------------------------- #
                           #                      STORED PROCEDURE                   #
                           # ------------------------------------------------------- #


-- I designed a  denormalized structure from the operational tables to extract useful information regarding revenue made by the digital store.
-- For this I included InvoiceLine Id as an identifier for each order. From the Invoice table I used the date of the order and the billing country to
-- show where the sales were made. From the customer table I used the name of customer and from the Employee table, the name of employee who are customer representatives.
-- I also included Unit price and Quantity which are used to create a new column 'Revenue'. From the Album table I took the Album name and from the Track table I used
-- the Track title to show sales for these. I used  the function cast to separated date and time and only included the date for my analysis.

USE Chinook; 

DROP PROCEDURE IF EXISTS CreateMediaStoreSales;

DELIMITER //

CREATE PROCEDURE CreateMediaStoreSales()
BEGIN

	DROP TABLE IF EXISTS SalesInfo;
    
    CREATE TABLE SalesInfo AS
SELECT  
		IL. InvoiceLineId, 
        IL.UnitPrice, 
        IL.Quantity, 
		ROUND(IL.UnitPrice*IL.Quantity, 2)    AS Revenue, 	
        CAST(I.InvoiceDate AS Date)           AS InvoiceDate,     
        CONCAT_WS(' ',E.FirstName,E.LastName) AS CustomerRep,
        CONCAT_WS(' ',C.FirstName,C.LastName) AS CustomerName,
		A.Title                               AS AlbumName, 
        T.Name                                AS Track, 
		I.BillingCountry                   
FROM `InvoiceLine` AS IL
		INNER JOIN Invoice AS I
		USING (InvoiceId)
		INNER JOIN Customer AS C
		USING (CustomerId)
		INNER JOIN Track AS T
		USING (TrackId)
		INNER JOIN Album AS A
        USING (AlbumId)
        LEFT JOIN Employee AS E
		ON C.SupportRepId = E.EmployeeId
        
        ORDER BY InvoiceId, Revenue;

END //
DELIMITER ;
                            
CALL CreateMediaStoreSales();

-- Checking the new table
SELECT * FROM SalesInfo; 
-- As there were 2240 orders in the operational data set, this code also shows the new table has the same number of rows so it is functional
SELECT count(*) FROM SalesInfo;

--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --


