-- Rolling 7-Day Average Sales

SELECT
    order_date,
    SUM(total_order_value) AS daily_sales,
    AVG(SUM(total_order_value)) OVER (
        ORDER BY order_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_7_day_avg
FROM fact_orders
GROUP BY order_date
ORDER BY order_date;


-- Month-over-Month Sales using LAG
SELECT
    purchase_year,
    purchase_month,
    SUM(total_order_value) AS monthly_sales,
    LAG(SUM(total_order_value)) OVER (
        ORDER BY purchase_year, purchase_month
    ) AS previous_month_sales
FROM fact_orders
GROUP BY purchase_year, purchase_month;

-- Rank Sellers by Revenue
SELECT
    seller_id,
    SUM(total_order_value) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(total_order_value) DESC
    ) AS seller_rank
FROM fact_orders
GROUP BY seller_id;

-- Running Total of Late Deliveries
SELECT
    order_date,
    SUM(is_late) AS late_orders,
    SUM(SUM(is_late)) OVER (
        ORDER BY order_date
    ) AS running_late_deliveries
FROM fact_orders
GROUP BY order_date
ORDER BY order_date;