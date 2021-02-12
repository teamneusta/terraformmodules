variable "environment" {
  description = "The env module"
  type        = map(any)
  default     = {}
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

variable "virtual_network" {
  type = object({
    id                  = string
    name                = string
    resource_group_name = string
  })
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
