/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 JUN 01
*/

# Create a resource group
resource "azurerm_resource_group" "valheim-resources" {
    name                        = "valheim-resources"
    location                    = var.location
}

/* BUILD NETWORK */
module "network" {
    source                      = "./modules/network"
    azurerm_resource_group      = azurerm_resource_group.valheim-resources.name
    azurerm_resource_location   = azurerm_resource_group.valheim-resources.location
}

module "securitygroups" {
    source                      = "./modules/security-groups"
    your_ip                     = var.your_ip
    azurerm_resource_group      = azurerm_resource_group.valheim-resources.name
    azurerm_resource_location   = azurerm_resource_group.valheim-resources.location
    
}

/* BUILD SERVER */
module "server" {
    source                      = "./modules/dedicated-server"
    azurerm_resource_group      = azurerm_resource_group.valheim-resources.name
    azurerm_resource_location   = azurerm_resource_group.valheim-resources.location
    instance_type               = "Standard_B1ls"
    subnet_id                   = module.network.network_subnet_id
    security_groups             = module.securitygroups.valheim_security_groups
    keyname                     = file(var.keyname)
    user_data                   = base64encode(file("./scripts/bootstrap.sh"))
}
