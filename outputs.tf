output "frontend_url" {
  value = module.frontend.app_service_url
}

output "backend_kube_config" {
  value = module.backend.kube_config
  sensitive = true
}

output "api_gateway_url" {
  value = azurerm_api_management.api_gateway.gateway_url
}


output "cdn_url" {
  value = module.cdn.cdn_endpoint_url
}

output "dns_zone_name" {
  value = module.dns.dns_zone_name
}

output "dns_a_record_fqdn" {
  value = module.dns.dns_a_record_fqdn
}

