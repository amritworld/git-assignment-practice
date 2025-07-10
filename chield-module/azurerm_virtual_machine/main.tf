resource "azurerm_linux_virtual_machine" "frontvm" {
  name                            = var.vm_name
  resource_group_name             = var.resource
  location                        = var.location
  size                            = var.size
  admin_username                  = data.azurerm_key_vault_secret.data-user.value
  admin_password                  = data.azurerm_key_vault_secret.data-pass.value
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.data_nic.id]

  os_disk {
    caching              = var.disk_caching
    storage_account_type = var.disk_stg_acc
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}

