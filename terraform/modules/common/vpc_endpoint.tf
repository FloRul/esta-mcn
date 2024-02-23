

resource "aws_vpc_endpoint" "s3_vpce" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = module.vpc.public_route_table_ids
}

resource "aws_vpc_endpoint" "dynamo_db_vpce" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = module.vpc.public_route_table_ids
}

resource "aws_vpc_endpoint" "kms_vpce" {
  vpc_id              = module.vpc.vpc_id
  service_name        = "com.amazonaws.${var.region}.secretsmanager"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.sm_sg.id]
  subnet_ids          = module.vpc.public_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "bedrock_vpce" {
  vpc_id              = module.vpc.vpc_id
  service_name        = "com.amazonaws.${var.region}.bedrock-runtime"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.bedrock_sg.id]
  subnet_ids          = module.vpc.public_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "lambda_vpce" {
  vpc_id              = module.vpc.vpc_id
  service_name        = "com.amazonaws.${var.region}.lambda"
  vpc_endpoint_type   = "Interface"
  security_group_ids  = [aws_security_group.lambda_egress_all_sg.id]
  subnet_ids          = module.vpc.public_subnets
  private_dns_enabled = true
}
