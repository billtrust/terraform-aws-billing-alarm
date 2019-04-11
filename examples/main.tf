module "billing_alert" {
  source = "billtrust/billing-alarm/aws"

  aws_env = "${var.aws_profile}"
  billing_threshold = 10000
}

output "sns_topic" {
  value = "${module.billing_alert.sns_topic}"
}

# Will output the following:
#
# A billing alarm has been set for this account with a threshold of USD 10000. 
# Any estimated charges above this amount will trigger an alarm publish to the SNS topic below.
#
# !! MANUAL STEP :
# !! Subscribe emails to arn:aws:sns:us-east-1:123456789012:billing-alarm-notification-usd-dev for billing alarms
