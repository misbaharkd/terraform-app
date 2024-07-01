provider "azurerm" {
  features {}
}

resource "azurerm_mysql_server" "mysql" {
  name                = var.mysql_server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  sku_name                     = "B_Gen5_1"
  version                      = "5.7"
  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  threat_detection_policy {
    enabled           = true
    email_account_admins = true
  }
}

resource "azurerm_mysql_database" "mysql_database" {
  name                = var.mysql_database_name
  resource_group_name = azurerm_mysql_server.mysql.resource_group_name
  server_name         = azurerm_mysql_server.mysql.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}

output "mysql_fqdn" {
  value = azurerm_mysql_server.mysql.fully_qualified_domain_name
}

