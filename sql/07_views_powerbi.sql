USE supply_chain_dw;

-- Monthly Sales Trend
CREATE VIEW monthly_sales_trend AS
SELECT
    purchase_year,
    purchase_month,
    ROUND(SUM(total_order_value), 2) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM fact_orders
WHERE purchase_year >= 2017
GROUP BY
    purchase_year,
    purchase_month;
    
SELECT * FROM monthly_sales_trend LIMIT 10;  


-- Sales by Customer State
CREATE VIEW sales_by_state AS
SELECT
    dim_customer.customer_state,
    ROUND(SUM(fact_orders.total_order_value), 2) AS total_revenue,
    COUNT(fact_orders.order_id) AS total_orders
FROM fact_orders
JOIN dim_customer
    ON fact_orders.customer_id = dim_customer.customer_id
GROUP BY dim_customer.customer_state;

SELECT * FROM sales_by_state LIMIT 10;

-- Monthly Late Delivery Analysis
CREATE VIEW late_delivery_analysis AS
SELECT
    purchase_year,
    purchase_month,
    COUNT(order_id) AS total_orders,
    SUM(is_late) AS late_orders,
    ROUND(AVG(delivery_delay_days), 2) AS avg_delay_days
FROM fact_orders
GROUP BY
    purchase_year,
    purchase_month
ORDER BY
    purchase_year,
    purchase_month;

SELECT * FROM late_delivery_analysis LIMIT 10;

-- Product Category Performance
CREATE VIEW category_performance AS
SELECT
    dim_product.product_category_name,
    COUNT(fact_orders.order_id) AS total_orders,
    ROUND(SUM(fact_orders.total_order_value), 2) AS total_revenue
FROM fact_orders
JOIN dim_product
    ON fact_orders.product_id = dim_product.product_id
GROUP BY dim_product.product_category_name;

SELECT * FROM category_performance LIMIT 10;

-- Payment Analysis

CREATE VIEW payment_analysis AS
SELECT
    payment_type,
    COUNT(*) AS total_transactions,
    ROUND(SUM(payment_value), 2) AS total_payment_value
FROM order_payments
GROUP BY payment_type;

SELECT * FROM payment_analysis LIMIT 10;