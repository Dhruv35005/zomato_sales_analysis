--CREATE TABLE--
CREATE TABLE zomato_sales
			(
				name VARCHAR(100),
				online_order VARCHAR(3),
				book_table VARCHAR(3),
				rate VARCHAR(10),
				votes INT,
				approx_cost_for_two_people INT,
				listed_in_type VARCHAR(100)
			);
			
SELECT COUNT(*) FROM zomato_sales;

--EDA--

--How many restaurants are in the dataset?--
SELECT COUNT(*) AS total_restaurants
FROM zomato_sales;

--What is the distribution of restaurants offering online ordering?--
SELECT online_order,
	COUNT(*) AS restaurant_count
FROM zomato_sales
GROUP BY online_order;

--What is the average rating for each restaurant type?--
SELECT listed_in_type, 
AVG(CAST(SUBSTRING(rate, 1, LENGTH(rate) -2) 
AS DECIMAL(2,1))) AS average_rating
FROM zomato_sales
GROUP BY listed_in_type
ORDER BY average_rating DESC;

-- Does online ordering affect the average rating?--
SELECT online_order, AVG(CAST(SUBSTRING(rate, 1, LENGTH(rate) - 2) AS DECIMAL(2,1))) AS average_rating
FROM zomato_sales
GROUP BY online_order;



--DATA ANALYSIS & BUSINESS KEY PROBLEMS & SOLUTIONS--

--1. Impact of Online Orders on Customer Ratings--

--How do the average ratings of restaurants that offer online orders compare to those that do not?--
SELECT online_order, AVG(CAST(SPLIT_PART(rate, '/', 1) AS NUMERIC)) AS avg_rating
FROM zomato_sales
GROUP BY online_order;


--2. Correlation Between Table Booking and Restaurant Popularity--

--Do restaurants with table booking have more votes than those without?--
SELECT book_table,
AVG(votes) AS avg_votes
FROM zomato_sales
GROUP BY book_table;


--Pricing Strategy for Different Restaurant Types--

--What is the average cost for two people across different restaurant types?--
SELECT listed_in_type,
AVG(approx_cost_for_two_people) AS avg_cost
FROM zomato_sales
GROUP BY listed_in_type;


--4. Customer Engagement vs. Rating Relationship--

--Is there a correlation between the number of votes and restaurant ratings?--
SELECT votes, CAST(SPLIT_PART(rate, '/', 1)AS NUMERIC) AS rating
FROM zomato_sales
ORDER BY votes DESC;

--5.Optimal Pricing for Maximizing Customer Satisfaction--

--What is the average rating for different price ranges?--
SELECT
	CASE
		WHEN approx_cost_for_two_people <= 500 THEN 'Low'
		WHEN approx_cost_for_two_people BETWEEN 501 AND 1000 THEN 'Medium'
		ELSE 'High'
	END AS price_range,
	AVG(CAST(SPLIT_PART(rate, '/', 1) AS NUMERIC)) AS avg_rating
FROM zomato_sales
GROUP BY price_range;

--6.The Influence of Online Orders on Revenue Potential--

--Do restaurants that accept online orders have higher average prices?
SELECT online_order,
AVG(approx_cost_for_two_people) AS avg_price
FROM zomato_sales
GROUP BY online_order;

--7. Key Factors Influencing Restaurant Ratings--

--Which factors (online order, book table, restaurant type) have the highest-rated restaurants?--
SELECT 
		online_order,
		book_table,
		listed_in_type,
		AVG(CAST(SPLIT_PART(rate, '/', 1) AS NUMERIC)) AS avg_rating
FROM zomato_sales
GROUP BY online_order,book_table,listed_in_type
ORDER BY avg_rating DESC;

--8. Market Demand for Online Orders in Different Restaurant Types--

--Which restaurant types have the highest percentage of online orders?--
SELECT listed_in_type,
		COUNT(*) FILTER (WHERE online_order = 'Yes') * 100.0 / COUNT(*) AS online_order_percentage
FROM zomato_sales
GROUP BY listed_in_type
ORDER BY online_order_percentage DESC;


--9. Competitive Analysis of Top-Rated Restaurants--

--What are the common characteristics of restaurants with the highest ratings?--
SELECT 
		name,
		online_order,
		book_table,
		listed_in_type,
		votes,
		approx_cost_for_two_people,
		rate
FROM zomato_sales
WHERE CAST(SPLIT_PART(rate, '/', 1) AS NUMERIC) >= 4.5
ORDER BY rate DESC, votes DESC;

--10. Customer Preferences for Restaurant Selection--

--Are customers more likely to choose restaurants with online orders, table booking, or lower prices?--
SELECT online_order, book_table, 
       COUNT(*) AS total_restaurants,
       AVG(approx_cost_for_two_people) AS avg_cost,
       AVG(votes) AS avg_votes
FROM zomato_sales
GROUP BY online_order, book_table
ORDER BY avg_votes DESC;



















