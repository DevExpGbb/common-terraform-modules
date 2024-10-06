
resource "azurerm_user_assigned_identity" "cluster" {
  name = "id-aks-runner"
  resource_group_name = var.resource_group.name
  location = var.resource_group.location
}


resource "azurerm_user_assigned_identity" "kubelet" {
  name = "id-aks-runner-kubelet"
  resource_group_name = var.resource_group.name
  location = var.resource_group.location
}