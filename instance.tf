resource "proxmox_vm_qemu" "proxmox_instance" {
  name = var.pve_instance_name
  desc = var.pve_instance_description
  vmid = var.vmid

  clone      = var.clone
  full_clone = var.full_clone
  agent      = var.qemu_agent

  target_node = var.target_node
  pool        = var.resource_pool

  cores   = var.cores
  sockets = var.sockets
  memory  = var.memory
  boot    = var.boot

  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "10G"
  }

  dynamic "network" {
    for_each = var.network_interfaces
    content {
      model   = network.value.model
      bridge  = network.value.bridge
      tag     = network.value.tag
      macaddr = network.value.macaddr
    }
  }

  os_type                 = var.os_type
  cicustom                = "user=local:${var.snippet_dir}/user-${var.snippet_file_base},network=local:${var.snippet_dir}/network-${var.snippet_file_base}"
  cloudinit_cdrom_storage = var.cloudinit_cdrom_storage

  searchdomain = var.searchdomain
  nameserver   = var.nameserver
}
