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

variable "resource_name" {
  type    = string
  default = ""
}

variable "vm_name" {
  type    = string
  default = ""
}

variable "nic_number" {
  type    = number
  default = 0
}

variable "nic_name" {
  type    = string
  default = ""
}

variable "subnet" {
  type = object({
    id = string
  })
}

variable "public_ip" {
  type = object({
    id = string
  })
  default = null
}

variable "private_ip_address" {
  type    = string
  default = null
}

variable "network_security_group" {
  type = object({
    id = string
  })
}

variable "configuration_name" {
  type    = string
  default = "default"
}

variable "log_analytics" {
  type = object({
    id                 = string,
    workspace_id       = string,
    primary_shared_key = string
  })
  default = null
}
