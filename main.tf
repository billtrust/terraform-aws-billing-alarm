resource "aws_cloudwatch_metric_alarm" "billing" {
  alarm_name                = "billing-alarm-${var.aws_env}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "EstimatedCharges"
  namespace                 = "AWS/Billing"
  period                    = "${var.period_in_hours * 60 * 60}"
  statistic                 = "Maximum"
  threshold                 = "${var.billing_threshold}"
  alarm_actions             = ["${aws_sns_topic.sns_alert_topic.arn}"]

  dimensions = {
      Currency = "${var.currency}"
  }
}

resource "aws_sns_topic" "sns_alert_topic" {
    name = "billing-alarm-notification-${var.aws_env}"
}