resource "azurerm_storage_account" "demo2" {
  name = "examplestorageacc6837"
  resource_group_name = azurerm_resource_group.demo.name
  location = azurerm_resource_group.demo.location
  account_tier = "standard"
  account_replication_type = "LRS"
}