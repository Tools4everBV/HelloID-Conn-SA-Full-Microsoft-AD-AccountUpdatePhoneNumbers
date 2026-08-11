# variables configured in form:
$user = $form.gridUsers
$mobile = $form.mobile
$telephoneNumber = $form.telephoneNumber

# Set debug logging
$VerbosePreference = "SilentlyContinue"
$InformationPreference = "Continue"
$WarningPreference = "Continue"

# Set TLS to accept TLS, TLS 1.1 and TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls -bor [Net.SecurityProtocolType]::Tls11 -bor [Net.SecurityProtocolType]::Tls12

try {
    $actionMessage = "updating AD attributes for user [$($user.userPrincipalName)] with objectguid [$($user.ObjectGuid)]"

    if ([String]::IsNullOrEmpty($mobile) -eq $true) {
        $mobile = $null
    }
    if ([String]::IsNullOrEmpty($telephoneNumber) -eq $true) {
        $telephoneNumber = $null
    } 

    $splatADuserUpdateParams = @{
        Identity    = $user.ObjectGuid
        MobilePhone = $mobile
        OfficePhone = $telephoneNumber
    }
    
    $null = Set-ADUser @splatADuserUpdateParams
    
    $Log = @{
        Action            = "UpdateAccount" # optional. ENUM (undefined = default) 
        System            = "ActiveDirectory" # optional (free format text) 
        Message           = "Successfully updated AD user [$($user.userPrincipalName)] for attributes [Mobile] from [$($user.mobile)] to [$mobile] and [TelephoneNumber] [$($user.telephoneNumber)] from to [$telephoneNumber]" # required (free format text) 
        IsError           = $false # optional. Elastic reporting purposes only. (default = $false. $true = Executed action returned an error) 
        TargetDisplayName = $user.userPrincipalName # optional (free format text) 
        TargetIdentifier  = $user.ObjectGuid # optional (free format text) 
    }
    #send result back  
    Write-Information -Tags "Audit" -MessageData $log    
}
catch {
    $ex = $PSItem
    $auditMessage = "Error $($actionMessage). Error: $($ex.Exception.Message)"
    $warningMessage = "Error at Line [$($ex.InvocationInfo.ScriptLineNumber)]: $($ex.InvocationInfo.Line). Error: $($ex.Exception.Message)"    

    $Log = @{
        Action            = "UpdateAccount" # optional. ENUM (undefined = default) 
        System            = "ActiveDirectory" # optional (free format text) 
        Message           = "Error $($actionMessage). Error Message: $auditMessage" # required (free format text) 
        IsError           = $true # optional. Elastic reporting purposes only. (default = $false. $true = Executed action returned an error) 
        TargetDisplayName = $user.userPrincipalName # optional (free format text) 
        TargetIdentifier  = $user.ObjectGuid # optional (free format text) 
    }
    #send result back  
    Write-Information -Tags "Audit" -MessageData $log      
    Write-Warning $warningMessage   
    Write-Error $auditMessage
}
