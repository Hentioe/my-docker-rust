FROM hentioe/rust:1.88.0-void AS base

FROM base AS amd64
# Set the C_INCLUDE_PATH for amd64 architecture
ENV C_INCLUDE_PATH=/usr/lib/gcc/x86_64-unknown-linux-gnu/14.2/include/

FROM base AS arm64
# Set the C_INCLUDE_PATH for arm64 architecture
ENV C_INCLUDE_PATH=/usr/lib/gcc/aarch64-linux-gnu/14.2/include/

ARG TARGETARCH
FROM $TARGETARCH

COPY cleanup.sh /usr/bin/void-cleanup

RUN set -xe \
    && xbps-install -Sy pkg-config libclang19 \
    && void-cleanup \
    # Check the C_INCLUDE_PATH, it will error if not exists
    && stat $C_INCLUDE_PATH
