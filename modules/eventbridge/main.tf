resource "aws_cloudwatch_event_rule" "monthly_schedule" {
  name                = "monthly-email-trigger"
  description         = "Triggers the email Lambda on the 1st of every month"
  schedule_expression = "cron(0 10 1 * ? *)" # 1st day of month, 10:00 UTC
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.monthly_schedule.name
  target_id = "lambda-monthly-trigger"
  arn       = var.lambda_function_arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.monthly_schedule.arn
}
