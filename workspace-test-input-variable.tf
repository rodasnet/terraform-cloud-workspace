module "workspace-test-input-variable" {
  source          = "./module/workspace"
  global_settings = var.global_settings
  
#   my_description = "This is a description" 
  description = "This is a description" 

  workspace_settings = {
    workspace_name    = "workspace-test-input-variable"
    terraform_version = "1.0.0"
  }
}
