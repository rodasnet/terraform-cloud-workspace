module "TeamAccess-Workspace" {
  source          = "../archive/workspaces-only"
  
  organization                  = var.organization
  name                          = "TeamAccess-Workspace"
  description                   = "Terraform workspace with Team Acess configurations"
 
  team_access = {
    # "DosNotExist1"     = "read"
    # "DosNotExist2"       = "write"
    # "ConsultingCo"     = "read"
    # "SecondTeam"       = "write"
  }
}
