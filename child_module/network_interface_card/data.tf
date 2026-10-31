data "azurerm_subnet" "snetblock" {
  for_each             = var.subnets
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pipblock" {
  for_each             = var.pips
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
}