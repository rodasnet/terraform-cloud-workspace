#------------------------------------------------------------------------------
# Team Access
#------------------------------------------------------------------------------
variable "team_access" {
  type        = map(string)
  description = "Map of existing Team(s) and built-in permissions to grant on Workspace."
  default     = {}
}

variable "custom_team_access" {
  type = map(
    object(
      {
        runs              = string
        variables         = string
        state_versions    = string
        sentinel_mocks    = string
        workspace_locking = bool
        run_tasks         = bool
      }
    )
  )
  description = "Map of existing Team(s) and custom permissions to grant on Workspace. If used, all keys in the object must be specified."
  default     = {}
}

#------------------------------------------------------------------------------
# Workspace Variable Sets
#------------------------------------------------------------------------------

