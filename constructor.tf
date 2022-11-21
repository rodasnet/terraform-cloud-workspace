module "constructor" {
  source = "./module/workspace"

  organization      = "rodasnet"
  workspace_name    = "worksace-with-constructor-01"
  repo_name         = "terraform-rodasnet.com"
  oauth_token       = var.github_token == "" ? null : var.github_token
  
  // Optional variable
  branch            = "feature-branch"

#   tfe_variable_sensitive_map = var.sensitives
#   tfe_variable_public_map = var.workspace_vars
}

variable "sensitives" {
  type = map
  default = {
    COLOR = "Magic"
    BANK_ACCOUNT = "292929292993"
  }
}

variable "workspace_vars" {
  type = map
  default = {
    LOCATION = "West Coast"
    TIER = "Premium"
  }
}
