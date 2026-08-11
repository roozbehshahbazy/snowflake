
provider "snowflake" {
  organization_name = "AOJAKXH"
  account_name      = "YN03913"
  role              = "TERRAFORM_ROLE"
  user              = "TERRAFORM_GITHUB"

  authenticator              = "WORKLOAD_IDENTITY"
  workload_identity_provider = "OIDC"
}