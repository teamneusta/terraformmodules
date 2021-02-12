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

variable "lb_name" {
  type    = string
  default = ""
}

variable "sku" {
  type    = string
  default = "Basic"
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
  default = {
    id = ""
  }
}

variable "private_ip_address" {
  type    = string
  default = ""
}

variable "backend_pools" {
  type = list(object({
    name                 = string
    enable_outbound_rule = bool
  }))
  default = []
}

variable "probes" {
  type = list(object({
    name         = string
    protocol     = string
    backend_port = number
    request_path = string
  }))
  default = []
}

variable "rules" {
  type = list(object({
    name                    = string
    protocol                = string
    frontend_port           = number
    backend_port            = number
    idle_timeout_in_minutes = number
    backend_pool_name       = string
    configuration_name      = string
    load_distribution       = string
    probe_name              = string
  }))
  default = []
}

variable "nat_rules" {
  type = list(object({
    name                    = string
    protocol                = string
    frontend_port           = number
    backend_port            = number
    idle_timeout_in_minutes = number
  }))
  default = []
}

variable "log_analytics" {
  type = object({
    id                 = string
    workspace_id       = string
    primary_shared_key = string
  })
  default = null
}

variable "tags" {
  type    = map(any)
  default = {}
}
