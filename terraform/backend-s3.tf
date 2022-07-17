# You cannot create a new backend by simply defining this and then
# immediately proceeding to "terraform apply". The S3 backend must
# be bootstrapped according to the simple yet essential procedure in
# https://github.com/cloudposse/terraform-aws-tfstate-backend#usage
module "terraform_state_backend" {
  source                              = "cloudposse/tfstate-backend/aws"
  namespace                           = var.terraform_s3_backend.namespace
  environment                         = var.terraform_s3_backend.environment
  stage                               = var.terraform_s3_backend.stage
  name                                = var.terraform_s3_backend.name
  attributes                          = var.terraform_s3_backend.attributes

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  #terraform_backend_config_file_path = ""
  #terraform_backend_config_file_name = ""
  force_destroy                      = false
}