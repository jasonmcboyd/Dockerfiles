[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]
    $Version,

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
        --build-arg ANTLR_VERSION=$Version `
        -t jasonmcboyd/antlr:$Tag `
        -f $InternalPath `
        $PSScriptRoot
}

BuildDockerfile $Path $Version

if ($Latest) {
    BuildDockerfile $Path 'latest'
}
