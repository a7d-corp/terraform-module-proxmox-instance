terraform {
  required_version = ">= 0.14.0"

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = ">= 3.0.1-rc4"
    }
  }
}
