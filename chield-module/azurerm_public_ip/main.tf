resource "azurerm_public_ip" "pinku_pip" {
     name=var.pip_name
  resource_group_name = var.resource
  location = var.location
  allocation_method = var.allocation_method
}

# data "azurerm_public_ip" "data-pip" {
#   name                = var.pip_name
#   resource_group_name = var.resource
# }
# output "public_ip_address" {
#   value = data.azurerm_public_ip.data-pip.ip_address
# }