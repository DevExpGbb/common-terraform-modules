
resource "azurerm_user_assigned_identity" "cluster" {
  name = "id-aks-runner"
  resource_group_name = azurerm_resource_group.default.name
  location = azurerm_resource_group.default.location
}


resource "azurerm_user_assigned_identity" "kubelet" {
  name = "id-aks-runner-kubelet"
  resource_group_name = azurerm_resource_group.default.name
  location = azurerm_resource_group.default.location
}