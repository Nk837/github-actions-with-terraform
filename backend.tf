# # terraform {
# #   backend "azurerm" {
# #     subscription_id = "e3bf1520-631c-4200-b6e7-dc6ade33c0b7"
# #     resource_group_name = "demo_rg"
# #     storage_account_name = "examplestoracc6837"
# #     container_name = "tfstate"
# #     key = "terraform.tfstate"
# #   }
# # }

resource "azurerm_resource_group" "demo" {
  name     = var.resource_group_name[0]
  location = var.location[0]
}

resource "azurerm_storage_account" "demo" {
  name                     = var.storage_account_name[0]
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "demo" {
  name                 = var.container_name[0]
  storage_account_name = azurerm_storage_account.demo.name
}