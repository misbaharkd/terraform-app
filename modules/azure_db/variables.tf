variable "mysql_server_name" {
  description = "The name of the MySQL server."
  type        = string
}

variable "location" {
  description = "The location where the resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "mysql_admin_username" {
  description = "The admin username for the MySQL server."
  type        = string
}

variable "mysql_admin_password" {
  description = "The admin password for the MySQL server."
  type        = string
  sensitive   = true
}

variable "mysql_sku_name" {
  description = "The SKU name for the MySQL server."
  type        = string
}

variable "mysql_storage_mb" {
  description = "The storage size in MB for the MySQL server."
  type        = number
}

variable "mysql_high_availability_mode" {
  description = "The high availability mode for the MySQL server."
  type        = string
}

variable "mysql_version" {
  description = "The MySQL version."
  type        = string
}

variable "mysql_database_name" {
  description = "The name of the MySQL database."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
  default     = {}
}

