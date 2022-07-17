# INIT

This will deploy the underlying infrastructure responsible for managing the LAMP Legacy stack.

## What Will be Deployed?

The following services will be affected:
1. GitHub
  * A repository to host this IaC will be created
2. Terraform Cloud
  * A Terraform Cloud Workspace will be created
  * The GitHub repository created prior will be linked
3. VNware
  * A virtual machine to host the new LAMP stack
  * Folder structure for the LAMP hosts
  * Resrouce Pool creation
  * Tags


