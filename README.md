# Serverless Email Marketing App using AWS and Terraform

This is a simple, serverless email marketing system built using **AWS** and **Terraform**. It automatically sends **bulk HTML emails** (like a newsletter) using **SES**, triggered by **EventBridge** on a schedule. Email templates and contact lists are stored in **Amazon S3**, and email sending is handled by a **Lambda function**.

---

## Real Use Case

I built this for my **food blog** to send out a weekly newsletter to my subscribers with recipe ideas and seasonal cooking tips. Instead of using a paid email tool, I built a **cost-effective and automated solution** using AWS.

---

## Technologies Used

- **AWS Lambda** – Send emails using SES
- **Amazon S3** – Store email template and recipient list
- **Amazon SES** – Send bulk HTML emails
- **Amazon EventBridge** – Schedule the email campaign
- **AWS IAM** – Manage secure permissions
- **Terraform** – Infrastructure as Code (IaC)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.16 |


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eventbridge"></a> [eventbridge](#module\_eventbridge) | ./modules/eventbridge | n/a |
| <a name="module_lambda_email"></a> [lambda\_email](#module\_lambda\_email) | ./modules/lambda_email | n/a |
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | ./modules/s3_bucket | n/a |
| <a name="module_ses"></a> [ses](#module\_ses) | ./modules/ses | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the Bucket in S3 | `string` | n/a | yes |
| <a name="input_csv_key"></a> [csv\_key](#input\_csv\_key) | Contact csv file name | `string` | n/a | yes |
| <a name="input_email_subject"></a> [email\_subject](#input\_email\_subject) | Subject of my marketing email | `string` | n/a | yes |
| <a name="input_source_email"></a> [source\_email](#input\_source\_email) | Source email Id | `string` | n/a | yes |
| <a name="input_template_key"></a> [template\_key](#input\_template\_key) | Email template file name | `string` | n/a | yes |

