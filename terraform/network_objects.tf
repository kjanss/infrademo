resource "azurerm_virtual_network" "myvnet" {
  name                = var.myVnet.name
  location            = var.myVnet.location
  resource_group_name = var.myVnet.rgname
  address_space       = [var.myVnet.address_space]
}

resource "azurerm_subnet" "vmnet" {
  name                 = var.mySubNetVM.name
  address_prefixes     = [var.mySubNetVM.address_prefix]
  resource_group_name  = var.myVnet.rgname
  virtual_network_name = azurerm_virtual_network.myvnet.name
}

resource "azurerm_subnet" "mgmtnet" {
  name                 = var.mySubNetMgmt.name
  address_prefixes     = [var.mySubNetMgmt.address_prefix]
  resource_group_name  = var.myVnet.rgname
  virtual_network_name = azurerm_virtual_network.myvnet.name
}

resource "azurerm_subnet" "aksnet" {
  name                 = var.mySubNetAKS.name
  address_prefixes     = [var.mySubNetAKS.address_prefix]
  resource_group_name  = var.myVnet.rgname
  virtual_network_name = azurerm_virtual_network.myvnet.name
}

resource "azurerm_public_ip" "mgmtip" {
  name                = "mgmtip"
  resource_group_name = var.demo_defaults.rgname
  location            = var.demo_defaults.location
  allocation_method   = "Dynamic"
}