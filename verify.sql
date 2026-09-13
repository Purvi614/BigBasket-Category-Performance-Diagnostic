-- BigBasket Capstone: Initial Database Verification

-- 1. Check number of products
SELECT 'Products' AS check_name, COUNT(*) AS result
FROM products;

-- 2. Check number of customers
SELECT 'Customers' AS check_name, COUNT(*) AS result
FROM customers;

-- 3. Check number of orders
SELECT 'Orders' AS check_name, COUNT(*) AS result
FROM orders;

-- 4. Check number of category targets
SELECT 'Category Targets' AS check_name, COUNT(*) AS result
FROM category_targets;

-- 5. Check order status distribution
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status
ORDER BY status;