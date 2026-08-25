/* ============================================================================== 
   SQL String Functions
-------------------------------------------------------------------------------
   This document provides an overview of SQL string functions, which allow 
   manipulation, transformation, and extraction of text data efficiently.

   Table of Contents:
     1. Manipulations
        - CONCAT
        - LOWER
        - UPPER
	- TRIM
	- REPLACE
     2. Calculation
        - LEN
     3. Substring Extraction
        - LEFT
        - RIGHT
        - SUBSTRING
=================================================================================
*/

/* ============================================================================== 
   CONCAT() - String Concatenation
=============================================================================== */

-- Concatenate first name and country into one column
SELECT 
    CONCAT(FirstName, '-', Country) AS full_info
FROM Sales.Customers;

/* ============================================================================== 
   LOWER() & UPPER() - Case Transformation
=============================================================================== */

-- Convert the first name to lowercase
SELECT 
    LOWER(FirstName) AS lower_case_name
FROM Sales.Customers

-- Convert the first name to uppercase
SELECT 
    UPPER(FirstName) AS upper_case_name
FROM Sales.Customers
	
/* ============================================================================== 
   TRIM() - Remove White Spaces
=============================================================================== */

-- Find Sales.Customers whose first name contains leading or trailing spaces
SELECT 
    FirstName,
	LEN(FirstName) len_name,
	LEN(TRIM(FirstName)) len_trim_name, 
	LEN(FirstName) - LEN(TRIM(FirstName)) flag
FROM Sales.Customers 
--WHERE LEN(FirstName)  != LEN(TRIM(FirstName))
WHERE FirstName != TRIM(FirstName)

/* ============================================================================== 
   REPLACE() - Replace or Remove old value with new one
=============================================================================== */
-- Remove dashes (-) from a phone number
SELECT
'123-456-7890' AS phone,
REPLACE('123-456-7890', '-', '/') AS clean_phone

-- Replace File Extence from txt to csv
SELECT
'report.txt' AS old_filename,
REPLACE('report.txt', '.txt', '.csv') AS new_filename
	
/* ============================================================================== 
   LEN() - String Length & Trimming
=============================================================================== */

-- Calculate the length of each customer's first name
SELECT 
    FirstName, 
    LEN(FirstName) AS name_length
FROM Sales.Customers
	
/* ============================================================================== 
   LEFT() & RIGHT() - Substring Extraction
=============================================================================== */

-- Retrieve the first two characters of each first name
SELECT 
    FirstName,
    LEFT(TRIM(FirstName), 2) AS first_2_chars-- trimming to not get blank space as name
FROM Sales.Customers

-- Retrieve the last two characters of each first name
SELECT 
    FirstName,
    RIGHT(FirstName, 2) AS last_2_chars
FROM Sales.Customers
	
/* ============================================================================== 
   SUBSTRING() - Extracting Substrings
   SUBSTRING(text_or_column, start, end)
=============================================================================== */

-- Retrieve a list of Sales.Customers' first names after removing the first character
SELECT 
    FirstName,
    SUBSTRING(TRIM(FirstName), 2, LEN(FirstName)) AS trimmed_name 
    
FROM Sales.Customers	

/* ==============================================================================
   NESTING FUNCTIONS
===============================================================================*/

-- Nesting
SELECT
FirstName, 
UPPER(LOWER(FirstName)) AS nesting
FROM Sales.Customers
