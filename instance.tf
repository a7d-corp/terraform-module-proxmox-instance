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

  network {
    model   = "virtio"
    bridge  = var.network_bridge
    tag     = var.primary_network_vlan_tag
    macaddr = var.primary_mac
  }

  network {
    model   = "virtio"
    bridge  = var.network_bridge
    tag     = var.secondary_network_vlan_tag
    macaddr = var.secondary_mac
  }

  os_type                 = var.os_type
  cicustom                = "user=local:${var.snippet_dir}/user-${var.snippet_file_base},network=local:${var.snippet_dir}/network-${var.snippet_file_base}"
  cloudinit_cdrom_storage = var.cloudinit_cdrom_storage

  searchdomain = var.searchdomain
  nameserver   = var.nameserver
}
