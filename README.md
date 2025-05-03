## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.16 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lambda_email"></a> [lambda\_email](#module\_lambda\_email) | ./modules/lambda_email | n/a |
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | ./modules/s3_bucket | n/a |
| <a name="module_ses"></a> [ses](#module\_ses) | ./modules/ses | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_csv_key"></a> [csv\_key](#input\_csv\_key) | n/a | `string` | n/a | yes |
| <a name="input_email_subject"></a> [email\_subject](#input\_email\_subject) | n/a | `string` | n/a | yes |
| <a name="input_source_email"></a> [source\_email](#input\_source\_email) | n/a | `string` | n/a | yes |
| <a name="input_template_key"></a> [template\_key](#input\_template\_key) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
# AWSEmailMarketing
