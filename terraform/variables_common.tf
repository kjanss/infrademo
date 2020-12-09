variable "myRG" {
  type    = string
  default = "RG-TEST"
}

variable "demo_defaults" {
  type = map
  default = {
    location = "westeurope"
    rgname   = "RG-TEST"
  }
}

variable "demo_vmdefaults" {
  type = map
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
    sshkey    = "~/.ssh/id_rsa.pub"

  }
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

variable "myVM-01" {
  type = map
  default = {
    "name"   = "vm-01"
    "size"   = "Standard_B2s"
  }
}