

resource "tfe_workspace" "workspace" {
  name					                  = var.name
  organization				            = var.organization
  description				              = var.description
  agent_pool_id				            = var.agent_pool_id
  allow_destroy_plan			        = var.allow_destroy_plan
  auto_apply				              = var.auto_apply
  execution_mode			            = var.execution_mode
  file_triggers_enabled		        = var.file_triggers_enabled
  global_remote_state			        = var.global_remote_state
  remote_state_consumer_ids		    = var.remote_state_consumer_ids
  queue_all_runs			            = var.queue_all_runs
  speculative_enabled			        = var.speculative_enabled
  structured_run_output_enabled		= var.structured_run_output_enabled
  ssh_key_id				              = var.ssh_key_id
  terraform_version			          = var.terraform_version
  trigger_prefixes			          = var.trigger_prefixes
  tag_names				                = var.tag_names
  working_directory			          = var.working_directory

  vcs_repo {
    identifier			      = var.vcs_repo_identifier
    branch			          = var.vcs_repo_branch
    ingress_submodules		= var.vcs_repo_ingress_submodules
    oauth_token_id		    = var.vcs_repo_oauth_token_id
  }
}

output "workspace_id" {
  value                   = tfe_workspace.workspace.id
}

