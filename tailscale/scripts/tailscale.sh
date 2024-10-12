#! /bin/bash

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