# Custom Container Images

This directory contains custom container images used by devcontainer templates or available for standalone use.

## Available Images

| Image | Description | Base | GHCR URL |
|-------|-------------|------|----------|
| [simple-python](simple-python/) | Minimal Python development image with essential dev tools, pipx packages, Git, Zsh, and Starship | `python:3.13-slim-bookworm` | `ghcr.io/metinsenturk/devcontainer-templates/simple-python` |

## Features

All images in this repository are:

- **Multi-arch**: Built for `linux/amd64` and `linux/arm64`
- **Tested**: Automated tests run on every build
- **Scanned**: Security scanning with Trivy
- **Attested**: Includes provenance and SBOM
- **Versioned**: Tagged with semantic versions and `latest`

## Usage

Pull an image from GitHub Container Registry:

```bash
docker pull ghcr.io/metinsenturk/devcontainer-templates/simple-python:latest
```

Use in a devcontainer:

```json
{
  "image": "ghcr.io/metinsenturk/devcontainer-templates/simple-python:latest"
}
```

## Contributing

Want to add a new container image? See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed instructions on:

- Creating new images
- Required files and structure
- Writing tests
- Local testing
- CI/CD workflow
- Best practices

## Documentation

For more details about the image system, CI/CD pipeline, and testing, see [IMAGES.md](IMAGES.md).

## License

All images are licensed under MIT.
