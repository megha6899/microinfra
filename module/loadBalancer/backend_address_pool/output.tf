output "backend_pool_id" {
  value = values(azurerm_lb_backend_address_pool.backend_pool)[0].id
}

