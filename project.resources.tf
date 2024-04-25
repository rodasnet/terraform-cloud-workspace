
resource "tfe_project" "project" {

  count = var.project_definition != null ? 1 : 0

  organization = var.project_definition.organization
  name         = var.project_definition.name
}

resource "tfe_policy_set" "policy_set" {

  count = try(var.project_definition, null) != null && try(var.project_definition.policy_sets, null) != null ? length(var.project_definition.policy_sets) : 0

  name = var.project_definition.policy_sets[count.index].name
  description         = var.project_definition.policy_sets[count.index].description
  global              = var.project_definition.policy_sets[count.index].global
  kind                = var.project_definition.policy_sets[count.index].kind
  agent_enabled       = var.project_definition.policy_sets[count.index].agent_enabled
  policy_tool_version = var.project_definition.policy_sets[count.index].policy_tool_version
  overridable         = var.project_definition.policy_sets[count.index].overridable
  organization        = try(var.project_definition.policy_sets[count.index].organization, null) != null ? var.project_definition.policy_sets[count.index].organization : var.project_definition.organization
  policies_path       = var.project_definition.policy_sets[count.index].policies_path
  policy_ids          = var.project_definition.policy_sets[count.index].policy_ids
  dynamic "vcs_repo" {
    for_each = var.project_definition.policy_sets[count.index].vcs_repo != null ? [1] : []
    content {
      identifier                 = var.project_definition.policy_sets[count.index].identifier
      branch                     = var.project_definition.policy_sets[count.index].branch
      ingress_submodules         = var.project_definition.policy_sets[count.index].ingress_submodules
      oauth_token_id             = var.project_definition.policy_sets[count.index].oauth_token_id
      github_app_installation_id = var.project_definition.policy_sets[count.index].github_app_installation_id
    }
  }
  workspace_ids = var.project_definition.policy_sets[count.index].workspace_ids
  slug          = var.project_definition.policy_sets[count.index].slug
}

# resource "tfe_project_policy_set" "created" {

#   count = length(var.project_definition.*.policy_set_list)

#   policy_set_id = tfe_policy_set.policy_set[count.index].policy_set_id
#   project_id    = var.project_definition.*.policy_set_list[count.index].project_id
# }

# resource "tfe_project_policy_set" "linked" {

#   count         = length(var.link_project_policy_set_list)
#   policy_set_id = var.link_project_policy_set_list[count.index].policy_set_id
#   project_id    = var.link_project_policy_set_list[count.index].project_id
# }

# variable "link_project_policy_set_list" {
#   type = list(object({
#     policy_set_id = string
#     project_id    = string
#   }))

#   default = []
# }

# variable "create_new_policy_set_list" {
#   type = list(object({
#     policy_set = object({
#       name                = string
#       description         = optional(string)
#       global              = optional(string)
#       kind                = optional(string)
#       agent_enabled       = optional(string)
#       policy_tool_version = optional(string)
#       overridable         = optional(bool)
#       organization        = optional(string)
#       policies_path       = optional(string)
#       policy_ids          = optional(list(string))
#       vcs_repo = optional(object({
#         identifier                 = optional(string)
#         branch                     = optional(string)
#         ingress_submodules         = optional(bool)
#         oauth_token_id             = optional(string)
#         github_app_installation_id = optional(string)
#       }))
#       workspace_ids = optional(list(string))
#       slug          = optional(map(string))

#     })
#     project_id = optional(string)
#   }))

#   default = []
# }

# variable "project_policy_set_list" {
#   type = list(object({
#     policy_set_id = string
#     project_id    = string
#   }))

#   default = []
# }

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

# count = length(var.project_definition[*].policy_set_list)
# count = length(flatten(var.project_definition.*.policy_set_list))
# count = length(flatten(var.project_definition[*].policy_set_list))
# count = length(flatten(local.create_policy_set_list))
# count = length(local.create_policy_set_list)
# count = length(var.project_definition.*.policy_set_list)
# for_each =  var.project_definition.*.policy_set_list
