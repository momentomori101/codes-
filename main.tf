provider "vsphere" {
  user           = "USER"
  password       = "PASSWORD"
  # vsphere_server = "172.16.16.201"
}

resource "vsphere_virtual_machine" "example" {
  name             = "example"
  resource_pool_id = "RESOURCE_POOL_ID"
  datastore_id     = "DATASTORE_ID"
  num_cpus         = 2
  memory           = 4096

  network_interface {
    network_id = "NETWORK_ID"
  }

  disk {
    label            = "disk0"
    size             = 40
    eagerly_scrub    = true
    thin_provisioned = true
  }

  clone {
    template_uuid = "TEMPLATE_UUID"
  }
}