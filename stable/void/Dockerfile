FROM ghcr.io/void-linux/void-glibc-busybox:20250701R1

ARG TARGETARCH

ENV RUST_VERSION="1.88.0" \
    RUSTUP_VERSION="1.28.2" \
    RUSTUP_DOWNLOAD_SHA256_AARCH64="e3853c5a252fca15252d07cb23a1bdd9377a8c6f3efa01531109281ae47f841c" \
    RUSTUP_DOWNLOAD_SHA256_X86_64="20a06e644b0d9bd2fbdbfd52d42540bdde820ea7df86e92e533c073da0cdd43c" \
    RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

COPY cleanup.sh /usr/bin/void-cleanup

RUN set -xe \
    && if [ "$TARGETARCH" = "arm64" ]; then \
    # Support arm64.
    export RUST_ARCH="aarch64-unknown-linux-gnu"; \
    export RUSTUP_DOWNLOAD_SHA256="$RUSTUP_DOWNLOAD_SHA256_AARCH64"; \
    elif [ "$TARGETARCH" = "amd64" ]; then \
    # Support amd64.
    export RUST_ARCH="x86_64-unknown-linux-gnu"; \
    export RUSTUP_DOWNLOAD_SHA256="$RUSTUP_DOWNLOAD_SHA256_X86_64"; \
    fi \
    && RUSTUP_DOWNLOAD_URL="https://static.rust-lang.org/rustup/archive/${RUSTUP_VERSION}/${RUST_ARCH}/rustup-init" \
    && fetchDeps='curl' \
    # Skip extraction of `/etc/hosts` file (it is read-only)
    && echo noextract=/etc/hosts >> /etc/xbps.d/noextract.conf \
    # Update the package index.
    && xbps-install -Suy \
    # Install dependencies for downloading files.
    && xbps-install -Ay $fetchDeps \
    # Download and verify Rustup installer.
    && curl -fSL -o rustup-init "$RUSTUP_DOWNLOAD_URL" \
    && echo "$RUSTUP_DOWNLOAD_SHA256  rustup-init" | sha256sum -c - \
    # Install Rust and Cargo.
    && chmod +x rustup-init \
    && ./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION --default-host $RUST_ARCH \
    && chmod -R a+w $RUSTUP_HOME $CARGO_HOME \
    # Clean up the fetch dependencies.
    && xbps-remove -Roy $fetchDeps \
    # Clean up the downloaded Rustup installer.
    && rm rustup-init \
    # Install runtime dependencies.
    && runtimeDeps=' \
    ca-certificates \
    gcc' \
    && xbps-install -y $runtimeDeps \
    # Run Void Linux cleanup script.
    && void-cleanup \
    # Print versions of installed tools.
    rustup --version \
    cargo --version \
    rustc --version
