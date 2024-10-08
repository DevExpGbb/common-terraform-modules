resource "azurerm_search_service" "example" {
  name                = var.name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  sku                 = "standard"

  local_authentication_enabled = false
}