variable "name" {
  type = string
  description = "(Required) Name of the workspace."
}

variable "organization" {
  type = string
  description = "(Required) Name of the organization."
}

variable "description" {
  type = string
  description = "(Required) A description for the workspace."
}

variable "agent_pool_id" {
  type = string
  default = null
  description = "(Optional) The ID of an agent pool to assign to the workspace. Requires execution_mode to be set to agent. This value must not be provided if execution_mode is set to any other value or if operations is provided."
}

variable "allow_destroy_plan" {
  type = bool
  default = true
  description = "(Optional) Whether destroy plans can be queued on the workspace."
}

variable "auto_apply" {
  type = bool
  default = false
  description = "(Optional) Whether to automatically apply changes when a Terraform plan is successful. Defaults to false."
}

variable "execution_mode" {
  type = string
  default = "remote"
  description = "(Optional) Which execution mode to use. Using Terraform Cloud, valid values are remote, local oragent. Defaults to remote. Using Terraform Enterprise, only remoteand local execution modes are valid. When set to local, the workspace will be used for state storage only. This value must not be provided if operations is provided."
}

variable "assessments_enabled" {
  type = bool
  default = null
  description = "(Optional) Whether to regularly run health assessments such as drift detection on the workspace. Defaults to false."
}

variable "file_triggers_enabled" {
  type = bool
  default = null
  description = "(Optional) Whether to filter runs based on the changed files in a VCS push. Defaults to true. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run."
}

variable "global_remote_state" {
  type = bool
  default = true
  description = "(Optional) Whether the workspace allows all workspaces in the organization to access its state data during runs. If false, then only specifically approved workspaces can access its state (remote_state_consumer_ids)."
}

variable "remote_state_consumer_ids" {
  type = list(string)
  default = null
  description = "(Optional) The set of workspace IDs set as explicit remote state consumers for the given workspace."
}

# variable "project_id" {
#   type = string
#   
#   description = "(Optional) ID of the project where the workspace should be created."
# }

variable "queue_all_runs" {
  type = bool
  default = null
  description = "(Optional) Whether the workspace should start automatically performing runs immediately after its creation. Defaults to true. When set to false, runs triggered by a webhook (such as a commit in VCS) will not be queued until at least one run has been manually queued. Note: This default differs from the Terraform Cloud API default, which is false. The provider uses true as any workspace provisioned with false would need to then have a run manually queued out-of-band before accepting webhooks."
}

variable "speculative_enabled" {
  type = bool
  default = null
  description = "(Optional) Whether this workspace allows speculative plans. Defaults to true. Setting this to false prevents Terraform Cloud or the Terraform Enterprise instance from running plans on pull requests, which can improve security if the VCS repository is public or includes untrusted contributors."
}

variable "structured_run_output_enabled" {
  type = bool
  default = null
  description = "(Optional) Whether this workspace should show output from Terraform runs using the enhanced UI when available. Defaults to true. Setting this to false ensures that all runs in this workspace will display their output as text logs."
}

variable "ssh_key_id" {
  type = string
  default = null
  description = "(Optional) The ID of an SSH key to assign to the workspace."
}

variable "tag_names" {
  type = list(string)
  default = null
  description = "(Optional) A list of tag names for this workspace. Note that tags must only contain lowercase letters, numbers, colons, or hyphens."
}

variable "terraform_version" {
  type = string
  default = null
  description = "(Optional) The version of Terraform to use for this workspace. This can be either an exact version or a version constraint (like ~> 1.0.0); if you specify a constraint, the workspace will always use the newest release that meets that constraint. Defaults to the latest available version."
}

variable "trigger_prefixes" {
  type = list(string)
  default = null
  description = "(Optional) List of repository-root-relative paths which describe all locations to be tracked for changes."
}

variable "trigger_patterns" {
  type = list(string)
  default = null
  description = "(Optional) List of glob patterns that describe the files Terraform Cloud monitors for changes. Trigger patterns are always appended to the root directory of the repository. Mutually exclusive with trigger-prefixes. Only available for Terraform Cloud."
}

variable "working_directory" {
  type = string
  default = null
  description = "(Optional) A relative path that Terraform will execute within. Defaults to the root of your repository."
}

variable "vcs_repo" {
  type = optional(object({
    identifier       = string
    oauth_token_id  = string
    branch          = optional(string)
  }))
  
  description = "(Optional) Settings for the workspace's VCS repository, enabling the UI/VCS-driven run workflow. Omit this argument to utilize the CLI-driven and API-driven workflows, where runs are not driven by webhooks on your VCS provider."
}

variable "tfe_variable_sensitive_map" {
  type        = map(any)
  default     = {}
  description = "A map of sensitive variable to add as environment variables to the TFC workspace"
}

variable "tfe_variable_public_map" {
  type        = map(any)
  default     = {}
  description = "A map of public variable to add as environment variables to the TFC workspace"
}


The vcs_repo block supports:

identifier
branch
ingress_submodules 
oauth_token_id
tags_regex