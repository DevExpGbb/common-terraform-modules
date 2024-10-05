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

variable "models" {
  description = "Model Deployments create in an Azure Open AI Account in the form of ``` deployment_name = { format = 'openai', name = 'gpt-4', version = '4.0.0' } ```"
  type = map(object({
    format = string
    name = string
    version = string
  }))
}