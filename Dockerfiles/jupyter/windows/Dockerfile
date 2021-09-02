ARG DOTNET_SDK_VERSION

FROM mcr.microsoft.com/dotnet/sdk:$DOTNET_SDK_VERSION
SHELL ["pwsh", "-command"]
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; \
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
RUN Invoke-Expression (Invoke-WebRequest 'https://community.chocolatey.org/install.ps1' -SkipCertificateCheck); \
    choco install python -y
