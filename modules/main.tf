provider "azurerm" {
  features {}
}

module "vnet" {
  source = "./modules/vnet"

  resource_group_name = "rg-terraform-app"
  location            = "West Europe"
  vnet_name           = "vnet-terraform-app"
  subnet_name         = "subnet-terraform-app"
  nsg_name            = "nsg-terraform-app"
  ddos_protection_name = "ddos-protection-terraform-app"
}

module "frontend" {
  source = "./modules/frontend"

  resource_group_name = "rg-terraform-app"
  location            = "West Europe"
  app_service_plan_name = "app-service-plan"
  app_service_name      = "terraform-app-service"
}

module "backend" {
  source = "./modules/backend"

  resource_group_name = "rg-terraform-app"
  location            = "West Europe"
  cluster_name        = "aks-terraform-app"
  dns_prefix          = "aks"
}

module "api_gateway" {
  source = "./modules/api_gateway"

  resource_group_name = "rg-terraform-app"
  location            = "West Europe"
  api_gateway_name    = "api-gateway-terraform-app"
  publisher_name      = "Your Name"
  publisher_email     = "your.email@example.com"
}

module "azure_db" {
  source = "./modules/azure_db"

  resource_group_name   = "rg-terraform-app"
  location              = "West Europe"
  mysql_server_name     = "mysql-server-terraform-app"
  admin_username        = "mysqladmin"
  admin_password        = "ComplexP@ssword!"
  mysql_database_name   = "terraformappdb"
}

module "cdn" {
  source = "./modules/cdn"

  resource_group_name = "rg-terraform-app"
  location            = "West Europe"
  cdn_profile_name    = "cdn-profile-terraform-app"
  cdn_endpoint_name   = "cdn-endpoint-terraform-app"
  origin_hostname     = module.frontend.app_service_url
}

module "dns" {
  source = "./modules/dns"

  resource_group_name = "rg-terraform-app"
  dns_zone_name       = "misbah.testapp.com"
  a_record_name       = "www"
  ip_address          = "YOUR_PUBLIC_IP" # Replace with the actual public IP
}

output "frontend_url" {
  value = module.frontend.app_service_url
}

output "backend_kube_config" {
  value = module.backend.kube_config
}

output "api_gateway_url" {
  value = azurerm_api_management.api_gateway.gateway_url
}

output "mysql_fqdn" {
  value = module.azure_db.mysql_fqdn
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

