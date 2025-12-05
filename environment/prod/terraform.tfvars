# Resource Group
rg = {
  rg1 = {
    name       = "prodrg-01"
    location   = "japan east"
    managed_by = "Terraform"
    tags = {
      env   = "prod"
      owner = "megha"
    }
  }
}

# SQL + DataBase
server = {
  sql1 = {
    sql_server_name = "prodsql0111"
    rg_name         = "prodrg-01"
    location        = "japan east"
    version         = "12.0"
    admin_username     = "sqladmin"
    admin_password  = "prod@123456789!"
    tags = {
      environment = "prod"
      owner       = "megha"
    }
  }
}

db = {
  db1 = {
    sql_db_name  = "prod-sql-01"
    server_ids   = "prod-sql-01"
    sku_name     = "Basic"
    max_size_gb  = 5
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    enclave_type = "Default"
    license_type = "LicenseIncluded"
    tags = {
      environment = "prod"
      owner       = "megha"
    }
  }
}


# Azure Container Registry
acr = {
  acr1 = {
    name                = "prodacr01"
    resource_group_name = "prodrg-01"
    location            = "japan east"
    sku                 = "Premium"
    admin_enabled       = false
  }
}


# AKS Clusters
aks = {
  aks1 = {
    name                = "prodaks01"
    location            = "japan east"
    resource_group_name = "prodrg-01"
    dns_prefix          = "prodaks"
    size                = "Standard_B2s"
    acr_name            = "acr1"   # MUST match the ACR map key
  }
}

