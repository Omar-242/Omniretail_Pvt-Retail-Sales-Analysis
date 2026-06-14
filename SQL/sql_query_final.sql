CREATE TABLE clean_sales_dataset (
    Sale_ID TEXT PRIMARY KEY,
    Sale_Date DATE,
    Customer_ID TEXT,
    Product_ID TEXT,
    Product_Category TEXT,
    Store_ID TEXT,
    Region TEXT,
    Quantity_Sold INTEGER,
    Unit_Price NUMERIC(10,2),
    Payment_Method TEXT,
    Returned TEXT,
    Total_Sale_Amount NUMERIC(12,2)
);

--
SELECT * FROM clean_sales_dataset;

-- 1. Which region has the highest total revenue?

CREATE VIEW qs1 as
SELECT Region,
		SUM(Total_Sale_Amount) AS total_revenue
FROM clean_sales_dataset
GROUP BY Region
ORDER BY total_revenue DESC
limit 1;

SELECT * FROM qs1;

-- 2. Which product category generates the highest revenue on average per sale?

CREATE VIEW qs2 as
SELECT Product_Category,
       AVG(Total_Sale_Amount) AS avg_revenue_per_sale
FROM clean_sales_dataset
GROUP BY Product_Category
ORDER BY avg_revenue_per_sale DESC
LIMIT 1;

SELECT * FROM qs2;

-- 3. What is the return rate per product category?

CREATE VIEW qs3 as
SELECT Product_Category,
       CONCAT(ROUND((SUM(CASE 
	           WHEN Returned = 'Yes' THEN 1 
			   ELSE 0 END) * 1.0 / COUNT(*)) * 100, 2), '%') AS return_rate
FROM clean_sales_dataset
GROUP BY Product_Category;

SELECT * FROM qs3;

-- 4. Identify the top 5 products with the highest total sales by quantity.

CREATE VIEW qs4 as
SELECT Product_ID,
       SUM(Quantity_Sold) AS total_quantity
FROM clean_sales_dataset
GROUP BY Product_ID
ORDER BY total_quantity DESC
LIMIT 5;

SELECT * FROM qs4;


-- 5. Which store has the lowest revenue but highest number of sales?

CREATE VIEW qs5 as
WITH store_stats AS (
    SELECT Store_ID,
           SUM(Total_Sale_Amount) AS lowest_revenue,
           COUNT(*) AS highest_total_sales
    FROM clean_sales_dataset
    GROUP BY Store_ID
)
SELECT *
FROM store_stats
ORDER BY lowest_revenue ASC, highest_total_sales DESC
LIMIT 1;

SELECT * FROM qs5;

-- 6. How do different payment methods impact total revenue?

CREATE VIEW qs6 as
SELECT Payment_Method,
       SUM(Total_Sale_Amount) AS total_revenue
FROM clean_sales_dataset
GROUP BY Payment_Method
ORDER BY total_revenue DESC;

SELECT * FROM qs6;

-- 7. Which customers have made the most purchases in terms of total amount spent?

CREATE VIEW qs7 as
SELECT Customer_ID,
       SUM(Total_Sale_Amount) AS total_spent
FROM clean_sales_dataset
GROUP BY Customer_ID
ORDER BY total_spent DESC
LIMIT 10;

SELECT * FROM qs7;

-- 8. Which quarter sees the highest sales?

CREATE VIEW qs8 as
SELECT EXTRACT(QUARTER FROM Sale_Date) AS quarter,
       SUM(Total_Sale_Amount) AS total_revenue
FROM clean_sales_dataset
GROUP BY quarter
ORDER BY total_revenue DESC;

SELECT * FROM qs8;

-- 9. What is the average unit price per product category?

CREATE VIEW qs9 as
SELECT Product_Category,
       ROUND(AVG(Unit_Price), 2) AS avg_unit_price
FROM clean_sales_dataset
GROUP BY Product_Category;

SELECT * FROM qs9;

-- 10. Which product categories have the highest return percentage?

CREATE VIEW qs10 as
SELECT Product_Category,
       ROUND(SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(*), 3) AS return_percentage
FROM clean_sales_dataset
GROUP BY Product_Category
ORDER BY return_percentage DESC;

SELECT * FROM qs10;

