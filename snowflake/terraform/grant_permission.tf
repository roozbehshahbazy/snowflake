resource "snowflake_grant_privileges_to_account_role" "dcm_developer_project" {
  privileges        = ["ALL"]
  account_role_name = snowflake_account_role.dcm_developer.name

  on_schema {
    schema_name = snowflake_schema.project.name
  }

}