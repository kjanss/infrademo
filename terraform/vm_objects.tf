resource "azurerm_network_interface" "vm-01" {
  name                = "${var.myVM-01.name}-nic"
  resource_group_name = var.demo_defaults.rgname
  location            = var.demo_defaults.location
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mgmtnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm-01" {
  name                  = var.myVM-01.name
  size                  = var.myVM-01.size
  resource_group_name   = var.demo_defaults.rgname
  location              = var.demo_defaults.location
  network_interface_ids = [azurerm_network_interface.vm-01.id]

  admin_username = "admin"

  admin_ssh_key {
    username   = "admin"
    public_key = file(var.demo_vmdefaults.sshkey)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.demo_vmdefaults.publisher
    offer     = var.demo_vmdefaults.offer
    sku       = var.demo_vmdefaults.sku
    version   = var.demo_vmdefaults.version
  }
}