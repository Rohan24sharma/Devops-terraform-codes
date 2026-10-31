module "rgs" {
  source = "../child_module/resource_group_block"
  rg     = var.rgs

}

module "pips" {
  source     = "../child_module/public_ip"
  pips       = var.pips
  depends_on = [module.rgs]
}

module "nsgs" {
  source     = "../child_module/network_security_group"
  nsgs       = var.nsgs
  depends_on = [module.rgs]
}
module "vnets" {
  source     = "../child_module/virtual_network"
  vnets      = var.vnets
  depends_on = [module.rgs]
}

module "subnet" {
  source     = "../child_module/subnet"
  depends_on = [module.vnets]
  subnets    = var.snets
}

module "nics" {
  source     = "../child_module/network_interface_card"
  nics       = var.nics
  subnets    = var.snets
  pips       = var.pips
  depends_on = [module.subnet, module.pips]
}


# -------------------------------------
data "azurerm_network_interface" "nic" {
  for_each            = var.nics
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  depends_on = [module.nics]
}

data "azurerm_network_security_group" "nsg" {
  for_each            = var.nsgs
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  depends_on = [module.nsgs]
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  for_each = var.nics

  network_interface_id      = data.azurerm_network_interface.nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.value.nsg_key].id
}
# -------------------------------------

module "vms" {
  source     = "../child_module/virtual_machine"
  vms        = var.vms
  nics       = var.nics
  depends_on = [azurerm_network_interface_security_group_association.nic_nsg, module.nics]
}