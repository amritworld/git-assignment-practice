resource "azurerm_virtual_network" "pinku_vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource
  location            = var.location
  address_space       = var.address_space

}

