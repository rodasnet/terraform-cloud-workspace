module "TeamAccess-Workspace" {
  source          = "../"
  
  organization                  = var.organization
  name                          = "TeamAccess-Workspace"
  description                   = "Terraform workspace with Team Acess configurations"
 
  # team_access = {
  #   "ConsultingCo"     = "read"
  #   "SecondTeam"       = "write"
  # }
}
