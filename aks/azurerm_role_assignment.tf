
resource "azurerm_role_assignment" "cluster-identity" {
  principal_id         = azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Contributor"
  scope                = var.resource_group.id
}

resource "azurerm_role_assignment" "cluster-identity-operator" {
  principal_id         = azurerm_user_assigned_identity.cluster.principal_id
  role_definition_name = "Managed Identity Operator"
  scope                = azurerm_user_assigned_identity.kubelet.id
}

resource "azurerm_role_assignment" "acr" {
  scope = var.container_registry.id
  role_definition_name = "AcrPull"
  principal_id = azurerm_user_assigned_identity.kubelet.principal_id
}