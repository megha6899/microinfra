terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
}
provider "azurerm" {

  features {}
 subscription_id      = "5ed71b72-e131-4c8d-8029-6d14191c6dfe"
 tenant_id = "4616d612-8bc9-4839-bf28-e030beab3250"
  
}
