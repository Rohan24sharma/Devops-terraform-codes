terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstatestgacnt" # <- use module output
    container_name       = "tfstate"
    key                  = "dev.tfstate"

  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}