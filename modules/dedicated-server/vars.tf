/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 05
*/

variable "azurerm_resource_group"{
    default = ""
}
variable "azurerm_resource_location"{
    default = ""
}
variable "image_publisher" {
  description = "Name of the publisher of the image (az vm image list)"
  default     = "Canonical"
}

variable "image_offer" {
  description = "Name of the offer (az vm image list)"
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "Image SKU to apply (az vm image list)"
  default     = "16.04-LTS"
}

variable "image_version" {
  description = "Version of the image to apply (az vm image list)"
  default     = "latest"
}

variable "hostname" {
  description = "Virtual machine hostname. Used for local hostname, DNS, and storage-related names."
  default     = "valheimsrv"
}

variable "admin_username" {
  description = "Administrator user name"
  default     = "adminuser"
}

variable "admin_password" {
  description = "Administrator password"
  default     = "Adminpassword123!"
}


    variable "instance_type"    { }


    variable "subnet_id"        {}

    variable "security_groups"  {
    }
    variable "iam_instance_profile" {
        default = ""
    }
    variable "key_name" {
        default = ""
    }
    variable "user_data" {
        default = ""
    }
    variable "user_data_base64" {
        default = ""
    }
    variable "depends_id"   {
        default = ""
    }
    