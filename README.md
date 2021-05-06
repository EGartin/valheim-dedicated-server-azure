# Valheim Dedicated Server Azure IaaS Build

## Terraform

### 2021 MAY 05

## Disclaimer/Legal

All use of these tools are the sole responsibility of the user applying the build in their own Cloud Environments.  Elijah Gartin/Falkon, Thunder Rock Gaming, ZeroBandwidth/And All Aliases, and any affiliated associates assume no liability for any issues or costs associated with utilizing these tools. You accept these terms and assume all responsibility by using and deploying any asset or artifact in this repository.

## About

This repository is to build a Valheim Dedicated Server from Microsoft Azure.  We assume you know how to use Microsoft Azure.

Pulling from Ubuntu Server immutable images and a dynamic Valheim Build library created by ZeroBandwidth and associates. [Application Build Github](https://github.com/Nimdy/Dedicated_Valheim_Server_Script.git). 

I do have some ambitions to try and create something like this for all the major cloud providers. All critiques are welcome via the Github Issue tracker or through discord.

## Prerequisites

  - [Terraform](https://www.terraform.io/downloads.html) (Tested on version 0.14.5)

## Steps

You'll be editing some lines in the `ROOT:main.tf` file for the local variables between line 8 and 13. Steps described below. Mileage may vary depending on what data center you try to push to.

You'll notice some of the taxonomy in referring to files such as `ROOT:filename`.  Root will be the root of the folder structure. Any modules will change the name of `ROOT` to `NETWORK` for example where there is another grouping of similarily named files.  This is a Terraform thing that some people may not be familiar with.

1. Use `curl https://ipinfo.io/ip` to obtain your IP and input it in the locals variable for `your_ip` in the `ROOT:main.tf`. This is essential for you to be able to SSH from your box.  If you intend to use a bastion host, make sure you're putting in the ip for the bastion host.

2. Make sure you have a keypair already made in your `EC2 > Network & Security > Key Pairs` area so you can put the name of the key in the locals in `ROOT:main.tf`.  You don't need to include the .pem or .ppk extension.

3. Edit the `ROOT:provider.tf` file to choose the data center you want to deploy in. [AWS EndPoints](https://docs.aws.amazon.com/general/latest/gr/rande.html).  Input your API key here if you aren't going to push or share this code, otherwise save your credentials in a credential file or in your OS environment variables for security purposes. [Read more about Terraform and AWS credentials here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

  - If you want to use the spot instance reduced cost configuration:
    - In `ROOT:Main.tf` comment out the `module:server` block in  from lines 32 to 45. Subsequently, uncomment the `module:spotserver` right underneath it from lines 48 to 62.
    - In `ROOT:output.tf` comment out lines 9 through 11 and uncomment lines 14-16

4. Once you've saved all your changes, open a terminal/command prompt to the location of this repository and run the following commands in succession:
  - `terraform init`
  - `terraform apply`

  You can destroy all assets when you are completed using `terraform destroy`

  **WARNING**
  Make sure you backup your game if you've made progress and want to keep it. Currently the S3 bucket is for read only access for security reasons. If it becomes additionally requested I may add more functionality to play with the backup functionality that ZeroBandwidth and crew have developed.

  Alternatively you can just backup with their scripts and then use SCP to download the backup.

  Example:
  ```scp -i KEYNAME.pem ubuntu@IPADDRESS:/home/steam/backups/valheim-backup-DATEUUID.tgz ~/Downloads/valheim-backup-DATEUUID.tgz```

  You can then reupload this to S3 and have it download from the `/scripts/bootstrap.sh` script if you care to.

## Network Schema

10.10.10.0/24 - Main Subnet (Server will build here as 10.10.10.69 (Nice))

The server will currently build as a `t3.medium`. I've tested this up to 4 concurrent players without surpassing 25% CPU utilization.  Depending on the size of the world and how many users, you may need to adjust the size. With Terraform, it should be as simple as updating the line of code in `ROOT:main.tf` line 34 with the new sizing and re-running `terraform apply`. Make sure you stop the server and backup before doing it, just in case.

## Support for Infrastructure as Code

Author: Elijah Gartin (Falkon)

- [Website](https://www.thunderrockgaming.com)
- [Discord](https://discord.gg/Trwr3Ty)
- [Falkon Twitch](https://twitch.tv/FalkonTTV)

## Support for Valheim Server Scripts

Author: ZeroBandwith (And Many More)

- [ZeroBandwith Discord](https://discord.gg/ejgQUfc)
- [ZeroBandwith Github Repo](https://github.com/Nimdy/Dedicated_Valheim_Server_Script.git)