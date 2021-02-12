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

variable "open_ports" {
  type = list(object({
    name       = string
    port_range = string
  }))
  default = []
}

variable "rules" {
  type = list(object({
    priority                     = number
    name                         = string
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_ranges           = list(string)
    destination_port_ranges      = list(string)
    source_address_prefixes      = list(string)
    destination_address_prefixes = list(string)
  }))
  default = []
}

variable "deny_vnet_inbound" {
  type    = bool
  default = false
}

variable "deny_vnet_outbound" {
  type    = bool
  default = false
}

variable "deny_internet_outbound" {
  type    = bool
  default = false
}
