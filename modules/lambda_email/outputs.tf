output "lambda_role_name" {
  description = "IAM Role name used by the Lambda function"
  value       = aws_iam_role.iam_for_lambda.name
}

output "lambda_role_arn" {
  description = "IAM Role ARN used by the Lambda function"
  value       = aws_iam_role.iam_for_lambda.arn
}

output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.terraform_lambda_func.function_name
}

output "lambda_function_arn" {
  value = aws_lambda_function.terraform_lambda_func.arn
}
