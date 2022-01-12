terraform {
  experiments = [module_variable_optional_attrs]

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  
  tfe = {
      version = "~> 0.27.0"
    }
  }
}

provider "github" {
  # GITHUB_OWNER
  owner = "library-ucsb"
}
provider "tfe" {}
