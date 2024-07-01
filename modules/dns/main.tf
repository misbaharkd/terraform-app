provider "azurerm" {
  features {}
}

resource "azurerm_dns_zone" "dns_zone" {
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_dns_a_record" "dns_a_record" {
  name                = var.a_record_name
  zone_name           = azurerm_dns_zone.dns_zone.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [var.ip_address]
}

output "dns_zone_name" {
  value = azurerm_dns_zone.dns_zone.name
}

output "dns_a_record_fqdn" {
  value = azurerm_dns_a_record.dns_a_record.fqdn
}

