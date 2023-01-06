// Need for TFE provider configuration
variable "tf_token" {
  type      = string
  sensitive = true
  default   = null
}

variable "github_token" {
  type      = string
  sensitive = true
}

# variable "github_oauth_client" {
#   type = map(any)
#   default = {
#     api_url          = "https://api.github.com"
#     http_url         = "https://github.com"
#     service_provider = "github"
#   }
# }

variable "organization" {
  type = string
  default = "rodasnet"
}

 variable "github_oauth_token_id" {
   type = string
   default = "ot-fDGBsomaKMQj6WkL"
 }
  
