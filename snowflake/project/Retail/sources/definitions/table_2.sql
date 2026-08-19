DEFINE TABLE {{env_prefix}}RETAIL.BRONZE.orders_raw_v2 (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount NUMBER(10,2)
);