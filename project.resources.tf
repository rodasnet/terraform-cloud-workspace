
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

  count         = length(tfe_policy_set.policy_set)
  policy_set_id = tfe_policy_set.policy_set[count.index].id
  project_id    = tfe_project.project[0].id
}

resource "tfe_project_policy_set" "linked" {

  count = try(var.project_definition, null) != null && try(var.project_definition.policy_set_links, null) != null ? length(var.project_definition.policy_set_links) : 0

  policy_set_id = var.project_definition.policy_set_links[count.index].policy_set_id
  project_id    = tfe_project.project[0].id
}

# resource "tfe_project_variable_set" "project_variable_set" {

#   count = length(var.project_variable_set_list)

#   variable_set_id = var.project_variable_set_list[count.index].variable_set_id
#   project_id      = var.project_variable_set_list[count.index].project_id
# }

# variable "project_variable_set_list" {
#   type = list(object({
#     variable_set_id = string
#     project_id      = string
#   }))
#   default = []
# }

# resource "tfe_team_project_access" "project_access" {
#   count = length(var.project_access)

#   access     = var.project_access[count.index].access
#   team_id    = var.project_access[count.index].team_id
#   project_id = var.project_access[count.index].project_id
# }

# variable "project_access" {
#   type = list(object({
#     access     = string
#     team_id    = string
#     project_id = string
#   }))
#   default = []
# }

