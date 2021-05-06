/*
* PROJECT: Valheim Dedicated Server
* FILE: IAM :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 05
*/

resource "aws_iam_role" "ec2_s3_read_access_role" {
  name = "ec2_s3_read_access_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": "sts:AssumeRole",
        "Principal": {
            "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
        }
    ]
    })

  tags = {
    name = "EC2_S3_Read_Access_Role"
  }
}

resource "aws_iam_instance_profile" "ec2_s3_read_access_profile" {
  name = "ec2_s3_read_access_profile"
  role = aws_iam_role.ec2_s3_read_access_role.name
}

resource "aws_iam_role_policy" "ec2_s3_read_access_policy" {
  name = "ec2_s3_read_access_policy"
  role = aws_iam_role.ec2_s3_read_access_role.id

  policy = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
          {
              "Effect": "Allow",
              "Action": [
                  "s3:Get*",
                  "s3:List*"
              ],
              "Resource": "*"
          }
        ]
    })
}