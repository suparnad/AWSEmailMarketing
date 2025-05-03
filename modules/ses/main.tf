# 1. Verify the email address with SES
resource "aws_ses_email_identity" "this" {
  email = var.source_email
}

# 2. Allow the Lambda function to send emails using SES
resource "aws_iam_role_policy" "ses_send" {
  name = "lambda-ses-send-policy"
  role = var.lambda_role_name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ses:SendEmail",
          "ses:SendRawEmail"
        ],
        Resource = "*"
      }
    ]
  })
}
