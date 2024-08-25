terraform {
  backend "s3" {
    region         = "eu-west-1"
    bucket         = "ilyes-terraform-statefiles-340404277013"
    encrypt        = true
    dynamodb_table = "terraform-locks-ilyes"
    key            = "iam.tfstate"
    profile        = "lego-qsc-sandbox:Admin"
  }
}
