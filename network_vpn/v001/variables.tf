# Environment
variable "environment" {
  description = "The env module"
  type        = map(any)
  default     = {}
}

variable "location" {
  description = "The location, overwrites environment value"
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

# Name
variable "resource_name" {
  type    = string
  default = ""
}

variable "gateway_name" {
  type    = string
  default = "gateway"
}

# Specific
variable "subnet" {
  description = "The subnet, to use for the VPN"
  type = object({
    id = string
  })
}

variable "public_ip" {
  description = "The public ip used for the virtual network gateway"
  type = object({
    id = string
  })
}

variable "sku" {
  description = "The sku used for the virtual network gateway, defines bandwith etc."
  type        = string
  default     = "Basic"
}

variable "generation" {
  description = "The generation of the virtual network gateway, depends on sku"
  type        = string
  default     = "Generation1"
}

variable "vpn_type" {
  description = "The type of the VPN Routing"
  type        = string
  default     = "RouteBased"
}

variable "connections" {
  description = "The connections"
  type = map(object({
    gateway_address     = string
    address_space       = list(string)
    shared_key          = string
    connection_protocol = string
    })
  )
}
