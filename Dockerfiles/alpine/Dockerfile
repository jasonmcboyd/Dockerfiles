ARG ALPINE_VERSION

FROM alpine:$ALPINE_VERSION
RUN mkdir root/.ashrc.d
COPY .ashrc root/.ashrc 
ENV ENV="/root/.ashrc"
