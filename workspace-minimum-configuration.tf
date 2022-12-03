module "workspace-minimum-configuration" {
  source          = "./module/workspace"
  global_settings = var.global_settings

  my_description = "A new description ."

  workspace_settings = {
    workspace_name = "workspace-minimum-configuration"
    description    = "Second something really special"
  }
}

