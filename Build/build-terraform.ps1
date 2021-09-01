[CmdletBinding()]
param (
    [string]
    $AlpineVersion,

    [string]
    $TerraformVersion,

    [switch]
    $Latest
)

$BuildArgs = @{
    ALPINE_VERSION    = $AlpineVersion
    TERRAFORM_VERSION = $TerraformVersion
    XAUTH_VERSION     = ''
}

& $PSScriptRoot/build.ps1 `
    -Image 'terraform' `
    -BuildArgs $BuildArgs `
    -ContextPath "$PSScriptRoot/../Dockerfiles/terraform/alpine" `
    -Latest:$Latest
