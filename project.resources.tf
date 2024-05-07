
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

  for_each = toset(keys({ for k,v in local.project_policy_sets: k => v }))

  name                = local.project_policy_sets[each.key].name
  description         = local.project_policy_sets[each.key].description
  global              = local.project_policy_sets[each.key].global
  kind                = local.project_policy_sets[each.key].kind
  agent_enabled       = local.project_policy_sets[each.key].agent_enabled
  policy_tool_version = local.project_policy_sets[each.key].policy_tool_version
  overridable         = local.project_policy_sets[each.key].overridable
  organization        = try(local.project_policy_sets[each.key].organization, null) != null ? local.project_policy_sets[each.key].organization : var.project_definition.organization
  policies_path       = local.project_policy_sets[each.key].policies_path
  policy_ids          = local.project_policy_sets[each.key].policy_ids
  dynamic "vcs_repo" {
    for_each = local.project_policy_sets[each.key].vcs_repo != null ? [1] : []

    content {
      identifier                 = local.project_policy_sets[each.key].vcs_repo.identifier
      branch                     = local.project_policy_sets[each.key].vcs_repo.branch
      ingress_submodules         = local.project_policy_sets[each.key].vcs_repo.ingress_submodules
      oauth_token_id             = local.project_policy_sets[each.key].vcs_repo.oauth_token_id
      github_app_installation_id = local.project_policy_sets[each.key].vcs_repo.github_app_installation_id
    }
  }
  workspace_ids = local.project_policy_sets[each.key].workspace_ids
  slug          = local.project_policy_sets[each.key].slug
}

output "policy_sets" {
  value = tfe_policy_set.policy_set
}

resource "tfe_project_policy_set" "created" {

  for_each = tfe_policy_set.policy_set

  policy_set_id = each.value.id
  project_id    = tfe_project.project[0].id
}

locals {
  project_policy_set_links = var.project_definition != null && try(var.project_definition.policy_set_links, null) != null ? var.project_definition.policy_set_links : toset([])
}
resource "tfe_project_policy_set" "linked" {

  for_each = { for k,v in local.project_policy_set_links: k => v }

  policy_set_id = each.value.policy_set_id
  # for_each = toset(keys({ for k,v in local.project_policy_set_links: k => v }))

  # policy_set_id = local.project_policy_set_links[each.value]["policy_set_id"]
  project_id    = tfe_project.project[0].id
}
