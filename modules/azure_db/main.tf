provider "azurerm" {
  features {}
}


resource "azurerm_mysql_flexible_server" "mysql_server" {
  name                = var.mysql_server_name
  location            = var.location
  resource_group_name = var.resource_group_name
  administrator_login = var.mysql_admin_username
  administrator_password = var.mysql_admin_password
  sku_name            = var.mysql_sku_name

  high_availability {
    mode = var.mysql_high_availability_mode
  }

  version = var.mysql_version

}

resource "azurerm_mysql_flexible_database" "mysql_database" {
  name                = var.mysql_database_name
  resource_group_name = azurerm_mysql_flexible_server.mysql_server.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
















































