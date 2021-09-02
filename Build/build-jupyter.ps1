[CmdletBinding()]
param (
    [string]
    $BuildBaseVersion,

    [string]
    $DotNetCoreVersion,

    [string]
    $Python3Version,

    [string]
    $JupyterVersion,

    [switch]
    $Latest
)

$BuildArgs = @{
    BUILD_BASE_VERSION = $BuildBaseVersion
    DOTNETCORE_VERSION = $DotNetCoreVersion
    PYTHON3_VERSION    = $Python3Version
    JUPYTER_VERSION    = $JupyterVersion
}

& $PSScriptRoot/build.ps1 `
    -Image 'jupyter' `
    -BuildArgs $BuildArgs `
    -ContextPath "$PSScriptRoot/../Dockerfiles/jupyter/alpine" `
    -Latest:$Latest
