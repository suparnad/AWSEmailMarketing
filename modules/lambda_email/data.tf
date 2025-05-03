# Trust policy for Lambda to assume the role
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# Archive the Python Lambda function
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/python/SendSESEmailToContacts.py"
  output_path = "${path.module}/python/SendSESEmailToContacts.zip"
}
