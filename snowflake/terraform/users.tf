resource "snowflake_account_role" "dcm_role" {
name = "DCM_ROLE"
comment = "This is a Database Change Management Role created using Terraform."
}