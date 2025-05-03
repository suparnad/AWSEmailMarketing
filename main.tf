module "lambda_email" {
  source = "./modules/lambda_email"

  bucket_name   = var.bucket_name
  csv_key       = var.csv_key
  template_key  = var.template_key
  source_email  = var.source_email
  email_subject = var.email_subject
}

module "s3_bucket" {
  source = "./modules/s3_bucket"

  bucket_name = var.bucket_name
}

module "ses" {
  source           = "./modules/ses"
  source_email     = var.source_email
  lambda_role_arn  = module.lambda_email.lambda_role_arn
  lambda_role_name = module.lambda_email.lambda_role_name

}

module "eventbridge" {
  source = "./modules/eventbridge"

  lambda_function_name = module.lambda_email.lambda_function_name
  lambda_function_arn  = module.lambda_email.lambda_function_arn
}

