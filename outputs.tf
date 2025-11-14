output "vnet_id" {
  description = "Virtual network ID"
  value       = azurerm_virtual_network.default.id
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = azurerm_subnet.subnets[*].id
}
