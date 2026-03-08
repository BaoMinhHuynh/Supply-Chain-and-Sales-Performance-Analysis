-- Key Analytical Questions
-- 1. What are the total sales, total profit, and profit margin across the entire dataset?
SELECT
	EXTRACT(YEAR from order_date) AS year,
	ROUND(SUM(sales), 2) AS total_sales,
	ROUND(SUM(profit), 2) AS total_profit ,
	ROUND(SUM(profit)*100.0/NULLIF(SUM(sales),0),2) AS profit_margin 
FROM supply_chain
GROUP BY 1
ORDER BY 1

-- 2. Which regions and states generate the highest total profit?
SELECT 
	region, 
	state,
	ROUND(SUM(profit),2) AS total_profit
FROM supply_chain 
WHERE EXTRACT(YEAR from order_date) = 2017
GROUP BY 1,2
ORDER BY total_profit DESC 
LIMIT 5

-- 3. Who are the top 10 sales representatives based on total profit and average order value?
SELECT 
	retail_sales_people,
	ROUND(SUM(profit),2) AS total_profit,
	ROUND(SUM(sales)/COUNT(DISTINCT order_id),2) AS avg_order_value
FROM supply_chain 
GROUP BY 1
ORDER BY 2
-- 4. How do sales and profit differ across customer segments?
SELECT 
	segment,
	SUM(sales) AS total_sale,
	SUM(profit) AS total_profit,
	ROUND(SUM(profit)*100.0/NULLIF(SUM(sales),0),2) AS profit_margin
FROM supply_chain
WHERE EXTRACT(YEAR FROM order_date) = 2017
GROUP BY 1

-- 5. Which products have the highest and lowest sales?
WITH product_summarize AS (
	SELECT 
		product_id,
		product_name,
		ROUND(SUM(sales),2) AS total_sales
	FROM supply_chain
	GROUP BY product_id, product_name
)
(SELECT *,
	'High Performing' AS performance_group
FROM product_summarize
ORDER BY total_sales DESC
LIMIT 5)
UNION ALL
(SELECT 
	product_id,
	product_name,
	ROUND(SUM(sales),2) AS total_sales,
	'Low Performing' AS performance_group
FROM supply_chain
GROUP BY product_id, product_name
ORDER BY total_sales 
LIMIT 5)
-- 6. How have total sales changed year over year?
WITH aggre AS (
	SELECT 
		EXTRACT(YEAR FROM order_date) AS year,
		ROUND(SUM(sales),2) AS total_sales
	FROM supply_chain
	GROUP BY 1
)
SELECT *,
	ROUND(LAG(total_sales) OVER(ORDER BY year),2) AS previous_year_sales,
	(total_sales - ROUND(LAG(total_sales) OVER(ORDER BY year),2))*100.0/NULLIF(ROUND(LAG(total_sales) OVER(ORDER BY year),2),0) AS growth_rate
FROM aggre
-- 7. What is the cumulative sales trend over time?
WITH quarter_sales AS (
	SELECT 
		'Q' || EXTRACT(QUARTER FROM order_date) || '-' || EXTRACT (YEAR FROM order_date) AS quarter,
		EXTRACT(YEAR FROM order_date) AS year,
		ROUND(SUM(sales),2) AS total_sales
	FROM supply_chain
	GROUP BY EXTRACT (YEAR FROM order_date),EXTRACT(QUARTER FROM order_date)
	ORDER BY EXTRACT (YEAR FROM order_date),EXTRACT(QUARTER FROM order_date)
)
SELECT *,
	ROUND(SUM(total_sales) OVER(PARTITION BY year ORDER BY quarter),2) AS cumulative
FROM quarter_sales

-- 8. What are the top 3 products by sales within each category?
WITH product_sales AS (
	SELECT
		product_id,
		product_name,
		category,
		ROUND(SUM(sales), 2) AS total_sales
	FROM supply_chain
	GROUP BY product_id, product_name, category 
), ranked AS (
	SELECT *,
		RANK() OVER(PARTITION BY category ORDER BY total_sales DESC) AS ranking
	FROM product_sales 
)
SELECT 
	product_id,
	product_name,
	category,
	total_sales
FROM ranked
WHERE ranking <= 3
-- 9. New Lost Customer Analysis
-- 9.1 What percentage of annual sales comes from new customers each year?
WITH define_new_cus AS (
SELECT *,
	EXTRACT(YEAR FROM order_date) AS year,
	order_date ,
	ROW_NUMBER() OVER (
            PARTITION BY customer_id, EXTRACT(YEAR FROM order_date)
            ORDER BY order_date, order_id
        ),
	CASE WHEN ROW_NUMBER() OVER (
            PARTITION BY customer_id, EXTRACT(YEAR FROM order_date)
            ORDER BY order_date, order_id
        ) = 1
	THEN 'New Customer' ELSE 'Existing Customer' END AS is_new_customer
FROM supply_chain)
SELECT 
	year,
	ROUND(SUM(sales),2) AS total_sales,
	ROUND(SUM(CASE WHEN is_new_customer = 'New Customer' THEN sales END) ,2) AS sales_of_new,
	ROUND(SUM(CASE WHEN is_new_customer = 'New Customer' THEN sales END)*100.0/SUM(sales)) AS percent_sales_of_new
FROM define_new_cus
GROUP BY year
ORDER BY year
-- 9.2 How many customers become inactive (lost) each year?
WITH active AS (
SELECT 
	customer_id,
	order_date,
	EXTRACT(YEAR FROM order_date) AS YEAR,
	MAX(order_date) OVER(PARTITION BY EXTRACT(YEAR FROM order_date)) - MAX(order_date) OVER(PARTITION BY customer_id, EXTRACT(YEAR FROM order_date)) AS active_days
FROM supply_chain 
ORDER BY 1,2), 
status_cus AS (
	SELECT *,
		CASE WHEN active_days < INTERVAL '90 days' THEN 'Active' 
			ELSE 'Lost' END AS status 
	FROM active
)
SELECT 
	year,
	COUNT(DISTINCT customer_id) AS num_of_lost
FROM status_cus
WHERE status = 'Lost'
GROUP BY year
-- 10. What is the average delivery time, and which region has the slowest deliveries?
SELECT 
	EXTRACT(YEAR FROM order_date) AS year,
	ROUND(AVG(days),2) AS avg_delivery_time 
FROM supply_chain
GROUP BY 1
ORDER BY 1

SELECT 
	region,
	ROUND(AVG(days),2) AS avg_delivery_time 
FROM supply_chain
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
-- 11. How does delivery time impact profitability?
WITH group_deliveries AS (
	SELECT 
		days,
		profit,
		sales,
		CASE WHEN days <= 3 THEN 'fast(0-3 days)'
		 WHEN days <= 6 THEN 'medium(3-6 days)'
		 ELSE  'slow (7+ days) '  END AS delivery_bucket,
		 CASE WHEN days <= 3 THEN 1
		 WHEN days <= 6 THEN 2
		 ELSE  3  END AS delivery_rank
	FROM supply_chain
)
SELECT 
	delivery_bucket,
	ROUND(AVG(days),2)AS avg_delivery_days,
	ROUND(AVG(profit),2) AS avg_profit,
	ROUND(SUM(profit)*100.0/NULLIF(SUM(sales),0),2) AS profit_margin 
FROM group_deliveries
GROUP BY delivery_bucket,delivery_rank
ORDER BY delivery_rank

-- 12. Which region has the highest return rate?
SELECT 
	region,
	COUNT(DISTINCT order_id) AS total_orders,
	SUM(CASE WHEN returned = 'Yes' THEN 1 END) AS return_oders,
	ROUND(SUM(CASE WHEN returned = 'Yes' THEN 1 END)*100.0/COUNT(order_id),2) AS return_rate
FROM supply_chain
GROUP BY region
ORDER BY return_rate DESC
LIMIT 1


-- 13. Which product has the highest return rate, and what are the key causes?
SELECT 
	sub_category,
	COUNT(DISTINCT order_id) AS total_orders,
	SUM(CASE WHEN returned = 'Yes' THEN 1 END) AS return_orders,
	ROUND(SUM(CASE WHEN returned = 'Yes' THEN 1 END)*100.0/COUNT(order_id),2) AS return_rate
FROM supply_chain
GROUP BY sub_category
ORDER BY return_rate DESC


