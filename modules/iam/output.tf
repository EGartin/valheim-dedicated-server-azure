/*
* PROJECT: Valheim Dedicated Server
* FILE: IAM :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 05
*/

output "ec2_s3_read_access" {
    value = aws_iam_instance_profile.ec2_s3_read_access_profile.name
}