
resource "snowflake_grant_account_role" "dcm_developer_to_roozbeh" {
  role_name = snowflake_account_role.dcm_developer.name
  user_name = "ROOZBEH1984"
}



resource "snowflake_grant_account_role" "dcm_developer_to_git_user" {
  role_name = snowflake_account_role.dcm_developer.name
  user_name = snowflake_service_user.github_actions_dmc_snowflake.name
}