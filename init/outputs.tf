output "github_repo_full_name" {
  value = module.gh_repo.full_name
}

output "github_repo_ssh_clone_url" {
  value = module.gh_repo.ssh_clone_url
}

output "github_repo_branches" {
  value = module.gh_repo.branches
}

output "tfc_workspace_id" {
  value = module.tfc_workspace.workspace_id
}
