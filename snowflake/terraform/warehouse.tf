# Resource with required fields
resource "snowflake_warehouse" "retail_warehouse" {
  name           = "retail_wh"
  warehouse_type = "STANDARD"
  warehouse_size = "X-SMALL"
  auto_suspend   = 300

}