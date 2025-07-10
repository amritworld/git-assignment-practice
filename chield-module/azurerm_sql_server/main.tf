resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sqlserver
  resource_group_name          = var.resource
  location                     = var.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.data-user.value
  administrator_login_password = data.azurerm_key_vault_secret.data-pass.value
  minimum_tls_version          = "1.2"

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

