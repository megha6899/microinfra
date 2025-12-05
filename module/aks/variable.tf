# AKS Clusters
variable "aks" {
  type = map(object({
    name       = string
    location   = string
    resource_group_name    = string
    dns_prefix = string
    size       = string
    acr_name   = string
  }))
}

# ACR IDs (for role assignment)
variable "acr_id" {
  type = map(string)
}
