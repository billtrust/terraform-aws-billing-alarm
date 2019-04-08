module "billing_alert" {
  source = "billtrust/billing-alarm/aws"
  aws_env = "${var.aws["profile"]}"
  billing_threshold = 10000
}

output "sns_topic" {
  value = "${module.billing_alert.sns_topic}"
}
