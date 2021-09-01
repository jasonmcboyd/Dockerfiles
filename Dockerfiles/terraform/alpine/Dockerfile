ARG ALPINE_VERSION
ARG TERRAFORM_VERSION

FROM jasonmcboyd/alpine as downloader
ARG TERRAFORM_VERSION
RUN cd /bin && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_arm64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_arm64.zip

FROM jasonmcboyd/alpine:$ALPINE_VERSION
COPY --from=downloader /bin/terraform /bin/terraform
