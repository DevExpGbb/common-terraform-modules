
resource "azapi_resource" "bing" {
  type                      = "Microsoft.Bing/accounts@2020-06-10"
  schema_validation_enabled = false
  name                      = var.name
  parent_id                 = var.resource_group.id
  location                  = "global"
  body = jsonencode({
    sku = {
      name = "S1"
    }
    kind = "Bing.Search.v7" # or "Bing.CustomSearch"
  })
  response_export_values = ["*"]
}
