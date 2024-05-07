locals {
  project_teams = var.project_definition != null && try(var.project_definition.teams, null) != null ? var.project_definition.teams : toset([])
}
resource "tfe_team" "project_team" {
  
  for_each = { for k,v in local.project_teams: k => v }

  name = each.value.name
  organization = "rodasnet"
  visibility = each.value.visibility

  dynamic "organization_access" {
    for_each = each.value.organization_access != null ? [1] : []

    content {
      read_workspaces = each.value.organization_access.read_workspaces
    }
  }
}

resource "tfe_team_project_access" "project_access" {

    for_each = tfe_team.project_team

    access       = local.project_teams[each.key].access
    team_id      = each.value.id
    project_id   = tfe_project.project[0].id
}
