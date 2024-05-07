
resource "tfe_project" "project" {

  count = var.project_definition != null ? 1 : 0

  organization = var.project_definition.organization
  name         = var.project_definition.name
  description  = var.project_definition.description
}

output "project_id" {
  value = try(tfe_project.project, null) != null && try(tfe_project.project[0], null) != null ? tfe_project.project[0].id : null
}
locals {
  project_policy_sets = var.project_definition != null && try(var.project_definition.policy_sets, null) != null ? var.project_definition.policy_sets : toset([])
}
resource "tfe_policy_set" "policy_set" {

  for_each = { for k,v in local.project_policy_sets: k => v }

  name                = each.value.name
  description         = each.value.description
  global              = each.value.global
  kind                = each.value.kind
  agent_enabled       = each.value.agent_enabled
  policy_tool_version = each.value.policy_tool_version
  overridable         = each.value.overridable
  organization        = try(each.value.organization, null) != null ? each.value.organization : var.project_definition.organization
  policies_path       = each.value.policies_path
  policy_ids          = each.value.policy_ids
  dynamic "vcs_repo" {
    for_each = each.value.vcs_repo != null ? [1] : []

    content {
      identifier                 = each.value.vcs_repo.identifier
      branch                     = each.value.vcs_repo.branch
      ingress_submodules         = each.value.vcs_repo.ingress_submodules
      oauth_token_id             = each.value.vcs_repo.oauth_token_id
      github_app_installation_id = each.value.vcs_repo.github_app_installation_id
    }
  }
  workspace_ids = each.value.workspace_ids
  slug          = each.value.slug
}

output "policy_sets" {
  value = tfe_policy_set.policy_set
}

resource "tfe_project_policy_set" "created" {

  for_each = tfe_policy_set.policy_set

  policy_set_id = each.value.id
  project_id    = tfe_project.project[0].id
}

# locals {
#   project_policy_set_links = var.project_definition != null && try(var.project_definition.policy_set_links, null) != null ? var.project_definition.policy_set_links : toset([])
# }
resource "tfe_project_policy_set" "linked" {
############################################################################################################
#   https://app.terraform.io/app/rodasnet/workspaces/tf_cloud_workspace/runs/run-bQUjDtztt7U4iv69
#   Error: Invalid for_each argument
# on ../project.resources.tf line 63, in resource "tfe_project_policy_set" "linked":
#   for_each = { for k,v in local.project_policy_set_links: k => v }
# local.project_policy_set_links is a list of object, known only after apply
# The "for_each" map includes keys derived from resource attributes that cannot be determined until apply, 
# and so Terraform cannot determine the full set of keys that will identify the instances of this resource.
#
# When working with unknown values in for_each, it's better to define the map keys statically 
# in your configuration and place apply-time results only in the map values.
#
# Alternatively, you could use the -target planning option to first apply only the resources 
# that the for_each value depends on, and then apply a second time to fully converge.
############################################################################################################
  # for_each = { for k,v in local.project_policy_set_links: k => v }
  for_each = var.project_definition != null && try(var.project_definition.policy_set_links, null) != null ? var.project_definition.policy_set_links : toset([])

  policy_set_id = each.value.policy_set_id
  # for_each = toset(keys({ for k,v in local.project_policy_set_links: k => v }))

  # policy_set_id = local.project_policy_set_links[each.value]["policy_set_id"]
  project_id    = tfe_project.project[0].id
}
