
resource "snowflake_grant_account_role" "dcm_developer_to_roozbeh" {
  role_name        = "DCM_DEVELOPER"
  parent_role_name = "ROOZBEH1984"
}