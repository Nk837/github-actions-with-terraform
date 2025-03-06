# Output the Static Website URL
output "static_website_url" {
  value = "https://${azurerm_storage_account.example.primary_web_endpoint}"
}

output "storage_account_name" {
  value = azurerm_storage_account.demo2.name
}

output "storage_account_key" {
  value = azurerm_storage_account.demo2.primary_access_key
}

output "storage_container_name" {
  value = azurerm_storage_container.demo2.name
}