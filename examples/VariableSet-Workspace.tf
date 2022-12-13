module "VariableSet-Workspace" {
  source          = "../"
  
  organization                  = var.organization
  name                          = "VariableSet-Workspace"
  description                   = "Terraform workspace with Variable Set configurations"
 
  variable_set_names = [
    "my-aws-creds",
    "tfe-api-token"
  ]
}
