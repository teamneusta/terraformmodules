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

variable "account_name" {
  description = "The name of the storage account"
  type        = string
  default     = ""
}

variable "account_kind" {
  description = "Defines the Kind of account"
  type        = string
  default     = "StorageV2"
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account"
  type        = string
  default     = "LRS"
}

variable "access_tier" {
  description = "Defines the access tier"
  type        = string
  default     = "Hot"
}

variable "containers" {
  description = "Defines default containers"
  type = list(object({
    name        = string
    access_type = string
  }))
  default = []
}

variable "enable_https_traffic_only" {
  description = "Boolean flag which forces HTTPS if enabled"
  type        = bool
  default     = true
}

variable "enable_static_website" {
  description = "Boolean flag which enabled static website hosting"
  type        = bool
  default     = false
}

variable "network_rule_subnets" {
  type = list(object({
    id = string
  }))
  default = []
}

variable "network_rule_bypass" {
  type    = list(string)
  default = []
}

variable "network_rule_ip_rules" {
  type    = list(string)
  default = []
}

variable "network_rule_allow_public_access" {
  description = "Whether or not public network access is allowed for this storage account. Defaults to true."
  type        = bool
  default     = true
}

variable "private_endpoint_subnets" {
  type = list(object({
    id = string
  }))
  default = []
}

variable "private_endpoint_subresource_names" {
  type    = list(string)
  default = ["blob"] //, "file", "queue", "table", "web"]
}

variable "privatelink_blob_dns_zone" {
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

variable "tags" {
  type    = map(any)
  default = {}
}
