resource "azurerm_kubernetes_cluster_node_pool" "default" {
  for_each = { for pool in var.user_node_pools : pool.name => pool }

  name       = each.value.name
  vm_size    = each.value.vm_size
  node_count = each.value.node_count

  kubernetes_cluster_id = azurerm_kubernetes_cluster.default.id
  tags = var.tags
}