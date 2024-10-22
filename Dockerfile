# Dockerfile for python twine tool
ARG ALPINE_VERSION=latest

FROM alpine:${ALPINE_VERSION}

ARG TWINE_VERSION=5.1.1

SHELL [ "/bin/sh", "-xe", "-c" ]

# hadolint ignore=DL3018,DL3013
RUN addgroup -S -g 911 twine \
    && adduser -u 911 -DS -G twine twine \
    && apk add --no-cache ca-certificates \
                          python3 \
                          py3-cryptography \
                          py3-pip \
    && pip3 install --no-cache-dir twine=="$TWINE_VERSION" --break-system-packages

USER twine

ENTRYPOINT ["twine"]
CMD ["--version"]
