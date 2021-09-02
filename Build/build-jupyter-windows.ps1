[CmdletBinding()]
param (
    [string]
    $DotNetSdkVersion,

    [switch]
    $Latest
)

$BuildArgs = @{
    DOTNET_SDK_VERSION = $DotNetSdkVersion
}

& $PSScriptRoot/build.ps1 `
    -Image 'jupyter/windows' `
    -BuildArgs $BuildArgs `
    -ContextPath "$PSScriptRoot/../Dockerfiles/jupyter/windows" `
    -Tag latest `
    -Latest:$Latest
