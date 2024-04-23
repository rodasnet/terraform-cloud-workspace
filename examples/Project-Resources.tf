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

  #  project_list = [
  #   {
  #     organization = var.organization
  #     name = "Project-PolicySet-1"

  #   }
  #  ]


}

variable "storageaccounts" {
  default = []
  type = list(object({
    name       = string
    containers = list(string)
  }))
}

resource "null_resource" "cluster" {
  count = length(flatten(var.storageaccounts.*.containers))
  provisioner "local-exec" {
    command = "echo ${flatten(var.storageaccounts.*.containers)[count.index]}"
  }
}

