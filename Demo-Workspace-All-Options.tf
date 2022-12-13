module "Demo-Workspace-All-Options" {
  source          = "./module/workspace"
  
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
  queue_all_runs                  = true
  speculative_enabled             = false
  structured_run_output_enabled   = false
  ssh_key_id                      = tfe_ssh_key.test.id
  tag_names                       = ["tagx", "you", "are", "it"]
  terraform_version               = "1.2.5"
  # trigger_prefixes                = ["terraform/modules/*"] # Conflicts with trigger_patterns
  trigger_patterns                = ["/**/networking/*"]    # Conflicts with trigger_prefixes
  working_directory               = "some/path"

  vcs_repo = {
      identifier      = "rodasnet/terraform-rodasnet.com"
      branch          = "feature-branch"
      oauth_token_id  = tfe_oauth_client.oauth_client.oauth_token_id
    }
}

variable "ssh_key_id" {
  type = string
}

resource "tfe_ssh_key" "test" {
  name         = "tf-test-ssh-key-name"
  organization = var.organization
  key          = var.ssh_key_id
}

