ARG ALPINE_VERSION

FROM alpine:$ALPINE_VERSION
RUN mkdir root/.ashrc.d
COPY root root
ENV ENV="/root/.ashrc"
