# data "azurerm_subnet" "sn-aks-01" {
#     name = var.mySubNetAKS.name
#     virtual_network_name = var.myVnet.name
#     resource_group_name = var.demo_defaults.rgname
# }

# data "azurerm_subnet" "sn-mgmt-01" {
#     name = var.mySubNetMgmt.name
#     virtual_network_name = var.myVnet.name
#     resource_group_name = var.demo_defaults.rgname
# }