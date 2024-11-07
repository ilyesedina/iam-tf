resource "aws_cloudwatch_metric_alarm" "lambda_error_rate" {
  alarm_name          = "lambda-error-rate"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_description   = "The lambda function has failed. Investigate why the lambda function is failing on CloudWatch"
  metric_name         = "Errors"
  dimensions = {
    "FunctionName" = "lambda function name"
  }
  namespace          = "AWS/Lambda"
  statistic          = "Sum"
  period             = 10
  evaluation_periods = 1
  threshold          = 1
  alarm_actions      = [aws_sns_topic.alarm_on.arn]
}

resource "aws_cloudwatch_metric_alarm" "integrations_lambda_error_rate" {
  alarm_name          = "integrations-lambda-error-rate"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_description   = "The lambda function  has failed. Investigate why the lambda function is failing on CloudWatch"
  metric_name         = "Errors"
  dimensions = {
    "FunctionName" = "integrations-lambda"
  }
  namespace                 = "AWS/Lambda"
  statistic                 = "Sum"
  period                    = 300 # 5 minutes (in seconds) until the alarm will be triggered
  evaluation_periods        = 1
  threshold                 = 1
  alarm_actions             = [aws_sns_topic.alarm_on.arn]
  ok_actions                = [aws_sns_topic.alarm_off.arn]
  insufficient_data_actions = [] # No action is to be taken if data is missing, because the triggered alert would be resolved without anyone looking at the underlying issue.
}

data "aws_instance" "bastion" {

  filter {
    name   = "tag:Name"
    values = ["bastion"]
  }
}