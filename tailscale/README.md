# Tailscale VM

This module will deploy an Azure Linux VM that will auto provision based on the key passed in a Tailscale Exit Node that can be used as a S2S or P2S vpn gateway.

This will be deployed as a Tailscale [subnet router](https://tailscale.com/kb/1019/subnets) and [exit node](https://tailscale.com/kb/1103/exit-nodes)

## Bootstrapping

The node will start up and use it's User Assigned Managed Identity to get the Tailscale pre-authorized Auth Key to authenticate and join the tailscale network.  As such the following are required:
- Azure Key Vault Name
- Secret Name (the name of the secret that stores the tailscale auth key)
- User Managed Identity ID (used to retrieve an auth token to access the azure key vault)
- A list of subnets written CIDR notation for any subnets that the node will be come the Subnet Router for (S2S or P2S VPN appliance)
  - e.g. [192.168.100.0/24,10.10.0.0/16,172.169.4.127/32]