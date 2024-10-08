resource "time_sleep" "wait_for_role_assignment" {
  depends_on = [azurerm_role_assignment.cluster-identity-operator]

  create_duration = "60s"
}

resource "azurerm_kubernetes_cluster" "default" {

  depends_on = [time_sleep.wait_for_role_assignment]

  name                = var.cluster_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  dns_prefix          = var.cluster_name

  workload_autoscaler_profile {
    keda_enabled = true
  }

  

  default_node_pool {
    name       = var.system_node_pool.name
    node_count = var.system_node_pool.node_count
    vm_size    = var.system_node_pool.vm_size
  }

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.cluster.id
    ]
  }

  kubelet_identity {
    client_id = azurerm_user_assigned_identity.kubelet.client_id
    object_id = azurerm_user_assigned_identity.kubelet.principal_id
    user_assigned_identity_id = azurerm_user_assigned_identity.kubelet.id
  }
}
