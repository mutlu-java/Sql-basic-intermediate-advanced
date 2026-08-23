/* ==============================================================================
   SQL Joins 
-------------------------------------------------------------------------------
   This document provides an overview of SQL joins, which allow combining data
   from multiple tables to retrieve meaningful insights.

   Table of Contents:
     1. Basic Joins
        - INNER JOIN
        - LEFT JOIN
        - RIGHT JOIN
        - FULL JOIN
     2. Advanced Joins
        - LEFT ANTI JOIN
        - RIGHT ANTI JOIN
        - ALTERNATIVE INNER JOIN
        - FULL ANTI JOIN
        - CROSS JOIN
     3. Multiple Table Joins (4 Tables)
=================================================================================
*/

/* ============================================================================== 
   BASIC JOINS 
=============================================================================== */

-- No Join
/* Retrieve all data from customers and orders as separate results */
SELECT * FROM Sales.customers;
SELECT * FROM Sales.orders;

-- INNER JOIN
/* Get all customers along with their orders, 
   but only for customers who have placed an order */
 
SELECT
    c.CustomerID,
    c.firstname,
    o.OrderID,
    o.sales
FROM Sales.customers AS c
INNER JOIN Sales.orders AS o
ON c.CustomerID = o.CustomerID;

-- LEFT JOIN
/* Get all customers along with their orders, 
   including those without orders */
SELECT
    c.CustomerID,
    c.firstname,
    o.OrderID,
    o.sales
FROM Sales.customers AS c
LEFT JOIN Sales.orders AS o
ON c.CustomerID = o.CustomerID;

-- RIGHT JOIN
/* Get all customers along with their orders, 
   including orders without matching customers */
SELECT
    c.CustomerID,
    c.firstname,
    o.OrderID,
    o.sales
FROM  Sales.orders AS o
RIGHT JOIN Sales.customers AS c
ON c.CustomerID = o.CustomerID;

-- Alternative to RIGHT JOIN using LEFT JOIN
/* Get all customers along with their orders, 
   including orders without matching customers */


-- FULL JOIN
/* Get all customers and all orders, even if there’s no match */
SELECT
    --c.CustomerID,
    --c.FirstName,
    --o.OrderID,
    --o.CustomerID,
    --o.sales
    *
FROM Sales.Customers AS c 
FULL JOIN Sales.orders AS o 
ON c.CustomerID = o.CustomerID

/* ============================================================================== 
   ADVANCED JOINS-ANTI JOINS
=============================================================================== */

-- LEFT ANTI JOIN
/* Get all customers who haven't placed any order */
SELECT *
FROM Sales.customers AS c
LEFT JOIN Sales.orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL

-- RIGHT ANTI JOIN
/* Get all orders without matching Sales.Customers */
SELECT *
FROM Sales.Customers AS c
RIGHT JOIN Sales.orders AS o
ON c.CustomerID = o.CustomerID
WHERE c.CustomerID IS NULL

-- Alternative to RIGHT ANTI JOIN using LEFT JOIN
/* Get all orders without matching Sales.Customers */
SELECT *
FROM Sales.orders AS o 
LEFT JOIN Sales.Customers AS c
ON c.CustomerID = o.CustomerID
WHERE c.CustomerID IS NULL

-- Alternative to INNER JOIN using LEFT JOIN
/* Get all customers along with their orders, 
   but only for customers who have placed an order */
SELECT *
FROM Sales.Customers AS c
LEFT JOIN Sales.orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NOT NULL

-- FULL ANTI JOIN
/* Find customers without orders and orders without customers */
SELECT
    *
FROM Sales.Customers AS c 
FULL JOIN Sales.orders AS o 
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL OR c.CustomerID IS NULL

-- CROSS JOIN
/* Generate all possible combinations of customers and orders */
SELECT *
FROM Sales.Customers
CROSS JOIN sales.orders

/* ============================================================================== 
   MULTIPLE TABLE JOINS (4 Tables)
=============================================================================== */

/* Task: Using SalesDB, Retrieve a list of all orders, along with the related customer, product, 
   and employee details. For each order, display:
   - Order ID
   - Customer's name
   - Product name
   - Sales amount
   - Product price
   - Salesperson's name */

USE SalesDB

SELECT 
    o.OrderID,
    o.Sales,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    p.Product AS ProductName,
    p.Price,
    e.FirstName AS EmployeeFirstName,
    e.LastName AS EmployeeLastName
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
ON o.SalesPersonID = e.EmployeeID