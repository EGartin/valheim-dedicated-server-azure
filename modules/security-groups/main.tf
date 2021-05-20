/*
* PROJECT: Valheim Dedicated Server
* FILE: SECURITY-GROUPS :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 20
*/

resource "azurerm_network_security_group" "valheim_ports" {
  name                = "Valheim_Ports"
  location            = var.azurerm_resource_location
  resource_group_name = var.azurerm_resource_group

  #TCP  
  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.your_ip
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ValheimTCP0"
    priority                   = 105
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "2456-2458"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ValheimTCP1"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "27015-27030"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ValheimTCP2"
    priority                   = 115
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "27036-27037"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  #UDP
  security_rule {
    name                       = "ValheimUDP0"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "UDP"
    source_port_range          = "*"
    destination_port_range     = "2456-2458"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ValheimUDP1"
    priority                   = 125
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "UDP"
    source_port_range          = "*"
    destination_port_range     = "4380"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ValheimUDP2"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "UDP"
    source_port_range          = "*"
    destination_port_range     = "27000-27031"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ValheimUDP3"
    priority                   = 135
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "UDP"
    source_port_range          = "*"
    destination_port_range     = "27036"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }  
}