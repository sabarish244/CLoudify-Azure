output "location" {
  value = azurerm_resource_group.jenkins_rg.location
}

output "resource_group_name" {
  value = azurerm_resource_group.jenkins_rg.name
}

output "subnet" {
  value = azurerm_subnet.jenkins_subnet.id
}
