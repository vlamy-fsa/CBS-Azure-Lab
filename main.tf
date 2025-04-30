terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
  required_version = ">=1.1.0"
}

provider "azurerm" {
  features {
  }

  subscription_id = "3918983b-49d8-4d7f-bd90-73a70aa911e7"
}

# Reference to existing resources
data "azurerm_resource_group" "gso-core-westus2" {
  name = "gso-core-westus2"
}


data "azurerm_subnet" "gso-core-subnet" {
  name                 = "gso-core-westus2-subnet-default"
  virtual_network_name = "gso-core-westus2-vnet"
  resource_group_name  = "gso-core-westus2"
}

resource "azurerm_resource_group" "rg-vla" {
  name     = var.rg_name
  location = var.rg_location
}

module "vla-vm-net-int" {
  source      = "./modules/vm"
  rg_location = var.rg_location
  rg_name     = data.azurerm_resource_group.gso-core-westus2.name
  vm_subnet   = data.azurerm_subnet.gso-core-subnet.id
}

module "vla-vm" {
  source      = "./modules/vm"
  rg_location = var.rg_location
  rg_name     = data.azurerm_resource_group.gso-core-westus2.name
  vm_admin    = var.vm_admin
  vm_password = var.vm_password
  vm_size     = var.vm_size
  vm_name     = var.vm_name
}