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

variable "hastate" {
  default     = null
  description = "Requested HA state for the resource."
  type        = string
  validation {
    condition = anytrue([
      var.hastate == "disabled",
      var.hastate == "enabled",
      var.hastate == "ignored",
      var.hastate == "started",
      var.hastate == "stopped",
      var.hastate == null
    ])
    error_message = "Must be one of 'disabled', 'enabled', 'ignored', 'started', 'stopped', or null (default)."
  }
}

variable "hagroup" {
  default     = null
  description = "The HA group identifier the resource belongs to."
  type        = string
}

variable "cpu" {
  default     = null
  description = "The type of CPU to emulate in the guest."
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
  default     = null
  description = "Set PXE boot mode"
  type        = bool
}

variable "boot" {
  default     = "order=scsi0;net0"
  description = "Boot order for the instance."
  type        = string
}

variable "onboot" {
  default     = null
  description = "Whether to have the VM startup after the PVE node starts."
  type        = bool
}

variable "vm_state" {
  default     = "running"
  description = "Desired power state of the VM."
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
  description = "List of objects representing additional disks."
  type = list(object({
    discard    = optional(bool)
    emulatessd = optional(bool)
    iothread   = optional(bool)
    size       = optional(string)
    slot       = string
    storage    = string
  }))
  default = [{
    discard    = false
    emulatessd = false
    iothread   = false
    size       = "20G"
    slot       = "scsi0"
    storage    = "local-lvm"
  }]
}

variable "os_type" {
  default     = null
  description = "Type of OS for preprovisioning."
  type        = string
}

variable "cicustom" {
  default     = null
  description = "Path(s) to cloud-init config files (ignored when pxe_boot is true)."
  type        = string
}
