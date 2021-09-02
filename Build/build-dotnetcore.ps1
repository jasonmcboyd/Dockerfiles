[CmdletBinding()]
param (
    [string]
    $AlpineVersion,

    [string]
    $DotNetCoreVersion,

    [switch]
    $Latest
)

$BuildArgs = @{
    ALPINE_VERSION     = $AlpineVersion
    DOTNETCORE_VERSION = $DotNetCoreVersion
}

& $PSScriptRoot/build.ps1 `
    -Image 'dotnetcore' `
    -BuildArgs $BuildArgs `
    -ContextPath "$PSScriptRoot/../Dockerfiles/dotnetcore/alpine" `
    -Latest:$Latest
