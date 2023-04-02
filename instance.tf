resource "proxmox_vm_qemu" "proxmox_instance" {
  name = var.pve_instance_name
  desc = var.pve_instance_description
  vmid = var.vmid

  clone      = var.pxe_boot == true ? null : var.clone
  full_clone = var.pxe_boot == true ? null : var.full_clone

  pxe      = var.pxe_boot
  boot     = var.boot
  onboot   = var.onboot
  vm_state = var.vm_state

  agent = var.qemu_agent

  target_node = var.target_node
  pool        = var.resource_pool

  hastate = var.hastate
  hagroup = var.hagroup

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

  os_type  = var.pxe_boot == true ? null : var.os_type
  cicustom = var.pxe_boot == true ? null : var.cicustom
  # example: "user=${local.citemplate_storage}:${local.snippet_dir}/user-${local.snippet_file_base},network=${local.citemplate_storage}:${local.snippet_dir}/network-${local.snippet_file_base}"
  cloudinit_cdrom_storage = var.pxe_boot == true ? null : var.cloudinit_cdrom_storage
}
