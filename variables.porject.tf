
#------------------------------------------------------------------------------
# TFC Project Variables
#------------------------------------------------------------------------------

variable "project_definition" {
  type = object({
    organization = string
    name         = string
    description  = optional(string)

    policy_set_links = optional(list(object({
      policy_set_id = string
      project_id    = optional(string)
    })))

    policy_sets = optional(list(object({
      name                = string
      description         = optional(string)
      global              = optional(string)
      kind                = optional(string)
      agent_enabled       = optional(string)
      policy_tool_version = optional(string)
      overridable         = optional(bool)
      organization        = optional(string)
      policies_path       = optional(string)
      policy_ids          = optional(list(string))
      vcs_repo = optional(object({
        identifier                 = optional(string)
        branch                     = optional(string)
        ingress_submodules         = optional(bool)
        oauth_token_id             = optional(string)
        github_app_installation_id = optional(string)
      }))
      workspace_ids = optional(list(string))
      slug          = optional(map(string))
    })))
  })

  default = null
}

#------------------------------------------------------------------------------
# TFC Workspaces Variables
#------------------------------------------------------------------------------
variable "workspace_definition" {
  type = object({
    organization                  = string
    name                          = string
    description                   = optional(string)
    agent_pool_id                 = optional(string)
    allow_destroy_plan            = optional(string)
    auto_apply                    = optional(string)
    execution_mode                = optional(string)
    assessments_enabled           = optional(string)
    file_triggers_enabled         = optional(string)
    global_remote_state           = optional(string)
    remote_state_consumer_ids     = optional(string)
    project_id                    = optional(string)
    queue_all_runs                = optional(string)
    speculative_enabled           = optional(string)
    structured_run_output_enabled = optional(string)
    ssh_key_id                    = optional(string)
    terraform_version             = optional(string)
    trigger_prefixes              = optional(string)
    trigger_patterns              = optional(string)
    working_directory             = optional(string)
  })

  default = null
}
