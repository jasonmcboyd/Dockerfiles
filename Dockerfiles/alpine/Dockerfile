ARG ALPINE_VERSION

FROM alpine:$ALPINE_VERSION
RUN mkdir root/.ashrc.d && \
    apk update && \
    apk add --update
COPY root root
ENV ENV="/root/.ashrc"
