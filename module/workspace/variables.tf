variable "tf_token" { // Required
  type      = string
  sensitive = true
}

variable "oauth_token" { // Required
  type      = string
  sensitive = true
}

variable "workspace_name" { // Required
  type = string
}

variable "organization" { // Required
  type = string
}

variable "repo_name" { // Required
  type = string
}

// Optional variables

variable "branch_name" {
  type      = string
  default   = null
}

variable "description" {
  type    = string
  default = ""
}

variable "auto_apply" {
  type  = bool
  default = null // fales
}

variable "file_triggers_enabled" {
  type  = bool
  default = null // true
}

variable "allow_destroy_plan" {
  type  = bool
  default = null  // true
}

variable "ssh_key_id" {
  description = "(Optional) The ID of an SSH key to assign to the workspace."
  default     = null
}

// Default valued variables
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
