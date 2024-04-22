module "TFC-Project-Standalone-1" {
  source          = "../"

  create_workspace = false
  
  # organization                  = var.organization
  name                          = "TFC-Project-Standalone-1"
  description                   = "Terraform project with no workspace 1"
  additional_tags_list            = ["who", "wants", "more", "features"]
}
