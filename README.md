# AWS Billing Alarm module

Simply adds a billing alert and sns topic to alert when a threshold is reached. You still need to subscribe to the sns topic manually. Working on a solution to that.

Visit [the registry page](https://registry.terraform.io/modules/billtrust/billing-alarm/aws) for more information.

## Example

```terraform
module "billing_alert" {
  source = "billtrust/billing-alarm/aws"

  # Will be appended to SNS topic and alarm name
  aws_env = "dev"
  # Alarm when estimated monthly charges are above this amount
  monthly_billing_threshold = 10000
  # Currency is optional and defaults to USD
  currency = "USD"
}
```

## Variables

There are only two required variables for this. The environment this is running in (e.g. dev, stage, prod), and the threshold of estimated charges that will trigger the alarm (a monetary amount).

This metric is checked every 8 hours, and a single metric sample above the threshold amount will trigger an alarm state. The metric is named `billing-alarm-${lower(currency)}-${aws_env}`

The alarm action is automatically set to the created SNS topic, `billing-alarm-notification-${lower(currency)}-${aws_env}`. **YOU MUST MANUALLY SUBSCRIBE TO THIS SNS TOPIC.**

Currency is an optional variable. It defaults to USD, however you can provide any currency abbreviation (e.g. CAD, EUR, JPY) so you can seperate billing alerts by currency. I don't know if that's a common thing, but it's a provided dimension by Amazon, so I added support for it here.

## Output

The module outputs one block, sns_topic. Access it like this:

```
output "sns_topic" {
  value = "${module.billing_alert.sns_topic}"
}
```

For the example block at the top of the readme, it would print the following as output:

```
A billing alarm has been set for this account with a threshold of USD 10000. 
Any estimated charges above this amount will trigger an alarm publish to the SNS topic below.

!! MANUAL STEP :
!! Subscribe emails to arn:aws:sns:us-east-1:123456789012:billing-alarm-notification-usd-dev for billing alarms
```