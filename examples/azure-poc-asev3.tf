module "Azure-PoC-ASEv3" {
  source          = "../archive/workspaces-only"
  
  organization                  = var.organization
  name                          = "Azure-PoC-ASEv3"
  description                   = "Deploy App Service Environment V3 in Azure"

  auto_apply                      = true
  assessments_enabled             = true
  speculative_enabled             = false
  structured_run_output_enabled   = false
  additional_tags_list            = ["asev3", "web", "poc"]
  terraform_version               = ">= 0.14.0, < 0.15.0"
  working_directory               = "modules/examples/asev3"

  vcs_repo = {
      identifier      = "rodasnet/terraform-azure-asev3"
      branch          = "main"
      oauth_token_id  = var.github_oauth_token_id
    }
  
  variable_set_names = [
    "Azure Provider PoC ASEv3",
    "tfe-api-token"
  ]
}

