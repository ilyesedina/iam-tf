module "iam_role" {
  source = "../../modules/iam-role"
  env    = local.environment
}

module "alerts" {
  source          = "../../modules/alerts"
  integration_url = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string).PagerDuty_Teams_integration_url
  env             = local.environment
}

data "aws_secretsmanager_secret" "pagerduty" {
  name = "PagerDuty_Teams_integration_url"
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.pagerduty.id
}