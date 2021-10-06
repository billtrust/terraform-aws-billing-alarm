resource "aws_cloudwatch_metric_alarm" "billing" {
  alarm_name                = "billing-alarm-${lower(var.currency)}-${var.aws_env}"
  alarm_description         = var.alarm_description
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "EstimatedCharges"
  namespace                 = "AWS/Billing"
  period                    = "28800"
  statistic                 = "Maximum"
  threshold                 = var.monthly_billing_threshold
  alarm_actions             = concat([aws_sns_topic.sns_alert_topic.arn], var.alarm_action_arns)

  dimensions = {
      Currency = var.currency
  }
}

resource "aws_sns_topic" "sns_alert_topic" {
    name = "billing-alarm-notification-${lower(var.currency)}-${var.aws_env}"
}
