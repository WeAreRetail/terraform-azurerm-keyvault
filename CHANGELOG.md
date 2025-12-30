# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2025-12-30
### Updated
- Azurerm introduced "rbac_authorization_enabled" parameter for key vaults in version 4.42.
  Updated module to use this parameter in place of the deprecated "enable_rbac_authorization" and force the minimum required provider version to 4.42.
  The module's API remains unchanged to maintain backward compatibility with existing configurations.

## [1.0.0] - 2021-09-22
### Added
- Initial Release