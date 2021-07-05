param (
    [string]
    $BuildArg
)

Get-Content -Path 'default-build-args.json' -Raw | ConvertFrom-Json | Select-Object -ExpandProperty $BuildArg