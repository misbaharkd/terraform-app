variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Azure location"
  default     = "West Europe"
}

variable "api_gateway_name" {
  description = "API Gateway name"
}

variable "publisher_name" {
  description = "Publisher name"
}

variable "publisher_email" {
  description = "Publisher email"
}

variable "api_management_name" {
  description = "The name of the API Management service."
  type        = string
}


variable "swagger_url" {
  description = "The URL of the Swagger file."
  type        = string
}

