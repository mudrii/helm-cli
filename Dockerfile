FROM alpine:latest

RUN deluser guest ; delgroup users
RUN addgroup -g 985 -S users
RUN adduser -S -G users -u 1000 -s /bin/sh -h /home/mudrii mudrii

# Helm versioni https://github.com/kubernetes/helm/releases
ENV HELM_VERSION v2.11.0

RUN apk --no-cache update && \
    apk --no-cache add \
    curl \
    ca-certificates \
    jq && \
    curl -O https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz && \
    tar xzf helm-${HELM_VERSION}-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/ && \
#    rm helm-${HELM_VERSION}-linux-amd64.tar.gz && \
    rm -rf linux-amd64 && \
    apk --purge del curl

USER mudrii
