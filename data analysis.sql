USE restaurant_db;

-- Explore the items table
-- View the menu_items table 
SELECT *
FROM menu_items;

-- find the number of items on the menu
SELECT DISTINCT count(menu_item_id) AS tota_no_of_items
FROM menu_items;

-- What are the least and most expensive items on the menu?
SELECT *
FROM menu_items
WHERE price IN (
		(
			SELECT max(price)
			FROM menu_items
			)
		,(
			SELECT min(price)
			FROM menu_items
			)
		);

-- How many Italian dishes are on the menu?
SELECT category
	,count(menu_item_id)
FROM menu_items
WHERE category = 'Italian';

-- What are the least and most expensive Italian dishes on the menu?
WITH italian
AS (
	SELECT *
	FROM menu_items
	WHERE category = 'italian'
	)
SELECT *
FROM italian
WHERE price IN (
		(
			SELECT max(price)
			FROM italian
			)
		,(
			SELECT min(price)
			FROM italian
			)
		);

-- How many dishes are in each category? 
SELECT category
	,count(menu_item_id) AS no_of_items
FROM menu_items
GROUP BY category;

-- What is the average dish price within each category?
SELECT category
	,count(menu_item_id) AS No_of_items
	,round(avg(price), 2) AS avg_price
FROM menu_items
GROUP BY category;

-- Explore the orders table
-- View the order_details table. 
SELECT *
FROM order_details;

-- What is the date range of the table?
SELECT min(order_date)
	,max(order_date)
FROM order_details;

-- How many orders were made within this date range?
SELECT count(DISTINCT order_id) AS no_of_orders
FROM order_details;

-- How many items were ordered within this date range?
SELECT count(item_id) AS no_of_items
FROM order_details;

-- Which orders had the most number of items?
SELECT order_id
	,count(item_id) AS no_of_items
FROM order_details
GROUP BY order_id
ORDER BY no_of_items DESC;

-- How many orders had more than 12 items?
SELECT count(*) AS no_of_orders
FROM (
	SELECT order_id
		,count(item_id) AS no_of_items
	FROM order_details
	GROUP BY order_id
	HAVING no_of_items > 12
	) AS num_orders;

-- Analyze customer behavior
-- Combine the menu_items and order_details tables into a single table
SELECT *
FROM order_details o
LEFT JOIN menu_items m ON o.item_id = m.menu_item_id;

-- What were the least and most ordered items? What categories were they in?
WITH number_table
AS (
	SELECT item_id
		,count(item_id) AS no_of_items
	FROM order_details
	GROUP BY item_id
	)
SELECT m.item_name
	,m.category
	,n.no_of_items
FROM number_table n
INNER JOIN menu_items m ON n.item_id = m.menu_item_id
WHERE n.no_of_items IN (
		(
			SELECT max(no_of_items)
			FROM number_table
			)
		)
	OR n.no_of_items = (
		(
			SELECT min(no_of_items)
			FROM number_table
			)
		);

-- What were the top 5 orders that spent the most money?
SELECT o.order_id
	,sum(m.price) AS total_spend
FROM order_details o
INNER JOIN menu_items m ON m.menu_item_id = o.item_id
GROUP BY o.order_id
ORDER BY total_spend DESC limit 5;

-- View the details of the highest spend orders. Which specific items were purchased?
WITH order_id_details
AS (
	SELECT o.order_id
	FROM order_details o
	INNER JOIN menu_items m ON m.menu_item_id = o.item_id
	GROUP BY o.order_id
	ORDER BY sum(m.price) DESC limit 5
	)
SELECT *
FROM order_details
WHERE order_id IN (
		SELECT order_id
		FROM order_id_details
		);
