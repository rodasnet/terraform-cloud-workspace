module "aws-acct-dev-02" {
  source = "./module/workspace"

  # workspace_settings = var.my-workspace_settings
  workspace_settings = {
    organization        = "rodasnet"
    description         = "Second something really special"
    repo_name           = "terraform-rodasnet.com"
    workspace_name      = "aws-acct-dev-02"
  }
}

# variable "my-workspace_settings" {
#   # type = object({
#   #   organization    = optional(string)
#   #   workspace_name  = optional(string)
#   #   repo_name       = optional(string)
#   #   description     = optional(string)
#   # })

#   default = {
#     organization        = "rodasnet"
#     description         = "Second something really special"
#     repo_name           = "terraform-rodasnet.com"
#     workspace_name      = "aws-acct-dev-02"
#   }
# }
