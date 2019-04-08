variable "period_in_hours" {
    description = "Hours between evaluations. Default is 6"
    default = "6"
}

variable "aws_env" {
    description = "AWS environment you are deploying to. Will be appended to SNS topic and alarm name."
}


variable "billing_threshold" {
    description = "Maximum dollar amount for billing period"
}

variable "currency" {
    description = "Short notation for currency type (e.g. USD)"
    default = "USD"
}