# ---------------------------------------------------------
# DCM Role
# ---------------------------------------------------------

resource "snowflake_account_role" "dcm_role" {
  name    = "DCM_ROLE"
  comment = "This is a Database Change Management Role created using Terraform."
}


# ---------------------------------------------------------
# DCM User
# ---------------------------------------------------------

resource "snowflake_user" "dcm_user" {
  name = "DCM_USER"

  default_role = snowflake_role.dcm_role.name

  # Optional - only required if you want password authentication
  password = var.dcm_user_password

  disabled = false
}

variable "dcm_user_password" {
  type      = string
  sensitive = true
}

# ---------------------------------------------------------
# Grant DCM_ROLE to DCM_USER
# ---------------------------------------------------------

resource "snowflake_grant_account_role" "dcm_role_to_user" {
  role_name = snowflake_role.dcm_role.name
  user_name = snowflake_user.dcm_user.name
}

# ---------------------------------------------------------
# Database-level privileges
# ---------------------------------------------------------

resource "snowflake_grant_privileges_to_account_role" "dcm_database" {
  privileges = [
    "USAGE",
    "CREATE SCHEMA"
  ]

  account_role_name = snowflake_role.dcm_role.name

  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.cicd.name
  }
}

# ---------------------------------------------------------
# Schema-level privileges
# ---------------------------------------------------------
#
# Allows DCM_ROLE to create objects inside existing schemas.
#

resource "snowflake_grant_privileges_to_account_role" "dcm_schemas" {
  privileges = [
    "USAGE",
    "CREATE TABLE",
    "CREATE VIEW",
    "CREATE MATERIALIZED VIEW",
    "CREATE STAGE",
    "CREATE FILE FORMAT",
    "CREATE SEQUENCE",
    "CREATE PIPE",
    "CREATE STREAM",
    "CREATE TASK",
    "CREATE PROCEDURE",
    "CREATE FUNCTION",
    "CREATE MASKING POLICY",
    "CREATE ROW ACCESS POLICY",
    "CREATE TAG"
  ]

  on_schema_object {

    all {
      object_type_plural = "SCHEMAS"
      in_database        = snowflake_database.cicd.name
    }
  }

  account_role_name = snowflake_role.dcm_role.name
}

# ---------------------------------------------------------
# Existing objects inside CICD
# ---------------------------------------------------------
#
# Gives the role access to existing objects.
#

resource "snowflake_grant_privileges_to_account_role" "dcm_all_tables" {
  privileges = [
    "SELECT",
    "INSERT",
    "UPDATE",
    "DELETE",
    "TRUNCATE",
    "REFERENCES"
  ]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_database        = snowflake_database.cicd.name
    }
  }
  account_role_name = snowflake_role.dcm_role.name
}

resource "snowflake_grant_privileges_to_account_role" "dcm_all_views" {
  privileges = [
    "SELECT",
    "REFERENCES"
  ]
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_database        = snowflake_database.cicd.name
    }
  }

  account_role_name = snowflake_role.dcm_role.name
}

resource "snowflake_grant_privileges_to_account_role" "dcm_all_stages" {
  privileges = [
    "USAGE",
    "READ",
    "WRITE"
  ]
  on_schema_object {
    all {
      object_type_plural = "STAGES"
      in_database        = snowflake_database.cicd.name
    }
  }

  account_role_name = snowflake_role.dcm_role.name
}

resource "snowflake_grant_privileges_to_account_role" "dcm_all_sequences" {
  privileges = [
    "USAGE"
  ]
  on_schema_object {
    all {
      object_type_plural = "SEQUENCES"
      in_database        = snowflake_database.cicd.name
    }
  }

  account_role_name = snowflake_role.dcm_role.name
}

resource "snowflake_grant_privileges_to_account_role" "dcm_all_file_formats" {
  privileges = [
    "USAGE"
  ]
  on_schema_object {
    all {
      object_type_plural = "FILE FORMATS"
      in_database        = snowflake_database.cicd.name
    }
  }

  account_role_name = snowflake_role.dcm_role.name
}

# ---------------------------------------------------------
# Future grants
# ---------------------------------------------------------
#
# Automatically grant privileges to objects created later.
#

resource "snowflake_grant_privileges_to_account_role" "dcm_future_tables" {
  privileges = [
    "SELECT",
    "INSERT",
    "UPDATE",
    "DELETE",
    "TRUNCATE",
    "REFERENCES"
  ]
  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_database        = snowflake_database.cicd.name
    }
  }
  account_role_name = snowflake_role.dcm_role.name
}

# resource "snowflake_grant_privileges_to_account_role" "dcm_future_views" {
#   privileges = [
#     "SELECT",
#     "REFERENCES"
#   ]

#   future {
#     object_type_plural = "VIEWS"
#     in_database        = "CICD"
#   }

#   role_name = snowflake_role.dcm_role.name
# }

# resource "snowflake_grant_privileges_to_account_role" "dcm_future_stages" {
#   privileges = [
#     "USAGE",
#     "READ",
#     "WRITE"
#   ]

#   future {
#     object_type_plural = "STAGES"
#     in_database        = "CICD"
#   }

#   role_name = snowflake_role.dcm_role.name
# }