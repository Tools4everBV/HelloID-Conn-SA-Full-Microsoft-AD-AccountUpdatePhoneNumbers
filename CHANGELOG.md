# Change Log

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/), and this project adheres to [Semantic Versioning](https://semver.org/).

## [1.0.0] - 2026-08-11

### Added

• Initial release of HelloID-Conn-SA-Full-AD-AccountUpdatePhoneNumbers
• AD account phone number management functionality
• Search and select target AD user account by Name, DisplayName, UserPrincipalName, or Mail address
• View basic AD user account attributes (ObjectGuid, SamAccountName, DisplayName, UserPrincipalName, Enabled status, Description, Company, Department, and Title)
• View current telephone number and mobile number of selected user account
• Update telephone number (telephoneNumber attribute) with comprehensive audit logging
• Update mobile number (mobile attribute) with comprehensive audit logging
• Ability to clear phone number values by leaving fields empty
• User search across multiple attributes with wildcard support
• PowerShell data source for AD user retrieval with search functionality
• PowerShell task script for updating phone numbers with detailed error handling and logging
• Dynamic form configuration for user-friendly interface
• Comprehensive configuration files for all data sources and tasks
• All-in-one setup script for automated deployment
• Manual resources folder with individual component files
• GitHub workflows for creating releases and verifying changelog
• README documentation with requirements, connection settings, and development resources
