
DROP TABLE IF EXISTS fact_orders;

CREATE TABLE fact_orders AS
SELECT
    orders.order_id,
    orders.customer_id,
    order_items.product_id,
    order_items.seller_id,

    DATE(orders.order_purchase_timestamp) AS order_date,

    orders.order_status,

    order_items.price,
    order_items.freight_value,

    (order_items.price + order_items.freight_value) AS total_order_value,

    DATEDIFF(
        orders.order_delivered_customer_date,
        orders.order_estimated_delivery_date
    ) AS delivery_delay_days,

    DATEDIFF(
        orders.order_delivered_customer_date,
        orders.order_purchase_timestamp
    ) AS lead_time_days,

    CASE
        WHEN orders.order_delivered_customer_date >
             orders.order_estimated_delivery_date
        THEN 1
        ELSE 0
    END AS is_late,

    reviews.review_score,

    orders.purchase_year,
    orders.purchase_month,
    orders.purchase_day,
    orders.purchase_hour

FROM orders

JOIN order_items
    ON orders.order_id = order_items.order_id

LEFT JOIN order_reviews AS reviews
    ON orders.order_id = reviews.order_id;
    
SELECT COUNT(*) FROM fact_orders;

SELECT * FROM fact_orders LIMIT 10;