module "cloud_tags" {

  tag_dataclassification               = "Green"
  tag_environment                      = reverse(split("/", abspath(path.root)))[0]
  tag_ManagedWith                      = "Terraform"
  tag_purpose                          = "Learning"
  tags_override = {
    "repository" = "https://github.com/ilyesedina/iam-tf"
    "Owner" : "Ilyes Edina"
  }
}
