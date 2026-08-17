
provider "snowflake" {
  organization_name = "AOJAKXH"
  account_name      = "YN03913"
  user              = "GITHUB_ACTIONS_SNOWFLAKE"
  role              = "GITHUB_ACTIONS_DEPLOYER"

  authenticator              = "WORKLOAD_IDENTITY"
  workload_identity_provider = "OIDC"

  experimental_features_enabled = [
    "USER_ENABLE_DEFAULT_WORKLOAD_IDENTITY"
  ]
}

provider "azurerm" {
  features {}
  storage_use_azuread = true
}