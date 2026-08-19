define database DEV_RETAIL;

define schema DEV_RETAIL.BRONZE;


define VIEW DEV_RETAIL.BRONZE.ENVIRONMENT_V
AS 
SELECT
    'DEV' AS ENVIRONMENT,
    'RETAIL' AS BUSINESS_UNIT,
    'NZ' AS COUNTRY;

define VIEW DEV_RETAIL.BRONZE.ENVIRONMENT_V2
AS 
SELECT
    'DEV' AS ENVIRONMENT,
    'RETAIL' AS BUSINESS_UNIT,
    'NZ' AS COUNTRY;



DEFINE TABLE DEV_RETAIL.BRONZE.orders_raw (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount NUMBER(10,2)
);


DEFINE DYNAMIC TABLE DEV_RETAIL.BRONZE.customer_spend
    TARGET_LAG = '1 minute'  -- Refresh interval (can be minutes, hours, etc.)
    WAREHOUSE = RETAIL_WH  -- Warehouse used for refresh
AS
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(amount) AS total_spent
FROM DEV_RETAIL.BRONZE.orders_raw 
GROUP BY customer_id;