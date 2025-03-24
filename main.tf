resource "azurerm_resource_group" "demo2" {
  name     = var.resource_group_name[1]
  location = var.location[0]
}

resource "azurerm_storage_account" "demo2" {
  name                     = var.storage_account_name[1]
  resource_group_name      = azurerm_resource_group.demo2.name
  location                 = azurerm_resource_group.demo2.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Enable Static Website Hosting
  is_hns_enabled           = false
  static_website {
    index_document    = "index.html"
    error_404_document = "404.html"
  }

  tags = {
    environment = "test"
  }
}

resource "azurerm_storage_container" "demo2" {
  name                 = var.container_name[1]
  storage_account_name = azurerm_storage_account.demo2.name
  container_access_type = "container"
}

# resource "azurerm_virtual_network" "main" {
#   name = "${var.vnet}-network"
#   address_space = ["10.0.0.0/16"]
#   location = azurerm_resource_group.demo2.location
#   resource_group_name = azurerm_resource_group.demo2.name
# }

# resource "azurerm_subnet" "internal" {
#   name = "internal"
#   resource_group_name = azurerm_resource_group.demo2.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefixes = ["10.0.2.0/24"]
# }

# resource "azurerm_network_interface" "main" {
#   name = "${var.vnet}-nic"
#   resource_group_name = azurerm_resource_group.demo2.name
#   location = azurerm_resource_group.demo2.location

#   ip_configuration {
#     name = "testconfiguration1"
#     subnet_id = azurerm_subnet.internal.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_virtual_machine" "main" {
#   name = var.vm
#   location = azurerm_resource_group.demo2.location
#   resource_group_name = azurerm_resource_group.demo2.name
#   network_interface_ids = [ azurerm_network_interface.main.id ]
#   vm_size = "Standard_DS1_v2"

#   delete_data_disks_on_termination = "true"
#   delete_os_disk_on_termination = "true"

#   storage_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "18.04-LTS"
#     version   = "latest"
#   }
#   storage_os_disk {
#     name              = "myosdisk1"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }
#   os_profile {
#     computer_name = "hostname"
#     admin_username = var.admin_username
#     admin_password = var.admin_password
#   }

#   os_profile_linux_config {
#     disable_password_authentication = "false"
#   }

#   tags = {
#     environment = "test"
#   }
# }