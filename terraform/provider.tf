provider "azurerm" {
  subscription_id = "***REMOVED***"
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