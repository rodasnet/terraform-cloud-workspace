variable "workspace_settings" {
  type = object({
    workspace_name  = string
    description     = optional(string)
    vcs             = optional(object({
        repo_name           = string
        oauth_token_id      = string
        branch              = optional(string)
      })
    )
  })
}

variable "global_settings" {
  type = object({
    organization        = string
    oauth_token_id      = optional(string)
  })
}
