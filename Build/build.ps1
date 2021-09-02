[CmdletBinding()]
param (
    [string]
    $Image,

    [HashTable]
    $BuildArgs,

    [string]
    $ContextPath,

    [string]
    $Tag,

    [switch]
    $Latest
)

$ErrorActionPreference = 'Stop'

# Normalize the path
$ContextPath = Get-Item $ContextPath | Select-Object -ExpandProperty FullName

$DockerfilePath = Join-Path $ContextPath Dockerfile
Write-Debug "DockerfilePath: $DockerfilePath"

Write-Debug "Build Args:"
foreach ($key in $BuildArgs.Keys.Clone()) {
    if ([string]::IsNullOrEmpty($BuildArgs[$key])) {
        $BuildArgs[$key] = & $PSScriptRoot/get-default-build-arg.ps1 -BuildArg $key
    }
    Write-Debug "`t${key}: $($BuildArgs[$key])"
}

$buildArgsString = [string]::Join(' ', ($BuildArgs.GetEnumerator() | ForEach-Object { "--build-arg $($_.Key)=$($_.Value)" }))
Write-Debug "BuildArgsString: $BuildArgsString"

if ([string]::IsNullOrEmpty($Tag)) {
    $tag = `
        $BuildArgs.GetEnumerator() `
        | Where-Object {
            $key = $_.Key.Replace('_', '')
            $key -match $Image
        } `
        | Select-Object -ExpandProperty Value
}
Write-Debug "tag: $tag"

function BuildDockerfile($InternalTag) {
    $DockerBuildCommand = "docker build $buildArgsString -t jasonmcboyd/${Image}:$InternalTag -f $DockerfilePath $ContextPath"
    Write-Debug "DockerBuildCommand: $DockerBuildCommand"
    Invoke-Expression $DockerBuildCommand
}

BuildDockerfile $tag

if ($Latest) {
    BuildDockerfile 'latest'
}
