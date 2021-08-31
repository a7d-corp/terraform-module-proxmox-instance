terraform {
  # minimum required version for experimental features.
  required_version = "0.14.0"

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = ">= 2.6.9"
    }
  }

  # enable experimental optional variables.
  # TODO: remove when no longer experimental.
  experiments = [module_variable_optional_attrs]
}
