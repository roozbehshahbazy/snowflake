
provider "snowflake" {
  organization_name = "AOJAKXH"
  account_name = "YN03913"
  role    = "TERRAFORM_ROLE"

  authenticator              = "WORKLOAD_IDENTITY"
  workload_identity_provider = "OIDC"
}