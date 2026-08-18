define database {{env_prefix}}RETAIL;

define schema {{env_prefix}}RETAIL.BRONZE;


define VIEW {{env_prefix}}RETAIL.BRONZE.ENVIRONMENT_V
AS 
SELECT
    'DEV' AS ENVIRONMENT,
    'RETAIL' AS BUSINESS_UNIT,
    'NZ' AS COUNTRY;

