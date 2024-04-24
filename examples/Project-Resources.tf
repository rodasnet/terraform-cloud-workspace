module "Project-Standalone-1" {
  source          = "../"

   project_definition = {
      organization = var.organization
      name = "MyFirstTfcProject1"
    }
}

module "Project-PolicySet-1" {
  source          = "../"


   project_definition = {
      organization = var.organization
      name = "Project-PolicySet-1"
      policy_sets = [
        {
          name = "Project-PolicySet-1"
        }
      ]
    }
}

module "Project-PolicySet-Override-Organizaion" {
  source          = "../"


   project_definition = {
      organization = var.organization
      name = "Project-PolicySet-2"
      policy_sets = [
        {
          name = "Project-PolicySet-2"
          organization = "doesnotexist12342"
        }
      ]
    }
}


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
# locals {

# }
# resource "tfe_policy_set" "policy_set" {
#   # count = (try(var.the_project, false) && var.the_project.policy_set_list != null) ? length(var.the_project.policy_set_list) : 0
#   count = var.the_project != null && try(var.the_project.policy_set_list, false) ? length(var.the_project.policy_set_list) : 0

#   name = var.the_project.policy_set_list[count.index].name
# }
