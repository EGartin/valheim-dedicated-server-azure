/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Provider.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 01
*/
 #Only use these if you are secure and not sharing your code. Otherwise use more secure methods discussed in README.md

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  # More information on the authentication methods supported by
  # the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

subscription_id = "359b45a2-d4dd-4b2b-8d53-d2c1c9dfdaf5"
client_id       = "2ef5c34e-b66c-4287-9cdf-ba05c4bb9851"
client_secret   = "Yt28F5-v.INz9n-TXu5W60~~.U23jX50fj"
tenant_id      = "7465a8ef-0274-4e2d-847b-7da2f87ac604"
}