USE birdstrikes;

-- EX.1: Based on the previous chapter, create a table called “employee” with two columns: “id” and “employee_name”. NULL values should not be accepted for these 2 columns.
CREATE TABLE employee
(id INTEGER NOT NULL,
employee_name VARCHAR(255) NOT NULL,
PRIMARY KEY (id));

-- EX.2: What state figures in the 145th line of our database?
SELECT state FROM birdstrikes LIMIT 144,1;
-- Answer: Tennessee

-- EX.3: What is flight_date of the latest birstrike in this database?
SELECT flight_date FROM birdstrikes ORDER BY flight_date DESC LIMIT 1;
-- Answer: 2000-04-18

-- EX.4: What was the cost of the 50th most expensive damage?
SELECT DISTINCT cost FROM birdstrikes ORDER BY cost DESC LIMIT 49,1;
-- Answer: 5345

-- EX.5: What state figures in the 2nd record, if you filter out all records which have no state and no bird_size specified?
SELECT * FROM birdstrikes WHERE state IS NOT NULL AND bird_size IS NOT NULL;
-- Answer: ''

-- EX.6: How many days elapsed between the current date and the flights happening in week 52, for incidents from Colorado? (Hint: use NOW, DATEDIFF, WEEKOFYEAR)
SELECT WEEKOFYEAR(flight_date), flight_date FROM birdstrikes WHERE state = 'Colorado'; 
-- Answer: 2000-01-01
SELECT NOW() AS 'current_date';
SELECT DATEDIFF('2020-10-02','2000-01-01');
-- Answer: 7580



