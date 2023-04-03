# terraform-module-proxmox-instance

Terraform module to manage VM instances on Proxmox hosts.

## Limitations

This module is an opinionated take on creating a VM in Proxmox; not all possible configuration options are exposed. It is expected to be used in conjunction with [terraform-module-proxmox-cloudinit-template](https://github.com/glitchcrab/terraform-module-proxmox-cloudinit-template) to provide the required cloud-init files for this module to consume.

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| boot | Boot order for the instance. | `string` | `"order=scsi0;net0"` | no |
| cicustom | Path(s) to cloud-init config files (ignored when pxe_boot is true). | `string` | `null` | no |
| clone | Name of the template to clone (ignored when pxe_boot is true). | `string` | `null` | no |
| cloudinit_cdrom_storage | Name of the storage to create the cloud-init image in (e.g. local-lvm). | `string` | `null` | no |
| cores | Number of cores to allocate. | `number` | n/a | yes |
| cpu | The type of CPU to emulate in the guest. | `string` | `null` | no |
| disks | List of objects representing additional disks. | <pre>list(object({<br>    type    = string<br>    storage = string<br>    size    = string<br>  }))</pre> | `null` | no |
| full_clone | Create a full clone; if false, a linked clone will be created (ignored when pxe_boot is true). | `bool` | `null` | no |
| hagroup | The HA group identifier the resource belongs to. | `string` | `null` | no |
| hastate | Requested HA state for the resource. | `string` | `null` | no |
| memory | Amount of memory to allocate. | `number` | n/a | yes |
| network_interfaces | List of objects representing instance interface configuration. | <pre>list(object({<br>    model   = string<br>    bridge  = string<br>    tag     = number<br>    macaddr = string<br>  }))</pre> | n/a | yes |
| onboot | Whether to have the VM startup after the PVE node starts. | `bool` | `null` | no |
| oncreate | Whether to have the VM startup after the VM is created. | `bool` | `null` | no |
| os_type | Type of OS for preprovisioning. | `string` | `null` | no |
| pve_instance_description | Description of the instance. | `string` | n/a | yes |
| pve_instance_name | Name of the instance. | `string` | n/a | yes |
| pxe_boot | Set PXE boot mode | `bool` | `null` | no |
| qemu_agent | Enable QEMU guest agent (must be installed in the template). Set to `1` to enable or `0` to disable. | `number` | `0` | no |
| resource_pool | Name of the resource pool the assign the instance to. | `string` | n/a | yes |
| sockets | Number of sockets to allocate. | `number` | n/a | yes |
| target_node | Name of the node to assign the instance to. | `string` | n/a | yes |
| vmid | ID of the VM (must be unique). | `number` | n/a | yes |
