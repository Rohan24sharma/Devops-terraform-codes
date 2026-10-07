resource "azurerm_virtual_network" "vgs" {
    for_each = var.vnets
    resource_group_name = each.value.resource_group_name
    name=each.value.name
    location = each.value.location

    address_space = each.value.address_space
  
}