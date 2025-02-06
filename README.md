# Zomato Sales Analysis

## 📌 Overview
This project analyzes a dataset of restaurant sales from Zomato to identify key business insights. Using SQL, we derive patterns in pricing, customer preferences, and restaurant performance based on factors such as online ordering, table booking, and ratings.

## 📊 Dataset Description
The dataset consists of 148 restaurant records with the following columns:

| Column Name                     | Description |
|----------------------------------|-------------|
| `name`                           | Restaurant name |
| `online_order`                   | Whether online ordering is available (`Yes`/`No`) |
| `book_table`                     | Whether table booking is available (`Yes`/`No`) |
| `rate`                            | Customer rating in `X/Y` format (e.g., `4.1/5`) |
| `votes`                           | Number of customer votes |
| `approx_cost(for two people)`    | Approximate cost for two people (numeric) |
| `listed_in(type)`                 | Type of restaurant (e.g., Buffet, Casual Dining) |

## 🚀 Business Problems Addressed
1. **Impact of Online Orders on Customer Ratings** – Do restaurants with online orders have better ratings?
2. **Table Booking and Popularity** – Do restaurants with table booking receive more votes?
3. **Pricing Strategy Across Restaurant Types** – What is the average cost for different restaurant types?
4. **Customer Engagement vs. Ratings** – Do more votes correlate with higher ratings?
5. **Optimal Pricing for Customer Satisfaction** – What price range attracts higher ratings?
6. **Revenue Potential of Online Orders** – Do online-order restaurants charge higher prices?
7. **Key Factors Affecting Ratings** – Which factors (e.g., booking, online order) contribute to high ratings?
8. **Market Demand for Online Orders** – Which restaurant types benefit the most from online ordering?
9. **Competitive Analysis of Top Restaurants** – What characteristics do highly-rated restaurants share?
10. **Customer Preferences in Restaurant Selection** – Do users prefer online orders, table booking, or lower prices?

## 🔍 SQL Queries Used
We used SQL queries to analyze the dataset, including:
```sql
-- Average rating for restaurants with and without online ordering
SELECT online_order, AVG(CAST(SPLIT_PART(rate, '/', 1) AS NUMERIC)) AS avg_rating
FROM zomato_sales
GROUP BY online_order;
```
```sql
-- Average cost for different restaurant types
SELECT "listed_in(type)", ROUND(AVG("approx_cost(for two people)"), 1) AS avg_cost
FROM zomato_sales
GROUP BY "listed_in(type)";
```
For a full list of SQL queries, check the **zomato_sales.sql** file.

## 🛠 Technologies Used
- PostgreSQL for database analysis
- SQL for querying and insights


## 🔍 Findings

1. Top Locations: Certain locations generate higher sales and attract more customers.

2. Popular Cuisines: Some cuisines are more commonly available and preferred by customers.

3. High-Performing Restaurants: Identifying restaurants with the highest ratings and sales.

4. Customer Preferences: Understanding pricing trends based on restaurant ratings and votes.

## 📑 Reports

Sales Summary: Insights into top-selling restaurants and customer preferences.

Cuisine Popularity: Breakdown of cuisine demand in different locations.

Pricing Trends: Analysis of cost variations across different cuisines.  

## 🏁 Conclusion

This project provides valuable insights into Zomato sales data, helping restaurant owners optimize their pricing, improve customer satisfaction, and maximize sales. The SQL-based analysis covers essential business questions that can drive data-driven decision-making.

---
