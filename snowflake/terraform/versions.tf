terraform {
  backend "azurerm" {
    subscription_id      = "dadbc2ea-904e-4b51-9974-8581e34e539d"
    resource_group_name  = "terraform"
    storage_account_name = "terraformforsnowflake"
    container_name       = "snowflake"
    key                  = "snowflake.terraform.tfstate"
  }
}
