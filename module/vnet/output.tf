output "subnet_ids" {
  value = {
    for vnet_key, vnet in azurerm_virtual_network.virtual_networks :
    vnet_key => [for subnet in vnet.subnet : subnet.id]
  }
}
