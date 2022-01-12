data "vsphere_datacenter" "dc" {
  name                        = var.vsphere_datacenter
}

data "vsphere_datastore" "ds" {
  name                        = var.vsphere_datastore
  datacenter_id               = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name                        = "cluster1"
  datacenter_id               = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "v2476" {
  name                        = var.vsphere_network_v2476
  datacenter_id               = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name                        = var.source_template
  datacenter_id               = data.vsphere_datacenter.dc.id
}

data "vsphere_tag_category" "category_service" {
  name												= "ansible_automation_service"
}

resource "vsphere_tag" "tag_service" {
  name												= var.tag_service
  category_id									= data.vsphere_tag_category.category_service.id
}

resource "vsphere_folder" "lamp" {
  path												= "lamp"
  type												= "vm"
  datacenter_id								= data.vsphere_datacenter.dc.id
}

resource "vsphere_folder" "legacy" {
  path												= "${vsphere_folder.lamp.path}/legacy"
  type												= "vm"
  datacenter_id								= data.vsphere_datacenter.dc.id
}

resource "vsphere_folder" "workers" {
  path												= "${vsphere_folder.legacy.path}/workers"
  type												= "vm"
  datacenter_id								= data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  count                       = length(var.worker_count)
  name                        = "${var.hostname_prefix}-00${count.index +1}"
  resource_pool_id            = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id                = data.vsphere_datastore.ds.id
  folder              				= vsphere_folder.workers.path
  tags												= [vsphere_tag.tag_service.id]

  num_cpus            				= var.num_cpus
  memory              				= var.memory
  guest_id            				= data.vsphere_virtual_machine.source_template.guest_id  
  scsi_type           				= data.vsphere_virtual_machine.source_template.scsi_type
    
  network_interface {
    network_id          			= data.vsphere_network.v2476.id
    adapter_type        			= "e1000"
  }
    
  disk {
    label               			= "disk0"
    size                			= data.vsphere_virtual_machine.template.disks[0].size
    eagerly_scrub       			= data.vsphere_virtual_machine.template.disks[0].eagerly_scrub
    thin_provisioned    			= data.vsphere_virtual_machine.template.disks[0].thin_provisioned
  }

  clone {
    template_uuid 						= data.vsphere_virtual_machine.source_template.id

    customize {
      linux_options {
        host_name 						= "${var.hostname_prefix}-00${count.index +1}"
        domain    						= var.domain
      }

      network_interface {}

      ipv4_gateway    				= var.ipv4_gateway
      dns_server_list 				= var.dns_server_list
      dns_suffix_list 				= var.dns_suffix_list
    }
  }

  wait_for_guest_net_timeout 	= var.wait_for_guest_net_timeout
  wait_for_guest_ip_timeout  	= var.wait_for_guest_ip_timeout
}


output "default_ip" {
  value = vsphere_virtual_machine.vm[*].default_ip_address
}

