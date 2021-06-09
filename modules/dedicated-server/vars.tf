/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 JUN 09
*/

variable "instance_type"            {}
variable "subnet_id"                {}
variable "security_groups"          {}
variable "keyname"                  {}
variable "azurerm_resource_group"   {}
variable "azurerm_resource_location"{}
variable "user_data" {
  description = "Scripts to run at boot with Cloud-init"
  default = ""
}
variable "image_publisher" {
  description = "Name of the publisher of the image (az vm image list)"
  default     = "Canonical"
}
variable "image_offer" {
  description = "Name of the offer (az vm image list)"
  default     = "0001-com-ubuntu-server-focal"
}
variable "image_sku" {
  description = "Image SKU to apply (az vm image list)"
  default     = "20_04-lts-gen2"
}
variable "image_version" {
  description = "Version of the image to apply (az vm image list)"
  default     = "latest"
}
variable "hostname" {
  description = "Virtual machine hostname. Used for local hostname, DNS, and storage-related names."
  default     = "valheimsrv"
}

