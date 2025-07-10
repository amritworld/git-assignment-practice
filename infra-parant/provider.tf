terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-sumit1"
    storage_account_name = "stgsumit21"
    container_name       = "sumitcont21"
    key                  = "sonu.tfstate"
    subscription_id      = "3a734e32-021d-4243-89ff-c3495e6aa4da"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "3a734e32-021d-4243-89ff-c3495e6aa4da"

}
