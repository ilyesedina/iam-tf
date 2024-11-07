resource "aws_cloudwatch_metric_alarm" "ec2_bastion_status_check" {
  alarm_name          = "ec2-bastion-status-check"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_description   = "EC2 instance status check has failed. Investigate why the EC2 instance is failing"
  metric_name         = "StatusCheckFailed"
  dimensions = {
    "InstanceId" = data.aws_instance.bastion.id
  }
  namespace                 = "AWS/EC2"
  statistic                 = "Sum"
  period                    = 300 # 5 minutes (in seconds) until the alarm will be triggered
  evaluation_periods        = 1
  threshold                 = 1
  alarm_actions             = [aws_sns_topic.alarm_on.arn]
  ok_actions                = [aws_sns_topic.alarm_off.arn]
  insufficient_data_actions = [] # No action is to be taken if data is missing, because the triggered alert would be resolved without anyone looking at the underlying issue.
}