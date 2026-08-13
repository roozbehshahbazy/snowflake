define warehouse DCM_DEMO_1_WH
with 
    warehouse_size = "X-SMALL"
    auto_suspend = 300
    comment = 'For Quickstart Demo of DCM Projects PrPr'
;

grant USAGE on warehouse DCM_DEMO_1_WH to role GITHUB_ACTIONS_DEPLOYER;

USE WAREHOUSE DCM_DEMO_1_WH;

define SCHEMA CICD.BRONZE;

define SCHEMA CICD.SILVER;