provider "aws" {
  region  = "${var.aws["region"]}"
  profile = "${var.aws["profile"]}"
  version = "~> 1.51.0"
}

variable "aws" {
  default = {
    region  = "us-east-1"
    profile = "dev"
  }
}
