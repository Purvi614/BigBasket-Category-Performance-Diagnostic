-- BigBasket Capstone
-- 03 Reporting

-- 1. Tier products by Delivered revenue

SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(o.amount_inr) AS total_revenue,
    CASE
        WHEN SUM(o.amount_inr) >= 3000 THEN 'High'
        WHEN SUM(o.amount_inr) >= 1000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_tier
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY total_revenue DESC;

-- 2. Monthly revenue by category

SELECT
    p.category,
    strftime('%Y-%m', o.order_date) AS month,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY
    p.category,
    strftime('%Y-%m', o.order_date)
ORDER BY
    p.category,
    month;

    -- 3. Category target report

SELECT
    p.category,
    SUM(o.amount_inr) AS total_revenue,
    t.target_revenue_inr,
    t.target_revenue_inr - SUM(o.amount_inr) AS variance,
    ((SUM(o.amount_inr) - t.target_revenue_inr) * 100.0) / t.target_revenue_inr AS percentage_variance,
    CASE
        WHEN SUM(o.amount_inr) >= t.target_revenue_inr THEN 'Above Target'
        WHEN SUM(o.amount_inr) >= t.target_revenue_inr * 0.85 THEN 'Below Target - Watch'
        ELSE 'Below Target - Critical'
    END AS performance_tag
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
INNER JOIN category_targets AS t
    ON p.category = t.category
WHERE o.status = 'Delivered'
GROUP BY
    p.category,
    t.target_revenue_inr
ORDER BY
    p.category;