resource "tfe_project" "project" {

  count = length(var.project_list)

  organization = var.project_list[count.index].organization
  name         = var.project_list[count.index].name
}

variable "project_list" {
  type = list(object({
    organization = string
    name         = string
    policy_set_list = optional(list(object({
      name                = string
      description         = optional(string)
      global              = optional(string)
      kind                = optional(string)
      agent_enabled       = optional(string)
      policy_tool_version = optional(string)
      overridable         = optional(bool)
      organization        = optional(string)
      policies_path       = optional(string)
      policy_ids          = optional(list(string))
      vcs_repo = optional(object({
        identifier                 = optional(string)
        branch                     = optional(string)
        ingress_submodules         = optional(bool)
        oauth_token_id             = optional(string)
        github_app_installation_id = optional(string)
      }))
      workspace_ids = optional(list(string))
      slug          = optional(map(string))
    })))
  }))

  default = []
}

locals {
  create_policy_set_list = flatten([for p in var.project_list : (p.policy_set_list != null ? p.policy_set_list : continue )])
}

resource "tfe_policy_set" "policy_set" {

  # count = length(var.project_list[*].policy_set_list)
  # count = length(flatten(var.project_list.*.policy_set_list))
  # count = length(flatten(var.project_list[*].policy_set_list))
  # count = length(flatten(local.create_policy_set_list))
  # count = length(local.create_policy_set_list)
  # count = length(var.project_list.*.policy_set_list)
  # for_each =  var.project_list.*.policy_set_list
  count = length(local.create_policy_set_list)

  # name = each.value.policy_set.name
  # name = local.create_policy_set_list[count.index].name
  name = local.create_policy_set_list[count.index].name

  # name                = var.project_list.*.policy_set_list[count.index].policy_set.name
  # name                = var.project_list.*.policy_set_list[count.index].policy_set.name
  # name                = flatten(var.project_list.*.policy_set_list)[count.index].policy_set.name
  # name                = flatten(var.project_list[*].policy_set_list)[count.index].policy_set.name
  # description         = var.project_list.*.policy_set_list[count.index].policy_set.description
  # global              = var.project_list.*.policy_set_list[count.index].policy_set.global
  # kind                = var.project_list.*.policy_set_list[count.index].policy_set.kind
  # agent_enabled       = var.project_list.*.policy_set_list[count.index].policy_set.agent_enabled
  # policy_tool_version = var.project_list.*.policy_set_list[count.index].policy_set.policy_tool_version
  # overridable         = var.project_list.*.policy_set_list[count.index].policy_set.overridable
  # organization        = var.project_list.*.policy_set_list[count.index].policy_set.organization
  # policies_path       = var.project_list.*.policy_set_list[count.index].policy_set.policies_path
  # policy_ids          = var.project_list.*.policy_set_list[count.index].policy_set.policy_ids
  # dynamic "vcs_repo" {
  #   for_each = var.project_list.*.policy_set_list
  #   content {
  #     identifier                 = var.project_list.*.policy_set_list[count.index].policy_set.vcs_repo.identifier
  #     branch                     = var.project_list.*.policy_set_list[count.index].policy_set.vcs_repo.branch
  #     ingress_submodules         = var.project_list.*.policy_set_list[count.index].policy_set.vcs_repo.ingress_submodules
  #     oauth_token_id             = var.project_list.*.policy_set_list[count.index].policy_set.vcs_repo.oauth_token_id
  #     github_app_installation_id = var.project_list.*.policy_set_list[count.index].policy_set.vcs_repo.github_app_installation_id
  #   }
  # }
  # workspace_ids = var.project_list.*.policy_set_list[count.index].policy_set.workspace_ids
  # slug          = var.project_list.*.policy_set_list[count.index].policy_set.slug
}

# resource "tfe_project_policy_set" "created" {

#   count = length(var.project_list.*.policy_set_list)

#   policy_set_id = tfe_policy_set.policy_set[count.index].policy_set_id
#   project_id    = var.project_list.*.policy_set_list[count.index].project_id
# }

resource "tfe_project_policy_set" "linked" {

  count         = length(var.link_project_policy_set_list)
  policy_set_id = var.link_project_policy_set_list[count.index].policy_set_id
  project_id    = var.link_project_policy_set_list[count.index].project_id
}

variable "link_project_policy_set_list" {
  type = list(object({
    policy_set_id = string
    project_id    = string
  }))

  default = []
}

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

resource "tfe_project_variable_set" "project_variable_set" {

  count = length(var.project_variable_set_list)

  variable_set_id = var.project_variable_set_list[count.index].variable_set_id
  project_id      = var.project_variable_set_list[count.index].project_id
}

variable "project_variable_set_list" {
  type = list(object({
    variable_set_id = string
    project_id      = string
  }))
  default = []
}

resource "tfe_team_project_access" "project_access" {
  count = length(var.project_access)

  access     = var.project_access[count.index].access
  team_id    = var.project_access[count.index].team_id
  project_id = var.project_access[count.index].project_id
}

variable "project_access" {
  type = list(object({
    access     = string
    team_id    = string
    project_id = string
  }))
  default = []
}
