/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 JUN 01
*/

variable "your_ip"  {
    description = "Your Public IP Address to allow you to SSH to the box"
    #You can use the "get-your-ip.sh" script get your IP
    default     = "212.102.45.106/32"
}

variable "keyname"  {
    description = "Your path to your public key to authenticate to the server"
    #[Github Generate SSH Keys](https://docs.github.com/en/github-ae@latest/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
    default     = "~/.ssh/id_rsa.pub"
}

variable "location" {
    description = "Data Center Location"
    #[Azure Datacenters](https://azure.microsoft.com/en-us/global-infrastructure/geographies/)
    default     = "West Central US"
}