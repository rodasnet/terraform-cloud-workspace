
resource "tfe_workspace" "workspace" {

  count = var.workspace_definition != null ? 1 : 0

  organization = var.workspace_definition.organization
  name         = var.workspace_definition.name
  # description                   = var.description
  # agent_pool_id                 = var.agent_pool_id
  # allow_destroy_plan            = var.allow_destroy_plan
  # auto_apply                    = var.auto_apply
  # execution_mode                = var.execution_mode
  # assessments_enabled           = var.assessments_enabled
  # file_triggers_enabled         = var.file_triggers_enabled
  # global_remote_state           = var.global_remote_state
  # remote_state_consumer_ids     = var.remote_state_consumer_ids
  project_id = var.workspace_definition.project_id
  # queue_all_runs                = var.queue_all_runs
  # speculative_enabled           = var.speculative_enabled
  # structured_run_output_enabled = var.structured_run_output_enabled
  # ssh_key_id                    = var.ssh_key_id
  # tag_names                     = concat(
  #   tolist(setsubtract(var.additional_tags_list,local.tags)),
  #   local.tags
  #   )
  # terraform_version             = var.terraform_version
  # trigger_prefixes              = var.trigger_prefixes
  # trigger_patterns              = var.trigger_patterns
  working_directory = try(var.workspace_definition.working_directory, null)

  # Present -> VCS-driven workspace. Absent -> CLI-driven (unchanged behaviour).
  dynamic "vcs_repo" {
    for_each = try(var.workspace_definition.vcs_repo, null) != null ? [var.workspace_definition.vcs_repo] : []
    content {
      identifier                 = vcs_repo.value.identifier
      branch                     = vcs_repo.value.branch
      ingress_submodules         = vcs_repo.value.ingress_submodules
      oauth_token_id             = vcs_repo.value.oauth_token_id
      github_app_installation_id = vcs_repo.value.github_app_installation_id
      tags_regex                 = vcs_repo.value.tags_regex
    }
  }

}

# resource "tfe_variable" "sensitive" {
#   for_each = var.tfe_variable_sensitive_map

#   key          = each.key
#   value        = each.value
#   category     = "env"
#   sensitive    = true
#   workspace_id = tfe_workspace.workspace[0].id
# }

# resource "tfe_variable" "public" {
#   for_each = var.tfe_variable_public_map

#   key          = each.key
#   value        = each.value
#   category     = "env"
#   sensitive    = false
#   workspace_id = tfe_workspace.workspace[0].id
# }

