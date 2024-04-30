resource "tfe_team" "project_team" {
  
  count = try(var.project_definition, null) != null && try(var.project_definition.teams, null) != null ? length(var.project_definition.teams) : 0

  name = var.project_definition.teams[count.index].name
  organization = "rodasnet"
}

resource "tfe_team_project_access" "project_access" {

    # count = length(tfe_team.project_team)
    count = try(var.project_definition, null) != null && try(var.project_definition.teams, null) != null ? length(var.project_definition.teams) : 0

    access       = var.project_definition.teams[count.index].access
    team_id      = tfe_team.project_team[count.index].id
    project_id   = tfe_project.project[0].id
}