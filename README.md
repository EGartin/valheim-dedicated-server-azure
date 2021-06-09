# Valheim Dedicated Server Azure IaaS Build

## Terraform

### 2021 JUN 01

## Disclaimer/Legal

All use of these tools are the sole responsibility of the user applying the build in their own Cloud Environments.  Elijah Gartin/Falkon, Thunder Rock Gaming, ZeroBandwidth/And All Aliases, and any affiliated associates assume no liability for any issues or costs associated with utilizing these tools. You accept these terms and assume all responsibility by using and deploying any asset or artifact in this repository.

## About

This repository is to build a Valheim Dedicated Server from Microsoft Azure.  We assume you know how to use Microsoft Azure.

Pulling from Ubuntu Server immutable images and a dynamic Valheim Build library created by ZeroBandwidth and associates. [Application Build Github](https://github.com/Nimdy/Dedicated_Valheim_Server_Script.git). 

All critiques are welcome via the [Github Project](https://github.com/users/ElijahGartin/projects/2) or through [Discord](https://discord.gg/Trwr3Ty) in the Valheim or Science and Technology areas. To access those areas in discord, click on the :evergreen_tree: and/or :rocket: emoji reactions to gain access to those respective channel groups in the #channel-picker after accepting the terms of service discord prompt.

### Repositories

| Repository  |
| ----------- |
| [Valheim Terraform AWS](https://github.com/ElijahGartin/valheim-dedicated-server-aws)     |
| [Valheim Terraform Azure](https://github.com/ElijahGartin/valheim-dedicated-server-azure)   |
| [Valheim Terraform Google Cloud Platform](https://github.com/ElijahGartin/valheim-dedicated-server-gcp)            |
| [Valheim Terraform Digital Ocean](https://github.com/ElijahGartin/valheim-dedicated-server-digio)            |


## Prerequisites

  - [Azure Account](https://azure.microsoft.com/en-us/free/)
  - [Terraform](https://www.terraform.io/downloads.html) (Tested on version 1.0.0)

## Steps
You'll be editing some lines in the `ROOT:vars.tf` and `ROOT:provider.tf` files for the variables in your environment. The steps described below. Mileage may vary depending on what data center you try to push to.

You'll notice some of the taxonomy in referring to files such as `ROOT:filename`.  Root will be the root of the folder structure. Any modules will change the name of `ROOT` to `NETWORK` for example where there is another grouping of similarily named files.  This is a Terraform thing that some people may not be familiar with.

1. `ROOT:vars.tf`: Use `curl https://ipinfo.io/ip` to obtain your IP and input it in the variable for `your_ip` on line 10. This is essential for you to be able to SSH from your box.  If you intend to use a bastion host, make sure you're putting in the ip for the bastion host.

2. `ROOT:vars.tf`: Make sure you have a keypair already made in `~/.ssh/id_rsa.pub` and insert that path in this section, or modify the location/name of it in the variables file on line 15.

3. `ROOT:vars.tf`: Change the `location` variable on line 21 to put it in the azure datacenter you want. 
  - [Azure Datacenters](https://azure.microsoft.com/en-us/global-infrastructure/geographies/)

4. `ROOT:provider.tf`: file to input your unique identifiers for your azure subscription and active directory app: 
  - [Azure Subscriptions](https://portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade)
    - `subscription_id`
  - [Azure Active Directory Registered App](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/RegisteredApps)
    - `client_id`
    - `client_secret`
    - `tenant_id`

  [Azure Terraform Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

5. Once you've saved all your changes, open a terminal/command prompt to the location of this repository and run the following commands in succession:
  - `terraform init`
  - `terraform apply`

6. To SSH to box, use `odin` as the username with the public key you provided. Ex: `ssh -i {YOUR_SSH_KEY_PATH} odin@{server-public-ip}`

  You can destroy all assets when you are completed using `terraform destroy`

  **WARNING**
  Make sure you backup your game if you've made progress and want to keep it. If it becomes additionally requested I may add more functionality to play with the backup functionality that ZeroBandwidth and crew have developed.

  Alternatively you can just backup with their scripts and then use SCP to download the backup.

  Example:
  ```scp -i KEYNAME odin@IPADDRESS:/home/steam/backups/valheim-backup-DATEUUID.tgz ~/Downloads/valheim-backup-DATEUUID.tgz```

  You can then reupload this to Data Blobs and have it download from the `/scripts/bootstrap.sh` script if you care to if you have to rebuild a server.

## Network Schema

10.10.10.0/24 - Main Subnet (Server will build here as 10.10.10.69 (Nice))

The server will currently build as a `Standard_B2s` (2vCPU 4GB RAM). Depending on the size of the world and how many users, you may need to adjust the size. With Terraform, it should be as simple as updating the line of code in `ROOT:main.tf` line 41 with the new sizing and re-running `terraform apply`. Make sure you stop the server and backup before doing it, just in case.

For testing, we'll use `Standard_B1ls`

## Support for Infrastructure as Code

Author: Elijah Gartin (Falkon)

- [Website](https://www.thunderrockgaming.com)
- [Discord](https://discord.gg/Trwr3Ty)
- [Falkon Twitch](https://twitch.tv/FalkonTTV)

## Support for Valheim Server Scripts

Author: ZeroBandwith (And Many More)

- [ZeroBandwith Discord](https://discord.gg/ejgQUfc)
- [ZeroBandwith Github Repo](https://github.com/Nimdy/Dedicated_Valheim_Server_Script.git)