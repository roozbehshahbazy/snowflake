resource "snowflake_database" "cicd" {
  name = "CICD"
}

resource "snowflake_database" "platform" {
  name = "platform"
}