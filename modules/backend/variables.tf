variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Azure location"
  default     = "West Europe"
}

variable "cluster_name" {
  description = "AKS Cluster name"
}

variable "dns_prefix" {
  description = "DNS prefix"
}

