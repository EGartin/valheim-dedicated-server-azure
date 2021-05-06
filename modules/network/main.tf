/*
* PROJECT: Valheim Dedicated Server
* FILE: NETWORK :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 05
*/

#RANGE 10.10.x.x VNET NETWORK
resource "azurerm_virtual_network" "valheim-vnet" {
  name                = "valheim-vnet"
  resource_group_name = var.azurerm_resource_group
  location            = var.azurerm_resource_location
  address_space       = ["10.10.0.0/16"]
}

#10 Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "valheim-subnet"
  virtual_network_name = azurerm_virtual_network.valheim-vnet.name
  resource_group_name  = var.azurerm_resource_group
  address_prefix       = "10.10.10.0/24"
}