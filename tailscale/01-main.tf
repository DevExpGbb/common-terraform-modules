terraform {
  required_providers {
    azuremrm = {
      source = "hashicorp/azuremrm"
      version = ">= 4.2.0, < 5.0.0"
    }
  }
}

locals {
  name = "${var.name}-tailscale"
  admin_username = "gbbadmin"
}

data "cloudinit_config" "cloudinit" {
  base64_encode = true
  gzip          = true
  part {
    content_type = "text/cloud-config"
    content      = file("${path.module}/tailscale/cloudinit.yml")
  }

  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/tailscale/cloudinit.sh", {
      user_msi = var.user_assigned_identity_id
      secret_name = var.secret_name
      key_vault_name = var.key_vault_name
      advertise_routes = var.subnet_cidrs
    })
  }
}