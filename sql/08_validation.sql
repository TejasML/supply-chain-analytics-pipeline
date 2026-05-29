USE supply_chain_dw;


-- Check Row Counts

SELECT COUNT(*) AS customer_rows
FROM dim_customer;

SELECT COUNT(*) AS product_rows
FROM dim_product;

SELECT COUNT(*) AS seller_rows
FROM dim_seller;

SELECT COUNT(*) AS date_rows
FROM dim_date;

SELECT COUNT(*) AS fact_rows
FROM fact_orders;



-- Check Null Values in Fact Table

SELECT
    SUM(customer_id IS NULL) AS null_customers,
    SUM(product_id IS NULL) AS null_products,
    SUM(seller_id IS NULL) AS null_sellers,
    SUM(order_date IS NULL) AS null_order_dates

FROM fact_orders;



-- Verify Fact Table Relationships

SELECT *
FROM fact_orders
LIMIT 10;



-- Validate Foreign Key Matching

SELECT COUNT(*) AS unmatched_customers
FROM fact_orders
LEFT JOIN dim_customer
    ON fact_orders.customer_id = dim_customer.customer_id
WHERE dim_customer.customer_id IS NULL;



SELECT COUNT(*) AS unmatched_products
FROM fact_orders
LEFT JOIN dim_product
    ON fact_orders.product_id = dim_product.product_id
WHERE dim_product.product_id IS NULL;



SELECT COUNT(*) AS unmatched_sellers
FROM fact_orders
LEFT JOIN dim_seller
    ON fact_orders.seller_id = dim_seller.seller_id
WHERE dim_seller.seller_id IS NULL;