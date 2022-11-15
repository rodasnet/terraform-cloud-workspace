/*
module "aws-acct-dev-02" {
  source = "./module/workspace"

  organization      = var.organization
  workspace_name    = "aws-acct-dev-02"
  repo_name         = "terraform-rodasnet.com"
  oauth_token       = var.github_token
  
  // Optional variable
  branch            = "feature-branch"

  tfe_variable_sensitive_map = var.sensitives
  tfe_variable_public_map = var.workspace_vars
}
*/
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

