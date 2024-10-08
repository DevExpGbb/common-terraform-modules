# Suggest moving to https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/search_service
resource "azurerm_cognitive_account" "default" {
  name                = local.name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  kind                = var.kind
  sku_name            = var.sku_name
}