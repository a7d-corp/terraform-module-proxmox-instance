# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.6.2] - 2023-04-02

## [1.6.1] - 2023-04-02

### Changed

- Replace deprecated `oncreate` option with `vm_state`.

### Fixed

- Correct `vm_state` variable type.

## [1.6.0] - 2023-03-25

### Added

- Exposed `onboot` and `oncreate` options.

### Changed

- Bump proxmox provider to `2.9.14` to take advantage of new PXE options.
- Use new boot order syntax.

## [1.5.0] - 2023-03-10

### Removed

- Removed unused vars relating to cloud-init.

## [1.4.1] - 2023-03-05

### Changed

- Default `pxe_boot` to `null`.

## [1.4.0] - 2023-03-02

### Added

- Ability to set Proxmox HA options.

## [1.3.0] - 2022-12-03

### Added

- Added changelog enforcer workflow.

### Removed

- Remove `searchdomain` and `nameserver` vars.

## [1.2.2] - 2022-11-27

### Fixed

- Use null vars instead of strings.

## [1.2.1] - 2022-11-27

### Fixed

- Correct conditional logic.

## [1.2.0] - 2022-11-27

### Changed

- Make vars not required for PXE booting optional.

## [1.1.0] - 2022-11-27

### Fixed

- Correct `pxe` variable.

### Added

- Terraform validate workflow.

### Removed

- Remove feature toggle for experimental attributes.

## [1.0.0] - 2022-11-26

### Added

- Changelog.
- Release workflows.

### Changed

- Enable configuration of PXE booting.

[Unreleased]: https://github.com/a7d-corp/terraform-module-proxmox-instance/compare/v1.6.2...HEAD
[1.6.2]: https://github.com/a7d-corp/terraform-module-proxmox-instance/compare/v1.6.1...v1.6.2
[1.6.1]: https://github.com/a7d-corp/terraform-module-proxmox-instance/compare/v1.6.0...v1.6.1
[1.6.0]: https://github.com/a7d-corp/terraform-module-proxmox-instance/compare/v1.5.0...v1.6.0
[1.5.0]: https://github.com/a7d-corp/terraform-module-proxmox-instance/compare/v1.4.1...v1.5.0
[1.4.1]: https://github.com/a7d-corp/terraform-module-proxmox-instance/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/a7d-corp/terraform-module-proxmox-instance/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/a7d-corp/terraform-module-proxmox-instance/compare/v1.2.2...v1.3.0
[1.2.2]: https://github.com/a7d-corp/terraform-module-proxmox-instance/compare/v1.2.1...v1.2.2
[1.2.1]: https://github.com/a7d-corp/terraform-module-proxmox-instance/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/a7d-corp/terraform-module-proxmox-instance/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/a7d-corp/terraform-module-proxmox-instance/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/a7d-corp/terraform-module-proxmox-instance/releases/tag/v1.0.0
