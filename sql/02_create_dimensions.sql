
-- Create dimension tables from staging tables

-- Customer Dimension

DROP TABLE IF EXISTS dim_customer;
CREATE TABLE dim_customer AS
SELECT DISTINCT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM customers;


-- Product Dimension

DROP TABLE IF EXISTS dim_product;
CREATE TABLE dim_product AS
SELECT DISTINCT
    product_id,
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM products;


-- Seller Dimension

DROP TABLE IF EXISTS dim_seller;
CREATE TABLE dim_seller AS
SELECT DISTINCT
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
FROM sellers;


-- Payment Dimension

DROP TABLE IF EXISTS dim_payment;
CREATE TABLE dim_payment AS
SELECT DISTINCT
    payment_type,
    payment_installments
FROM order_payments;


-- Location Dimension

DROP TABLE IF EXISTS dim_location;
CREATE TABLE dim_location AS
SELECT
    geolocation_zip_code_prefix,
    geolocation_city,
    geolocation_state,
    ROUND(AVG(geolocation_lat), 6) AS avg_lat,
    ROUND(AVG(geolocation_lng), 6) AS avg_lng
FROM geolocation
GROUP BY
    geolocation_zip_code_prefix,
    geolocation_city,
    geolocation_state;


-- Date Dimension

DROP TABLE IF EXISTS dim_date;
CREATE TABLE dim_date AS
SELECT DISTINCT
    DATE(order_purchase_timestamp) AS full_date,
    YEAR(order_purchase_timestamp) AS year,
    MONTH(order_purchase_timestamp) AS month,
    MONTHNAME(order_purchase_timestamp) AS month_name,
    DAY(order_purchase_timestamp) AS day,
    DAYNAME(order_purchase_timestamp) AS day_name,
    QUARTER(order_purchase_timestamp) AS quarter
FROM orders;