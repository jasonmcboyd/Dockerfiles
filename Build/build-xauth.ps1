[CmdletBinding()]
param (
    [string]
    $AlpineVersion,

    [switch]
    $Latest
)

$BuildArgs = @{
    ALPINE_VERSION = $AlpineVersion
    XAUTH_VERSION = ''
}

& $PSScriptRoot/build.ps1 `
    -Image 'xauth' `
    -BuildArgs $BuildArgs `
    -ContextPath "$PSScriptRoot/../Dockerfiles/xauth/alpine" `
    -Latest:$Latest
