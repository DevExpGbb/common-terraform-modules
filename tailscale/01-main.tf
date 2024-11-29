terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 4.2.0, < 5.0.0"
    }
  }
}

locals {
  name = "${var.name}-tailscale"
  admin_username = var.admin_username
  tags = merge([var.tags, {  CostControl = "Ignore" }])
}

data "cloudinit_config" "cloudinit" {
  base64_encode = true
  gzip          = true
  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/scripts/tailscale.sh", {
      tailscale_auth_key = var.tailscale_auth_key
      advertise_routes = join(",", var.advertise_routes)
    })
  }
}
