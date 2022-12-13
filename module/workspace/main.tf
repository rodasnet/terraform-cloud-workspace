resource "tfe_workspace" "workspace" {
  organization                  = var.organization
  name                          = var.name
  description                   = var.description
  agent_pool_id                 = var.agent_pool_id
  allow_destroy_plan            = var.allow_destroy_plan
  auto_apply                    = var.auto_apply
  execution_mode                = var.execution_mode
  assessments_enabled           = var.assessments_enabled
  file_triggers_enabled         = var.file_triggers_enabled
  global_remote_state           = var.global_remote_state
  remote_state_consumer_ids     = var.remote_state_consumer_ids
  queue_all_runs                = var.queue_all_runs
  speculative_enabled           = var.speculative_enabled
  structured_run_output_enabled = var.structured_run_output_enabled
  ssh_key_id                    = var.ssh_key_id
  tag_names                     = var.tag_names
  terraform_version             = var.terraform_version
  trigger_prefixes              = var.trigger_prefixes
  trigger_patterns              = var.trigger_patterns
  working_directory             = var.working_directory

  # dynamic "vcs_repo" {
  #   for_each = var.workspace_settings.vcs != null ? [1] : []
  #   content {
  #     identifier     = "${var.global_settings.organization}/${var.workspace_settings.vcs.repo_name}"
  #     oauth_token_id = var.workspace_settings.vcs.oauth_token_id
  #     branch         = var.workspace_settings.vcs.branch
  #   }
  # }
 
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
