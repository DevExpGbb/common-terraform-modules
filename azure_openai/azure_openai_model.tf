resource "azapi_resource" "model_deployment" {
  for_each = var.models

  depends_on = [
    azapi_resource.openai_account
  ]

  name = each.key
  type      = "Microsoft.CognitiveServices/accounts/deployments@2022-12-01"
  parent_id = resource.azapi_resource.openai_account.id

  body = jsonencode({
    properties = {
      model = {
        format  = each.value.format
        name    = each.value.name
        version = each.value.version
      }
      scaleSettings = {
        scaleType = "Standard"
      }
    }
  })
}