resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.aks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = each.value.size
  }

  identity {
    type = "SystemAssigned"
  }
}

# ACR Permission Assignment (AKS kubelet → ACR)
resource "azurerm_role_assignment" "aks_acr_pull" {
  for_each = var.aks

  scope                = var.acr_id[each.value.acr_name]  # ACR resource ID
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks[each.key].kubelet_identity[0].object_id

  depends_on = [azurerm_kubernetes_cluster.aks]
}

