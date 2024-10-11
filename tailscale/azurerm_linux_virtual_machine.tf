resource "azurerm_network_interface" "default" {
  name = local.name
  resource_group_name = var.resource_group.name
  location = var.resource_group.location

  ip_configuration {
    name = local.name

    private_ip_address_allocation = "Dynamic"
    subnet_id = var.subnet_id
  }
  
}

resource "azurerm_linux_virtual_machine" "default" {
  name                = local.name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  size                = "Standard_F2"
  admin_username      = local.admin_username
  network_interface_ids = [
    azurerm_network_interface.default.id,
  ]

  identity {
    type = "UserAssigned"
    identity_ids = [
      var.user_assigned_identity_id
    ]
  }

  admin_ssh_key {
    username   = local.admin_username
    public_key = var.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

    custom_data = data.cloudinit_config.cloudinit.rendered
}