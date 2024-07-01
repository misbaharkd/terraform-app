output "app_service_url" {
  value = "http://${azurerm_app_service.app_service.default_site_hostname}"
}

