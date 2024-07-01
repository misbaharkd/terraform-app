provider "azurerm" {
  features {}
}

resource "azurerm_cdn_profile" "cdn_profile" {
  name                = var.cdn_profile_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard_Akamai"
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  name                = var.cdn_endpoint_name
  profile_name        = azurerm_cdn_profile.cdn_profile.name
  location            = azurerm_cdn_profile.cdn_profile.location
  resource_group_name = azurerm_cdn_profile.cdn_profile.resource_group_name
  origin {
    name      = "storageaccount"
    host_name = var.origin_hostname
  }
}

output "cdn_endpoint_url" {
  value = azurerm_cdn_endpoint.cdn_endpoint.host_name
}

