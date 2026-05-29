ALTER TABLE dim_customer
MODIFY customer_id VARCHAR(50);

ALTER TABLE dim_product
MODIFY product_id VARCHAR(50);

ALTER TABLE dim_seller
MODIFY seller_id VARCHAR(50);

ALTER TABLE fact_orders
MODIFY customer_id VARCHAR(50);

ALTER TABLE fact_orders
MODIFY product_id VARCHAR(50);

ALTER TABLE fact_orders
MODIFY seller_id VARCHAR(50);


-- Add Primary Keys

ALTER TABLE dim_customer
ADD PRIMARY KEY (customer_id);

ALTER TABLE dim_product
ADD PRIMARY KEY (product_id);

ALTER TABLE dim_seller
ADD PRIMARY KEY (seller_id);

ALTER TABLE dim_date
ADD PRIMARY KEY (full_date);


-- Add Surrogate Key to Fact Table

ALTER TABLE fact_orders
ADD COLUMN fact_order_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;


-- Add Foreign Keys

ALTER TABLE fact_orders
ADD CONSTRAINT fk_fact_customer
FOREIGN KEY (customer_id)
REFERENCES dim_customer(customer_id);

ALTER TABLE fact_orders
ADD CONSTRAINT fk_fact_product
FOREIGN KEY (product_id)
REFERENCES dim_product(product_id);

ALTER TABLE fact_orders
ADD CONSTRAINT fk_fact_seller
FOREIGN KEY (seller_id)
REFERENCES dim_seller(seller_id);

ALTER TABLE fact_orders
ADD CONSTRAINT fk_fact_date
FOREIGN KEY (order_date)
REFERENCES dim_date(full_date);


SHOW CREATE TABLE fact_orders;