ARG ALPINE_VERSION
ARG DOTNETCORE_VERSION

FROM jasonmcboyd/alpine:$ALPINE_VERSION
ARG DOTNETCORE_VERSION
# if the .NET app requires the System.Drawing.Common assembly
# RUN apk add libgdiplus --repository https://dl-3.alpinelinux.org/alpine/edge/testing/
RUN apk add wget bash icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib && \
    wget https://dot.net/v1/dotnet-install.sh && \
    chmod +x dotnet-install.sh && \
    ./dotnet-install.sh -version $DOTNETCORE_VERSION -InstallDir /usr/share/dotnet && \
    rm dotnet-install.sh
ENV PATH=$PATH:/usr/share/dotnet:/root/.dotnet/tools
