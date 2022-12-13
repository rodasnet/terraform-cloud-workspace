## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.38.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.public](https://registry.terraform.io/providers/hashicorp/tfe/0.38.0/docs/resources/variable) | resource |
| [tfe_variable.sensitive](https://registry.terraform.io/providers/hashicorp/tfe/0.38.0/docs/resources/variable) | resource |
| [tfe_workspace.workspace](https://registry.terraform.io/providers/hashicorp/tfe/0.38.0/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | <pre>object({<br>    organization   = string<br>    oauth_token_id = optional(string)<br>  })</pre> | n/a | yes |
| <a name="input_tfe_variable_public_map"></a> [tfe\_variable\_public\_map](#input\_tfe\_variable\_public\_map) | A map of public variable to add as environment variables to the TFC workspace | `map(any)` | `{}` | no |
| <a name="input_tfe_variable_sensitive_map"></a> [tfe\_variable\_sensitive\_map](#input\_tfe\_variable\_sensitive\_map) | A map of sensitive variable to add as environment variables to the TFC workspace | `map(any)` | `{}` | no |
| <a name="input_workspace_settings"></a> [workspace\_settings](#input\_workspace\_settings) | n/a | <pre>object({<br>    workspace_name                = string<br>    description                   = optional(string)<br>    agent_pool_id                 = optional(string)<br>    allow_destroy_plan            = optional(bool)<br>    auto_apply                    = optional(bool)<br>    execution_mode                = optional(string)<br>    assessments_enabled           = optional(bool)<br>    file_triggers_enabled         = optional(bool)<br>    global_remote_state           = optional(bool)<br>    remote_state_consumer_ids     = optional(list(string))<br>    queue_all_runs                = optional(bool)<br>    speculative_enabled           = optional(bool)<br>    structured_run_output_enabled = optional(bool)<br>    ssh_key_id                    = optional(string)<br>    tag_names                     = optional(list(string))<br>    terraform_version             = optional(string)<br>    trigger_prefixes              = optional(list(string))<br>    trigger_patterns              = optional(list(string))<br>    working_directory             = optional(string)<br><br>    vcs = optional(object({<br>      repo_name      = string<br>      oauth_token_id = string<br>      branch         = optional(string)<br>      }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | n/a |
