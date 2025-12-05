variable "vm" {
  description = "Map of VM configurations"
  type = map(object({
    vm_name   = string
    rg_name   = string
    location  = string
    size      = string
    nic_name  = string
    pip_name  = optional(string)
    subnet_name = string
    vnet_name   = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
      custom_data = optional(string)
    })
    tags = optional(map(string), {})
    admin_username = optional(string)
    admin_password = optional(string)
  }))
}

variable "kv_name" {
  type        = string
  description = "Key Vault name for fetching secrets"
}

variable "kv_rg_name" {
  type        = string
  description = "Resource Group name of Key Vault"
}

variable "secrets" {
  description = "Map of Key Vault secrets"
  type = map(object({
    name  = string
    value = string
  }))
  default = {}
}
