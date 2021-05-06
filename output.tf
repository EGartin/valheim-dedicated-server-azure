/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 01
*/


output "public" {
    value = module.server.public_ip
}

/*
output "public" {
    value = module.spotserver.public_ip
}
*/