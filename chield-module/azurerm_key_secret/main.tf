resource "azurerm_key_vault_secret" "keyvalt-secret" {
  name         = var.user_name
  value        = var.user_value
  key_vault_id = data.azurerm_key_vault.data-keyvalt.id
}

resource "azurerm_key_vault_secret" "keyvalt-secret1" {
  name         = var.passwd_name
  value        = var.passwd_value
  key_vault_id = data.azurerm_key_vault.data-keyvalt.id
}

data "azurerm_key_vault" "data-keyvalt" {
  name                = var.keyvalt_name
  resource_group_name = var.resource
}
