-- Revenue by Month
SELECT
    purchase_year,
    purchase_month,
    ROUND(SUM(total_order_value), 2) AS total_revenue
FROM fact_orders
GROUP BY
    purchase_year,
    purchase_month
ORDER BY
    purchase_year,
    purchase_month;


-- Orders by State
SELECT
    dim_customer.customer_state,
    COUNT(fact_orders.order_id) AS total_orders
FROM fact_orders
JOIN dim_customer
    ON fact_orders.customer_id = dim_customer.customer_id
GROUP BY dim_customer.customer_state
ORDER BY total_orders DESC;


-- Top 10 Products by Revenue
SELECT
    product_id,
    ROUND(SUM(total_order_value), 2) AS total_revenue
FROM fact_orders
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 10;


-- Average Delivery Delay by State
SELECT
    dim_customer.customer_state,
    ROUND(AVG(delivery_delay_days), 2) AS avg_delay_days
FROM fact_orders
JOIN dim_customer
    ON fact_orders.customer_id = dim_customer.customer_id
GROUP BY dim_customer.customer_state
ORDER BY avg_delay_days DESC;


-- Payment Type Distribution
SELECT
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value), 2) AS total_payment_value
FROM order_payments
GROUP BY payment_type
ORDER BY total_payment_value DESC;