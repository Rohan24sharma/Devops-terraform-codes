rgs = {
  rg1 = {
    name     = "nse-resource-group1"
    location = "East US"
  },
  rg2 = {
    name     = "nse-resource-group2"
    location = "East US"
  },
  rg3 = {
    name     = "nse-resource-group3"
    location = "East US"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-1"
    resource_group_name = "nse-resource-group1"
    location            = "East US"
    address_space       = ["10.0.1.0/24"]
  },
  vnet2 = {
    name                = "vnet-2"
    resource_group_name = "nse-resource-group2"
    location            = "East US"
    address_space       = ["10.0.2.0/24"]

  },
  vnet3 = {
    name                = "vnet-3"
    resource_group_name = "nse-resource-group3"
    location            = "East US"
    address_space       = ["10.0.3.0/24"]

  }
}
