ARG ALPINE_VERSION
ARG PYTHON3_VERSION

FROM jasonmcboyd/alpine:$ALPINE_VERSION
ARG PYTHON3_VERSION
RUN apk add --no-cache python3=$PYTHON3_VERSION && \
    apk add py3-pip && \
    python3 -m pip install --upgrade pip  
