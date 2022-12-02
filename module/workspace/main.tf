resource "tfe_workspace" "workspace" {
  organization = var.global_settings.organization
  name         = var.workspace_settings.workspace_name
  description  = var.workspace_settings.description

  agent_pool_id                 = var.workspace_settings.agent_pool_id
  allow_destroy_plan            = var.workspace_settings.allow_destroy_plan
  auto_apply                    = var.workspace_settings.auto_apply
  execution_mode                = var.workspace_settings.execution_mode
  assessments_enabled           = var.workspace_settings.assessments_enabled
  file_triggers_enabled         = var.workspace_settings.file_triggers_enabled
  global_remote_state           = var.workspace_settings.global_remote_state
  remote_state_consumer_ids     = var.workspace_settings.remote_state_consumer_ids
  queue_all_runs                = var.workspace_settings.queue_all_runs
  speculative_enabled           = var.workspace_settings.speculative_enabled
  structured_run_output_enabled = var.workspace_settings.structured_run_output_enabled
  ssh_key_id                    = var.workspace_settings.ssh_key_id
  tag_names                     = var.workspace_settings.tag_names
  terraform_version             = var.workspace_settings.terraform_version
  trigger_prefixes              = var.workspace_settings.trigger_prefixes
  trigger_patterns              = var.workspace_settings.trigger_patterns
  working_directory             = var.workspace_settings.working_directory

  dynamic "vcs_repo" {
    for_each = var.workspace_settings.vcs != null ? [1] : []
    content {
      identifier     = "${var.global_settings.organization}/${var.workspace_settings.vcs.repo_name}"
      oauth_token_id = var.workspace_settings.vcs.oauth_token_id
      branch         = var.workspace_settings.vcs.branch
    }
  }

  force_delete                  = var.workspace_settings.force_delete
}

resource "tfe_variable" "sensitive" {
  for_each = var.tfe_variable_sensitive_map

  key          = each.key
  value        = each.value
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "public" {
  for_each = var.tfe_variable_public_map

  key          = each.key
  value        = each.value
  category     = "env"
  sensitive    = false
  workspace_id = tfe_workspace.workspace.id
}
