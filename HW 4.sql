USE classicmodels;

-- EX4: INNER join orders,orderdetails,products and customers.

SELECT orderNumber, priceEach, quantityOrdered, productName, productLine, city, country, orderDate
FROM orders
INNER JOIN orderdetails
USING(orderNumber)
INNER JOIN products
USING(productCode)
INNER JOIN customers
USING(customerNumber);    

