resource "azurerm_virtual_network" "myvnet" {
  name                = var.myVnet.name
  location            = var.myVnet.location
  resource_group_name = var.myVnet.rgname
  address_space       = [var.myVnet.address_space]
  subnet {
    name           = var.mySubNetMgmt.name
    address_prefix = var.mySubNetMgmt.address_prefix
  }
  subnet {
    name           = var.mySubNetAKS.name
    address_prefix = var.mySubNetAKS.address_prefix
  }
  subnet {
    name           = var.mySubNetVM.name
    address_prefix = var.mySubNetVM.address_prefix
  }
}