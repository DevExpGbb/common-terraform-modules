resource "azurerm_cognitive_deployment" "all" {
  for_each = var.models

  name                 = each.key
  cognitive_account_id = azurerm_cognitive_account.default.id
  model {
    format  = var.kind
    name    = each.value.name
    version = each.value.version
  }

  sku {
    name = "Standard"
  }
}