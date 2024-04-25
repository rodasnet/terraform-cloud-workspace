module "Project-Standalone-1" {
  source = "../"

  project_definition = {
    organization = var.organization
    name         = "MyFirstTfcProject1"
  }
}

module "Project-PolicySet-1" {
  source = "../"

  project_definition = {
    organization = var.organization
    name         = "Project-PolicySet-1"
    policy_sets = [
      {
        name = "Project-PolicySet-Example"
        # Organization is overridable in the policy set configuration
        # organization = "<A Different Organization>"
        # Requires lisence
        # vcs_repo = {
        #   identifier     = "rodasnet/optimalstop-secretary"
        #   branch         = "feature-branch"
        #   oauth_token_id = var.github_oauth_token_id
        # }
      }
    ]
  }
}

# START TEST CODE
# variable "the_project" {
#   type = object({
#     organization = string
#     name         = string
#     policy_set_list = optional(list(object({
#       name                = string
#     })))
#   })

#   default = null

#   # default = {
#   #   organization = "rodasnet"
#   #   name = "the_project"
#   #   policy_set_list = [ {
#   #     name = "the_project_policy"
#   #   } ]
#   # }
# }
# END TEST CODE

# resource "tfe_policy_set" "policy_set" {
#   # count = (try(var.the_project, false) && var.the_project.policy_set_list != null) ? length(var.the_project.policy_set_list) : 0
#   count = var.the_project != null && try(var.the_project.policy_set_list, false) ? length(var.the_project.policy_set_list) : 0

#   name = var.the_project.policy_set_list[count.index].name
# }
