module "workspace-with-all-options" {
  source          = "./module/workspace"
  global_settings = var.global_settings

  workspace_settings = {
    workspace_name                  = "workspace-with-all-options"
    description                     = "TFE Workspace module with all options"
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
    # working_directory               = ""
  }
  
  tfe_variable_public_map = {
    LOCATION    = "West Coast"
    TIER        = "Premium"
    ENV_VARIABLE_3 = "Value Number 3"
  }

  # depends_on = [
  #   tfe_agent_pool.test-agent-pool
  # ]
}

variable "ssh_key_id" {
  type = string
}

resource "tfe_ssh_key" "test" {
  name         = "tf-test-ssh-key-name"
  organization = var.global_settings.organization
  key          = var.ssh_key_id
}

# Note: Terraform Cloud Agents are a paid feature, available as part of the Terraform Cloud for Business upgrade package.
# resource "tfe_agent_pool" "test-agent-pool" {
#   name         = "my-agent-pool-name"
#   organization = var.global_settings.organization
# }
