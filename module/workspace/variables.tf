variable "organization" { 
  type = string
}

variable "workspace_name" {
  type = string
}

variable "oauth_token" {
  type      = string
  sensitive = true
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
