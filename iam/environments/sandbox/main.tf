module "iam_role" {
  source = "../../modules/iam-role"
  env    = local.environment
}

module "tf-cloud-tags" {
  source      = "../../modules/tf-cloud-tags"
  environment = local.environment
}