ARG BUILD_BASE_VERSION
ARG DOTNETCORE_VERSION
ARG PYTHON3_VERSION
ARG JUPYTER_VERSION

FROM jasonmcboyd/dotnetcore:$DOTNETCORE_VERSION AS dotnet

FROM jasonmcboyd/buildbase:$BUILD_BASE_VERSION
ENV PATH=$PATH:/usr/share/dotnet:/root/.dotnet/tools
RUN apk add bash icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib
RUN python3 -m pip install pyzmq
RUN python3 -m pip install jupyter
COPY --from=dotnet /usr/share/dotnet /usr/share/dotnet
RUN echo $PATH
RUN dotnet tool install --global Microsoft.dotnet-interactive --version 1.0.155302
RUN dotnet interactive jupyter install
