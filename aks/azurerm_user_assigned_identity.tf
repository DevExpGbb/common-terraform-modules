
resource "azurerm_user_assigned_identity" "cluster" {
  name = "${var.cluster_name}-cluster-id"
  resource_group_name = var.resource_group.name
  location = var.resource_group.location
}


resource "azurerm_user_assigned_identity" "kubelet" {
  name = "${var.cluster_name}-kubelet-id"
  resource_group_name = var.resource_group.name
  location = var.resource_group.location
}