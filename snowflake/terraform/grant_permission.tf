resource "snowflake_grant_privileges_to_account_role" "dcm_developer_project" {
  privileges        = ["ALL"]
  account_role_name = snowflake_account_role.dcm_developer.name

  on_schema {
    schema_name = snowflake_schema.project.fully_qualified_name
  }

}

# Grant USAGE on RETAIL database to DCM_DEVELOPER
resource "snowflake_grant_privileges_to_account_role" "retail_usage" {
  account_role_name = snowflake_account_role.dcm_developer.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.retail.name
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


resource "snowflake_grant_privileges_to_account_role" "dcm_to_retail_table" {
  privileges        = ["ALL"]
  account_role_name = snowflake_account_role.dcm_developer.name
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = snowflake_database.retail.name
    }
  }
}


resource "snowflake_grant_privileges_to_account_role" "dcm_to_retail_view" {
  privileges        = ["ALL"]
  account_role_name = snowflake_account_role.dcm_developer.name
  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_database        = snowflake_database.retail.name
    }
  }
}