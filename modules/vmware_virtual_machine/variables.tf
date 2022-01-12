variable "vsphere_datacenter" {
  type    = string
  default = "NHDC"
}

variable "vsphere_datastore" {
  type    = string
  default = null
}

variable "vsphere_computer_cluster" {
  type    = string
  default = "UCS2"
}

variable "deploy_vsphere_folder" {
  type    = string
  default = "/"
}

variable "vsphere_network_v2476" {
  type    = string
  default = "dvPG-vlan2476"
}

variable "source_template" {
  type    = string
  default = "ucsb-lib-centos7-template-packer"
}

variable "num_cpus" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 2048
}

variable "ipv4_gateway" {
  type    = string
  defaul  = null
}

variable "dns_server_list" {
  type    = list(string)
  default = ["10.3.x.x", "10.3.x.x"]
}

variable "dns_suffix_list" {
  type    = list(string)
  default = ["library.ucsb.edu"]
}

variable "domain" {
  type    = string
  default = "library.ucsb.edu"
}

variable "hostname_prefix" {
  type    = string
  default = "lamp-legacy"
}

variable "worker_count" {
  type    = number
  default = 1
}

variable "wait_for_guest_net_timeout" {
  type    = number
  default = 0
}

variable "wait_for_guest_ip_timeout" {
  type    = number
  default = 0
}
