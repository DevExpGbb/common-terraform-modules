output "cluster" {
  value = object({
    id       = azurerm_kubernetes_cluster.default.id
    name     = azurerm_kubernetes_cluster.default.name
    cluster_principal_id = azurerm_user_assigned_identity.cluster.principal_id
    kubelet_principal_id = azurerm_user_assigned_identity.kubelet.principal_id
  })
}