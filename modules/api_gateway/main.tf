provider "azurerm" {
  features {}
}

resource "azurerm_api_management" "api_gateway" {
  name                = var.api_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = "Developer_1"
}

