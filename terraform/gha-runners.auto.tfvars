github_owner                    = "library-ucsb"
aws_region                      = "us-west-2"

github_repo = {
  auto_init                     = false
  description                   = "IaC for the Ansible deployment"
  name                          = "iac-service-github-action-runners"
  visibility                    = "public"
  has_downloads                 = true
}

# namespace-environment-stage-name-attributes
terraform_s3_backend = {
  namespace                     = "ucsb-library"
  environment                   = "iac-service"
  stage                         = "github-action-runners"
  name                          = "terraform"
  attributes                    = [ "state" ]
}