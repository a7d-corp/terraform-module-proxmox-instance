# terraform-module-proxmox-instance

Terraform module to manage VM instances on Proxmox hosts.

## Limitations

This module is an opinionated take on creating a VM in Proxmox; not all possible configuration options are exposed. It is expected to be used in conjunction with [terraform-module-proxmox-cloudinit-template](https://github.com/glitchcrab/terraform-module-proxmox-cloudinit-template) to provide the required Cloudinit files for this module to consume.

## Variables

| name                       | type         | required | description                                |
|----------------------------|--------------|----------|--------------------------------------------|
| `boot`                     | string       | `false` | Boot order for the instance.                |
| `citemplate_storage`       | string       | `false` | Name of the storage containing the Cloudinit snippets. |
| `clone`                    | string       | `true`  | Name of the template to clone.              |
| `cloudinit_cdrom_storage`  | string       | `false` | Name of the storage to create the Cloudinit image in. |
| `cores`                    | number       | `true`  | Number of cores to allocate.                |
| `full_clone`               | bool         | `false` | Create a full clone (if false, a linked clone will be created). |
| `instance_domain`          | string       | `true`  | Domain name to use.                         |
| `memory`                   | number       | `true`  | Amount of memory to allocate.               |
| `network_interfaces`       | list(object) | `true`  | List of objects representing instance interface configuration. |
| `nameserver`               | string       | `true`  | Nameserver to use in the instance.          |
| `os_type`                  | string       | `true`  | Type of OS for preprovisioning (see [the provider docs](https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/resources/vm_qemu.md#preprovision)). |
| `pve_instance_name`        | string       | `true ` | Name of the instance.                       |
| `pve_instance_description` | string       | `true`  | Description of the instance.                |
| `qemu_agent`               | number       | `false` | Enable QEMU guest agent (must be installed in the template). Set to `1` to enable or `0` to disable. |
| `resource_pool`            | string       | `true`  | Name of the resource pool the assign the instance to. |
| `snippet_dir`              | string       | `false` | Name of the snippet subdirectory.           |
| `snippet_file_base`        | string       | `false` | Path to the directory containing the `snippet_dir`. |
| `sockets`                  | number       | `true`  | Number of sockets to allocate.              |
| `searchdomain`             | string       | `true`  | DNS searchdomain to use.                    |
| `target_node`              | string       | `true`  | Name of the node to assign the instance to. |
| `vmid `                    | number       | `true`  | ID of the VM (must be unique).              |
