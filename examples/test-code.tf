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