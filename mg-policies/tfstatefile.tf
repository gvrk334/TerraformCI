/*resource "random_string" "resource_code" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_resource_group" "sg-rg" {
  name = "rg-sa-sg-we"
  location = "West Europe"
  
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate${random_string.resource_code.result}"
  resource_group_name      = azurerm_resource_group.sg-rg.name
  location                 = azurerm_resource_group.sg-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  #allow_blob_public_access  = true
  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
}

# Outputs
output "storage_account_name" {
  value = azurerm_storage_account.tfstate.name
}

output "storage_container_name" {
  value = azurerm_storage_container.tfstate.name
}

   */