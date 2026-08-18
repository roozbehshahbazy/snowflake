resource "snowflake_schema" "project" {
  database = "PLATFORM"
  name     = "PROJECT"
}


resource "snowflake_schema" "platform_security" {
  database = "PLATFORM"
  name     = "SECURITY"
}


resource "snowflake_schema" "platform_git" {
  database = "PLATFORM"
  name     = "GIT"
}
