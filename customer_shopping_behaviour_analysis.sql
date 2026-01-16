CREATE DATABASE customer_shopping_analysis;

USE customer_shopping_analysis;

SELECT*FROM customer_shopping_analysis;


-- 1.what revenue genearted by male vs female
SELECT
	gender,
    SUM(purchase_amount) 'total revenue'
	FROM customer_shopping_analysis
	group by gender;
    
-- 2.which customer spent more avg amount after discount
SELECT
	customer_id,
    purchase_amount
FROM customer_shopping_analysis
WHERE discount_applied = 'Yes' and purchase_amount >= (SELECT  AVG(purchase_amount) from customer_shopping_analysis)

-- 3.how often are the customer purchasing

SELECT
	customer_id,
    COUNT(*) 'total_purchase'
    FROM customer_shopping_analysis
    GROUP BY customer_id
    ORDER BY total_purchase DESC;

-- 4.average spend per customer
SELECT 
    customer_id,
    ROUND(AVG(purchase_amount), 2) 'avg_spend'
	FROM customer_shopping_analysis
	GROUP BY customer_id;

-- 5.top customers by total spend
SELECT 
    customer_id,
    SUM(purchase_amount) 'total_spent'
	FROM customer_shopping_analysis
	GROUP BY customer_id
	ORDER BY total_spent DESC;

