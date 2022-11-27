resource "proxmox_vm_qemu" "proxmox_instance" {
  name = var.pve_instance_name
  desc = var.pve_instance_description
  vmid = var.vmid

  clone      = var.pxe_boot ? "" : var.clone
  full_clone = var.pxe_boot ? false : var.full_clone
  pxe        = var.pxe_boot
  boot       = var.boot

  agent = var.qemu_agent

  target_node = var.target_node
  pool        = var.resource_pool

  cores   = var.cores
  sockets = var.sockets
  memory  = var.memory

  dynamic "network" {
    for_each = var.network_interfaces
    content {
      model   = network.value.model
      bridge  = network.value.bridge
      tag     = network.value.tag
      macaddr = network.value.macaddr
    }
  }

  dynamic "disk" {
    for_each = var.disks
    content {
      type    = disk.value.type
      storage = disk.value.storage
      size    = disk.value.size
    }
  }

  os_type  = var.pxe_boot ? "" : var.os_type
  cicustom = var.pxe_boot ? "" : var.cicustom
  # example: "user=${var.citemplate_storage}:${var.snippet_dir}/user-${var.snippet_file_base},network=${var.citemplate_storage}:${var.snippet_dir}/network-${var.snippet_file_base}"
  cloudinit_cdrom_storage = var.pxe_boot ? "" : var.cloudinit_cdrom_storage

  searchdomain = var.searchdomain
  nameserver   = var.nameserver
}
