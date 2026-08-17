resource "snowflake_schema" "platform_project" {
  database = "PLATFORM"
  name     = "PROJECT"
}

resource "snowflake_schema" "retail_bronze" {
  database = "RETAIL"
  name     = "BRONZE"
}