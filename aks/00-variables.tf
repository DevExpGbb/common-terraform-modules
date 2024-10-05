variable "resource_group" {
  description = "Resource Group to add the AKS Cluster to"
  type = object({
    id       = string
    name     = string
    location = string
  })
}

variable "admin_username" {
  description = "Admin username for the AKS Cluster"
  type = string
}

variable "cluster_name" {
  description = "Name of the AKS Cluster"
  type = string
}
variable "container_registry" {
  description = "Azure Container Registry to link to the AKS Cluster Kubelet Identity"
  type = object({
    id       = string
  })
}

variable "tags" {
  description = "Tags to apply to the AKS Cluster"
  type = map(string)
}

variable "system_node_pool" {
  description = "Node Pool to create and attach to the AKS Cluster"
  type = object({
    name      = string
    vm_size   = string
    node_count = number
  })
  default = {
    name      = "systempool"
    vm_size   = "Standard_D2s_v3"
    node_count = 1
  }
}

variable "user_node_pools" {
  description = "Node Pools to create and attach to the AKS Cluster"
  type = list(object({
    name      = string
    vm_size   = string
    node_count = number
  }))
  default = [{
    name      = "runnerpool"
    vm_size   = "Standard_D8s_v3"
    node_count = 1
  }]
}