data "azurerm_client_config" "current" {}

# -----------------------------
# 1️⃣ Key Vault Resource
# -----------------------------
resource "azurerm_key_vault" "kv" {
  for_each                    = var.key_vault
  name                        = each.value.kv_name
  location                    = each.value.location
  resource_group_name         = each.value.rg_name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled
  sku_name                    = each.value.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = ["Get"]

    secret_permissions = [
      "Backup",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Set"
    ]

    storage_permissions = ["Get"]
  }

  tags = each.value.tags
}

# -----------------------------
# 2️⃣ Key Vault Secrets
# -----------------------------
resource "azurerm_key_vault_secret" "secrets" {
  # ✅ FIX: unwrap sensitive variable for looping
  for_each     = nonsensitive(var.secrets)

  name         = each.value.name
  value        = each.value.value

  # ✅ FIX: all secrets go inside first (or only) Key Vault
  key_vault_id = values(azurerm_key_vault.kv)[0].id
}
