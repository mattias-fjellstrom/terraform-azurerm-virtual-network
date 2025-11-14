variable "name_suffix" {
  description = "Virtual network name suffix (e.g. vnet-<suffix>)"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where to create the virtual network"
  type        = string
}

variable "location" {
  description = "Azure region where to create the virtual network"
  type        = string
}

variable "cidr_block" {
  description = "Virtual network CIDR block"
  type        = string
}

variable "subnets" {
  description = "Virtual network subnets"
  type = list(object({
    name_suffix = string
    size        = number
  }))
}
