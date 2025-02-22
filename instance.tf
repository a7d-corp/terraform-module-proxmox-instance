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

  cpu     = var.cpu
  cores   = var.cores
  sockets = var.sockets
  memory  = var.memory
  scsihw  = var.scsihw

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
      discard    = disk.value.discard
      emulatessd = disk.value.emulatessd
      format     = disk.value.format
      iothread   = disk.value.iothread
      size       = disk.value.size
      slot       = disk.value.slot
      storage    = disk.value.storage
      type       = disk.value.type
    }
  }

  os_type  = var.pxe_boot == true ? null : var.os_type
  cicustom = var.pxe_boot == true ? null : var.cicustom
  # example: "user=${local.citemplate_storage}:${local.snippet_dir}/user-${local.snippet_file_base},network=${local.citemplate_storage}:${local.snippet_dir}/network-${local.snippet_file_base}"
}
