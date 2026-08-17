resource "snowflake_schema" "project" {
  database = "PLATFORM"
  name     = "PROJECT"
}

resource "snowflake_schema" "retail_bronze" {
  database = "RETAIL"
  name     = "BRONZE"
}