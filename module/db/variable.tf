variable "db" {
  type = map(object({
    sql_db_name  = string
    sku_name     = string
    max_size_gb  = number
    collation    = string
    enclave_type = string
    license_type = string
    tags         = optional(map(string))
  }))
}

variable "server_ids" {
  description = "SQL Server IDs map output from SQL module"
  type        = map(string)
}


