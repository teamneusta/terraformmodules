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

variable "appgw_name" {
  type    = string
  default = ""
}

variable "appgw_capacity" {
  type    = number
  default = 1
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
}

variable "user_assigned_identities" {
  type = list(object({
    id = string
  }))
  default = []
}

variable "frontend_ports" {
  type = list(object({
    name = string
    port = number
  }))
  default = [{
    name = "http"
    port = 80
    },
    {
      name = "https"
      port = 443
  }]
}

variable "redirect_listener" {
  type = list(object({
    name                 = string
    frontend_port_name   = string
    protocol             = string
    ssl_certificate_name = string
    host_names           = list(string)
    target_url           = string
    target_listener_name = string
  }))
  default = []
}

variable "http_listener" {
  type = list(object({
    name                  = string
    frontend_port_name    = string
    protocol              = string
    ssl_certificate_name  = string
    host_names            = list(string)
    backend_pool_name     = string
    backend_settings_name = string
  }))
  default = []
}

variable "backend_pools" {
  type = list(object({
    name     = string
    node_ips = list(string)
  }))
  default = []
}

variable "backend_settings" {
  type = list(object({
    name            = string
    port            = number
    protocol        = string
    request_timeout = number
    host_name       = string
    probe_name      = string
  }))
  default = []
}

variable "backend_probes" {
  type = list(object({
    name                                 = string
    host_name                            = string
    pick_host_name_from_backend_settings = bool
    path                                 = string
    protocol                             = string
    interval                             = number
    timeout                              = number
    match = object({
      status_code = list(string)
      body        = string
    })
  }))
  default = []
}

variable "default_ssl_certificate_name" {
  type    = string
  default = "DummyCertificate"
}

variable "ssl_certificate_files" {
  type = list(object({
    name     = string
    data     = string
    password = string
  }))
  default = []
}

variable "ssl_certificate_secrets" {
  type = list(object({
    name              = string
    secret_identifier = string
  }))
  default = []
}

variable "log_analytics" {
  type = object({
    id                 = string,
    workspace_id       = string,
    primary_shared_key = string
  })
  default = null
}

variable "tags" {
  type    = map(any)
  default = {}
}
