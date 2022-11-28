module "workspace-minimum-configuration" {
  source          = "./module/workspace"
  global_settings = var.global_settings

  workspace_settings = {
    workspace_name = "workspace-minimum-configuration"
    description    = "Second something really special"
  }
}

