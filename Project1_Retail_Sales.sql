CREATE DATABASE PROJECT1;

CREATE TABLE RETAIL_SALES (
TRANSACTIONS_ID INT PRIMARY KEY,
SALE_DATE DATE,
SALE_TIME TIME,
CUSTOMER_ID INT,
GENDER VARCHAR(15),
AGE INT,
CATEGORY VARCHAR(15),
QUANTITY INT,
PRICE_PER_UNIT INT,
COGS FLOAT,
TOTAL_SALE INT);

-- FIRST I CHECK, IF THERE IS ANY DUPLICATE & MISSING VALUES, I FOUND MISSING VALUES AND REPLACED THEM WITH AVERAGE VALUES OF THAT COLUMN.

-- TO SEE THE COMPLETE DATA INSIDE TABLE:
SELECT * FROM RETAIL_SALES;

-- TO SEE THE TOTAL NUMBER OF ROWS INSIDE TABLE:
SELECT COUNT(*) FROM RETAIL_SALES;

-- ONE COLUMN NAME IS CHANGED ITSELF, LET'S MODIFY IT.
ALTER TABLE RETAIL_SALES
CHANGE ï»¿TRANSACTIONS_ID TRANSACTIONS_ID INT PRIMARY KEY;

ALTER TABLE RETAIL_SALES
CHANGE QUANTITY QUANTITY VARCHAR(15);

-- NOW I WANT TO FIND OUT IF MY DATA CONTAINS NULL VALUES:

SELECT * FROM RETAIL_SALES WHERE TRANSACTIONS_ID IS NULL OR SALE_DATE IS NULL OR SALE_TIME IS NULL OR CUSTOMER_ID IS NULL OR GENDER IS NULL OR AGE IS NULL OR CATEGORY IS NULL OR QUANTITY IS NULL OR PRICE_PER_UNIT IS NULL OR COGS IS NULL OR TOTAL_SALE IS NULL;

-- IF THERE WERE ANY NULL VALUE I HAVE THE OPTION TO DELETE THAT VALUE. THIS IS CALLED DATA CLEANING.
DELETE FROM RETAIL_SALES WHERE TRANSACTIONS_ID IS NULL OR SALE_DATE IS NULL OR SALE_TIME IS NULL OR CUSTOMER_ID IS NULL OR GENDER IS NULL OR AGE IS NULL OR CATEGORY IS NULL OR QUANTITY IS NULL OR PRICE_PER_UNIT IS NULL OR COGS IS NULL OR TOTAL_SALE IS NULL;

-- HOW MANY SALES WE HAVE?
SELECT COUNT(*) AS TOTAL_SALES FROM RETAIL_SALES;

-- HOW MANY UNIQUE CUSTOMERS WE HAVE?
SELECT COUNT(DISTINCT(CUSTOMER_ID)) FROM RETAIL_SALES;

-- HOW MANY UNIQUE CATEGORIES WE HAVE?
SELECT COUNT(DISTINCT(CATEGORY)) FROM RETAIL_SALES;

-- DATA ANALYSIS & BUSINESS KEY PROBLEMS & ANSWERS:

-- 1. WRITE A SQL QUERY TO RETRIEVE ALL COLUMNS FOR SALES MADE ON '11-05-2022:
SELECT * FROM RETAIL_SALES WHERE SALE_DATE = '11-05-2022';

-- 3. WRITE A SQL QUERY TO CALCULATE THE TOTAL SALES (TOTAL_SALE) FOR EACH CATEGORY.
SELECT CATEGORY, COUNT(*) AS TOTAL_QUANTITY, SUM(TOTAL_SALE) AS TOTAL_SALES FROM RETAIL_SALES GROUP BY CATEGORY;

-- 4. WRITE A SQL QUERY TO FIND THE AVERAGE AGE OF CUSTOMERS WHO PURCHASED ITEMS FROM THE 'BEAUTY' CATEGORY.
SELECT ROUND(AVG(AGE),0) AS AVERAGE_AGE FROM RETAIL_SALES WHERE CATEGORY = 'BEAUTY';

-- 5. WRITE A SQL QUERY TO FIND ALL TRANSACTIONS WHERE THE TOTAL_SALE IS GREATER THAN 1000.
SELECT * FROM RETAIL_SALES WHERE TOTAL_SALE > 1000;

-- 6. WRITE A SQL QUERY TO FIND THE TOTAL NUMBER OF TRANSACTIONS (TRANSACTION_ID) MADE BY EACH GENDER IN EACH CATEGORY.
SELECT CATEGORY, GENDER, COUNT(TRANSACTIONS_ID) AS NUMBER_OF_TRANSACTIONS FROM RETAIL_SALES GROUP BY GENDER, CATEGORY;

-- 8. WRITE A SQL QUERY TO FIND THE TOP 5 CUSTOMERS BASED ON THE HIGHEST TOTAL SALES.
SELECT CUSTOMER_ID, SUM(TOTAL_SALE) FROM RETAIL_SALES GROUP BY CUSTOMER_ID ORDER BY SUM(TOTAL_SALE) DESC LIMIT 5;

-- 9. WRITE A SQL QUERY TO FIND THE NUMBER OF UNIQUE CUSTOMERS WHO PURCHASED ITEMS FROM EACH CATEGORY.
SELECT CATEGORY, COUNT(DISTINCT CUSTOMER_ID) FROM RETAIL_SALES GROUP BY CATEGORY;

-- 10. WRITE A SQL QUERY TO CREATE EACH SHIFT AND NUMBER OF ORDERS (EXAMPLE: MORNING <12, AFTERNOON BETWEEN 12 & 17, EVENING >17).
SELECT CASE WHEN HOUR(SALE_TIME) < 12 THEN 'MORNING' WHEN HOUR(SALE_TIME) BETWEEN 12 AND 17 THEN 'AFTERNOON' ELSE 'EVENING' END AS SHIFT,
COUNT(*) AS NUMBER_OF_ORDERS FROM RETAIL_SALES GROUP BY SHIFT ORDER BY FIELD(SHIFT, 'MORNING', 'AFTERNOON', 'EVENING');

-- END OF PROJECT --