variable "name" {
  description = "The name of the bing search service instance"
  type        = string
}

variable "resource_group" {
  description = "The resource group to deploy the bing search service instance to"
  type        = object({
    id       = string
    name     = string
    location = string
  })
}

variable "subnet_id" {
  description = "The subnet to deploy the tailscale gateway/exit node service instance to"
  type        = string
}

variable "public_key" {
  description = "The admin user public key to use for the VM"
  type        = string
}

variable "user_assigned_identity_id" {
  description = "The user assigned identity to use for the VM.  Identity is primarily used to get access to the AKV and get the tailscale_authkey"
  type        = string
}

# variable "key_vault_name" {
#   description = "The key vault to use for the VM.  Key vault is used to store the tailscale_authkey"
#   type        = string
# }

# variable "secret_name" {
#   description = "The secret name to use for the VM.  Secret is used to store the tailscale_authkey"
#   type        = string
# }

variable "tailscale_auth_key" {
  description = "Tailscale Auth Key"
}

variable "advertise_routes" {
  description = "A list of the subnet cidrs that tailscale will advertise and be the subnet router for"
}