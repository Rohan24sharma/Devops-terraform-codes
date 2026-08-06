# resource group

resource "azurerm_resource_group" "rg" {
  name     = "rg-rohan"
  location = "central india"
}

# virtual network

resource "azurerm_virtual_network" "vnet" {
  depends_on          = [azurerm_resource_group.rg]
  name                = "vnet-rohan"
  location            = "central india"
  resource_group_name = "rg-rohan"
  address_space       = ["10.0.0.0/16"]
}

# subnet

resource "azurerm_subnet" "subnet" {
  depends_on           = [azurerm_resource_group.rg, azurerm_virtual_network.vnet]
  name                 = "subnet-rohan"
  resource_group_name  = "rg-rohan"
  virtual_network_name = "vnet-rohan"
  address_prefixes     = ["10.0.1.0/24"]
}

# public ip

resource "azurerm_public_ip" "pip" {
  depends_on          = [azurerm_resource_group.rg]
  name                = "pip-rohan"
  resource_group_name = "rg-rohan"
  location            = "central india"
  allocation_method   = "Static"
}


resource "azurerm_network_interface" "nic" {
  depends_on = [ azurerm_resource_group.rg,azurerm_virtual_network.vnet,azurerm_subnet.subnet,azurerm_public_ip.pip ]
  name                = "nic-rohan"
  location            = "central india"
  resource_group_name = "rg-rohan"

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = data.azurerm_subnet.datasubnet.id
    public_ip_address_id          = data.azurerm_public_ip.datapip.id
    private_ip_address_allocation = "Dynamic"
  }
}