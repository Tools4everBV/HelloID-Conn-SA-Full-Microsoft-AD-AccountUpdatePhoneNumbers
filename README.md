# HelloID-Conn-SA-Full-AD-AccountUpdatePhoneNumbers

| :information_source: Information |
|:---|
| This repository contains the connector and configuration code only. The implementer is responsible for acquiring the connection details such as username, password, certificate, etc. You might even need to sign a contract or agreement with the supplier before implementing this connector. Please contact the client's application manager to coordinate the connector requirements. |

## Description

HelloID-Conn-SA-Full-AD-AccountUpdatePhoneNumbers is a delegated form designed for use with HelloID Service Automation (SA). It can be imported into HelloID and customized according to your requirements.

By using this delegated form, you can manage Active Directory user account phone numbers. The following options are available:

1. Search for and select the target Active Directory (AD) user account by Name, DisplayName, User Principal Name (UPN), or Mail address.
2. View basic AD user account attributes (ObjectGuid, SamAccountName, DisplayName, UserPrincipalName, Enabled status, Description, Company, Department, and Title).
3. View the current telephone number and mobile number of the selected user account.
4. Update the telephone number and/or mobile number with comprehensive audit logging.

## Getting started

### Requirements

- **Active Directory Access**: The connector requires access to an Active Directory domain with sufficient permissions to modify user account phone number attributes. A service account with appropriate AD permissions is necessary.
- **HelloID Agent**: A HelloID Agent must be installed and configured to communicate with the Active Directory domain.
- **PowerShell module 'ActiveDirectory'**: The HelloID Agent must have PowerShell available with Active Directory module support.

### Connection settings

The following user-defined variables are used by the connector.

| Variable | Description | Required |
|----------|-------------|----------|
| ADusersSearchOU | Array of Active Directory OUs for scoping AD user accounts in the search result of this form | Yes |

## Remarks

### User Search

- **Search Functionality**: Users can search for accounts using a wildcard (`*`) to return all users within the specified OUs, or by entering partial text to search across user attributes (Name, DisplayName, User Principal Name, or Mail address).
- The search scope is limited to the OUs defined in the `ADusersSearchOU` variable.

### Phone Number Updates

- **Telephone Number**: Updates the `telephoneNumber` attribute in Active Directory.
- **Mobile Number**: Updates the `mobile` attribute in Active Directory.
- **Clearing Values**: Either field can be cleared by leaving it empty during the update.
- **Immediate Effect**: Changes to phone numbers take effect immediately in Active Directory.

## Development resources

### PowerShell Module

This connector uses the ActiveDirectory PowerShell module for managing Active Directory user account phone number attributes.

- [ActiveDirectory Module Documentation](https://learn.microsoft.com/en-us/powershell/module/activedirectory/)

### Cmdlets

The following PowerShell cmdlets are used by the connector:

| Cmdlet | Description |
|--------|-------------|
| Get-ADUser | Retrieves Active Directory user accounts |
| Set-ADUser | Modifies Active Directory user account properties |

### Cmdlet documentation

- [Get-ADUser](https://learn.microsoft.com/en-us/powershell/module/activedirectory/get-aduser)
- [Set-ADUser](https://learn.microsoft.com/en-us/powershell/module/activedirectory/set-aduser)

## Getting help

| :bulb: Tip |
|:---|
| For more information on Delegated Forms, please refer to our [documentation pages](https://docs.helloid.com/). |

## HelloID docs

The official HelloID documentation can be found at: [https://docs.helloid.com/](https://docs.helloid.com/)
