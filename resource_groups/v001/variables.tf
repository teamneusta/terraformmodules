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

variable "resource_groups" {
  description = "List of the resource groups and their location."
  type = list(object({
    name     = string,
    location = string
  }))
}
