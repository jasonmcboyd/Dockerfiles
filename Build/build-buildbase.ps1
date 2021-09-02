[CmdletBinding()]
param (
    [string]
    $Python3Version,

    [string]
    $BuildBaseVersion,

    [switch]
    $Latest
)

$BuildArgs = @{
    PYTHON3_VERSION    = $Python3Version
    BUILD_BASE_VERSION = $BuildBaseVersion
}

& $PSScriptRoot/build.ps1 `
    -Image 'buildbase' `
    -BuildArgs $BuildArgs `
    -ContextPath "$PSScriptRoot/../Dockerfiles/buildbase/alpine" `
    -Latest:$Latest
