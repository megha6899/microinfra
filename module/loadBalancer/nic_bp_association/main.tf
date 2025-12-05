resource "azurerm_network_interface_backend_address_pool_association" "nic_backend_assoc" {
  for_each = var.nic_bp_association

  network_interface_id = var.nic_ids[each.value.nic_name]
  ip_configuration_name   = each.value.nic_ip_config_name
  backend_address_pool_id = var.backend_pool_id
}
