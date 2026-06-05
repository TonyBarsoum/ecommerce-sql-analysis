# E-Commerce SQL Analysis Project

## Project Overview

This project analyzes an e-commerce dataset using SQL. The goal of the project is to answer business questions related to customers, orders, payments, products, revenue trends, and order status performance.

I created this project to practice SQL for a data analyst internship and to demonstrate my ability to write business-focused queries using PostgreSQL.

## Tools Used

- PostgreSQL
- DBeaver
- SQL
- Visual Studio Code
- GitHub

## SQL Skills Used

- SELECT statements
- Aggregate functions
- GROUP BY
- ORDER BY
- Joins
- Common Table Expressions (CTEs)
- Window functions
- Date functions
- Business analysis

## Dataset Tables

The project uses the following tables:

- `customers`
- `orders`
- `orderitems`
- `payments`
- `products_clean`

## Project Files

### 1. Basic Data Quality and Business Metrics

File: `01_Basic_Data_Quality_and_Business_Metrics.sql`

This script calculates basic business metrics, including:

- Total customers
- Total orders
- Total revenue
- Total ordered items
- Average order value
- Unique products

### 2. Order Performance Analysis

File: `02_order_performance_analysis.sql`

This script analyzes order performance, including:

- Orders by status
- Cancellation rate
- Monthly orders
- Delivered orders per month

### 3. Customer Analysis

File: `03_Customers_Analysis.sql`

This script analyzes customer behavior and location data, including:

- Unique customers
- Top customer states
- Top customer cities
- Total orders by customer state
- Delivered orders by customer state

### 4. Payment Behavior Analysis

File: `04_Payments_Behavior.sql`

This script analyzes customer payment behavior, including:

- Transactions by payment type
- Total payment value by payment type
- Average payment value by payment type
- Orders with multiple installments
- Average installments by payment type

### 5. Product Performance Analysis

File: `05_Products_Performance.sql`

This script analyzes product performance, including:

- Top-selling product categories
- Revenue by product category
- Average sold price by product
- Top products by revenue

### 6. Monthly Revenue Trend and Growth

File: `06_Monthly_Revenue_Trend_and_Growth.sql`

This script analyzes revenue trends over time, including:

- Monthly revenue
- Month-over-month revenue growth
- Monthly revenue ranking
-- Monthly Revenue Trend and Month over Month Growth

This script uses window functions such as `lag()` and `rank()`.

### 7. Order Status Conversion Analysis

File: `07_Order_Status_Conversion_Analysis.sql`

This script analyzes order status performance, including:

- Overall order status conversion rates
- Monthly order status conversion trends
- Months with the highest cancellation rates

## Business Questions Answered

This project answers questions such as:

- How many customers and orders are in the dataset?
- What is the total revenue?
- What is the average order value?
- Which order statuses are most common?
- Which states and cities have the most customers?
- Which payment methods are used the most?
- Which product categories generate the most sales?
- How does revenue change month over month?
- Which months had the highest cancellation rates?

## Key Findings

Some key findings from this analysis include:

- Delivered orders make up the largest share of order statuses.
- Payment behavior can be analyzed by payment type, payment value, and installments.
- Product categories vary in both sales volume and total revenue.
- Monthly revenue changes over time, and window functions can be used to compare current revenue with previous months.
- Cancellation rates can be tracked monthly to identify periods with higher order issues.

## Data Limitation

Repeat customer analysis could not be fully performed because the available dataset only includes `customer_id`, which appears to be unique per order rather than a stable customer identifier.

A true repeat customer analysis would require a persistent customer-level key, such as `customer_unique_id`.

## Conclusion

This project helped me practice SQL by answering real business questions from an e-commerce dataset. It strengthened my understanding of joins, aggregations, CTEs, date functions, window functions, and how to explain data limitations clearly.

This project is part of my preparation for data analyst and MIS internship opportunities.
