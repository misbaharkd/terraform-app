provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-app"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "app-service-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = "terraform-app-service"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    default_documents = ["index.html"]
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }

  source_control {
    repo_url           = "https://github.com/misbaharkd/terraform-app-content"
    branch             = "main"
    use_mercurial      = false
  }
}

output "app_service_default_hostname" {
  value = azurerm_app_service.app_service.default_site_hostname
}

