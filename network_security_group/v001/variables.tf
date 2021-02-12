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

variable "resource_name" {
  description = "The name of the resource, overwrites convention-generated name"
  type        = string
  default     = ""
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
  default     = ""
}

variable "nsg_open_ports" {
  type = list(object({
    name       = string
    port_range = string
  }))
  default = []
}

variable "nsg_restricted_ports" {
  type = list(object({
    name             = string
    port_range       = string
    address_prefixes = list(string)
  }))
  default = []
}
