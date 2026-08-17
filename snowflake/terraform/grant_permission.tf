resource "snowflake_grant_privileges_to_account_role" "dcm_developer_project" {
  privileges        = ["ALL"]
  account_role_name = snowflake_account_role.dcm_developer.name

  on_schema {
    schema_name = snowflake_schema.project.fully_qualified_name
  }

}


resource "snowflake_grant_privileges_to_account_role" "dcm_to_retail" {
  privileges        = ["MODIFY", "CREATE TABLE"]
  account_role_name = snowflake_account_role.dcm_developer.name
  on_schema_object {
    future {
      object_type_plural = ["TABLES", "VIEWS", "DYNAMIC TABLES"]
      in_database        = snowflake_database.test.name
    }
  }
}