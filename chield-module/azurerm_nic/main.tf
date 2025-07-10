resource "azurerm_network_interface" "pinku_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource
  ip_configuration {
    name                          = var.ip_name
    subnet_id                     = data.azurerm_subnet.data-subnet.id
    private_ip_address_allocation = var.private_ip
    public_ip_address_id          = data.azurerm_public_ip.data-pip.id
  }

}


