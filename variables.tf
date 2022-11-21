// Need for TFE provider configuration
variable "tf_token" {
  type      = string
  sensitive = true
    default = null
}

variable "workspace_settings" {
  type = object({
    organization    = optional(string)
    workspace_name  = optional(string)
    repo_name       = optional(string)
    description     = optional(string)
  })
}
