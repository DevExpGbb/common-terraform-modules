resource "azurerm_network_security_group" "default" {
  name = "tailscale-nsg"
  resource_group_name = var.resource_group.name
  location = var.resource_group.location
}

resource "azurerm_network_security_rule" "default" {
  name                        = "tailscale-allow-inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_range      = "41641"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group.name
  network_security_group_name = azurerm_network_security_group.default.name
}