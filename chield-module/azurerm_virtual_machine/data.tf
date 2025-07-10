data "azurerm_network_interface" "data_nic" {
  name                = var.nic_name
  resource_group_name = var.resource
}

data "azurerm_key_vault_secret" "data-user" {
  name         = var.user_name
  key_vault_id = data.azurerm_key_vault.data-keyvalt.id
}
data "azurerm_key_vault_secret" "data-pass" {
  name         = var.passwd_name
  key_vault_id = data.azurerm_key_vault.data-keyvalt.id
}

data "azurerm_key_vault" "data-keyvalt" {
  name                = var.keyvalt_name
  resource_group_name = var.resource
}
