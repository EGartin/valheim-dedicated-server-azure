/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Output.tf
* AUTHOR: Elijah Gartin
* DATE: 2021 MAR 17
*/

output "instance_id"    {
    value = aws_spot_instance_request.instance.id
}
output "name_tag"   {
    value = var.name_tag
}
output "public_ip"  {
    value = aws_spot_instance_request.instance.public_ip
}
