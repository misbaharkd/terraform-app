terraform {
  backend "azurerm" {
    resource_group_name   = "rg-terraform-state"
    storage_account_name  = "tfstate15638"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "vnet-testduo" {
  source = "./modules/vnet-testduo"

  resource_group_name = "rg-terraform-app"
  location            = "West Europe"
  vnet_name           = "vnet-testduo-terraform-app"
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

# Import the API definition
resource "azurerm_api_management_api" "example" {
  name                = "example-api"
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name
  revision            = "1"
  display_name        = "Example API"
  path                = "example"
  protocols           = ["https"]

  import {
    content_format = "swagger-link-json"
    content_value  = var.swagger_url
  }
}


resource "azurerm_api_management_api_operation" "get_hello_world" {
  operation_id        = "GetHelloWorld"
  api_name            = azurerm_api_management_api.example.name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  display_name        = "Get Hello World"
  method              = "GET"
  url_template        = "/hello"

  response {
    status_code      = 200
    description = "Successful response"
  }

  request {
    description = "Example request"
  }
}

module "api_gateway" {
  source = "./modules/api_gateway"

  resource_group_name = "rg-terraform-app"
  location            = "West Europe"
  api_gateway_name    = "api-gateway-terraform-app"
  publisher_name      = "Your Name"
  publisher_email     = "your.email@example.com"
  swagger_url         = "https://testurl.com"
  api_management_name  = "hello-world"
}

module "azure_db" {
  source                = "./modules/azure_db"
  mysql_server_name     = "test-mysql-server"
  location              = "East US"
  resource_group_name   = "test-resource-group"
  mysql_admin_username  = "mysqladmin"
  mysql_admin_password  = "ComplexP@ssword!"
  mysql_sku_name        = "GP_Standard_D2ds_v4"
  mysql_storage_mb      = 5120
  mysql_high_availability_mode = "ZoneRedundant"
  mysql_version         = "5.7"
  mysql_database_name   = "test_database"
  tags = {
    environment = "test"
  }
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


resource "azurerm_api_management" "api_gateway" {
  name                = var.api_management_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = "Developer_1"
}

##resource "azurerm_mysql_flexible_server" "mysql" {
#  name                = var.mysql_server_name
#  location            = azurerm_resource_group.rg.location
#  resource_group_name = azurerm_resource_group.rg.name
##  administrator_login = var.admin_login
#  administrator_password = var.admin_password

#}


output "frontend_url_orig" {
  value = module.frontend.app_service_url
}

output "backend_kube_config_orig" {
  value = module.backend.kube_config
  sensitive = true
}


output "cdn_url_orig" {
  value = module.cdn.cdn_endpoint_url
}

output "dns_zone_name_orig" {
  value = module.dns.dns_zone_name
}

output "dns_a_record_fqdn_orig" {
  value = module.dns.dns_a_record_fqdn
}


output "api_gateway_ur_orig" {
  value = azurerm_api_management.api_gateway.gateway_url
}

