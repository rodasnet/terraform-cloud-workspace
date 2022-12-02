variable "workspace_settings" {
  type = object({
    workspace_name                = string
    description                   = optional(string)
    agent_pool_id                 = optional(string)
    allow_destroy_plan            = optional(bool)
    auto_apply                    = optional(bool)
    execution_mode                = optional(string)
    assessments_enabled           = optional(bool)
    file_triggers_enabled         = optional(bool)
    global_remote_state           = optional(bool)
    remote_state_consumer_ids     = optional(list(string))
    queue_all_runs                = optional(bool)
    speculative_enabled           = optional(bool)
    structured_run_output_enabled = optional(bool)
    ssh_key_id                    = optional(string)
    tag_names                     = optional(list(string))
    terraform_version             = optional(string)
    trigger_prefixes              = optional(list(string))
    trigger_patterns              = optional(list(string))
    working_directory             = optional(string)
    force_delete                  = optional(bool)

    vcs = optional(object({
      repo_name      = string
      oauth_token_id = string
      branch         = optional(string)
      })
    )

    
  })
}

variable "global_settings" {
  type = object({
    organization   = string
    oauth_token_id = optional(string)
  })
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
