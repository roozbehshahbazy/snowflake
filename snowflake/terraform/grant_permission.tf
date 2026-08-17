resource "snowflake_grant_privileges_to_account_role" "dcm_developer_project" {
  privileges        = ["ALL"]
  account_role_name = snowflake_account_role.dcm_developer.name

  on_schema {
    schema_name = snowflake_schema.project.fully_qualified_name
  }

}


resource "snowflake_grant_privileges_to_account_role" "dcm_to_retail_table" {
  privileges        = ["MODIFY", "CREATE TABLE", "SELECT"]
  account_role_name = snowflake_account_role.dcm_developer.name
  on_schema_object {
    future {
      object_type_plural = ["TABLES"]
      in_database        = snowflake_database.retail.name
    }
  }
}


resource "snowflake_grant_privileges_to_account_role" "dcm_to_retail_view" {
  privileges        = ["MODIFY", "CREATE TABLE", "SELECT"]
  account_role_name = snowflake_account_role.dcm_developer.name
  on_schema_object {
    future {
      object_type_plural = ["VIEWS"]
      in_database        = snowflake_database.retail.name
    }
  }
}