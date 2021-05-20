/*
* PROJECT: Valheim Dedicated Server
* FILE: SECURITY-GROUPS :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 20
*/

output "valheim_security_groups"    {
    value = azurerm_network_security_group.valheim_ports.id
}