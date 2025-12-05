resource "azurerm_mssql_database" "sql_db" {
  for_each     = var.db
  name         = each.value.sql_db_name
  server_id    = var.server_ids["sql1"]
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = each.value.max_size_gb
  sku_name     = "S0"
  enclave_type = "VBS"
  tags         = each.value.tags
}

