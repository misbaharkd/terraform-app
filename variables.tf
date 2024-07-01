variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location of the resource group."
  type        = string
}

variable "mysql_server_name" {
  description = "The name of the MySQL server."
  type        = string
}

variable "admin_login" {
  description = "The administrator login name for MySQL."
  type        = string
}

variable "admin_password" {
  description = "The administrator password for MySQL."
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "The name of the MySQL database."
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service plan."
  type        = string
}

variable "app_service_name" {
  description = "The name of the App Service."
  type        = string
}

variable "api_management_name" {
  description = "The name of the API Management service."
  type        = string
}

variable "publisher_name" {
  description = "The publisher name for the API Management service."
  type        = string
}

variable "publisher_email" {
  description = "The publisher email for the API Management service."
  type        = string
}


