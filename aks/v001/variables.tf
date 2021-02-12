# Environment

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

# Name

variable "resource_name" {
  type    = string
  default = ""
}

variable "aks_name" {
  type    = string
  default = ""
}

# Specific

variable "kubernetes_version" {
  type    = string
  default = "1.18.6"
}

variable "subnet" {
  type = object({
    id = string
  })
}

variable "node_resource_group_name" {
  type    = string
  default = null
}

variable "node_count" {
  type    = number
  default = 1
}

variable "node_labels" {
  type    = map(any)
  default = {}
}

variable "node_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "disk_size_gb" {
  type    = number
  default = 32
}

variable "max_pods_per_node" {
  type    = number
  default = 30
}

variable "admin_username" {
  type    = string
  default = "remoteuser"
}

variable "admin_password" {
  type    = string
  default = null
}

variable "admin_ssh_public_key" {
  type    = string
  default = null
}

variable "grant_subscription_owner_access" {
  type    = bool
  default = false
}

variable "grant_resource_group_owner_access" {
  type    = bool
  default = false
}

variable "service_principal" {
  type = object({
    client_id     = string
    client_secret = string
  })
  default = null
}

variable "log_analytics" {
  type = object({
    id                 = string
    workspace_id       = string
    primary_shared_key = string
  })
  default = null
}

variable "container_registry" {
  type = object({
    id = string
  })
  default = null
}

variable "tags" {
  type    = map(any)
  default = {}
}
