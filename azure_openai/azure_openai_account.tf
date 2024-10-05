
### Azure Open AI Account
resource "azapi_resource" "openai_account" {
  type = "Microsoft.CognitiveServices/accounts@2022-12-01"
  name = local.name
  parent_id = var.resource_group.id
  location = var.resource_group.location
  body = jsonencode({
    sku = {
        name = "S0"
      }
    kind = "OpenAI"
    properties = {
      publicNetworkAccess = var.public_network_access
      customSubDomainName = local.name
    }
  })
}
