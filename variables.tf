variable "pve_instance_name" {
  description = "Name of the instance."
  type        = string
}

variable "pve_instance_description" {
  description = "Description of the instance."
  type        = string
}

variable "vmid" {
  description = "ID of the VM (must be unique)."
  type        = number
}

variable "clone" {
  description = "Name of the template to clone."
  type        = string
}

variable "full_clone" {
  default     = false
  description = "Create a full clone (if false, a linked clone will be created)."
  type        = bool
}

variable "qemu_agent" {
  default     = 0
  description = "Enable QEMU guest agent (must be installed in the template). Set to `1` to enable or `0` to disable."
  type        = number
}

variable "target_node" {
  description = "Name of the node to assign the instance to."
  type        = string
}

variable "resource_pool" {
  description = "Name of the resource pool the assign the instance to."
  type        = string
}

variable "cores" {
  description = "Number of cores to allocate."
  type        = number
}

variable "sockets" {
  description = "Number of sockets to allocate."
  type        = number
}

variable "memory" {
  description = "Amount of memory to allocate."
  type        = number
}

variable "boot" {
  default     = "cdn"
  description = "Boot order for the instance."
  type        = string
}

variable "network_interfaces" {
  description = "List of objects representing instance interface configuration."
  type = list(object({
    model   = string
    bridge  = string
    tag     = number
    macaddr = string
  }))
}

variable "disks" {
  default     = null
  description = "List of objects representing additional disks."
  type = list(object({
    type    = string
    storage = string
    size    = string
  }))
}

variable "os_type" {
  description = "Type of OS for preprovisioning."
  type        = string
}

variable "snippet_dir" {
  default     = "snippets"
  description = "Name of the snippet subdirectory."
  type        = string
}

variable "snippet_file_base" {
  default     = "/var/lib/vz"
  description = "Path to the directory containing the snippet_dir."
  type        = string
}

variable "citemplate_storage" {
  default     = "local"
  description = "Name of the storage containing the Cloudinit snippets."
  type        = string
}

variable "cloudinit_cdrom_storage" {
  default     = "local-lvm"
  description = "Name of the storage to create the Cloudinit image in."
  type        = string
}

variable "instance_domain" {
  description = "Domain name to use."
  type        = string
}

variable "searchdomain" {
  description = "DNS searchdomain to use."
  type        = string
}

variable "nameserver" {
  description = "Nameserver to use in the instance."
  type        = string
}
