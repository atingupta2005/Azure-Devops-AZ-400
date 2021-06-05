variable "storage_account_name" {
    type=string
    default="appstore50001"
}
 
variable "network_name" {
    type=string
    default="staging"
}
 
variable "vm_name" {
    type=string
    default="stagingvm"
}
 
provider "azurerm"{
version = "=2.0"
subscription_id = "20c6eec9-2d80-4700-b0f6-4fde579a8783"
tenant_id       = "5f5f1c90-abac-4ebe-88d7-0f3d121f967e"
features {}
}
 
resource "azurerm_virtual_network" "staging" {
  name                = var.network_name
  address_space       = ["10.0.0.0/16"]
  location            = "North Europe"
  resource_group_name = "terraform_grp"
}
 
resource "azurerm_subnet" "default" {
  name                 = "default"
  resource_group_name  = "terraform_grp"
  virtual_network_name = azurerm_virtual_network.staging.name
  address_prefix     = "10.0.0.0/24"
}
 
resource "azurerm_network_interface" "interface" {
  name                = "default-interface"
  location            = "North Europe"
  resource_group_name = "terraform_grp"
 
  ip_configuration {
    name                          = "interfaceconfiguration"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
  }
}
 
resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = "North Europe"
  resource_group_name   = "terraform_grp"
  network_interface_ids = [azurerm_network_interface.interface.id]
  vm_size               = "Standard_DS1_v2"
 
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "stagingvm"
    admin_username = "demousr"
    admin_password = "AzurePortal@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }  
}