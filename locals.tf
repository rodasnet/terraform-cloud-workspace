locals {
  default_tags = {
    Terraform = "TfcManagedWorkspace"
  }

  tags_merged = concat(tolist(values(local.default_tags)), tolist(var.tag_names == null ? [] : var.tag_names))
}
