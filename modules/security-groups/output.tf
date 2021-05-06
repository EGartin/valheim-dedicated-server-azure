/*
* PROJECT: Valheim Dedicated Server
* FILE: SECURITY-GROUPS :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 05
*/

output "valheim_security_groups"    {
    value = [azurerm_network_security_group.valheim_external_ports.id, azurerm_network_security_group.ssh.id]
}