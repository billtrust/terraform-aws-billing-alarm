output "sns_topic" {
    value = "Subscribe to ${aws_sns_topic.sns_alert_topic.arn} for billing alarms"
    description = "Gives the sns topic ARN."
}