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
  default     = null
  description = "Name of the template to clone (ignored when pxe_boot is true)."
  type        = string
}

variable "full_clone" {
  default     = null
  description = "Create a full clone; if false, a linked clone will be created (ignored when pxe_boot is true)."
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

variable "pxe_boot" {
  default     = false
  description = "Set PXE boot mode"
  type        = bool
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
  default     = null
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

variable "cicustom" {
  default     = null
  description = "Path(s) to cloud-init config files (ignored when pxe_boot is true)."
  type        = string
}

variable "citemplate_storage" {
  default     = null
  description = "Name of the storage containing the cloud-init snippets (ignored when pxe_boot is true)."
  type        = string
}

variable "cloudinit_cdrom_storage" {
  default     = null
  description = "Name of the storage to create the cloud-init image in (e.g. local-lvm)."
  type        = string
}
