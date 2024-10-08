
resource "azapi_resource" "bing" {
  type                      = "Microsoft.Bing/accounts@2020-06-10"
  schema_validation_enabled = false
  name                      = var.name
  parent_id                 = azurerm_resource_group.default.id
  location                  = "global"
  body = jsonencode({
    sku = {
      name = "S1"
    }
    kind = "Bing.Search.v7" # or "Bing.CustomSearch"
  })
  response_export_values = ["*"]
}
