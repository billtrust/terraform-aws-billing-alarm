Simply adds a billing alert and sns topic to alert when a threshold is reached. You still need to subscribe to the sns topic manually. Working on a solution to that.

```
module "billing_alert" {
  source = "billtrust/billing-alarm/aws"

  aws_env = "dev"
  billing_threshold = 10000
  currency = "USD" # optional
  period_in_hours = 6 # optional
}
```