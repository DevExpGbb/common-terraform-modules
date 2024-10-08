variable "name" {
  description = "The name of the bing search service instance"
  type        = string
}

variable "resource_group" {
  description = "The resource group to deploy the bing search service instance to"
  type        = object({
    name     = string
    location = string
  })
}

