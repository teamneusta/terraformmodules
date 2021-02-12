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
  default = "10.3"
}

variable "server_administrator_login" {
  type    = string
  default = "sqladmin"
}

variable "server_administrator_password" {
  type    = string
  default = "eeduzeeVaPhieHau1aeb"
}

variable "sku_name" {
  type    = string
  default = "B_Gen5_1"
}

variable "storage_mb" {
  type    = number
  default = 5120
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

variable "databases" {
  description = "List of databases of the Mariadb server."
  type = list(object({
    name      = string,
    edition   = string,
    collation = string,
    charset   = string,
  }))
}

#variable "vnet_rule_subnets" {
#  type = list(object({
#    id = string
#  }))
#  default = []
#}
#
#variable "log_analytics" {
#  type = object({
#    id                 = string,
#    workspace_id       = string,
#    primary_shared_key = string
#  })
#  default = {
#    id                 = "",
#    workspace_id       = "",
#    primary_shared_key = ""
#  }
#}
#
#variable "activedirectory_admin" {
#  type = object({
#    login     = string
#    object_id = string
#  })
#  default = {
#    login     = ""
#    object_id = ""
#  }
#}

variable "tags" {
  type    = map(any)
  default = {}
}
