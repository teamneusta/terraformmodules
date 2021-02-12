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

variable "http_listener_ports" {
  type    = list(number)
  default = [80]
}

variable "https_listener_ports" {
  type    = list(number)
  default = [443]
}

variable "https_listener_ssl_certificate_name" {
  type    = string
  default = "DummyCertificate"
}

variable "forward_ports" {
  type    = list(number)
  default = []
}

variable "backend_node_ips" {
  type    = list(string)
  default = []
}

variable "backend_port" {
  type    = number
  default = 80
}

variable "backend_host_name" {
  type    = string
  default = ""
}

variable "backend_request_timeout" {
  type    = number
  default = 120
}

variable "probe_host_name" {
  type    = string
  default = ""
}

variable "probe_path" {
  type    = string
  default = "/"
}

variable "probe_match_status_code" {
  type    = list(string)
  default = ["200-399"]
}

variable "probe_match_body" {
  type    = string
  default = null
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

variable "ssl_certificate_password" {
  type    = string
  default = ""
}

variable "ssl_certificate_key_vault_secret" {
  type = object({
    id = string
  })
  default = {
    id = ""
  }
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
