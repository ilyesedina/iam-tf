This repository contains reusable GitHub actions workflows used for working with terraform.

The workflows follows the _convention over configuration_ dogma, and assumes that your terraform project has the following file structure in it's GitHub repo:

````
├── <project>
│   ├── environments
│   │   ├── <environment>
│   │   │   ├── providers.tf
│   │   │   ├── state.tf
````
Where `<project>` is the name of your project, and `<environment>` is the name of the environment you are working with.

### providers.tf
This file defines the terraform aws provider, and must include a `profile` line. 

Example:
`profile = "lego-qsc-${local.environment}:Admin"`. 
The `profile` name is automatically extracted by GHA to configure aws credentials for running terraform.

If `profile` includes the string `${local.environment}`, this will be replaced with the environment name.

#### Credentials aquired by GHA
GHA uses the GitHub OIDC IdP in the AWS-account(s) to aquire the necessary credentials for running terraform. For this to work, the github **repository name** that runs GHA must be whitelisted. 
To whitelist a repo, go to _AWS console -> CloudFormation -> Stack -> GitHubOIDC -> Update_. Add your repository to the comma-separated list in GitHubRepositories, and complete the wizard.
  

### state.tf
This is the terraform state backend configuration. It is used to extract `aws_account_id` assuming an s3 bucket is configured following the standard format. Example:

 `bucket         = "lego-qsc-<account_id>"`

 It is also assumed that the state is placed in the same aws_account as the terraform ressources.

# Reviewing the terraform plan
It's a good practice to review the terraform plan before applying it. This is especially important when working in production environments.
This can be achieved in GitHub by using a workflow consisting of first a `terraform plan` and then a `terraform apply` job.
