output "kv_name" {
  value = { for k, v in azurerm_key_vault.kv : k => v.name }
}

output "kv_rg_name" {
  value = { for k, v in azurerm_key_vault.kv : k => v.resource_group_name }
}
