
variable "name" {
  type 		= string
}

variable "organization" {
  type 		= string
}

variable "description" {
  type 		= string
  default	= null
}

variable "agent_pool_id" {
  type        	= number
  default	= null
}

variable "allow_destroy_plan" {
  type         	= bool
  default	= false
}

variable "auto_apply" {
  type       	= bool
  default	= false
}

variable "execution_mode" {
  type          = string
  default	= "remote"
}

variable "file_triggers_enabled" {
  type		= bool
  default	= true
}

variable "global_remote_state" {
  type   	= bool
  default	= false
}

variable "remote_state_consumer_ids" {
  type 		= list(string)
  default	= null
}

variable "queue_all_runs" {
  type 		= bool
  default	= true
}

variable "speculative_enabled" {
  type 		= bool
  default	= true
}

variable "structured_run_output_enabled" {
  type 		= bool
  default	= true
}

variable "ssh_key_id" {
  type      	= string
  default	= null
}

variable "terraform_version" {
  type		= string
  default	= null
}

variable "trigger_prefixes" {
  type		= list(string)
  default	= null
}

variable "tag_names" {
  type		= list(string)
  default	= null
}

variable "working_directory" {
  type          = string
  default	= null
}

variable "vcs_repo_identifier" {
  type		= string
}

variable "vcs_repo_branch" {
  type		= string
  default	= null
}

variable "vcs_repo_ingress_submodules" {
  type		= bool
  default	= false
}

variable "vcs_repo_oauth_token_id" {
  type		= string
}

