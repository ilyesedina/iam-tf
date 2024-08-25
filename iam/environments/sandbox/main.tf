module "iam_role" {
  source = "../../modules/iam-role"
  env    = local.environment
}