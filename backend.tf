terraform {
  backend "azurerm" {
    resource_group_name = "value"
    storage_account_name = "value"
    container_name = "value"
    key = "value"
  }
}

resource "azurerm_resource_group" "demo" {
  name = "demo-rg"
  location = "East US"
}

resource "azurerm_storage_account" "demo" {
  name = "examplestoracc6837"
  resource_group_name = azurerm_resource_group.demo.name
  location = azurerm_resource_group.demo.location
  account_tier = "standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "demo" {
  name = "tfstate"
  storage_account_name = azurerm_resource_group.demo.name
}