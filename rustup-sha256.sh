#!/usr/bin/env bash

RUSTUP_VERSION=1.28.2

function print-sha256() {
    local arch=$1
    local url="https://static.rust-lang.org/rustup/archive/${RUSTUP_VERSION}/${arch}/rustup-init"
    printf "%-40s %s\n" "rustup/${RUSTUP_VERSION}/${arch}" "$(curl -sSL ${url} | sha256sum | awk '{print $1}')"
}

print-sha256 "aarch64-unknown-linux-gnu"
print-sha256 "x86_64-unknown-linux-gnu"
