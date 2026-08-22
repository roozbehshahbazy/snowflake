resource "snowflake_schema" "project" {
  database = snowflake_database.platform.name
  name     = "PROJECT"
}


resource "snowflake_schema" "refinery_bronze_schema" {
  name     = "BRONZE"
  database = snowflake_database.refinery.name
}
