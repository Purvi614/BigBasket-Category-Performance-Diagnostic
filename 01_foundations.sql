-- BigBasket Capstone
-- 01 Foundations: SELECT and WHERE

-- 1. Show all orders from Pune
SELECT o.*
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE c.city = 'Pune';

-- 2. List all distinct product categories
SELECT DISTINCT category
FROM products
ORDER BY category;

-- 3. Show the 5 highest-value orders
SELECT order_id, amount_inr
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;

-- 4. Show order ID and amount with readable column names
SELECT order_id AS "Order ID",
       amount_inr AS "Order Amount"
FROM orders;

-- 5. Show orders paid using UPI or Wallet
SELECT *
FROM orders
WHERE payment_mode IN ('UPI', 'Wallet');

-- 6. Show orders with amounts between 100 and 300
SELECT order_id, amount_inr
FROM orders
WHERE amount_inr BETWEEN 100 AND 300;

-- 6b. Show orders with amounts outside 100 to 300
SELECT order_id, amount_inr
FROM orders
WHERE amount_inr NOT BETWEEN 100 AND 300;

-- 7. Show orders where rating is missing
SELECT order_id, status, rating
FROM orders
WHERE rating IS NULL;