provider "azurerm" {
  subscription_id = "4d9c108d-59d4-4363-9045-27649762ce09"
  features {}
  skip_provider_registration = true
}

terraform {
  required_version = "~> 0.14.0"
  required_providers {
    azurerm = {
      version = "~> 2.39"
    }
  }
}