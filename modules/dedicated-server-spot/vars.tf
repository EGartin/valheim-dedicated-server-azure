/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Vars.tf
* AUTHOR: Elijah Gartin
* DATE: 2021 MAR 05
*/

    variable "instance_type"    {}
    variable "volume_size"      {}
    variable "volume_type"      {}
    variable "subnet_id"        {}
    #variable "private_ip"   {}
    variable "public_ip"    {
        default = "true"
    }
    variable "security_groups"  {
    }
    variable "name_tag"          {}
    variable "env_type"         {}

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