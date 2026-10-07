module "rgs" {
  source = "../child_module/resource_group_block"
  rg     = var.rgs

}

module "vnets" {
  source     = "../child_module/virtual_network"
  vnets      = var.vnets
  depends_on = [module.rgs]
}
