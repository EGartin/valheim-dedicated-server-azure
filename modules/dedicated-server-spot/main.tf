/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Main.tf
* AUTHOR: Elijah Gartin
* DATE: 2021 MAR 05
*/

/* EC2 Instance */
data "aws_region" "current" {
}
data "aws_ami" "latest-ubuntu" {
    most_recent = true
    owners = ["099720109477"]

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}


resource "aws_spot_instance_request" "instance" {
    ami = data.aws_ami.latest-ubuntu.id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    #private_ip = var.private_ip
    vpc_security_group_ids = var.security_groups
    key_name = var.key_name
    wait_for_fulfillment = true
    spot_type = "persistent"
    tags = {
        Name = var.name_tag
        Environment = var.env_type
    }
    volume_tags = { 
        Name = var.name_tag
        Environment = var.env_type
    }
    ebs_block_device {
        volume_type = var.volume_type
        volume_size = var.volume_size
        device_name = "/dev/sda1"
    }
    user_data = var.user_data
    iam_instance_profile = var.iam_instance_profile
    lifecycle {
        ignore_changes = [
            id, 
            ebs_block_device,
            security_groups,
            tags,
            volume_tags,
            user_data
        ]
    }
}

