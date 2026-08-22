resource "snowflake_database" "platform" {
  name = "PLATFORM"
}


resource "snowflake_database" "refinery" {
  name = "DEV_REFINERY"
}
