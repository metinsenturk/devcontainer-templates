
# Python (python)

A Python development environment powered by the `simple-python` custom container image.

## Features

- **Base Image**: `ghcr.io/metinsenturk/devcontainer-templates/simple-python`
- **Python**: 3.13 with pip (or latest)
- **Tools**: Git, curl, build-essential, OpenSSH, GPG, sudo
- **User**: Non-root `vscode` user with sudoer privileges
- **Architecture**: Multi-arch support (linux/amd64, linux/arm64)

## Options

| Option | Description | Values | Default |
|--------|-------------|--------|---------|
| `imageVariant` | Python version | `3.13`, `latest` | `latest` |

## Usage

This template uses the pre-built `simple-python` image from GHCR. When opening the folder in VS Code, you can choose which Python version to use:

- **`3.13`**: Specific Python 3.13 release
- **`latest`**: Newest Python version available

Simply open the folder and VS Code will prompt you to select the Python version option.

---

_Note: This template references the custom `simple-python` image. See [images/simple-python](https://github.com/metinsenturk/devcontainer-templates/tree/main/images/simple-python) for details._
