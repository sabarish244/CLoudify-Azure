resource "azurerm_resource_group" "jenkins_rg" {
  name     = "${var.prefix}-resources"
  location = var.region
}

resource "azurerm_virtual_network" "jenkins_network" {
  name                = "${var.prefix}-network"
  address_space       = var.network_cidr
  location            = azurerm_resource_group.jenkins_rg.location
  resource_group_name = azurerm_resource_group.jenkins_rg.name
}

resource "azurerm_subnet" "jenkins_subnet" {
  name                 = "${var.prefix}-internal-net"
  resource_group_name  = azurerm_resource_group.jenkins_rg.name
  virtual_network_name = azurerm_virtual_network.jenkins_network.name
  address_prefixes     = var.subnet_cidr
}


