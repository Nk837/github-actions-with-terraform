terraform {
  backend "azurerm" {
    resource_group_name = "demo_rg"
    storage_account_name = "examplestoracc6837"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "demo" {
  name     = "demo_rg"
  location = "East US"
}

resource "azurerm_storage_account" "demo" {
  name                     = "examplestoracc6837"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "demo" {
  name                 = "tfstate"
  storage_account_name = azurerm_storage_account.demo.name
}