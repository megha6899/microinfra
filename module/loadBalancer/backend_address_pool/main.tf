data "azurerm_lb" "lb" {
  for_each = var.backend_pool
  name                = each.value.lb_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  for_each = var.backend_pool

  name            = each.value.backend_pool_name
 loadbalancer_id = data.azurerm_lb.lb[each.key].id
}
