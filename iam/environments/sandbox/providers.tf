provider "aws" {
  region  = "eu-west-1"
  profile = "lego-qsc-${local.environment}:Admin"

  default_tags {
    tags = module.cloud_tags.tags
  } 
}
