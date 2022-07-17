
variable "github_owner" {
    type            = string
}

variable "aws_region" {
    type            = string
    default         = "us-west-2"  
}

variable "github_repo" {
    type = object({
        name            = string
        description     = string 
        auto_init       = bool
        visibility      = string
        has_downloads   = bool
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