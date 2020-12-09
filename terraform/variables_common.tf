variable "myRG" {
  type    = string
  default = "RG-TEST"
}

variable "myVnet" {
  type = map
  default = {
    "name"          = "VNET-INFRADEMO"
    "location"      = "westeurope"
    "rgname"        = "RG-TEST"
    "address_space" = "172.20.0.0/16"
  }
}

variable "mySubNetMgmt" {
  type = map
  default = {
    "name"           = "sn-mgmt-01"
    "address_prefix" = "172.20.10.0/24"
  }
}

variable "mySubNetAKS" {
  type = map
  default = {
    "name"           = "sn-aks-01"
    "address_prefix" = "172.20.20.0/24"
  }
}

variable "mySubNetVM" {
  type = map
  default = {
    "name"           = "sn-vm-01"
    "address_prefix" = "172.20.30.0/24"
  }
}