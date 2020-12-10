resource "azurerm_network_interface" "nic-mgmt-01" {
  count               = var.mgmt-01.count
  name                = "${var.mgmt-01.name}${count.index}-nic"
  resource_group_name = var.demo_defaults.rgname
  location            = var.demo_defaults.location
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mgmtnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mgmtip.id
  }
}

resource "azurerm_linux_virtual_machine" "mgmt-01" {
  count                 = var.mgmt-01.count
  name                  = "${var.mgmt-01.name}-${count.index}"
  size                  = var.mgmt-01.size
  resource_group_name   = var.demo_defaults.rgname
  location              = var.demo_defaults.location
  network_interface_ids = [azurerm_network_interface.nic-mgmt-01[count.index].id]

  admin_username = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file(var.demo_vmdefaults.sshkey)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  boot_diagnostics {

  }
  source_image_reference {
    publisher = var.demo_vmdefaults.publisher
    offer     = var.demo_vmdefaults.offer
    sku       = var.demo_vmdefaults.sku
    version   = var.demo_vmdefaults.version
  }
}