resource "azapi_resource" "openai_model" {
  type      = "Microsoft.CognitiveServices/accounts/deployments@2022-12-01"
  name      = "cero_chatgpt_model"
  parent_id = resource.azapi_resource.openai_account.id
  body = jsonencode({
    properties = {
      model = {
        format  = "OpenAI",
        name    = "gpt-35-turbo"
        version = "0301"
      }
      scaleSettings = {
        scaleType = "Standard"
      }
    }
  })
}