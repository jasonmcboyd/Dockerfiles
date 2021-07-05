[CmdletBinding()]
param (
    [string]
    $AlpineVersion,

    [switch]
    $Latest
)

$BuildArgs = @{
    ALPINE_VERSION = $AlpineVersion
}

& $PSScriptRoot/build.ps1 `
    -Image 'alpine' `
    -BuildArgs $BuildArgs `
    -ContextPath "$PSScriptRoot/../Dockerfiles/alpine" `
    -Latest:$Latest
