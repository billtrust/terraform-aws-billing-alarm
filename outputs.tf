output "sns_topic" {
    value = <<EOO
    A billing alarm has been set for this account with a threshold of ${var.currency} ${var.billing_threshold}. 
    Any estimated charges above this amount will trigger an alarm publish to the SNS topic below.

    !! MANUAL STEP :
    !! Subscribe emails to ${aws_sns_topic.sns_alert_topic.arn} for billing alarms
EOO
    description = "Outputs the SNS Topic to be subscribed to manually."
}