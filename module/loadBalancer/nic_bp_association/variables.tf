variable "nic_bp_association" {
  type = map(object({
    nic_name           = string
    nic_ip_config_name = string
  }))
}

variable "nic_ids" {
  type = map(string)
}

variable "backend_pool_id" {
  type = string
}

