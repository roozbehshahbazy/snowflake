
resource "snowflake_grant_account_role" "dcm_developer_to_roozbeh" {
  role_name        = snowflake_account_role.dcm_developer.name
  parent_role_name = "ROOZBEH1984"
}