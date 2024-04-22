resource "tfe_project" "project" {

  count         = length(var.project_list)

  organization = var.project_list[count.index].organization
  name         = var.project_list[count.index].name
}

variable "project_list" {
  type = list(object({
    organization = string
    name         = string
  }))

  default = []
}

resource "tfe_policy_set" "policy_set" {

  count = length(var.create_project_policy_set_list)

  name                = var.create_project_policy_set_list[count.index].name
  description         = var.create_project_policy_set_list[count.index].description
  organization        = var.create_project_policy_set_list[count.index].organization
  kind                = var.create_project_policy_set_list[count.index].kind
  agent_enabled       = var.create_project_policy_set_list[count.index].agent_enabled
  policy_tool_version = var.create_project_policy_set_list[count.index].policy_tool_version
  policies_path       = var.create_project_policy_set_list[count.index].policies_path
  workspace_ids       = var.create_project_policy_set_list[count.index].workspace_ids

  # vcs_repo {
  #   identifier         = "my-org-name/my-policy-set-repository"
  #   branch             = "main"
  #   ingress_submodules = false
  #   oauth_token_id     = tfe_oauth_client.test.oauth_token_id
  # }
}

resource "tfe_project_policy_set" "created" {

  count         = length(var.create_project_policy_set_list)

  policy_set_id = tfe_policy_set.policy_set[count.index].policy_set_id
  project_id    = var.create_project_policy_set_list[count.index].project_id
}

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

variable "create_project_policy_set_list" {
  type = list(object({
    policy_set = object({
    name                = string
    description         = optional(string)
    global         = optional(string)
    kind                = optional(string)
    agent_enabled       = optional(string)
    policy_tool_version = optional(string)
    overridable          = optional(bool)
    organization        = optional(string)
    policies_path       = optional(string)
    description         = optional(string)
    description         = optional(string)
    description         = optional(string)
    description         = optional(string)
    workspace_ids       = optional(list(string))
    })
    project_id    = optional(string)
  }))

  default = []
}

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
