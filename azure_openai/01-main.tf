terraform {
  required_providers {
    azapi = {
      source = "github.com/azure/azapi"
      version = "1.15.0"
    }
  }
}

locals {
  prefix = var.prefix
  name = "${local.prefix}aoai"
}