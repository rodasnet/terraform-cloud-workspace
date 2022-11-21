module "workspace-constructor" {
  source = "./module/workspace"

  organization      = var.organization
  oauth_token       = var.github_token
  
  workspace_name    = workspace_settings.workspace_name
  repo_name         = workspace_settings.repo_name
  
}

variable "workspace_settings" {
  type = object({
    workspace_name  = string
    repo_name       = string
    description     = string
  })
}
