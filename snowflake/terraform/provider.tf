
provider "snowflake" {
  organization_name = "AOJAKXH"
  account_name      = "YN03913"

  authenticator              = "WORKLOAD_IDENTITY"
  workload_identity_provider = "OIDC"
}

