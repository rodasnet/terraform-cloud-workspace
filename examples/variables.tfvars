storageaccounts = [
    {
      name       = "testbackupstorage11"
      containers = ["logs", "web", "backups"]
    },
    {
      name       = "testbackupstorage12"
      containers = ["logs-1", "web-1"]
    }
  ]

project_list_example = [
    {
      organization = "rodasnet"
      name = "MyFirstTfcProject1"
    }
   ]

project_list_example_policy = [
    {
      organization = "rodasnet"
      name = "MyFirstTfcProject1"
      policy_set_list = [
        {
            name = "MyPolicy"
        }
      ]
    }
   ]