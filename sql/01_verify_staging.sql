CREATE DATABASE supply_chain_dw;
USE supply_chain_dw;
SHOW DATABASES;
SHOW TABLES;

-- Verify Row Conts 
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM order_payments;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM sellers;
SELECT COUNT(*) FROM geolocation;
SELECT COUNT(*) FROM order_reviews;