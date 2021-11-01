# Data Engineering 1 - Term Project 1(SQL)

This repository contains files for Nawal Zehra Hasan’s term project 1 for Data Engineering 1. I used the Chinook database for my analysis. My repository contains files including practice codes, operational layer, analytics plan, analytical plan using ETL pipeline, data marts using my analytical layer, EER diagram showing the relational dataset. I have provided a quick summary for the viewer to read before checking the SQL scripts. 


## 1.	OPERATIONAL LAYER:

### CHINOOK DATASET: 
I chose the Chinook relational dataset for the purpose of this project. An interesting name chosen for a dataset that has no direct connection to its name. Chinook are a type of current of wind. It is a sample  database or a digital media store. The media related data was extracted using data  from an Apple iTunes library. Customer and employee tables were created using fictitious names and address as well as other formatted data (phone, fax,email). The sales details were auto generated using random data dor a four year time period. It consists of 11 tables, above 15000 rows and a number of indexes, primary and foreign keys. Although the dataset contains 11 tables, for the purpose of my study and to create my start schema I shall be using 6 of these. I used sql codes to import the relational dataset and populate the tables. I edited the codes to add foreign keys and then used reverse engineering to form the EER diagram that can seen below. 
<p align="center">
  <img src="https://github.com/nawalhasan/CEU_DE1-SQL-KNIME/blob/main/Term-Project-1/EER%20diagram.png" />
</p>

### TABLES:
Invoice: This table contains all the billing information such as the billing country and billing data.
InvoiceLine: This table contains pricing information and quantity of each item. It will be used to calculate the revenue and then further used in data marts to answer questions.
Customer: It contains all pertinent information regarding the customers, such as their names, location and contact details.
Employee: As with customers table, employees table is equally essential piece of information. All the information such as their hire date, country and title are given.
Album: It contains the album title, ids.
Track: An important table that used information from media type, album and genre tables. It includes track names, their genres, composer. 

# 2.	ANALYTICS PLAN:
These tables together will form the basis of my analysis. I will be extracting from the operational layer and forming a new table. I will use these relational tables to construct my analytical layer using procedures. The procedure will return a new table by the name of ‘SalesInfo’. I removed the time from the Invoice Date column to only include the date of invoice.

My analysis revolves around the SalesInfo table, to understand the sales revenue made by the digital store. This can be viewed in the diagram below.
<p align="center">
  <img src="https://github.com/nawalhasan/CEU_DE1-SQL-KNIME/blob/main/Term-Project-1/2.%20Analytics_plan.png" />
</p>

# 3.	ANALYTICAL LAYER:

The salesInfo table was created by carefully picking relevant dimensions that serve the purpose of my study and formulate the star scheme, the facts of which will be UnitPrice, Quantity and Revenue. The SalesInfo table will them serve as a source of information for the questions that intend to answer using views as data marts. I have used customers, employee which includes customer representatives, album table which includes names, track table which include track names, billing information from invoice table and invoice line table. 

Using this I created a stored procedure that will return answers to my questions posted below. This procedure was created using inner joins and left join on InvoiceLine. 

<p align="center">
  <img src="https://github.com/nawalhasan/CEU_DE1-SQL-KNIME/blob/main/Term-Project-1/Star_schema.png" />
</p>

# 4.	DATA MARTS
The questions are answered using sql functions taught in class such as aggregations, joins, conditions and more. 

### Q1. Which Album made the most revenue?
### Q2. What is the revenue made by US, Germany, and Hungary in the given years?
### Q3. Which tracks were popular, and which were unpopular?
### Q4. Return 10 tracks with a revenue of less than 5$
### Q5. What was the date on which maximum revenue was made by the store?


# 5.	PRACTISE CODES
This exercise was done to help me understand my data better. I decided my analytics plan according to the information returned by these codes. I had a better grasp of the data and the results given using data marts. Distinct, Joins, order by and other simple codes applied here on a smaller scale gave me practice using them more effectively to produce the analytical layer. 

# 6.	CONCLUDING THOUGHTS:

This project enabled me to put into practice all or most of the SQL functions practiced in class. Starting from selecting a suitable dataset, formulating a plan, putting SQL functions to use, and creating my very own analytics plan and then executing it. Each step helped me understand the technicalities of analytics and the work that goes behind the curtains to produce informative results. The project is perfectly designed in a way that will help me retain what I have learnt and applied in SQL.






