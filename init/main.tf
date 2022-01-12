locals {
  service_prefix          = "iac-service"
  service_name 			      = "github-action-runners"
  oauth_token_id		      = "ot-GYEisCSeuP8h2z2a"
}

# Create GitHub Repo for this LAMP deployment
module "gh_repo" {
  source           		    = "./modules/github_repo"
  name             		    = "${local.service_prefix}-${local.service_name}"
  has_downloads			      = true
  auto_init               = true
}

# Create TerraForm Cloud Workspace
module "tfc_workspace" {
  source            		  = "./modules/tfc_workspace"
  name		    		        = "service-${local.service_name}"
  organization	    		  = "ucsb-me"
  vcs_repo_identifier		  = module.gh_repo.full_name
  vcs_repo_oauth_token_id = local.oauth_token_id
}
 
