resource "aws_ssm_parameter" "roboshop_vpc_id" {
  name  = "/terraform/roboshop/01-vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
}