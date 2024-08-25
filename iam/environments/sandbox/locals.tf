locals {
  # By convention current directory is environment name
  environment = split("/", abspath(path.module))[length(split("/", abspath(path.module))) - 1]
}
