
output "github_repository" {
  description               = "raw map of the github repositories managed"
  value                     = module.github_repository
}

output "github_repo_full_name" {
  value = module.github_repository.full_name
}

output "github_repo_ssh_clone_url" {
  value = module.github_repository.ssh_clone_url
}

output "github_repo_branches" {
  value = module.github_repository.branches
}
