
module "rg" {
  source = "../../module/rg"
  rg     = var.rg
}


module "sql" {
  source     = "../../module/sql"
  depends_on = [module.rg]
  server     = var.server
}

module "db" {
  source     = "../../module/db"
  depends_on = [module.sql]
  db         = var.db
  server_ids = module.sql.server_ids
}


module "acr" {
  depends_on = [module.rg]
  source     = "../../module/acr"
  acr        = var.acr
}

module "aks" {
  depends_on = [module.rg, module.acr]
  source     = "../../module/aks"
  aks        = var.aks
  acr_id     = module.acr.acr_id
}
