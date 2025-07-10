resource "azurerm_subnet" "pinku_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
}

# data "azurerm_subnet" "data-subnet" {
#   name                 = var.subnet_name
#   virtual_network_name = var.vnet_name
#   resource_group_name  = var.resource
# }

# output "subnet_id" {
#   value = data.azurerm_subnet.data-subnet.id
# }
