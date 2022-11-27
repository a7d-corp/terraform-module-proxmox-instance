# terraform-module-proxmox-instance

Terraform module to manage VM instances on Proxmox hosts.

## Limitations

This module is an opinionated take on creating a VM in Proxmox; not all possible configuration options are exposed. It is expected to be used in conjunction with [terraform-module-proxmox-cloudinit-template](https://github.com/glitchcrab/terraform-module-proxmox-cloudinit-template) to provide the required cloud-init files for this module to consume.

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| boot | Boot order for the instance. | `string` | `"cdn"` | no |
| cicustom | Path(s) to cloud-init config files (ignored when pxe_boot is true). | `string` | `""` | no |
| citemplate_storage | Name of the storage containing the cloud-init snippets (ignored when pxe_boot is true). | `string` | `"local"` | no |
| clone | Name of the template to clone (ignored when pxe_boot is true). | `string` | `""` | no |
| cloudinit_cdrom_storage | Name of the storage to create the cloud-init image in. | `string` | `"local-lvm"` | no |
| cores | Number of cores to allocate. | `number` | n/a | yes |
| disks | List of objects representing additional disks. | <pre>list(object({<br>    type    = string<br>    storage = string<br>    size    = string<br>  }))</pre> | `null` | no |
| full_clone | Create a full clone; if false, a linked clone will be created (ignored when pxe_boot is true). | `bool` | `false` | no |
| instance_domain | Domain name to use. | `string` | n/a | yes |
| memory | Amount of memory to allocate. | `number` | n/a | yes |
| nameserver | Nameserver to use in the instance. | `string` | n/a | yes |
| network_interfaces | List of objects representing instance interface configuration. | <pre>list(object({<br>    model   = string<br>    bridge  = string<br>    tag     = number<br>    macaddr = string<br>  }))</pre> | n/a | yes |
| os_type | Type of OS for preprovisioning. | `string` | `""` | no |
| pve_instance_description | Description of the instance. | `string` | n/a | yes |
| pve_instance_name | Name of the instance. | `string` | n/a | yes |
| pxe_boot | Set PXE boot mode | `bool` | `false` | no |
| qemu_agent | Enable QEMU guest agent (must be installed in the template). Set to `1` to enable or `0` to disable. | `number` | `0` | no |
| resource_pool | Name of the resource pool the assign the instance to. | `string` | n/a | yes |
| searchdomain | DNS searchdomain to use. | `string` | n/a | yes |
| snippet_dir | Name of the snippet subdirectory. | `string` | `"snippets"` | no |
| snippet_file_base | Path to the directory containing the snippet_dir. | `string` | `"/var/lib/vz"` | no |
| sockets | Number of sockets to allocate. | `number` | n/a | yes |
| target_node | Name of the node to assign the instance to. | `string` | n/a | yes |
| vmid | ID of the VM (must be unique). | `number` | n/a | yes |
