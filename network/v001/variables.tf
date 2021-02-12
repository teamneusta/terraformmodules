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

variable "address_space" {
  description = "The IP-Cidr of the Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "include_stage_name" {
  description = "Use the stage name as prefix in subnet names?"
  type        = bool
  default     = true
}

variable "include_project_name" {
  description = "Use the project name as prefix in subnet names?"
  type        = bool
  default     = false
}

variable "subnets" {
  description = "List of subnets and their address prefix."
  type = list(object({
    name              = string
    address_prefix    = string
    service_endpoints = list(string)
  }))
  default = []
}

variable "dns_servers" {
  description = "List of DNS servers."
  type        = list(string)
  default     = []
}

variable "enforce_private_link_endpoint_network_policies" {
  description = "Enable or Disable network policies for the private link endpoint on the subnet. Default value is false. Conflicts with enforce_private_link_service_network_policies."
  type        = bool
  default     = false
}

variable "enforce_private_link_service_network_policies" {
  description = "Enable or Disable network policies for the private link service on the subnet. Default valule is false. Conflicts with enforce_private_link_endpoint_network_policies."
  type        = bool
  default     = false
}
