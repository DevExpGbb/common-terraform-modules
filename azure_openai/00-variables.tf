variable "prefix" {
  description = "Prefix to add to all resources"
  type = string  
}

variable "resource_group" {
  description = "Resource Group to add the AKS Cluster to"
  type = object({
    id       = string
    name     = string
    location = string
  })
}

variable "public_network_access" {
  description = "Public Network Access for the Azure Open AI Account"
  type = string
  default = true
}

variable "model" {
  description = "Model to use for the Azure Open AI Account"
  type = object({
    format = string
    name = string
    version = string
  })
}