module "Azure-PoC-Tenant" {
  source          = "../archive/workspaces-only"
  
  organization                  = var.organization
  name                          = "Azure-PoC-Tenant"
  description                   = "Deploy Azure-PoC-Tenant"

  auto_apply                      = true
  assessments_enabled             = true
  speculative_enabled             = false
  structured_run_output_enabled   = true
  additional_tags_list            = ["tenant", "landingzone", "poc"]
  working_directory               = "modules/examples/tenant"

  vcs_repo = {
      identifier      = "rodasnet/terraform-azure-tenant"
      branch          = "main"
      oauth_token_id  = var.github_oauth_token_id
    }
  
  variable_set_names = [
    "Azure PoC Tenant"
  ]
}

