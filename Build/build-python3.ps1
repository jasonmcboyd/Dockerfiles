[CmdletBinding()]
param (
    [string]
    $AlpineVersion,

    [string]
    $Python3Version,

    [switch]
    $Latest
)

$BuildArgs = @{
    ALPINE_VERSION  = $AlpineVersion
    PYTHON3_VERSION = $Python3Version
}

& $PSScriptRoot/build.ps1 `
    -Image 'python3' `
    -BuildArgs $BuildArgs `
    -ContextPath "$PSScriptRoot/../Dockerfiles/python3/alpine" `
    -Latest:$Latest
