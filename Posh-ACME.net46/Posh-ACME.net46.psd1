@{

RootModule = 'Posh-ACME.psm1'
ModuleVersion = '3.0.0'
GUID = 'f14adab4-278e-4dcb-b843-421fa5a5e688'
Author = 'Ryan Bolger'
Copyright = '(c) 2018 Ryan Bolger. All rights reserved.'
Description = @'
ACMEv2 protocol client for generating certificates using Let''s Encrypt (or other ACMEv2 compliant CA)

This is a custom build intended allow compatibility with .NET 4.6.1. It should not be used with PowerShell Core and you should only attempt to use RSA based key options.
'@
CompatiblePSEditions = @('Desktop')
PowerShellVersion = '5.1'
DotNetFrameworkVersion = '4.6.1'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @('lib\BouncyCastle.Crypto.dll')

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = 'Posh-ACME.Format.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @(
    'Get-DnsPluginHelp',
    'Get-DnsPlugins',
    'Get-KeyAuthorization',
    'Get-PAAccount',
    'Get-PAAuthorizations',
    'Get-PACertificate',
    'Get-PAOrder',
    'Get-PAServer',
    'New-PAAccount',
    'New-PACertificate',
    'New-PAOrder',
    'Publish-DnsChallenge',
    'Remove-PAAccount',
    'Remove-PAOrder',
    'Save-DnsChallenge',
    'Send-ChallengeAck',
    'Set-PAAccount',
    'Set-PAOrder',
    'Set-PAServer',
    'Submit-ChallengeValidation',
    'Submit-OrderFinalize',
    'Submit-Renewal',
    'Unpublish-DnsChallenge'
)

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'LetsEncrypt','ssl','tls','certificates','acme'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/rmbolger/Posh-ACME/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/rmbolger/Posh-ACME'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = @'
## 3.0.0 (2018-11-13)

* Potentially breaking changes
  * Many ACME protocol messages that previously used GET requests have been changed to POST-as-GET to comply with the latest ACME draft-16. Let's Encrypt already supports the new draft, but other ACME servers may not yet.
  * `CertIssueTimeout` param was removed from `New-PACertificate` and `Submit-OrderFinalize` because it wasn't actually being used properly in the former and doesn't seem necessary anymore.
* New Feature: Generate certs from an existing certificate request which can be useful for appliances that generate their own keys and CSRs. (Thanks @virot)
  * New `CSRPath` parameter on `New-PACertificate` and `New-PAOrder` that removes the need for `Domain`, `CertKeyLength`, `NewCertKey`, `OCSPMustStaple`, `FriendlyName`, `PfxPass`, and `Install` parameters when used. Most values will be extracted from the CSR.
  * Certs generated using this method will not have PFX files created because there is no private key.
  * Certs generated using this method can not be automatically installed to the Windows cert store because there are no PFX files.
* `Get-KeyAuthorization` now has `ForDNS` parameter which returns the actual TXT value necessary for the dns-01 challenge. (Thanks @chandan1001)
* Added new DNS plugins
  * IBMSoftLayer (IBM Cloud DNS)
  * AutoDNS (InternetX XML Gateway)
* Fix for some validation params not getting set properly on new instances of old orders
* Fix for Windows plugin not using `$dnsParams` appropriately (Thanks @B4dM4n)
'@

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}
