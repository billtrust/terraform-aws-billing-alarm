variable "aws_env" {
    description = "AWS environment you are deploying to. Will be appended to SNS topic and alarm name. (e.g. dev, stage, prod)"
}

variable "monthly_billing_threshold" {
    description = "The threshold for which estimated monthly charges will trigger the metric alarm."
}

variable "currency" {
    description = "Short notation for currency type (e.g. USD, CAD, EUR)"
    default = "USD"
}

variable "alarm_description" {
  description = "(Optional) The description for the alarm."
  default = null
}

variable "alarm_action_arns" {
    description = "external list of action ARN's to execute when the alarm transitions into an ALARM state"
    default     = []
    type        = list(string)
}
