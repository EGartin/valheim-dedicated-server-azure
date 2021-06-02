/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 05
*/

output "public_ip"  {
    value = azurerm_linux_virtual_machine.valheim-server.public_ip_address
}
