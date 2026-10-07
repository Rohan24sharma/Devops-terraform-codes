terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=5.6.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "nse-resource-group"
    storage_account_name = "nsebackendstorage1"
    container_name       = "nsebackendcontainer"
    key                  = "nsedev.tfstate"
  }
}

provider "azurerm" {
  features {

  }
  # Configuration options
}