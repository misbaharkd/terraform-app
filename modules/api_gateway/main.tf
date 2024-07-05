provider "azurerm" {
  features {}
}

resource "azurerm_api_management" "apigatewaytestduo" {

  name                = "apigatewaytestduo"
  location            = "westeurope"
  resource_group_name = "rg-terraform-app"
  publisher_name      = "apigatewaytestduo"
  publisher_email     = var.publisher_email
  sku_name            = "Developer_1"
}



resource "azurerm_api_management_api_operation" "get_hello_world" {
  operation_id        = "GetHelloWorld"
  api_name            = "azurerm_api_management_api.helloworld"
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

