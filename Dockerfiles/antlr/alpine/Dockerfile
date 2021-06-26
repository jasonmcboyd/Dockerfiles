ARG OPEN_JDK_IMAGE_TAG=latest
ARG ANTLR_VERSION

FROM alpine as downloader
ARG ANTLR_VERSION
RUN apk add curl && \
    cd /usr/local/lib && \
    curl -O https://www.antlr.org/download/antlr-$ANTLR_VERSION-complete.jar

FROM jasonmcboyd/openjdk:$OPEN_JDK_IMAGE_TAG
ARG ANTLR_VERSION
ENV ANTLR_VERSION=$ANTLR_VERSION
ENV CLASSPATH=".:/usr/local/lib/antlr-$ANTLR_VERSION-complete.jar:$CLASSPATH"
COPY --from=downloader /usr/local/lib/antlr-$ANTLR_VERSION-complete.jar /usr/local/lib/antlr-$ANTLR_VERSION-complete.jar
COPY antlr-aliases.sh /root/.ashrc.d/antlr-aliases.sh
