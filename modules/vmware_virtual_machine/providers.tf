terraform {
  experiments = [module_variable_optional_attrs]
}


# Set the following ENV vars
# VSPHERE_USER
# VSPHERE_PASSWORD
# VSPHERE_SERVER
#
provider "vsphere" {
  allow_unverified_ssl = true
}

