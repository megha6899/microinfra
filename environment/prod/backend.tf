terraform {
  backend "azurerm" {
    resource_group_name  = "staterg"
    storage_account_name = "statestg030"
    container_name       = "statecon030"
    key                  = "prod.terraform.tfstate"
   access_key = "TCglQLOPtYJ9ZAq1TyjLMUbCc9B+SH9Iz1WWBdYmN8YsB0hfMmvcxkh3H4JySQ2HM/79DtudAqa6+AStmrnKvw=="
    subscription_id      = "5ed71b72-e131-4c8d-8029-6d14191c6dfe"
  tenant_id = "4616d612-8bc9-4839-bf28-e030beab3250"
  }
}


 
