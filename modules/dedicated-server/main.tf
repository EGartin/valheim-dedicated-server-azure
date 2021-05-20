/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 20
*/
locals {
  uuid = uuid()
  uuid_prefix = element(split("-", local.uuid), 0)
  uuid_four = substr(local.uuid_prefix,0,4)
}

#Dedicated IP 
resource "azurerm_network_interface" "valheim-server-nic" {
  name                            = "valheim-server-nic"
  location                        = var.azurerm_resource_location
  resource_group_name             = var.azurerm_resource_group

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.valheim-server-pip.id
  }
}

resource "azurerm_network_interface_security_group_association" "valheim-security-group" {
  network_interface_id            = azurerm_network_interface.valheim-server-nic.id
  network_security_group_id       = var.security_groups
}

resource "azurerm_public_ip" "valheim-server-pip" {
  name                            = "a-${local.uuid_four}-ip"
  location                        = var.azurerm_resource_location
  resource_group_name             = var.azurerm_resource_group
  allocation_method               = "Dynamic"
  domain_name_label               = "a-${local.uuid_four}-valheim"

    lifecycle {
      ignore_changes = [
        name,
        domain_name_label,
      ]
  }
}


## SERVER
resource "azurerm_linux_virtual_machine" "valheim-server" {
  name                          = "Valheim-Server"
  location                      = var.azurerm_resource_location
  resource_group_name           = var.azurerm_resource_group
  size                          = var.instance_type
  network_interface_ids         = [azurerm_network_interface.valheim-server-nic.id]
  custom_data                   = var.user_data    

  admin_username                = "odin"

  admin_ssh_key {
    username                    = "odin"
    public_key                  = var.keyname
  }

  source_image_reference {
    publisher                   = var.image_publisher
    offer                       = var.image_offer
    sku                         = var.image_sku
    version                     = var.image_version
  }

  os_disk {
    storage_account_type        = "Standard_LRS"
    caching                     = "ReadWrite"
  }

  
}