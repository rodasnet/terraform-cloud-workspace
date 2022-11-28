module "workspace-with-variables" {
  source          = "./module/workspace"
  global_settings = var.global_settings

  workspace_settings = {
    workspace_name = "workspace-with-variables"
    description    = "Variables. something really special"
  }
  
  tfe_variable_public_map = {
    LOCATION    = "West Coast"
    TIER        = "Premium"
  }
}
