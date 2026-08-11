# resource "snowflake_database" "cicd" {
#   name = "cicd"
# }


resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
}