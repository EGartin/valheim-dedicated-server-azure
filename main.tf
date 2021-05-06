/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 05
*/

locals {
    #env_type        = "PRODUCTION/TESTING/ETC"
    #keyname         = "YOUR-KEY"
    #You can use the "get-your-ip.sh" script and then end this variable in the vars.tf
    your_ip         = "YOUR-IP/32"
}

# Create a resource group
resource "azurerm_resource_group" "valheim-resources" {
  name     = "valheim-resources"
  location = "West Central US"
}

/* BUILD NETWORK */
module "network" {
    source                      = "./modules/network"
    azurerm_resource_group      = azurerm_resource_group.valheim-resources.name
    azurerm_resource_location   = azurerm_resource_group.valheim-resources.location
}

module "securitygroups" {
    source          = "./modules/security-groups"
    your_ip         = local.your_ip
    azurerm_resource_group      = azurerm_resource_group.valheim-resources.name
    azurerm_resource_location   = azurerm_resource_group.valheim-resources.location
    
}

/*Create Role to Pull from S3*/
/*
module "iam" {
    source = "./modules/iam"
}
*/

/* BUILD SERVER */
module "server" {
    source                  = "./modules/dedicated-server"
    azurerm_resource_group      = azurerm_resource_group.valheim-resources.name
    azurerm_resource_location   = azurerm_resource_group.valheim-resources.location

    instance_type           = "Standard_B2s"

    subnet_id               = module.network.network_subnet_id
    security_groups         = module.securitygroups.valheim_security_groups
    #iam_instance_profile    = module.iam.ec2_s3_read_access

    #key_name                = local.keyname
    #env_type                = local.env_type

    #name_tag                = "Valheim Server"
    user_data               = base64encode(file("./scripts/bootstrap.sh"))
}


/*
module "spotserver" {
    source                  = "./modules/dedicated-server-spot"
    instance_type           = "t3.medium"
    volume_size             = "30"
    volume_type             = "gp2"
    subnet_id               = module.network.network_subnet_id
    security_groups         = module.securitygroups.valheim_security_groups
    iam_instance_profile    = module.iam.ec2_s3_read_access
    key_name                = local.keyname
    env_type                = local.env_type
    name_tag                = "Spot Valheim Server"
    user_data               = file("./scripts/bootstrap.sh")   
}
*/

