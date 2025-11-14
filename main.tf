resource "azurerm_virtual_network" "default" {
  name                = "vnet-${var.name_suffix}"
  resource_group_name = var.resource_group_name
  location            = var.location

  address_space = [
    var.cidr_block,
  ]
}

locals {
  subnets = {
    for index in range(length(var.subnets)) : var.subnets[index].name_suffix => merge(var.subnets[index], { index = index })
  }
}

resource "azurerm_subnet" "subnets" {
  for_each = local.subnets

  name                 = "snet-${each.value.name_suffix}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.default.name

  address_prefixes = [
    cidrsubnet(var.cidr_block, each.value.size, each.value.index)
  ]
}
