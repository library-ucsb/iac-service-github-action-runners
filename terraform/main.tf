 
module "gh_repo" {
  source                    = "github.com/library-ucsb/terraform-tfc-module-github_repository"
    
  name                      = var.github_repo.name
  auto_init                 = var.github_repo.auto_init
  visibility                = var.github_repo.visibility
  description               = var.github_repo.description
  has_downloads             = var.github_repo.has_downloads
}

output "github_repositories" {
  description               = "raw map of the github repositories managed"
  value                     = module.gh_repo
}