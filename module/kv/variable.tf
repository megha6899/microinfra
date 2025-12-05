
variable "key_vault" {
  type = map(object({
    kv_name        = string
    location       = string
    rg_name        = string
    # Optional fields if you want to customize
    enabled_for_disk_encryption = optional(bool, true)
    soft_delete_retention_days  = optional(number, 7)
    purge_protection_enabled    = optional(bool, false)
    sku_name                    = optional(string, "standard")
    tags                        = optional(map(string))
  }))
}
variable "secrets" {
  description = "Map of Key Vault secrets"
  type = map(object({
    name  = string
    value = string
  }))
}


  
