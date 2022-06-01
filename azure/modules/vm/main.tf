# Generate a random suffix to suffix resources with
resource "random_id" "suffix" {
  byte_length = 4
}

resource "azurerm_public_ip" "jenkins_ip" {
  name                    = "${var.prefix}-public-ip-${random_id.suffix.hex}"
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
}

resource "azurerm_network_interface" "jenkins_interface" {
  name                = "${var.prefix}-nic-${random_id.suffix.hex}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.prefix}-internal-ip-${random_id.suffix.hex}"
    subnet_id                     = var.subnet
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jenkins_ip.id

  }
}

resource "azurerm_linux_virtual_machine" "jenkins" {
  name                = "${var.prefix}-vm-${random_id.suffix.hex}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.instance_type
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.jenkins_interface.id,
  ]

    admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_key_public
  }

  os_disk {
    caching           = var.os_disk_caching
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

}
