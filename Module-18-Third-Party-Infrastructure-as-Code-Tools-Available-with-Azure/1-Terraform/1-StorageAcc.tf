variable "storage_account_name" {
    type=string
    #default="appstore50001"
}

variable "resource_group_name" {
    type=string
    default="terraform_grp"
}

provider "azurerm"{
version = "=2.0"
#subscription_id = "20c6eec9-2d80-4700-b0f6-4fde579a8783"
#tenant_id       = "5f5f1c90-abac-4ebe-88d7-0f3d121f967e"
features {}
}

resource "azurerm_resource_group" "grp" {
  name     = var.resource_group_name
  location = "North Europe"
}

resource "azurerm_storage_account" "store" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.grp.name
  location                 = azurerm_resource_group.grp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
