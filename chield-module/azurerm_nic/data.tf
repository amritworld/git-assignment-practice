data "azurerm_subnet" "data-subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource
}
data "azurerm_public_ip" "data-pip" {
  name                = var.pip_name
  resource_group_name = var.resource
}