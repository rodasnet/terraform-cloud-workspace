module "workspace-with-tf-version" {
  source          = "./module/workspace"
  global_settings = var.global_settings
  
  my_description = "This is a description" 

  workspace_settings = {
    workspace_name    = "workspace-with-tf-version"
    description       = "Fourth something really special"
    terraform_version = "1.0.0"
  }
}
