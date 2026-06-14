# Retail Sales Analysis using PostgreSQL & Power BI

## Project Overview

This project analyzes retail sales data for **Omniretail Pvt. Ltd.**, a multi-region retail company operating across the North, South, East, and West regions.

The objective is to identify business insights related to:

* Revenue performance
* Product profitability
* Customer purchasing behavior
* Product returns
* Store performance
* Payment method usage

The project demonstrates a complete end-to-end data analytics workflow:

**Raw Dataset → Data Cleaning (Python) → PostgreSQL Analysis → SQL Views → Power BI Dashboard**

---

# Business Problem

Omniretail Pvt. Ltd. faces several business challenges:

* Underperforming regions
* High return rates for some products
* Inconsistent payment method usage
* Differences between store performance and category profitability

To address these issues, the following business questions were analyzed:

1. Which region has the highest total revenue?
2. Which product category generates the highest revenue per sale?
3. What is the return rate per product category?
4. Top 5 products with highest quantity sold.
5. Which store has the lowest revenue but highest number of sales?
6. How do payment methods impact revenue?
7. Which customers spent the most?
8. Which quarter generates the highest sales?
9. Average unit price per category.
10. Product categories with highest return percentage.

---

# Dataset

The dataset contains retail transaction records including:

* Sale_ID
* Sale_Date
* Customer_ID
* Product_ID
* Product_Category
* Store_ID
* Region
* Quantity_Sold
* Unit_Price
* Payment_Method
* Returned
* Total_Sale_Amount

### Raw Dataset

The original dataset contained:

* Inconsistent formatting

---

# Data Processing using Python

The raw dataset was transformed into correct format using Python.

### Cleaning Tasks Performed

* Converted columns into proper data types
* Removed unnecessary spaces
* Validated date columns
* Generated clean dataset for database import

### Technologies Used

* Python
* Pandas

### Output

The final CSV dataset was generated and used for PostgreSQL analysis.

---

# Database Creation

The cleaned dataset was imported into PostgreSQL using pgAdmin 4.

### Database Design

Main table:

* clean_sales_dataset

Important fields:

* Sale_ID
* Sale_Date
* Customer_ID
* Product_ID
* Product_Category
* Store_ID
* Region
* Quantity_Sold
* Unit_Price
* Payment_Method
* Returned
* Total_Sale_Amount

---

# SQL Analysis

All business questions were solved using PostgreSQL queries.

### Key SQL Concepts Used

* Aggregate Functions
* GROUP BY
* ORDER BY
* CASE WHEN
* Common Table Expressions (CTEs)
* Views
* Window Functions
* Subqueries

---

# SQL Views

To simplify Power BI integration, separate SQL Views were created for each business question.

Examples:

```sql
CREATE VIEW qs1 as
SELECT Region,
		SUM(Total_Sale_Amount) AS total_revenue
FROM clean_sales_dataset
GROUP BY Region
ORDER BY total_revenue DESC
limit 1;

SELECT * FROM qs1;
```

```sql
CREATE VIEW qs2 as
SELECT Product_Category,
       AVG(Total_Sale_Amount) AS avg_revenue_per_sale
FROM clean_sales_dataset
GROUP BY Product_Category
ORDER BY avg_revenue_per_sale DESC
LIMIT 1;

SELECT * FROM qs2;
```

These views were directly connected to Power BI.

---

# Power BI Dashboard

After creating SQL Views, PostgreSQL was connected with Power BI.

### Visualizations Created

### 1. Revenue by Region

* Column Chart

### 2. Revenue per Sale by Category

* Column Chart

### 3. Return Rate per Category

* Donut Chart

### 4. Top 5 Products by Quantity Sold

* Column Chart

### 5. Store Performance Analysis

* Column Chart

### 6. Revenue by Payment Method

* Donut Chart

### 7. Top Spending Customers

* Column Chart

### 8. Quarterly Sales Trend

* Donut Chart

### 9. Average Unit Price by Category

* Column Chart

### 10. Category Return Percentage

* Donut Chart

---

# Business Recommendations

### Regional Performance

* Invest more in high-performing regions.
* Conduct market analysis for underperforming regions.

### Product Returns

* Review products with high return percentages.
* Improve product quality checks.

### Store Optimization

* Investigate stores with low revenue but high transaction volume.
* Introduce upselling and cross-selling strategies.

### Customer Retention

* Reward top customers through loyalty programs.
* Offer personalized promotions.

### Payment Methods

* Promote payment methods that generate higher revenue.
* Improve payment convenience across demographics.

### Seasonal Planning

* Increase inventory before peak sales quarters.
* Prepare targeted marketing campaigns during high-demand periods.

---

# Technologies Used

* Python
* Pandas
* PostgreSQL
* pgAdmin 4
* SQL
* Power BI
* Git
* GitHub

---

# Project Workflow

Raw Dataset
↓
Python Data Cleaning
↓
Cleaned Dataset
↓
PostgreSQL Database
↓
SQL Analysis
↓
SQL Views
↓
Power BI Dashboard
↓
Business Insights & Recommendations

---

# Project Structure

```text
Retail-Sales-Analysis/
│
├── Dataset/
│   ├── sales_dataset.csv
│   └── clean_sales_dataset.csv
│
├── Python/
│   └── clean_dataset.py
│
├── SQL/
│   ├── sql_query_final.sql
│
├── PowerBI/
│   └── sql_assignment_powerbi_visualization.pbix
│
├── Images/
│   ├── powerbi_1.png
│   ├── powerbi_2.png
│   └── powerbi_3.png
│   └── powerbi_4.png
│   └── sql_assignment_powerbi_visualization.pdf
│
└── README.md
```

---

# Author

**Omar Faruque Chowdhury**

Data Analytics | SQL | PostgreSQL | Power BI | Python

GitHub: https://github.com/Omar-242
