[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $AlpineVersion,

    [string]
    $OpenJdkVersion,

    [switch]
    $Latest
)

$BuildArgs = @{
    ALPINE_VERSION   = $AlpineVersion
    OPEN_JDK_VERSION = $OpenJdkVersion
}

& $PSScriptRoot/build.ps1 `
    -Image 'openjdk' `
    -BuildArgs $BuildArgs `
    -ContextPath "$PSScriptRoot/../Dockerfiles/openjdk/alpine" `
    -Latest:$Latest
