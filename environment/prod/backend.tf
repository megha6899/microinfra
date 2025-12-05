terraform {
  backend "azurerm" {
    resource_group_name  = "staterg"
    storage_account_name = "statestg030"
    container_name       = "statecon030"
    key                  = "prod.terraform.tfstate"
    access_key = "TCglQLOPtYJ9ZAq1TyjLMUbCc9B+SH9Iz1WWBdYmN8YsB0hfMmvcxkh3H4JySQ2HM/79DtudAqa6+AStmrnKvw=="
    
  }
}


 