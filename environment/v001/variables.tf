variable "parent" {
  description = "A parent environment"
  type        = map(any)
  default = {
    location            = ""
    project_name        = ""
    stage_name          = ""
    resource_group_name = ""
  }
}

variable "location" {
  description = "The Name of the Location as string"
  type        = string
  default     = "*"
}

variable "project_name" {
  description = "The Name of the project"
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
  default     = "*"
}

variable "settings" {
  description = "Additional settings that should be included in the environment"
  type        = map(any)
  default     = {}
}
