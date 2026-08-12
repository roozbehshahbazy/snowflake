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

  default_role = snowflake_account_role.dcm_role.name

  # Optional - only required if you want password authentication
  password = var.dcm_user_password

  disabled = false
}


resource "snowflake_grant_privileges_to_account_role" "dcm_database" {
  account_role_name = snowflake_account_role.dcm_role.name

  privileges = ["OWNERSHIP"]

  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.cicd.name
  }
}