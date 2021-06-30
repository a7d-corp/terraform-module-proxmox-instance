variable "pve_instance_name" {
  type = string
}

variable "instance_hostname" {
  type = string
}

variable "pve_instance_description" {
  type = string
}

variable "vmid" {
  type = number
}

variable "clone" {
  type = string
}

variable "full_clone" {
  type = bool
}

variable "qemu_agent" {
  type = number
}

variable "target_node" {
  type = string
}

variable "resource_pool" {
  type = string
}

variable "cores" {
  type = number
}

variable "sockets" {
  type = number
}

variable "memory" {
  type = number
}

variable "boot" {
  type = string
}

variable "network_interfaces" {
  type = list(object({
    model   = string
    bridge  = string
    tag     = number
    macaddr = string
  }))
}

variable "os_type" {
  type = string
}

variable "snippet_dir" {
  type = string
}

variable "snippet_file_base" {
  type = string
}

variable "citemplate_storage" {
  type = string
}

variable "cloudinit_cdrom_storage" {
  type = string
}

variable "instance_domain" {
  type = string
}

variable "searchdomain" {
  type = string
}

variable "nameserver" {
  type = string
}
