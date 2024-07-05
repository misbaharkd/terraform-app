provider "azurerm" {
  features {}
}

module "vnet-testduo" {
  source = "../../modules/vnet-testduo"
  resource_group_name = "rg-terraform-app"
  location            = "westeurope"
  vnet_name           = "vnet-testduo-terraform-app"
  subnet_name         = "subnet-terraform-app"
  nsg_name            = "nsg-terraform-app"
  ddos_protection_name = "ddos-protection-terraform-app"
}

resource "azurerm_private_dns_zone" "testdu" {
  name                = "testdu.mysql.database.azure.com"
  resource_group_name =  var.resource_group_name
}


resource "azurerm_mysql_flexible_server" "mysqlservertestduo" {
  name                = "misbahtestdb"
  location            = "westeurope"
  resource_group_name = "rg-terraform-app"
  administrator_login = var.mysql_admin_username
  administrator_password = var.mysql_admin_password
  sku_name            = var.mysql_sku_name
  backup_retention_days  = 7
  delegated_subnet_id    =  module.vnet-testduo.subnet_id2
  version = var.mysql_version  

}

resource "azurerm_mysql_flexible_database" "mysqldatabasetestduo" {
  name                = var.mysql_database_name
  resource_group_name = azurerm_mysql_flexible_server.mysqlservertestduo.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysqlservertestduo.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
















































