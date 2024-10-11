#! /bin/bash

# # Get the access token for the User MSI
# access_token=$(curl -s "http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://vault.azure.net" -H "Metadata: true" -H "X-IDENTITY-HEADER: $user_msi" | jq -r '.access_token')

# # Get the secret from Azure Key Vault
# tailscale_auth_key=$(curl -s "https://${key_vault_name}.vault.azure.net/secrets/${secret_name}?api-version=7.0" -H "Authorization: Bearer $access_token" | jq -r '.value')

# Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf

# Authenticate Tailscale
tailscale up \
  --authkey=${tailscale_auth_key} \
  --advertise-routes=${advertise_routes} \
  --advertise-exit-node