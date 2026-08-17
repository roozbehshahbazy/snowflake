resource "snowflake_service_user" "github_actions_dmc_snowflake" {
  name = "GITHUB_ACTIONS_SNOWFLAKE_DMC"

  default_workload_identity {
    oidc {
      issuer  = "https://token.actions.githubusercontent.com"
      subject = "repo:roozbehshahbazy/snowflake:environment:dev"
    }
  }
}