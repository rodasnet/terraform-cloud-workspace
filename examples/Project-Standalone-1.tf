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
