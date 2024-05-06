locals {
  project_teams = var.project_definition != null && try(var.project_definition.teams, null) != null ? var.project_definition.teams : toset([])
}
resource "tfe_team" "project_team" {
  
  for_each = toset(keys({ for k,v in local.project_teams: k => v })) 

  name = local.project_teams[each.value].name
  organization = "rodasnet"
}

resource "tfe_team_project_access" "project_access" {

    for_each = toset(keys({ for k,v in local.project_teams: k => v })) 

    access       = local.project_teams[each.value].access
    team_id      = each.key
    project_id   = tfe_project.project[0].id
}
