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

variable "server_name" {
  type    = string
  default = ""
}

variable "server_version" {
  type    = string
  default = "12.0"
}

variable "server_administrator_login" {
  type    = string
  default = "sqladmin"
}

variable "server_administrator_password" {
  type    = string
  default = ""
}

variable "system_assigned_identity" {
  type    = bool
  default = true
}

variable "minimum_tls_version" {
  type    = string
  default = null
}

variable "firewall_rules" {
  description = "List of firewall rules for the SQL server."
  type = list(object({
    name             = string,
    start_ip_address = string,
    end_ip_address   = string
  }))
  default = []
}

variable "firewall_allow_azure_access" {
  description = "Indicates if azure services should be able to access this server."
  type        = bool
  default     = false
}

variable "firewall_allow_neusta_access" {
  description = "Indicates if team neusta IP ranges should be added to the firewall."
  type        = bool
  default     = false
}

variable "firewall_allow_public_network_access" {
  description = "Whether or not public network access is allowed for this server. Defaults to true."
  type        = bool
  default     = true
}

variable "databases" {
  description = "List of databases of the SQL server."
  type = list(object({
    name                             = string,
    edition                          = string,
    collation                        = string,
    max_size_gb                      = number,
    requested_service_objective_name = string
  }))
}

variable "vnet_rule_subnets" {
  type = list(object({
    id = string
  }))
  default = []
}

variable "private_endpoint_subnets" {
  type = list(object({
    id = string
  }))
  default = []
}

variable "privatelink_dns_zone" {
  type = object({
    name                = string
    resource_group_name = string
  })
  default = null
}

variable "log_analytics" {
  type = object({
    id                 = string,
    workspace_id       = string,
    primary_shared_key = string
  })
  default = null
}

variable "activedirectory_admin" {
  type = object({
    login_username = string
    object_id      = string
    tenant_id      = string
  })
  default = null
}

variable "tags" {
  type    = map(any)
  default = {}
}
