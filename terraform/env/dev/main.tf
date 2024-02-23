
module "embedding_rds" {
  source                 = "./RDS"
  environment            = var.environment
  db_subnet_group_name   = var.rds_subnet_group_name
  vpc_security_group_ids = var.rds_security_group_ids
}

module "common" {
  source = ""
  
}