# my-docker-rust

Rust images based on Void Linux, providing AMD64 and ARM64 builds.

## Usage

Pull the latest image:

```bash
docker pull hentioe/rust:1.88-void
```

You can also pull without specifying any tags, which will default to fetching the latest stable version.

## Supported tags and respective `Dockerfile` links

- [`rust:1-void`, `rust:1.88-void`, `rust:1.88.0-void`, `latest`](https://github.com/Hentioe/my-docker-rust/blob/main/stable/void/Dockerfile)
- [`rust:1-void-bindings`, `rust:1.88-void-bindings`, `rust:1.88.0-void-bindings`](https://github.com/Hentioe/my-docker-rust/blob/main/stable/void-bindings/Dockerfile)

## Base Images

The base images corresponding to the tags are listed below:

| tag                         | base                                               |
| :-------------------------- | :------------------------------------------------- |
| `1.88.0-void`          | `ghcr.io/void-linux/void-glibc-busybox:20250701R1` |
| `1.88.0-void-bindings` | `hentioe/rust:1.88.0-void`                         |
