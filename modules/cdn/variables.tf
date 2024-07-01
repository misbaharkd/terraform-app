variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Azure location"
  default     = "West Europe"
}

variable "cdn_profile_name" {
  description = "CDN profile name"
}

variable "cdn_endpoint_name" {
  description = "CDN endpoint name"
}

variable "origin_hostname" {
  description = "Origin hostname"
}

