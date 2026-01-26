# Devcontainer Templates

This repository hosts **devcontainer templates** and **custom container images** for Python development. It provides lightweight templates for Python projects:

- `python`: classic pip/venv on Debian base
- `python-uv`: uv-managed Python on Ubuntu base

Custom images are automatically built and published to GitHub Container Registry (GHCR). Current images are:

- `simple-python`: Minimal python image with essential dev tools, [pipx](https://github.com/pypa/pipx) packages, Git, and [Zsh](https://www.zsh.org/) with [Starship](https://starship.rs/)


## Template Highlights

| Template ID | Use Case | Containers | Image Build | Package manager | Python install | Extras |
|-------------|----------|-----------|-------------|-----------------|----------------|--------|
| python      | Quick Python development with Python | Single container | No (uses pre-built image) | pip + venv | Python 3.13 | VS Code Python + Pylance extensions, Zsh + Starship |
| python-uv   | Modern Python development with version management | Container group (Docker Compose) | Yes (builds from Dockerfile) | uv | `uv python install` (configurable) | Makefile, optional Jupyter, VS Code extensions |


## Learn More

For detailed information on how to use templates, testing locally, and advanced topics, see [MORE.md](MORE.md).

## Publishing

Packages are published from this repo (see GitHub Packages/OCI artifacts for availability). To have templates show up in the VS Code UI, publish to GHCR and add your collection to the public index at containers.dev/templates.

## License

MIT
