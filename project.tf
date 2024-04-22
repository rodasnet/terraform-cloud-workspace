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

resource "tfe_project_policy_set" "project_policy_set" {

  count         = length(var.project_policy_set_list)
  policy_set_id = var.project_policy_set_list[count.index].policy_set_id
  project_id    = var.project_policy_set_list[count.index].project_id
}

variable "project_policy_set_list" {
  type = list(object({
    policy_set_id = string
    project_id    = string
  }))

  default = []
}

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
