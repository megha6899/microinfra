
# Create SQL Server using secrets
resource "azurerm_mssql_server" "sql" {
  for_each = var.server

  name                         = each.value.sql_server_name
  resource_group_name           = each.value.rg_name
  location                      = each.value.location
  version                       = each.value.version
   administrator_login      = each.value.admin_username
  administrator_login_password = each.value.admin_password

 
}

