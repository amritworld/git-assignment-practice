module "rg_name" {
  source   = "../chield-module/azurerm_resource_group"
  resource = var.resource
  location = var.location
}

module "rg_name1" {
  
source   = "../chield-module/azurerm_resource_group"
  resource = var.resource
  location = var.location
} 

module "rg_name2" {

  source   = "../chield-module/azurerm_resource_group"
  resource = var.resource
  location = var.location
}
module "vnet" {
  depends_on    = [module.rg_name]
  source        = "../chield-module/azurerm_vnet"
  vnet_name     = var.vnet_name
  address_space = var.address_space
  resource      = var.resource
  location      = var.location
}
module "subnet" {
  depends_on       = [module.vnet]
  source           = "../chield-module/azurerm_subnet"
  subnet_name      = var.subnet_name
  resource         = var.resource
  vnet_name        = var.vnet_name
  address_prefixes = var.address_prefixes
}

module "nsg" {
  depends_on = [module.rg_name]
  source     = "../chield-module/azurerm_nsg"
  nsg_name   = var.nsg_name
  location   = var.location
  resource   = var.resource

}

module "pip" {

  depends_on        = [module.rg_name]
  source            = "../chield-module/azurerm_public_ip"
  pip_name          = var.pip_name
  resource          = var.resource
  location          = var.location
  allocation_method = var.allocation_method

}

module "nic" {
  depends_on  = [module.subnet, module.pip, module.rg_name, module.vnet]
  source      = "../chield-module/azurerm_nic"
  nic_name    = var.nic_name
  location    = var.location
  resource    = var.resource
  ip_name     = var.ip_name
  private_ip  = var.private_ip
  subnet_name = var.subnet_name
  vnet_name   = var.vnet_name
  pip_name    = var.pip_name
}

module "keyvalt" {
  depends_on   = [module.rg_name]
  source       = "../chield-module/azurerm_keyvault"
  keyvalt-name = var.keyvalt_name
  location     = var.location
  resource     = var.resource
}

module "keyvaltsec" {
  depends_on   = [module.keyvalt]
  source       = "../chield-module/azurerm_key_secret"
  user_name    = var.user_name
  user_value   = var.user_value
  passwd_name  = var.passwd_name
  passwd_value = var.passwd_value
  keyvalt_name = var.keyvalt_name
  resource     = var.resource

}

module "fromtvm" {
  depends_on = [ module.rg_name, module.nic, module.keyvalt,module.keyvaltsec ]
  source          = "../chield-module/azurerm_virtual_machine"
  vm_name         = var.vm_name
  resource        = var.resource
  location        = var.location
  size            = var.size
  disk_caching    = var.disk_caching
  disk_stg_acc    = var.disk_stg_acc
  image_publisher = var.image_publisher
  image_offer     = var.image_offer
  image_sku       = var.image_sku
  image_version   = var.image_version
  nic_name        = var.nic_name
  user_name       = var.user_name
  passwd_name     = var.passwd_name
  keyvalt_name    = var.keyvalt_name
}

module "nsg-assoc" {

  source = "../chield-module/nsg_association"
  nic_name=var.nic_name
  resource=var.resource
  nsg_name=var.nsg_name
}

module "sqlserver" {
  depends_on = [module.rg_name, module.keyvalt, module.keyvaltsec  ]
  source = "../chield-module/azurerm_sql_server"
  sqlserver=var.sqlserver
  resource=var.resource
  location=var.location
  user_name=var.user_name
  passwd_name=var.passwd_name
  keyvalt_name=var.keyvalt_name

}

module "sql_database" {
  depends_on = [ module.rg_name, module.sqlserver ]
  source = "../chield-module/azurerm_sql_database"
  database=var.database
  sqlserver=var.sqlserver
  resource=var.resource
}