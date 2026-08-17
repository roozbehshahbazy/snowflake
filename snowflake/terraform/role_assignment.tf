
resource "snowflake_grant_account_role" "dcm_developer_to_roozbeh" {
  role_name = snowflake_account_role.dcm_developer.name
  user_name = "ROOZBEH1984"
}



resource "snowflake_grant_account_role" "dcm_developer_to_git_user" {
  role_name = snowflake_account_role.dcm_developer.name
  user_name = "GITHUB_ACTIONS_SNOWFLAKE"
}