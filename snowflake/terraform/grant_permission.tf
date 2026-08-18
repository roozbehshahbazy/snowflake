resource "snowflake_grant_privileges_to_account_role" "dcm_developer_project" {
  privileges        = ["ALL"]
  account_role_name = snowflake_account_role.dcm_developer.name

  on_schema {
    schema_name = snowflake_schema.project.fully_qualified_name
  }

}

# Grant USAGE on PLATFORM database to DCM_DEVELOPER
resource "snowflake_grant_privileges_to_account_role" "platform_usage" {
  account_role_name = snowflake_account_role.dcm_developer.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.platform.name
  }
}