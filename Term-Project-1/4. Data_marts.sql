 -- -- -- -- -- -- -- -- -- -- --  --  --  --  -- DATA MARTS - -- -- -- -- -- -- --  --  --  --  --  --  --  --  --  

-- DATA MART 1
-- Which Album made the most revenue?

DROP VIEW IF EXISTS AlbumRevenue;

CREATE VIEW `AlbumRevenue` AS
SELECT DISTINCT AlbumName, ROUND(AVG(UnitPrice),2) AS UnitPrice, SUM(Quantity) AS Quantity, SUM(Revenue) AS Revenue
FROM SalesInfo
GROUP BY AlbumName
ORDER BY Revenue Desc;

-- Call the view
SELECT * FROM AlbumRevenue;

-- The results show that 'Minha Historia' made the most revenue with $39.77

--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  

-- DATA MART 2
-- What is the revenue made by US, Germany and Hungary in the given years?

DROP VIEW IF EXISTS CountryRevenue;

CREATE VIEW `CountryRevenue` AS
SELECT  
BillingCountry, 
(ROUND(AVG(UnitPrice),2)) AS UnitPrice, 
SUM(Quantity) AS TotalQuantity, 
SUM(Revenue) AS TotalRevenue
FROM SalesInfo
WHERE BillingCountry IN ('Germany', 'USA', 'Hungary')
GROUP BY BillingCountry
ORDER BY TotalRevenue DESC;

-- Call the view
SELECT * FROM CountryRevenue;

-- USA made $565.10, Germany came next with $171.43 and Hungary made $49.30


--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  -- --  --  --   

-- DATA MART 3
-- Which tracks were popular and which were unpopular?

DROP VIEW IF EXISTS PopTrack;

CREATE VIEW `PopTrack` AS
SELECT  
ANY_VALUE(Track)                AS Track,
SUM(Quantity)                   AS TotalQuantity, 
SUM(Revenue)                    AS TotalRevenue,
CASE
            WHEN SUM(Quantity) <= 50 THEN 'Unpopular'
            ELSE 'Popular'
        END AS TrackPopularity
FROM SalesInfo
GROUP BY BillingCountry
ORDER BY SUM(Quantity) DESC;

-- Call the view
SELECT * FROM PopTrack;


--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  -- 
-- DATA MART 4
-- Return 10 tracks with a revenue of less than 5$

DROP VIEW IF EXISTS TrackRevenue;

CREATE VIEW `TrackRevenue` AS
SELECT 
InvoiceLineId, 						
InvoiceDate,
AlbumName,
Track,
BillingCountry,
Revenue
FROM SalesInfo
WHERE Revenue >= 3
ORDER BY
Revenue DESC
LIMIT 10;

-- Call the view
Select * FROM TrackRevenue;


--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --
-- DATA MART 5
-- What was the date on which maximum revenue was made by the store and for which album?

DROP VIEW IF EXISTS Date;

CREATE VIEW `Date` AS
SELECT 
InvoiceDate   			
AlbumName,
Revenue                     AS MaxRevenue
FROM SalesInfo
WHERE Revenue = ( SELECT MAX(Revenue) FROM SalesInfo);

-- Call the view
Select * FROM Date;

-- The date was 2010-02-18

--  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --

                    