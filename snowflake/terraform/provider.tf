
provider "snowflake" {
  organization_name = "AOJAKXH"
  account_name      = "YN03913"
  user              = "GITHUB_ACTIONS_SNOWFLAKE"

  authenticator              = "WORKLOAD_IDENTITY"
  workload_identity_provider = "OIDC"
}

provider "azurerm" {
  features {}
  storage_use_azuread = true
}