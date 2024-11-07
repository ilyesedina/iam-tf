# Notification type definitions on SNS
resource "aws_sns_topic" "alarm_on" {
  name = "pagerduty-alarm-on"
}
# Autorecover
resource "aws_sns_topic" "alarm_off" {
  name = "pagerduty-alarm-off"
}

resource "aws_sns_topic_subscription" "pagerduty_alarm_on" {
  topic_arn = aws_sns_topic.alarm_on.arn
  protocol  = "https"
  endpoint  = var.integration_url
}

resource "aws_sns_topic_subscription" "pagerduty_alarm_off" {
  topic_arn = aws_sns_topic.alarm_off.arn
  protocol  = "https"
  endpoint  = var.integration_url
}