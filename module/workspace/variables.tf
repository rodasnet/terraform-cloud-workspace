variable "organization" { 
  type = string
}

variable "workspace_name" {
  type = string
}

variable "repo_name" {
  type = string
}

variable "oauth_token" {
  type      = string
  sensitive = true
}

variable "description" {
  type    = string
  default = ""
}

variable "branch" {
  type      = string
  default   = null
  description = "(Optional) The repository branch that Terraform will execute from. This defaults to the repository's default branch (e.g. main)."
}

variable "tfe_variable_sensitive_map" {
  type = map
  sensitive = true
  default = {}
  description = "A map of sensitive variable to add as environment variables to the TFC workspace"
}

variable "tfe_variable_public_map" {
  type = map
  default = {}
  description = "A map of public variable to add as environment variables to the TFC workspace"
}


variable "auto_apply" {
  type  = bool
  default = null
}

variable "file_triggers_enabled" {
  type  = bool
  default = null
}

variable "allow_destroy_plan" {
  type  = bool
  default = null
}

variable "ssh_key_id" {
  description = "(Optional) The ID of an SSH key to assign to the workspace."
  default     = null
}

variable "oauth_api_url" {
  type    = string
  default = "https://api.github.com"
}

variable "oauth_http_url" {
  type    = string
  default = "https://github.com"
}

variable "oauth_service_provider" {
  type    = string
  default = "github"
}
