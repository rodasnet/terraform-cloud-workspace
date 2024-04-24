
#------------------------------------------------------------------------------
# TFC Project Variables
#------------------------------------------------------------------------------

variable "project_definition" {
  type = object({
    organization = string
    name         = string
    
    workspaces   = optional(list(object({
      name = string
      description = string
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