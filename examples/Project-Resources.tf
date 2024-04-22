module "Project-Standalone-1" {
  source          = "../"

  create_workspace = false

   project_list = [
    {
      organization = var.organization
      name = "MyFirstTfcProject1"
    }
   ]
}

module "Project-PolicySet-1" {
  source          = "../"

  create_workspace = false

   project_list = [
    {
      organization = var.organization
      name = "Project-PolicySet-1"
    }
   ]

  #  project_policy_set_list = [
  #   {
  #     policy_set_id
  #     project_id
  #   }
  #  ]
}
