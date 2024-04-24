module "VariableSet-Workspace" {
  source          = "../archive/workspaces-only"
  
  organization                  = var.organization
  name                          = "VariableSet-Workspace"
  description                   = "Terraform workspace with Variable Set configurations"
 
  variable_set_names = [
    "my-aws-creds",
    "tfe-api-token"
  ]

  # tfe_variable_sensitive_map = {
  #   "a_key" = var.another_key
  #   "b_key" = var.something_special
  # }

  # tfe_variable_sensitive_map = {
  #   "a_key" = data.tfe_variable_set.varset_azure_spn.variable_ids 
  # }

  # tfe_variable_public_map = {
  #   "a_key" = data.tfe_variable_set.varset_azure_spn.variable_ids 
  # }
}

variable "another_key" {
  type = string
  default = "AnotherKeyValue"
}

variable "something_special" {
  type = string
  default = "SomethingSpecialValue"
}
