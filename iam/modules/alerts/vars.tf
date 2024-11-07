variable "integration_url" {
  type        = string
}

variable "env" {
  type = string
}

variable "api_gateway_ids" {
  type    = list(string)
  default = []
}

variable "lambda_function_names" {
  type    = list(string)
  default = []
}

variable "ec2_instance_ids" {
  type    = list(string)
  default = []
}