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

nsgs = {
  nsg1 = {
    name                  = "nsg-1"
    location              = "East US"
    resource_group_name   = "nse-resource-group1"
    security_rule_name    = "Allow-SSH"
    priority              = 100
    direction             = "Inbound"
    access                = "Allow"
    protocol              = "Tcp"
    source_port_range     = "*"
    dest_port_range       = "22"
    source_address_prefix = "223.191.88.16/32"
    dest_address_prefix   = "*"
  }
}

pips = {
  pip1 = {
    name                = "pip-1"
    resource_group_name = "nse-resource-group1"
    location            = "East US"
    allocation_method   = "Static"
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

snets = {
  snet1 = {
    name                 = "snet-1"
    resource_group_name  = "nse-resource-group1"
    virtual_network_name = "vnet-1"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

nics = {
  nic1 = {
    name                = "nic-1"
    location            = "East US"
    resource_group_name = "nse-resource-group1"
    nsg_key             = "nsg1"
    ip_configuration = {
      name                          = "internal"
      subnet_id                     = "snet1"
      private_ip_address_allocation = "Dynamic"
      public_ip_key                 = "pip1"
    }
  }
}

vms = {
  vm1 = {
    name                = "vm-1"
    location            = "East US"
    resource_group_name = "nse-resource-group1"
    nic_name            = "nic-1"
    vm_size             = "Standard_D2s_v4"
    computer_name       = "vm-1"
    admin_username      = "rohanuser"
    admin_password      = "Rohan@36652"
    vnet_name           = "vnet-1"
    subnet_name         = "snet-1"
  }
}