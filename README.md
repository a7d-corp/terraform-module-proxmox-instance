# terraform-module-proxmox-instance

Terraform module to manage VM instances on Proxmox hosts.

## Limitations

This module is an opinionated take on creating a VM in Proxmox; not all possible configuration options are exposed. It is expected to be used in conjunction with [terraform-module-proxmox-cloudinit-template](https://github.com/glitchcrab/terraform-module-proxmox-cloudinit-template) to provide the required cloud-init files for this module to consume.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| proxmox | >= 3.0.1-rc4 |

## Providers

| Name | Version |
|------|---------|
| proxmox | 2.9.13 |

## Resources

| Name | Type |
|------|------|
| [proxmox_vm_qemu.proxmox_instance](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/vm_qemu) | resource |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| cores | Number of cores to allocate. | `number` | yes |
| memory | Amount of memory to allocate. | `number` | yes |
| network_interfaces | List of objects representing instance interface configuration. | <pre>list(object({<br/>    model   = string<br/>    bridge  = string<br/>    tag     = number<br/>    macaddr = string<br/>  }))</pre> | yes |
| pve_instance_description | Description of the instance. | `string` | yes |
| pve_instance_name | Name of the instance. | `string` | yes |
| resource_pool | Name of the resource pool the assign the instance to. | `string` | yes |
| sockets | Number of sockets to allocate. | `number` | yes |
| target_node | Name of the node to assign the instance to. | `string` | yes |
| vmid | ID of the VM (must be unique). | `number` | yes |
| boot | Boot order for the instance. | `string` | no |
| cicustom | Path(s) to cloud-init config files (ignored when pxe_boot is true). | `string` | no |
| clone | Name of the template to clone (ignored when pxe_boot is true). | `string` | no |
| cpu | The type of CPU to emulate in the guest. | `string` | no |
| disks | List of objects representing additional disks. | <pre>list(object({<br/>    discard    = optional(bool)<br/>    emulatessd = optional(bool)<br/>    format     = optional(string)<br/>    iothread   = optional(bool)<br/>    size       = optional(string)<br/>    slot       = optional(string)<br/>    storage    = string<br/>    type       = string<br/>  }))</pre> | no |
| full_clone | Create a full clone; if false, a linked clone will be created (ignored when pxe_boot is true). | `bool` | no |
| hagroup | The HA group identifier the resource belongs to. | `string` | no |
| hastate | Requested HA state for the resource. | `string` | no |
| onboot | Whether to have the VM startup after the PVE node starts. | `bool` | no |
| os_type | Type of OS for preprovisioning. | `string` | no |
| pxe_boot | Set PXE boot mode | `bool` | no |
| qemu_agent | Enable QEMU guest agent (must be installed in the template). Set to `1` to enable or `0` to disable. | `number` | no |
| scsihw | SCSI controller to emulate. | `string` | no |
| vm_state | Desired power state of the VM. | `string` | no |
<!-- END_TF_DOCS -->
