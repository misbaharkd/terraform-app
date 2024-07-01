provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_mysql_flexible_server" "mysql" {
  name                = var.mysql_server_name
  location            = var.location
  resource_group_name = var.resource_group_name
  administrator_login    = var.admin_login
  administrator_password = var.admin_password

}

resource "azurerm_mysql_database" "mysql_database" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}























































