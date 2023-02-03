module "Demo-Workspace-All-Options" {
  source          = "../"
  
  organization                  = var.organization
  name                          = "Demo-Workspace-All-Options"
  description                   = "Terraform workspace with all option configurations"

  # Note: Terraform Cloud Agents are a paid feature, available as part of the Terraform Cloud for Business upgrade package.
  # agent_pool_id                   = tfe_agent_pool.test-agent-pool.id
  allow_destroy_plan              = false
  auto_apply                      = true
  execution_mode                  = "remote"
  assessments_enabled             = true
  file_triggers_enabled           = true # 'trigger_patterns' cannot be populated when 'file_triggers_enabled' is set to false.
  global_remote_state             = false
  remote_state_consumer_ids       = values(data.tfe_workspace_ids.example.ids)
  queue_all_runs                  = true
  speculative_enabled             = false
  structured_run_output_enabled   = false
  # Must provide SSH key in varialbe
  # ssh_key_id                      = tfe_ssh_key.test.id
  additional_tags_list            = ["add", "more", "info", "it"]
  terraform_version               = "1.2.5"
  # trigger_prefixes                = ["terraform/modules/*"] # Conflicts with trigger_patterns
  trigger_patterns                = ["modules/web"]    # Conflicts with trigger_prefixes
  working_directory               = "some/path"

  vcs_repo = {
      identifier      = "rodasnet/optimalstop-secretary"
      branch          = "feature-branch"
      oauth_token_id  = var.github_oauth_token_id
    }
  
  team_access = {
    "ConsultingCo"     = "read"
    "SecondTeam"       = "write"
  }
# module.Demo-Workspace-All-Options.variable_set_names
  variable_set_names = [
    "my-aws-creds",
    "tfe-api-token"
  ]
}

# variable "ssh_key_id" {
#   type = string
# }

# Must provide SSH key in varialbe
# resource "tfe_ssh_key" "test" {
#   name         = "tf-test-ssh-key-name"
#   organization = var.organization
#   key          = var.ssh_key_id
# }

# Note: Terraform Cloud Agents are a paid feature, available as part of the Terraform Cloud for Business upgrade package.
# resource "tfe_agent_pool" "test-agent-pool" {
#   name         = "my-agent-pool-name"
#   organization = var.global_settings.organization
# }

data "tfe_workspace_ids" "example" {
  names = ["Simple-Workspace", "VCS-Workspace"]
  organization = var.organization
}
