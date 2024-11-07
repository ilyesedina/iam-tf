resource "aws_cloudwatch_metric_alarm" "gateway_error_rate" {
  for_each            = toset(var.api_gateway_ids)
  alarm_name          = "5xx-gateway-errors"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "5xx"
  dimensions = {
    "ApiId" = each.value
  }
  namespace          = "AWS/ApiGateway"
  statistic          = "Sum"
  period             = 300 # 5 minutes (in seconds) until the alarm will be triggered
  evaluation_periods = 1
  threshold          = 1
  alarm_actions      = [aws_sns_topic.alarm_on.arn]
}