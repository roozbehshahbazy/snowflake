
provider "snowflake" {
  organization_name = "AOJAKXH"
  account_name      = "YN03913"
  role = "GITHUB_ACTIONS_DEPLOYER"

  authenticator              = "WORKLOAD_IDENTITY"
  workload_identity_provider = "OIDC"
}

provider "azurerm" {
  features {}
  storage_use_azuread = true
}