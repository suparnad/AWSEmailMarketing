# IAM role for Lambda function
resource "aws_iam_role" "iam_for_lambda" {
  name               = "terraform_iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# Attach basic logging policy
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Grant S3 read access to the Lambda IAM role
resource "aws_iam_role_policy" "lambda_s3_policy" {
  name = "lambda_s3_access"
  role = aws_iam_role.iam_for_lambda.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",  # list bucket permission
          "arn:aws:s3:::${var.bucket_name}/*" # get object permission
        ]
      }
    ]
  })
}


# Lambda function resource
resource "aws_lambda_function" "terraform_lambda_func" {
  filename         = "${path.module}/python/SendSESEmailToContacts.zip"
  function_name    = "SendSESEmailFunction"
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "SendSESEmailToContacts.lambda_handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.9" # Use the Python version you're targeting

  environment {
    variables = {
      BUCKET_NAME   = var.bucket_name
      CSV_KEY       = var.csv_key
      TEMPLATE_KEY  = var.template_key
      SOURCE_EMAIL  = var.source_email
      EMAIL_SUBJECT = var.email_subject
    }
  }

}
