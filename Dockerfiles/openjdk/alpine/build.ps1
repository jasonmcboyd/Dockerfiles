[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]
    $AlpineVersion,

    [Parameter(Mandatory = $true)]
    [string]
    $OpenJdkVersion,

    [string]
    $Path,

    [switch]
    $Latest
)

if ([string]::IsNullOrEmpty($Path)) {
    $Path = Join-Path $PSScriptRoot 'Dockerfile'
}
# Normalize the path
$Path = Get-Item $Path | Select-Object -ExpandProperty FullName

function BuildDockerfile($InternalPath, $Tag) {
    docker build `
        --build-arg ALPINE_VERSION=$AlpineVersion `
        --build-arg OPEN_JDK_VERSION=$OpenJdkVersion `
        -t jasonmcboyd/openjdk:$Tag `
        -f $InternalPath `
        $PSScriptRoot
}

BuildDockerfile $Path "$OpenJdkVersion-alpine.v$AlpineVersion" 

if ($Latest) {
    BuildDockerfile $Path 'latest'
}
