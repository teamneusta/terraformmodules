# Name

variable "pool_name" {
  type    = string
  default = ""
}

# Specific

variable "aks" {
  type = object({
    id = string
  })
}

variable "subnet" {
  type = object({
    id = string
  })
}

variable "os_type" {
  type    = string
  default = "Linux"
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

variable "tags" {
  type    = map(any)
  default = {}
}
