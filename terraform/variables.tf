
variable "github_owner" {
    type            = string
}

variable "aws_region" {
    type            = string
    default         = "us-west-2"  
}

variable "github_repo" {
    type = object({
        name                        = string
        description                 = string 
        auto_init                   = bool
        visibility                  = string
        has_downloads               = bool
        organization                = string
        enforce_admins              = bool
        allows_force_pushes         = bool
        push_restrictions           = list(string)
    })  
}

variable "terraform_s3_backend" {
    type = object({
        namespace   = string
        environment = string
        stage       = string
        name        = string
        attributes  = list(string)
    })
  
}