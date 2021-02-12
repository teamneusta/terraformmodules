variable "environment" {
  description = "The env module"
  type        = map(any)
  default     = {}
}

variable "location" {
  description = "The Name of the Location as string"
  type        = string
  default     = "*"
}

variable "project_name" {
  description = "The name of the stage. i.e dev, prod"
  type        = string
  default     = "*"
}

variable "stage_name" {
  description = "The name of the stage. i.e dev, prod"
  type        = string
  default     = "*"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
