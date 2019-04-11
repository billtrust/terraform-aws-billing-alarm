variable "aws_env" {
    description = "AWS environment you are deploying to. Will be appended to SNS topic and alarm name. (e.g. dev, stage, prod)"
}

variable "billing_threshold" {
    description = "The threshold for which estimated charges will trigger the metric alarm."
}

variable "currency" {
    description = "Short notation for currency type (e.g. USD, CAD, EUR)"
    default = "USD"
}