FROM alpine:latest


# Helm versioni https://github.com/kubernetes/helm/releases

ENV HELM_VERSION v2.10.0

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
    apk --purge del curl && \
    rm /var/cache/apk/*
