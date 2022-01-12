terraform {
  backend "remote" {
    organization = "ucsb-me"

    workspaces {
      name = "service-lamp-legacy"
    }
  }
}
