
provider "snowflake" {
  account = "AOJAKXH-YN03913"
  role    = "TERRAFORM_ROLE"

  authenticator              = "WORKLOAD_IDENTITY"
  workload_identity_provider = "OIDC"
}