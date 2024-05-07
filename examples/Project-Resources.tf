module "Project-Team-Creation" {
  source = "../"

  project_definition = {
    organization = var.organization
    name         = "Project-Team-Creation"
    description = "Test Project-Team-Creation."

    # teams = [
    #   {
    #     name = "team1"
    #     access = "admin"
    #   },
    #   {
    #     name = "team2"
    #     access = "maintain"
    #   },
    #   {
    #     name = "team3"
    #     access = "write"
    #   },
    #   {
    #     name = "team4"
    #     access = "read"
    #   },
    #   {
    #     name = "team5"
    #     access = "custom"
    #   },
    # ]
  }
}

module "Project-Standalone-1" {
  source = "../"

  project_definition = {
    organization = var.organization
    name         = "MyFirstTfcProject1"
    description = "The first TFC sample project."
  }
}

module "Project-Workspace-Link" {
  source = "../"

  project_definition = {
    organization = var.organization
    name         = "Project-Workspace-Link"
    description = "TFC project to be linked to a workspace."
  }
}

module "Project-PolicySet-Link" {
  source = "../"

  project_definition = {
    organization = var.organization
    name         = "Project-PolicySet-Link"
    policy_set_links = [
      {
        policy_set_id = module.Project-PolicySet-1.policy_sets[0].id
      }
    ]
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
        # TODO: Test remaining 
        # description         = "value"
        # global              = "value"
        # kind                = "value"
        # agent_enabled       = "value"
        # policy_tool_version = "value"
        # overridable         = "value"
        # Organization is overridable in the policy set configuration
        # organization = "<A Different Organization>"
        # policies_path       = "value"
        # policy_ids          = "value"
        # Requires license
        # vcs_repo = {
        #   identifier     = "rodasnet/optimalstop-secretary"
        #   branch         = "feature-branch"
        #   oauth_token_id = var.github_oauth_token_id
        # }
        # workspace_ids = "value"
        # slug          = "value"
      }
      # Example of creating a second policy for the project
      # The organization has reached the limit of 1 policy set
      # ,
      # {
      #   name = "Project-PolicySet-Second"
      # }
    ]
  }
}

module "Project-Test-1" {
  source = "../"

  project_definition = {
    organization = var.organization
    name         = "Project-Test-1"
    description = "The test TFC sample project."
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
