ARG DOTNET_SDK_VERSION

FROM mcr.microsoft.com/windows/servercore:1809
ARG DOTNET_TOOL_PATH="C:\DotnetToolPath"
CMD ["powershell"]
SHELL ["powershell", "-C"]
RUN "Set-ExecutionPolicy Bypass -Scope Process -Force"; \
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));
#RUN choco install dotnet-5.0-sdk -y
RUN choco install dotnetcore-sdk -y
RUN choco install python -y
RUN python.exe -m pip install --upgrade pip
RUN pip install jupyter
RUN mkdir $Env:DOTNET_TOOL_PATH
RUN dotnet tool install Microsoft.dotnet-interactive --version 1.0.155302 --tool-path $Env:DOTNET_TOOL_PATH
RUN setx /M PATH $($Env:PATH + ';' + $Env:DOTNET_TOOL_PATH)
RUN dotnet interactive jupyter install
