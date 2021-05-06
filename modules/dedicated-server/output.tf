/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 05
*/

output "public_ip"  {
    value = azurerm_public_ip.valheim-server-pip.ip_address
}
