/*
* PROJECT: Valheim Dedicated Server
* FILE: SECURITY-GROUPS :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 05
*/

variable "your_ip"  {}
variable "azurerm_resource_group"{
    default = ""
}
variable "azurerm_resource_location"{
    default = ""
}
