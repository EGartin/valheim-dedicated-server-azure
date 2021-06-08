/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Provider.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 11
*/
 #Only use these if you are secure and not sharing your code. Otherwise use more secure methods discussed in README.md

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  # More information on the authentication methods supported by
  # the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

subscription_id = "359b45a2-d4dd-4b2b-8d53-d2c1c9dfdaf5"
client_id       = "17e62c1c-1af9-4a50-9c47-0e6628ee197b"
client_secret   = "HWDZ4TdK78j~A~_EK_Ub~H_ZMzHD1Ba57W"
tenant_id       = "7465a8ef-0274-4e2d-847b-7da2f87ac604"
}