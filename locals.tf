locals {
  default_tags = {
    Terraform = "TfcManagedWorkspace"
  }

  tags_merged = concat(
    values(default_tags), 
    var.tag_names
    )
}
