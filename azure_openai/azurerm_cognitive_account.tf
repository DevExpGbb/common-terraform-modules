resource "azurerm_cognitive_account" "default" {
  name                = local.name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.example.name
  kind                = var.kind
  sku_name            = var.sku_name
}