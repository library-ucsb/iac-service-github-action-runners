 
module "github_repository" {
  source                    = "github.com/library-ucsb/terraform-tfc-module-github_repository"
    
  name                      = var.github_repo.name
  auto_init                 = var.github_repo.auto_init
  visibility                = var.github_repo.visibility
  description               = var.github_repo.description
  has_downloads             = var.github_repo.has_downloads
}

module "github_branch_protection" {
  source                    = "github.com/library-ucsb/terraform-tfc-module-github_branch_protection"
  repository_id             = module.github_repository.node_id
  enforce_admins            = var.github_repo.enforce_admins
  push_restrictions         = var.github_repo.push_restrictions
  allows_force_pushes       = var.github_repo.allows_force_pushes
}

resource "github_branch_default" "main" {
  repository                = module.github_repository.name
  branch                    = "main"  
}
