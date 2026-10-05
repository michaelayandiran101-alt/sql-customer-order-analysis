-- PROJECT 3: SQL CUSTOMER & ORDER ANALYSIS
-- Skills: SELECT, WHERE, SUM, AVG, COUNT, GROUP BY, JOIN, ORDER BY

-- 1. CREATE CUSTOMERS TABLE
CREATE TABLE customers (
Customer_ID INTEGER PRIMARY KEY,
Name TEXT,
City TEXT,
Total_Spent REAL
);

-- 2. INSERT CUSTOMER DATA
INSERT INTO customers (Customer_ID, Name, City, Total_Spent)
VALUES
(1, 'John', 'Atlanta', 210),
(2, 'Sarah', 'Marietta', 90),
(3, 'Mike', 'Atlanta', 350),
(4, 'Emily', 'Kennesaw', 180),
(5, 'David', 'Marietta', 275);

-- 3. CREATE ORDERS TABLE
CREATE TABLE orders (
Order_ID INTEGER PRIMARY KEY,
Customer_ID INTEGER,
Product TEXT,
Quantity INTEGER,
FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID)
);

-- 4. INSERT ORDER DATA
INSERT INTO orders (Order_ID, Customer_ID, Product, Quantity)
VALUES
(101, 1, 'Laptop', 1),
(102, 1, 'Mouse', 2),
(103, 2, 'Phone', 1),
(104, 3, 'Keyboard', 1),
(105, 4, 'Monitor', 2),
(106, 5, 'Headphones', 1);

-- 5. FIND CUSTOMERS FROM ATLANTA
SELECT Name
FROM customers
WHERE City = 'Atlanta';

-- 6. TOTAL SPENDING IN ATLANTA
SELECT SUM(Total_Spent)
FROM customers
WHERE City = 'Atlanta';

-- 7. AVERAGE SPENDING IN ATLANTA
SELECT AVG(Total_Spent)
FROM customers
WHERE City = 'Atlanta';

-- 8. TOTAL SPENDING BY CITY
SELECT City, SUM(Total_Spent)
FROM customers
GROUP BY City;

-- 9. AVERAGE SPENDING BY CITY
SELECT City, AVG(Total_Spent)
FROM customers
GROUP BY City;

-- 10. NUMBER OF CUSTOMERS BY CITY
SELECT City, COUNT(*)
FROM customers
GROUP BY City;

-- 11. JOIN CUSTOMERS WITH THEIR ORDERS
SELECT customers.Name, orders.Product
FROM customers
JOIN orders
ON customers.Customer_ID = orders.Customer_ID;

-- 12. SHOW CUSTOMER, CITY, PRODUCT, QUANTITY
SELECT customers.Name, customers.City, orders.Product, orders.Quantity
FROM customers
JOIN orders
ON customers.Customer_ID = orders.Customer_ID;

-- 13. SHOW ONLY ATLANTA ORDERS
SELECT customers.Name, orders.Product
FROM customers
JOIN orders
ON customers.Customer_ID = orders.Customer_ID
WHERE customers.City = 'Atlanta';

-- 14. TOTAL QUANTITY ORDERED BY CUSTOMER
SELECT customers.Name, SUM(orders.Quantity)
FROM customers
JOIN orders
ON customers.Customer_ID = orders.Customer_ID
GROUP BY customers.Name;

-- 15. TOTAL QUANTITY ORDERED BY ATLANTA CUSTOMERS
SELECT customers.Name, SUM(orders.Quantity)
FROM customers
JOIN orders
ON customers.Customer_ID = orders.Customer_ID
WHERE customers.City = 'Atlanta'
GROUP BY customers.Name;

-- 16. FINAL ANALYSIS
-- TOTAL QUANTITY ORDERED BY CUSTOMER
-- HIGHEST TO LOWEST
SELECT customers.Name, SUM(orders.Quantity)
FROM customers
JOIN orders
ON customers.Customer_ID = orders.Customer_ID
GROUP BY customers.Name
ORDER BY SUM(orders.Quantity) DESC;
