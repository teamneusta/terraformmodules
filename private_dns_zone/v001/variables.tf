variable "environment" {
  description = "The env module"
  type        = map(any)
  default     = {}
}

variable "location" {
  description = "The lLocation, overwrites environment value"
  type        = string
  default     = "*"
}

variable "project_name" {
  description = "The name of the project, overwrites environment value"
  type        = string
  default     = "*"
}

variable "stage_name" {
  description = "The name of the stage, overwrites environment value"
  type        = string
  default     = "*"
}

variable "resource_group_name" {
  description = "The name of the resource group, overwrites environment value"
  type        = string
  default     = "*"
}

variable "private_dns_zone_name" {
  description = "The name of the Private DNS Zone. Must be a valid domain name."
  type        = string
}

variable "virtual_networks" {
  type = list(object({
    id                  = string
    name                = string
    resource_group_name = string
  }))
  default = []
}
