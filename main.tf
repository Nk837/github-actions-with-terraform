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

