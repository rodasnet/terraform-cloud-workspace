module "Terraform-Aws-S3" {
  source = "../"

  registry_module_definition = {
    identifier     = "rodasnet/terraform-aws-s3"
    oauth_token_id = var.github_oauth_token_id
  }
}
