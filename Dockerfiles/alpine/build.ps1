[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]
    $AlpineVersion,

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
        -t jasonmcboyd/alpine:$Tag `
        -f $InternalPath `
        $PSScriptRoot
}

BuildDockerfile $Path $AlpineVersion

if ($Latest) {
    BuildDockerfile $Path 'latest'
}
