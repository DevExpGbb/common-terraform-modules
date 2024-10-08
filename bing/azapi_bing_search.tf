resource "azurerm_cognitive_account" "example" {
  name                = "${var.name}-bing-search-v7"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  kind                = "Bing.Search.v7"
  sku_name            = "S1"
}