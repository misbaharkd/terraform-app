variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Azure location"
  default     = "Middle East"
}

variable "vnet_name" {
  description = "VNet name"
}

variable "subnet_name" {
  description = "Subnet name"
}

variable "nsg_name" {
  description = "Network Security Group name"
}

variable "ddos_protection_name" {
  description = "DDoS protection plan name"
}

