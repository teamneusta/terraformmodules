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
  type    = string
  default = ""
}

variable "public_ip_name" {
  type    = string
  default = ""
}

variable "sku" {
  type    = string
  default = "Basic"
}

variable "ip_version" {
  type    = string
  default = "IPv4"
}

variable "allocation_method" {
  type    = string
  default = "Dynamic"
}

variable "domain_name_suffix" {
  type    = string
  default = "*"
}

variable "domain_name_label" {
  type    = string
  default = ""
}

variable "reverse_fqdn" {
  type    = string
  default = ""
}

variable "idle_timeout_in_minutes" {
  type    = number
  default = 30
}

variable "log_analytics" {
  type = object({
    id                 = string,
    workspace_id       = string,
    primary_shared_key = string
  })
  default = null
}