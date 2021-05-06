/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 05
*/
locals {
  uuid = uuid()
  uuid_prefix = element(split("-", local.uuid), 0)
  uuid_four = substr(local.uuid_prefix,0,4)
  formatmonth = element(split("-", timestamp()), 1)
  daytime = element(split("-", timestamp()), 2)
  formatday = element(split("T", local.daytime), 0)
  #prefix = "${local.uuid_four}-${local.formatmonth}-${local.formatday}"
}

#Dedicated IP 
resource "azurerm_network_interface" "valheim-server-nic" {
  name                      = "valheim-server-nic"
  location                  = var.azurerm_resource_location
  resource_group_name       = var.azurerm_resource_group
  #network_security_group_id = var.security_groups

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.valheim-server-pip.id
  }
}

resource "azurerm_public_ip" "valheim-server-pip" {
  name                         = "a-${local.uuid_four}-ip"
  location                     = var.azurerm_resource_location
  resource_group_name          = var.azurerm_resource_group
  allocation_method            = "Dynamic"
  domain_name_label            = "a-${local.uuid_four}-valheim"
}


## SERVER
# And finally we build our virtual machine. This is a standard Ubuntu instance.
# We use the shell provisioner to run a Bash script that configures Apache for 
# the demo environment. Terraform supports several different types of 
# provisioners including Bash, Powershell and Chef.
resource "azurerm_virtual_machine" "valheim-server" {
  name                          = "Valheim-Server"
  location                      = var.azurerm_resource_location
  resource_group_name           = var.azurerm_resource_group
  vm_size                       = var.instance_type
  #custom_data                   = var.user_data
  network_interface_ids         = [azurerm_network_interface.valheim-server-nic.id]
  delete_os_disk_on_termination = "true"

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  storage_os_disk {
    name              = "osdisk"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }

  os_profile {
    computer_name  = var.hostname
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  
}
/*
resource "aws_instance" "instance" {
    ami = data.aws_ami.latest-ubuntu.id
    instance_type = var.instance_type
    ebs_optimized = "true"
    subnet_id = var.subnet_id
    private_ip = var.private_ip
    vpc_security_group_ids = var.security_groups
    key_name = var.key_name
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
*/