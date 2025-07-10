
  resource "azurerm_mssql_database" "sql_database" {
  name         = var.database
  server_id    = data.azurerm_mssql_server.data-sql-server.id
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
}

data "azurerm_mssql_server" "data-sql-server" {
  name                = var.sqlserver
  resource_group_name = var.resource
}

